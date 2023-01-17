/* gVision.cpp
 * Routines directly related to the vision system on the gantry including
 *   - Fiducial recognition/location
 *   - Focus calculation
 *   - Focus curve fitting
 */

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <utility>
#include <set>
#include <cmath>
#include <limits>

#include "vision_utils.h"
#include "vision.h"

using namespace std;

#define MAX_OBJECTS 20

__declspec(dllexport) int __cdecl calc_focus(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth, int imgHeight,
        float *focus) {
    cv::Mat img(imgHeight, imgWidth, CV_8U, (void *) imgPtr, imgLineWidth);

    cv::Mat lap;
    cv::Laplacian(img, lap, CV_32F, 5, .01);

    cv::Scalar mu, sigma;
    cv::meanStdDev(lap, mu, sigma);
    *focus = (float) (sigma.val[0] * sigma.val[0]);
    return 0;
}

__declspec(dllexport) int __cdecl convert_to_grayscale(
        char *src_imgPtr,
        int src_imgLineWidth,
        int src_imgWidth,
        int src_imgHeight,
        const char *src_type,
        char *dst_imgPtr,
        int dst_imgLineWidth,
        int dst_imgWidth,
        int dst_imgHeight) {
    int src_color_code = color_code(src_type);
    if (src_color_code < 0) return -1;

    cv::Mat dst_img(dst_imgHeight, dst_imgWidth, CV_8UC1, (void *) dst_imgPtr, dst_imgLineWidth);
    cv::Mat src_img(src_imgHeight, src_imgWidth, src_color_code, (void *) src_imgPtr, src_imgLineWidth);

    if (strcmp(src_type, "Grayscale (U8)") == 0) {
        src_img.copyTo(dst_img);
    } else if (strcmp(src_type, "Grayscale (I16)") == 0) {
        cv::convertScaleAbs(src_img, dst_img, 1.0f / 256, 128);
    } else if (strcmp(src_type, "Grayscale (U16)") == 0) {
        cv::convertScaleAbs(src_img, dst_img, 1.0f / 256, 0);
    } else if (strcmp(src_type, "Grayscale (SGL)") == 0) {
        cv::convertScaleAbs(src_img, dst_img, 256);
    } else if (strcmp(src_type, "Complex (CSG)") == 0) {
        return -1;
    } else if (strcmp(src_type, "RGB (U32)") == 0) {
        cv::cvtColor(src_img, dst_img, cv::COLOR_RGB2GRAY);
    } else if (strcmp(src_type, "RGB (U64)") == 0) {
        cv::cvtColor(src_img, dst_img, cv::COLOR_RGB2GRAY);
    } else if (strcmp(src_type, "HSL (U32)") == 0) {
        return -1;
    }
    return 0;
}

void set_to(cv::Mat &img, char from, char to) {
    int n = img.rows * img.cols;
    for (int i = 0; i < n; i++) {
        char &curr = img.at<char>(i);
        if (curr == from) curr = to;
    }
}

void set_foreground(cv::Mat &img, char fgId, char fgVal, char bgVal) {
    int n = img.rows * img.cols;
    for (int i = 0; i < n; i++) {
        char &curr = img.at<char>(i);
        curr = (curr == fgId) ? fgVal : bgVal;
    }
}

void do_blur(cv::Mat &img, int blurSize) {
    if (blurSize % 2 == 0) blurSize++;
    cv::blur(img, img, cv::Size(blurSize, blurSize));
}

