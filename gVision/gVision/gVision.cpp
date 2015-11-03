// gVision.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "opencv2/opencv.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <set>

extern "C" __declspec(dllexport) int __cdecl getFocus(char* img,   int imgLineWidth,
	                                                  int imgWidth, int imgHeight,
													  int interactive,
													  float* focus);
extern "C" __declspec(dllexport) int __cdecl getFiducial(char* img, int imgLineWidth,
	                                                     int imgWidth, int imgHeight,
														 float shrinkFactor,
														 int dilateSize,
														 float sizeMin, float sizeMax,
														 float arMin, float arMax,
														 int colorGroups,
														 int interactive,
														 int* numFiducials,
														 float* coords);


extern "C" __declspec(dllexport) int __cdecl fitFocus(double* focus_values,
		                                      double* heights,
						      int num_measurements);


void show(cv::Mat img, bool interactive){
	if (interactive) return;
	cv::namedWindow("MyWindow", cv::WINDOW_AUTOSIZE);
	cv::imshow("MyWindow", img);
	cv::waitKey(0);
	cv::destroyWindow("MyWindow");
}

//#define INTERACTIVE

__declspec(dllexport) int __cdecl getFocus(char* imgPtr, int imgLineWidth,
	                                       int imgWidth, int imgHeight,
										   int interactive,
	                                       float* focus){
	cv::Mat img(imgHeight, imgWidth, CV_8U, (void*)imgPtr, imgLineWidth);

	cv::Mat lap;
	cv::Laplacian(img, lap, CV_32F, 5, .01);

	cv::Scalar mu, sigma;
	cv::meanStdDev(lap, mu, sigma);
	*focus = (float)sigma.val[0] * sigma.val[0];
	return 0; 
}

void log(const std::string &data){
	std::ofstream myfile;
	myfile.open("C:\\Users\\Husker\\Desktop\\out.txt", std::ios::out | std::ios::app);

	myfile << data << std::endl;
	myfile.close();
}

void setTo(cv::Mat &img, char from, char to){
	int n = img.rows * img.cols;
	for (int i = 0; i < n; i++){
		char &curr = img.at<char>(i);
		if (curr == from) curr = to;
	}
}

void setForeground(cv::Mat &img, char fgId, char fgVal, char bgVal){
	int n = img.rows * img.cols;
	for (int i = 0; i < n; i++){
		char &curr = img.at<char>(i);
		curr = (curr == fgId) ? fgVal : bgVal;
	}
}

void doBlur(cv::Mat &img, int blurSize){
	if (blurSize % 2 == 0) blurSize++;
	cv::blur(img, img, cv::Size(blurSize, blurSize));
}

void doKMeans(cv::Mat &img, int k){
	cv::TermCriteria tc(cv::TermCriteria::COUNT + cv::TermCriteria::EPS, 10, 1.0);
	int flags = cv::KMEANS_PP_CENTERS;
	cv::Mat kmeansIn = img.reshape(1, img.rows*img.cols);
	cv::Mat colVecD, bestLabels, centers, clustered;
	kmeansIn.convertTo(colVecD, CV_32FC3, 1.0 / 255.0);

	double compactness = kmeans(colVecD, k, bestLabels, tc, 1, flags, centers);

	bestLabels = bestLabels.reshape(1, img.rows);
	bestLabels.convertTo(bestLabels, CV_8U);
	img = bestLabels;

	float maxVal = -1; int foreground = -1;
	for (int i = 0; i < centers.rows; i++){
		float center = centers.at<float>(i);
		if (center > maxVal){
			maxVal = center;
			foreground = i;
		}
	}
	setForeground(img, foreground, 255, 0);
}

void doDilate(cv::Mat &img, int size){
	cv::Size s(size, size);
	cv::Mat element = getStructuringElement(cv::MORPH_ELLIPSE, s);
	dilate(img, img, element);
}

std::vector<std::vector<cv::Point>> getContours(cv::Mat &img, float sizeMin, float sizeMax, float arMin, float arMax){
	float pixels = img.rows * img.cols;
	std::vector<std::vector<cv::Point>> contours;
	std::vector<cv::Vec4i> hierarchy;
	findContours(img.clone(), contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);

	std::vector<std::vector<cv::Point>> passContours;
	for (unsigned int i = 0; i < contours.size(); i++){
		float size = contourArea(contours[i]) / pixels;
		cv::RotatedRect rr = minAreaRect(contours[i]);
		float ar = float(rr.size.width) / rr.size.height;
		if ((size > sizeMin && size < sizeMax) && (ar > arMin && ar < arMax)){
			passContours.push_back(contours[i]);
		}
	}
	return passContours;
}

#define NUM_FIDS 10
__declspec(dllexport) int __cdecl getFiducial(char* imgPtr, int imgLineWidth,
	                                          int imgWidth, int imgHeight,
					                          float shrinkFactor,
				                              int dilateSize,
					                          float sizeMin, float sizeMax,
											  float arMin, float arMax,
											  int colorGroups,
											  int interactive,
											  int* numFiducials,
											  float* coords){ //coords must be a 2*NUM_FIDS element float array
	cv::Mat imgIn(imgHeight, imgWidth, CV_8U, (void*)imgPtr, imgLineWidth);
	cv::Mat img = imgIn.clone(); //Make a local copy of image to avoid corrupting original image
	int rows = img.rows / shrinkFactor;
	int cols = img.cols / shrinkFactor;
	cv::Size s(cols, rows);
	resize(img, img, s);
	//show(img, interactive);
	//doBlur(img, dilateSize);
	show(img, interactive);
	doKMeans(img, colorGroups);

	doDilate(img, dilateSize);
	show(img, interactive);

	std::vector<std::vector<cv::Point>> contours = getContours(img, sizeMin, sizeMax, arMin, arMax);
	if (contours.size() > NUM_FIDS){
		contours.resize(NUM_FIDS);
	}
	*numFiducials = contours.size();


	std::ofstream myfile;
	myfile.open("C:\\Users\\Husker\\Desktop\\out.txt", std::ios::out | std::ios::app);

	myfile << "Fiducials Found: " << contours.size() << std::endl;

	for (unsigned int i = 0; i < contours.size(); i++){
		std::vector<cv::Point> fidContour = contours[i];

		cv::Moments mu = moments(fidContour, false);
		//cv::Point2f centroid(mu.m10 / mu.m00, mu.m01 / mu.m00);
		float x = mu.m10 / mu.m00 / cols;
		float y = mu.m01 / mu.m00 / rows;
		//circle(img, centroid, 3, cv::Scalar(255), -1);
		*(coords + 2 * i) = x;
		*(coords + 2 * i + 1) = y;
		myfile << "x:" << x << ", y:" << y << std::endl;

	}


	myfile.close();

	return 0;
}

__declspec(dllexport) int __cdecl fitFocus(double* focus_values,
                                           double* heights,
					   int num_measurements){
	return 0;
}
