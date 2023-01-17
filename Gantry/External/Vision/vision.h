#ifndef CLIONLVTEST_VISION_H
#define CLIONLVTEST_VISION_H

#define DLLExport __declspec(dllexport)

extern "C" {
DLLExport int __cdecl calc_focus(
        char *img,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        float *focus);


DLLExport int __cdecl convert_to_grayscale(
        char *src_imgPtr,
        int src_imgLineWidth,
        int src_imgWidth,
        int src_imgHeight,
        const char *src_type,
        char *dst_imgPtr,
        int dst_imgLineWidth,
        int dst_imgWidth,
        int dst_imgHeight
        );


DLLExport int __cdecl find_patches(
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
        float *patchSizes);


DLLExport int __cdecl find_circles(
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
        float *circleRadii);


DLLExport int __cdecl find_rects(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int shrinkFactor,
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
        float *rectAngles);

DLLExport int __cdecl flip(
        char *imgPtr,
        int imgLineWidth,
        int imgWidth,
        int imgHeight,
        int flipType);

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
        int bottom);


DLLExport int __cdecl fill(
        char *srcPtr,
        int srcLineWidth,
        int srcWidth,
        int srcHeight,
        unsigned char value);

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
        int new_height);

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
        int dstLeft);

};  // end extern "C"
#endif //CLIONLVTEST_VISION_H