void do_kmeans(cv::Mat &img, int k) {
    cv::TermCriteria tc(cv::TermCriteria::COUNT + cv::TermCriteria::EPS, 10, 1.0);
    int flags = cv::KMEANS_PP_CENTERS;
    cv::Mat kmeansIn = img.reshape(1, img.rows * img.cols);
    cv::Mat colVecD, bestLabels, centers, clustered;
    kmeansIn.convertTo(colVecD, CV_32FC3, 1.0 / 255.0);

    k = k > 0 ? k : 1;
    kmeans(colVecD, k, bestLabels, tc, 1, flags, centers);

    bestLabels = bestLabels.reshape(1, img.rows);
    bestLabels.convertTo(bestLabels, CV_8U);
    img = bestLabels;

    // TODO: Allow for selecting *which* label to use, ie brightest, 2nd brightest, etc
    float maxVal = -1;
    int foreground = -1;
    for (int i = 0; i < centers.rows; i++) {
        float center = centers.at<float>(i);
        if (center > maxVal) {
            maxVal = center;
            foreground = i;
        }
    }
    set_foreground(img, (char) foreground, (char) 255, (char) 0);
}

void do_dilate(cv::Mat &img, int size) {
    size = size > 0 ? size : 1;
    cv::Size s(size, size);
    cv::Mat element = getStructuringElement(cv::MORPH_ELLIPSE, s);
    dilate(img, img, element);
}

struct ContourData {
    ContourData() {
        area = 0;
        ar = 0;
    }

    ContourData(float area, float ar) {
        this->area = area;
        this->ar = ar;
    }

    float area;
    float ar;
};

typedef pair<vector<cv::Point>, ContourData> contour_t;

vector<contour_t> get_contours(cv::Mat &img, float sizeMin, float sizeMax, float arMin, float arMax) {
    vector<vector<cv::Point>> contours;
    vector<cv::Vec4i> hierarchy;
    findContours(img.clone(), contours, hierarchy, cv::RETR_TREE, cv::CHAIN_APPROX_SIMPLE);

    vector<contour_t> passContours;
    for (auto &contour: contours) {
        float area = (float) contourArea(contour);
        cv::RotatedRect rr = minAreaRect(contour);
        float ar = float(rr.size.width) / rr.size.height;
        if (ar < 1) ar = 1.0f / ar;
        if ((area > sizeMin && area < sizeMax) && (ar > arMin && ar < arMax)) {
            contour_t c;
            c.first = contour;
            c.second = ContourData(area, ar);
            passContours.push_back(c);
        }
    }
    return passContours;
}

__declspec(dllexport)
int __cdecl find_patches(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int shrinkFactor, // increase to speed up routine
        float fieldOfViewX,  // mm
        float fieldOfViewY,  // mm
        int dilateSize,
        float sizeMin,  // mm^2
        float sizeMax,  // mm^2
        float aspectRatioMin,
        float aspectRatioMax,
        int colorGroups,
        int *numPatches,
        float *patchXCoordinates,
        float *patchYCoordinates,
        float *patchAspectRatios,
        float *patchSizes) {
    log("Running find_patches");

    cv::Mat imgIn(imgHeight, imgWidth, CV_8U, (void *) imgPtr, imgLineWidth);
    cv::Mat img = imgIn.clone(); //Make a local copy of image to avoid corrupting original image
    int rows = (int) (img.rows / shrinkFactor);
    int cols = (int) (img.cols / shrinkFactor);
    cv::Size s(cols, rows);
    resize(img, img, s);

    show(img);
    do_kmeans(img, colorGroups);
    show(img);
    do_dilate(img, dilateSize);
    show(img);

    float pixelSize = (fieldOfViewX * fieldOfViewY) / (float) (cols * rows);
    float sizeMinPx = sizeMin / pixelSize;
    float sizeMaxPx = sizeMax / pixelSize;
    // Note that Aspect Ratio is not corrected to physical size because this code assumes square pixels

    vector<contour_t> contours = get_contours(img, sizeMinPx, sizeMaxPx, aspectRatioMin, aspectRatioMax);
    if (contours.size() > MAX_OBJECTS) {
        contours.resize(MAX_OBJECTS);
    }
    *numPatches = contours.size();

    std::stringstream ss;
    ss << "Fiducials Found: " << contours.size() << endl;

    for (unsigned int i = 0; i < contours.size(); i++) {
        vector<cv::Point> fidContour = contours[i].first;
        ContourData c = contours[i].second;

        cv::Moments mu = moments(fidContour, false);
        float x = (mu.m10 / mu.m00) * (fieldOfViewX / cols) - 0.5 * fieldOfViewX;
        float y = (mu.m01 / mu.m00) * (fieldOfViewY / rows) - 0.5 * fieldOfViewY;
        *(patchXCoordinates + i) = x;
        *(patchYCoordinates + i) = y;
        *(patchAspectRatios + i) = c.ar;
        *(patchSizes + i) = c.area * pixelSize;

        ss << i << ":" << endl;
        ss << "  x:" << x << ", y:" << y << endl;
        ss << "  area: " << pixelSize * c.area << ", ar: " << c.ar << endl << endl;
    }
    log(ss);
    log("Done");
    return 0;
}


