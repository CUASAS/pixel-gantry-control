//
// Created by cfang on 5/29/2025.
//
#include <format>
#include <iostream>
#include <ids_peak_comfort_c/ids_peak_comfort_c.h>

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
    status = (peak_status) LVPeakSaveConfig(cam_id, "test_config.cset");
    OK_OR_RETURN(status)
    status = (peak_status) LVPeakLoadConfig(cam_id, "test_config.cset");
    OK_OR_RETURN(status)
    status = (peak_status) LVPeakCloseCamera(cam_id);
    OK_OR_RETURN(status)

    cout << "Done. Cleaning Up.\n";
    LVPeakCleanup();
    return 0;
}