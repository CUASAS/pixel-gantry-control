#include <iostream>
#include <opencv2/opencv.hpp>

using namespace std;

int main(int argc, const char **argv) {
    cv::Mat checkerboard(400,400, CV_8UC3, cv::Scalar(255, 255, 255));

    // Define the size of each square (e.g., 50x50 pixels)
    int squareSize = 50;

    // Fill the checkerboard pattern
    for(int i = 0; i < checkerboard.rows; i++) {
        for(int j = 0; j < checkerboard.cols; j++) {
            // If the sum of the integer division of coordinates by squareSize is even,
            // make the square black, otherwise keep it white
            if(((i/squareSize) + (j/squareSize)) % 2 == 0) {
                checkerboard.at<cv::Vec3b>(i, j) = cv::Vec3b(0, 0, 0);
            }
        }
    }

    // Show the image and wait for keypress
    cv::imshow("Checkerboard", checkerboard);
    cout << "Press any key to continue" << endl;
    cv::waitKey(0);
    return 0;
}