__declspec(dllexport) int __cdecl find_circles(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int shrinkFactor, // increase to speed up routine
        float fieldOfViewX,  // mm
        float fieldOfViewY,  // mm
        float minRadius,  // mm
        float maxRadius,  // mm
        int houghGradientParam1,
        int houghGradientParam2,
        int *numCircles,
        float *circleXCenters,
        float *circleYCenters,
        float *circleRadii) {
    log("Running find_circles");

    cv::Mat imgIn(imgHeight, imgWidth, CV_8U, (void *) imgPtr, imgLineWidth);
    cv::Mat img = imgIn.clone(); //Make a local copy of image to avoid corrupting original image
    shrinkFactor = shrinkFactor > 1 ? shrinkFactor : 1;
    int rows = (int) (img.rows / shrinkFactor);
    int cols = (int) (img.cols / shrinkFactor);
    cv::Size s(cols, rows);
    resize(img, img, s);

    // This code assumes square pixels
    float pixelWidth = fieldOfViewX / cols;
    float minRadiusPx = abs(minRadius / pixelWidth);
    float maxRadiusPx = abs(maxRadius / pixelWidth);

    cv::GaussianBlur(img, img, cv::Size(5, 5), 0);
    vector<cv::Vec3f> circles;
    cv::HoughCircles(img, circles, cv::HOUGH_GRADIENT, 1, rows / 16, houghGradientParam1, houghGradientParam2,
                     minRadiusPx, maxRadiusPx);

    if (circles.size() > MAX_OBJECTS) {
        circles.resize(MAX_OBJECTS);
    }
    *numCircles = circles.size();

    for (size_t i = 0; i < circles.size(); i++) {
        cv::Vec3i c = circles[i];

        cv::Point center = cv::Point(c[0], c[1]);
        // circle center
        cv::circle(img, center, 1, cv::Scalar(0, 0, 1), 1, cv::LINE_AA);
        // circle outline
        circle(img, center, c[2], cv::Scalar(0, 0, 1), 3, cv::LINE_AA);
    }
    show(img);

    for (int i = 0; i < circles.size(); i++) {
        *(circleXCenters + i) = circles[i][0] * (fieldOfViewX / cols) - 0.5 * fieldOfViewX;
        *(circleYCenters + i) = circles[i][1] * (fieldOfViewY / rows) - 0.5 * fieldOfViewY;
        *(circleRadii + i) = circles[i][2] * pixelWidth;
    }
    log("Done");
    return 0;
}


