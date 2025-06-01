//
// Created by cfang on 5/29/2025.
//
#include <filesystem>
#include <format>
#include <iostream>
#include <ids_peak_comfort_c/ids_peak_comfort_c.h>
#include <opencv2/highgui.hpp>

#include "lvpeak.h"
#include "extcode.h"

using namespace std;

int main(int argc, char **argv) {
    cout << "Testing LVPeak\n";
    LVPeakInit();
    std::vector<peak_camera_descriptor> camera_list;
    peak_status status = PeakQueryCameras(camera_list);
    OK_OR_RETURN(status)

    for (auto &cam: camera_list) {
        cout << "Camera: " << cam.modelName << " " << cam.serialNumber << "\n";
        cout << "Camera ID: " << cam.cameraID << "\n";
        cout << "Camera Type: " << cam.cameraType << "\n";
    }
    if (camera_list.size() == 0) {
        cout <<  "No Cameras Connected. Stopping Test.\n";
        return 0;
    }


    unsigned long long cam_id = camera_list[0].cameraID;
    status = (peak_status) LVPeakOpenCamera(cam_id);
    OK_OR_RETURN(status)
    cout << "Camera Opened!\n";

    filesystem::remove("test_config.cset");
    status = (peak_status) LVPeakSaveConfig(cam_id, "test_config.cset");
    OK_OR_RETURN(status)
    cout << "Config Saved!\n";
    status = (peak_status) LVPeakLoadConfig(cam_id, "test_config.cset");
    OK_OR_RETURN(status)
    cout << "Config Loaded!\n";

    status = (peak_status) LVPeakStartAcquisition(cam_id);
    OK_OR_RETURN(status)

    cv::Mat img;
    while (true) {
        status = (peak_status) PeakGetFrame(cam_id, img);
        OK_OR_RETURN(status)
        cv::imshow("Frame", img);
        char c = (char) cv::waitKey(25);
        if (c == 27 /*ESC*/) break;
    }

    status = (peak_status) LVPeakStopAcquisition(cam_id);
    OK_OR_RETURN(status)

    status = (peak_status) LVPeakCloseCamera(cam_id);
    OK_OR_RETURN(status)
    cout << "Camera Closed!\n";

    cout << "Done. Cleaning Up.\n";
    LVPeakCleanup();
    return 0;
}