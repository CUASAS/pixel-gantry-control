#ifndef LVPEAK_H
#define LVPEAK_H

#include <vector>
#include <opencv2/world.hpp>

#include "extcode.h"


void printLastError() {
    peak_status lastErrorCode = PEAK_STATUS_SUCCESS;
    peak_status status = PEAK_STATUS_SUCCESS;
    size_t lastErrorMessageSize = 0;

    // Get last error message size
    status = peak_Library_GetLastError(&lastErrorCode, NULL, &lastErrorMessageSize);
    if (PEAK_ERROR(status)) {
        // Something went wrong getting the last error!
        fprintf(stderr, "Last-Error: Getting last error code failed! Status: %#06x\n", status);
        return;
    }

    // Get the corresponding error message.
    char *lastErrorMessage = (char *) malloc(lastErrorMessageSize);
    if (lastErrorMessage == NULL) {
        // Cannot allocate lastErrorMessage. Most likely not enough Memory.
        fprintf(stderr, "Last-Error: Failed to allocate memory for the error message!\n");
        free(lastErrorMessage);
        return;
    }
    memset(lastErrorMessage, 0, lastErrorMessageSize);

    status = peak_Library_GetLastError(&lastErrorCode, lastErrorMessage, &lastErrorMessageSize);
    if (PEAK_ERROR(status)) {
        // Unable to get error message. This shouldn't ever happen.
        fprintf(stderr, "Last-Error: Getting last error message failed! Status: %#06x; Last error code: %#06x\n",
                status, lastErrorCode);
        free(lastErrorMessage);
        return;
    }

    printf("Last-Error: %s | Code: %#06x\n", lastErrorMessage, lastErrorCode);
    free(lastErrorMessage);
}


#define OK_OR_RETURN(status) \
if (PEAK_ERROR(status)) { \
std::cerr << "Error in " << __FILE__ << ":" << __LINE__ << std::endl; \
printLastError(); \
return status; \
}

__declspec(dllexport) peak_status PeakQueryCameras(std::vector<peak_camera_descriptor> &Camera_descriptors);

__declspec(dllexport) peak_status PeakGetFrame(int camera_id, cv::Mat &img);

extern "C" {
__declspec(dllexport) int __cdecl LVPeakInit();

__declspec(dllexport) int __cdecl LVPeakCleanup();

__declspec(dllexport) int __cdecl LVPeakCameraCount(int *count);

__declspec(dllexport) int __cdecl LVPeakCameraInfo(int cam_idx, unsigned long long *camera_id, LStrHandle cam_name,
                                                   LStrHandle serial_number);

__declspec(dllexport) int __cdecl LVPeakOpenCamera(unsigned long long camera_id);

__declspec(dllexport) int __cdecl LVPeakCloseCamera(unsigned long long camera_id);

__declspec(dllexport) int __cdecl LVPeakSaveConfig(unsigned long long cam_id, const char *filename);

__declspec(dllexport) int __cdecl LVPeakLoadConfig(unsigned long long cam_id, const char *filename);

__declspec(dllexport) int __cdecl LVPeakStartAcquisition(int camera_id);

__declspec(dllexport) int __cdecl LVPeakStopAcquisition(int camera_id);

__declspec(dllexport) int LVPeakGetFrame(int camera_id, char *imgPtr,
                                         int imgLineWidth, int imgWidth,
                                         int imgHeight);
}


#endif //LVPEAK_H