__declspec(dllexport) int __cdecl find_rects(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int shrinkFactor, // increase to speed up routine
        float fieldOfViewX,
        float fieldOfViewY,
        float nominalWidth,
        float nominalHeight,
        float tolerance,
        bool allowRotation,
        int *Nrects,
        float *rectXCenters,
        float *rectYCenters,
        float *rectXBLCorners,
        float *rectYBLCorners,
        float *rectXTLCorners,
        float *rectYTLCorners,
        float *rectXTRCorners,
        float *rectYTRCorners,
        float *rectXBRCorners,
        float *rectYBRCorners,
        float *rectWidths,
        float *rectHeights,
        float *rectAngles) {
    log("Running find_rects");
    std::stringstream ss;

    cv::Mat imgIn(imgHeight, imgWidth, CV_8U, (void *) imgPtr, imgLineWidth);
    cv::Mat img = imgIn.clone(); //Make a local copy of image to avoid corrupting original image

    cv::resize(img, img, cv::Size(img.cols / shrinkFactor, img.rows / shrinkFactor), 0, 0);

    float pixelSize = fieldOfViewX / img.cols;

    //PREPPING IMAGE FOR DETECTION ALGORITHIM
    cv::threshold(img, img, 125, 255, cv::THRESH_OTSU);
    cv::GaussianBlur(img, img, cv::Size(5, 5), 0);
    cv::erode(img, img, cv::Mat(), cv::Point(-1, -1), 2, 1, 1);
    cv::dilate(img, img, cv::Mat(), cv::Point(-1, -1), 1, 1, 1);

    //USE FIND CONTOURS ALGORITHIM
    vector<vector<cv::Point>> contours;
    vector<cv::Vec4i> hierarchy;
    cv::findContours(img, contours, hierarchy, cv::RETR_TREE, cv::CHAIN_APPROX_SIMPLE);
    ss << "Found " << contours.size() << " contours";
    log(ss);

    //APPROXIMATE CONTOURS TO POLYGONS AND MAKE BOUNDING RECTANGLE
    vector<vector<cv::Point> > contoursPoly(contours.size());
    vector<cv::RotatedRect> boundRects(
            contours.size()); //Rect is a class for rectangles, described by the coordinates of the top-left, bottom-right, width and height

    for (int i = 0; i < contours.size(); i++) {
        approxPolyDP(cv::Mat(contours[i]), contoursPoly[i], 3,
                     true); //simplifies contours by decreasing the number of vertices, douglas-peucker algorithim
        if (allowRotation) {
            boundRects[i] = cv::minAreaRect(cv::Mat(contoursPoly[i]));
        } else {
            cv::Rect r = cv::boundingRect(cv::Mat(contoursPoly[i]));
            cv::Point2f rectCenter = cv::Point2f(r.tl().x + r.width * .5, r.tl().y + r.height * .5);
            cv::Size2f rectSize = cv::Size2f(r.width, r.height);
            boundRects[i] = cv::RotatedRect(rectCenter, rectSize, 0.0f);
        }
    }

    //PUTTING DIMENSIONS OF ALL RECTANGLES IN VECTORS
    vector<cv::Point2f> rectSizes;
    vector<vector<cv::Point2f> > rectPoints; // center, bl, tl, tr, br
    vector<float> rectAngles_;
    for (auto &bRect: boundRects) {
        float x, y;
        vector<cv::Point2f> pts;
        cv::Point2f recPoints[4];
        bRect.points(recPoints);

        pts.emplace_back( // Center
                (bRect.center.x - img.cols / 2) * pixelSize,
                (bRect.center.y - img.rows / 2) * pixelSize
        );

        pts.emplace_back( // Bottom-Left Corner
                (recPoints[0].x - img.cols / 2) * pixelSize,
                (recPoints[0].y - img.rows / 2) * pixelSize
        );

        pts.emplace_back( // Top-Left Corner
                (recPoints[1].x - img.cols / 2) * pixelSize,
                (recPoints[1].y - img.rows / 2) * pixelSize
        );

        pts.emplace_back( // Top-Right Corner
                (recPoints[2].x - img.cols / 2) * pixelSize,
                (recPoints[2].y - img.rows / 2) * pixelSize
        );

        pts.emplace_back( // Bottom-Right Corner
                (recPoints[3].x - img.cols / 2) * pixelSize,
                (recPoints[3].y - img.rows / 2) * pixelSize
        );
        rectPoints.push_back(pts);

        rectAngles_.push_back(bRect.angle);
        rectSizes.emplace_back(
                bRect.size.width * pixelSize,
                bRect.size.height * pixelSize
        );
    }


    //DEFINING minWidth, etc... FROM tolerance AND nominalWidth
    float minWidth = nominalWidth * (1 - tolerance);
    float maxWidth = nominalWidth * (1 + tolerance);
    float minHeight = nominalHeight * (1 - tolerance);
    float maxHeight = nominalHeight * (1 + tolerance);

    // DRAWING CONTOURS AND BOUNDING RECTANGLE + CENTER
    int counter = 0; //counts number of rectangles passing shape requirements
    log("Contours passing selection:");
    for (int i = 0; i < contours.size() && counter < MAX_OBJECTS; i++) {
        cv::Scalar color = cv::Scalar(255, 255, 255); //creates color

        bool passes = false;
        bool rotated = false; // Accounts for rectangle on it's side, in which case height&width are interchanged

        if ((rectSizes[i].x > minWidth && rectSizes[i].x < maxWidth) &&
            (rectSizes[i].y > minHeight && rectSizes[i].y < maxHeight)) {
            cout << "not rotated" << endl;
            cout << "angle: " << rectAngles_[i] << endl;
            passes = true;
        } else if ((rectSizes[i].x > minHeight && rectSizes[i].x < maxHeight) &&
                   (rectSizes[i].y > minWidth && rectSizes[i].y < maxWidth)) {
            cout << "rotated" << endl;
            cout << "angle: " << rectAngles_[i] << endl;
            passes = true;
            rotated = true;
        }

        if (passes) {
            drawContours(img, contoursPoly, i, color, 1, 8, vector<cv::Vec4i>(), 0,
                         cv::Point()); //takes the approximated contours as polynomails

            cv::Point2f vertices[4];
            boundRects[i].points(vertices);
            for (int j = 0; j < 4; j++) {
                cv::line(img, vertices[j], vertices[(j + 1) % 4], color, 2);
            }

            //Copy to output arrays
            *(rectXCenters + counter) = rectPoints[i][0].x;
            *(rectYCenters + counter) = rectPoints[i][0].y;
            ss << "  x=" << rectPoints[i][0].x << ", y=" << rectPoints[i][0].y;


            auto label_corner = [img](cv::Point2f &pt, int col, const char *label) {
                cv::Scalar color(col * 60, col * 60, col * 60);
                cv::circle(img, pt, 15, color, -1);
                cv::putText(img, label, pt, cv::FONT_HERSHEY_SIMPLEX, 2.0, color, 3);
            };

            float angle;
            if (rotated) {
                *(rectWidths + counter) = rectSizes[i].y;
                *(rectHeights + counter) = rectSizes[i].x;
                *(rectAngles + counter) = fmodf(rectAngles_[i] + 90, 180.0);

                *(rectXBLCorners + counter) = rectPoints[i][2].x;
                *(rectYBLCorners + counter) = rectPoints[i][2].y;
                label_corner(vertices[1], 1, "BL");

                *(rectXTLCorners + counter) = rectPoints[i][3].x;
                *(rectYTLCorners + counter) = rectPoints[i][3].y;
                label_corner(vertices[2], 2, "TL");

                *(rectXTRCorners + counter) = rectPoints[i][4].x;
                *(rectYTRCorners + counter) = rectPoints[i][4].y;
                label_corner(vertices[3], 3, "TR");

                *(rectXBRCorners + counter) = rectPoints[i][1].x;
                *(rectYBRCorners + counter) = rectPoints[i][1].y;
                label_corner(vertices[0], 4, "BR");

                ss << ", width=" << rectSizes[i].y << ", height=" << rectSizes[i].x;
            } else {
                *(rectWidths + counter) = rectSizes[i].x;
                *(rectHeights + counter) = rectSizes[i].y;
                *(rectAngles + counter) = fmodf(rectAngles_[i], 180.0);

                *(rectXBLCorners + counter) = rectPoints[i][1].x;
                *(rectYBLCorners + counter) = rectPoints[i][1].y;
                label_corner(vertices[0], 1, "BL");

                *(rectXTLCorners + counter) = rectPoints[i][2].x;
                *(rectYTLCorners + counter) = rectPoints[i][2].y;
                label_corner(vertices[1], 2, "TL");

                *(rectXTRCorners + counter) = rectPoints[i][3].x;
                *(rectYTRCorners + counter) = rectPoints[i][3].y;
                label_corner(vertices[2], 3, "TR");

                *(rectXBRCorners + counter) = rectPoints[i][4].x;
                *(rectYBRCorners + counter) = rectPoints[i][4].y;
                label_corner(vertices[3], 4, "BR");

                ss << ", width=" << rectSizes[i].x << ", height=" << rectSizes[i].y;
            }
            log(ss);
            counter += 1;
        }
    }
    *Nrects = counter;

    show(img);
    log("Done");
    return 0;
}

DLLExport int __cdecl flip(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int mirrorType) {
    cv::Mat imgIn(imgHeight, imgWidth, CV_8U, (void *) imgPtr, imgLineWidth);
    cv::flip(imgIn, imgIn, mirrorType);
    return 0;
}

DLLExport int __cdecl crop(
        char *srcPtr,
        int srcLineWidth,
        int srcWidth,
        int srcHeight,
        char *dstPtr,
        int dstLineWidth,
        int dstWidth,
        int dstHeight,
        int left,
        int right,
        int top,
        int bottom) {
    cv::Mat imgIn(srcHeight, srcWidth, CV_8U, (void *) srcPtr, srcLineWidth);
    cv::Mat imgOut(dstHeight, dstWidth, CV_8U, (void *) dstPtr, dstLineWidth);
    imgIn(cv::Range(top, bottom), cv::Range(left, right)).copyTo(imgOut);
    return 0;
}

DLLExport int __cdecl fill(
        char *srcPtr,
        int srcLineWidth,
        int srcWidth,
        int srcHeight,
        unsigned char value) {
    cv::Mat imgIn(srcHeight, srcWidth, CV_8U, (void *) srcPtr, srcLineWidth);
    imgIn.setTo(value);
    return 0;
}

DLLExport int __cdecl resample(
        char *srcPtr,
        int srcLineWidth,
        int srcWidth,
        int srcHeight,
        char *dstPtr,
        int dstLineWidth,
        int dstWidth,
        int dstHeight,
        int new_width,
        int new_height) {
    cv::Mat imgIn(srcHeight, srcWidth, CV_8U, (void *) srcPtr, srcLineWidth);
    cv::Mat imgOut(dstHeight, dstWidth, CV_8U, (void *) dstPtr, dstLineWidth);

    cv::resize(imgIn, imgOut, cv::Size(new_width, new_height), cv::INTER_LINEAR);
    return 0;
}

DLLExport int __cdecl superimpose(
        char *srcPtr,
        int srcLineWidth,
        int srcWidth,
        int srcHeight,
        char *dstPtr,
        int dstLineWidth,
        int dstWidth,
        int dstHeight,
        int dstTop,
        int dstLeft) {
    cv::Mat imgIn(srcHeight, srcWidth, CV_8U, (void *) srcPtr, srcLineWidth);
    cv::Mat imgOut(dstHeight, dstWidth, CV_8U, (void *) dstPtr, dstLineWidth);

    dstTop = clamp(dstTop, 0, dstHeight - 1);
    dstLeft = clamp(dstLeft, 0, dstWidth - 1);
    int dstRight = clamp(dstLeft + srcWidth, 0, dstWidth - 1);
    int dstBottom = clamp(dstTop + srcHeight, 0, dstHeight - 1);
    for (int i = dstTop; i < dstBottom; i++) {
        int src_row = i - dstTop;
        for (int j = dstLeft; j < dstRight; j++) {
            int src_col = j - dstLeft;
            imgOut.at<char>(i, j) = imgIn.at<char>(src_row, src_col);
        }
    }
    return 0;
}


