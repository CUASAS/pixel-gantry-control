#include <filesystem>
#include <format>
#include <iostream>

#include <ids_peak_comfort_c/ids_peak_comfort_c.h>
#include <lvpeak.h>
#include <map>
#include <vector>

using namespace std;

bool initialized = false;
map<unsigned long long, peak_camera_handle> open_cameras;
unsigned int frame_timeout_ms = 10;


__declspec(dllexport) peak_status PeakQueryCameras(vector<peak_camera_descriptor> &camera_descriptors) {
    peak_status status = PEAK_STATUS_SUCCESS;
    status = static_cast<peak_status>(LVPeakInit());
    OK_OR_RETURN(status)

    status = peak_CameraList_Update(nullptr);
    OK_OR_RETURN(status)

    size_t camera_list_length = 0;
    status = peak_CameraList_Get(nullptr, &camera_list_length);
    OK_OR_RETURN(status)

    camera_descriptors.resize(camera_list_length);
    status = peak_CameraList_Get(camera_descriptors.data(), &camera_list_length);
    OK_OR_RETURN(status)
    return status;
}


__declspec(dllexport) int __cdecl LVPeakOpenCamera(unsigned long long camera_id) {
    peak_status status = PEAK_STATUS_SUCCESS;
    status = static_cast<peak_status>(LVPeakInit());
    OK_OR_RETURN(status)

    peak_camera_handle camera = nullptr;
    status = peak_Camera_Open(camera_id, &camera);
    OK_OR_RETURN(status)
    open_cameras[camera_id] = camera;
    return status;
}

__declspec(dllexport) int __cdecl LVPeakCloseCamera(unsigned long long camera_id) {
    peak_status status = PEAK_STATUS_SUCCESS;
    status = static_cast<peak_status>(LVPeakInit());
    OK_OR_RETURN(status)

    if (!open_cameras.contains(camera_id)) {
        return PEAK_STATUS_INVALID_PARAMETER;
    }

    peak_camera_handle camera = open_cameras[camera_id];

    if (peak_Acquisition_IsStarted(camera) == PEAK_TRUE) {
        (void)LVPeakStopAcquisition(camera_id);
    }

    status = peak_Camera_Close(camera);
    open_cameras[camera_id] = camera;
    open_cameras.erase(camera_id);
    return status;
}


__declspec(dllexport) int __cdecl LVPeakInit() {
    peak_status status = PEAK_STATUS_SUCCESS;
    if (initialized) {
        return status;
    }
    cout << "LVPeakInit\n";
    status = peak_Library_Init();
    open_cameras.clear();
    OK_OR_RETURN(status)
    initialized = true;
    return status;
}

__declspec(dllexport) int __cdecl LVPeakCleanup() {
    cout << "LVPeakCleanup\n";

    for (std::pair<unsigned long long, peak_camera_handle> open_camera: open_cameras) {
        peak_Camera_Close(open_camera.second);
    }
    open_cameras.clear();

    (void) peak_Library_Exit();
    return 0;
}

__declspec(dllexport) int __cdecl LVPeakCameraCount(int *count) {
    peak_status status = PEAK_STATUS_SUCCESS;
    vector<peak_camera_descriptor> camera_list;
    status = PeakQueryCameras(camera_list);
    OK_OR_RETURN(status)
    *count = static_cast<int>(camera_list.size());
    return status;
}


__declspec(dllexport) int __cdecl LVPeakCameraInfo(int cam_idx, unsigned long long *camera_id, LStrHandle cam_name,
                                                   LStrHandle serial_number) {
    peak_status status = PEAK_STATUS_SUCCESS;
    vector<peak_camera_descriptor> camera_list;
    status = PeakQueryCameras(camera_list);
    OK_OR_RETURN(status)
    if (cam_idx >= camera_list.size()) {
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    *camera_id = camera_list[cam_idx].cameraID;
    LStrPrintf(cam_name, (CStr) "%s", camera_list[cam_idx].modelName);
    LStrPrintf(serial_number, (CStr) "%s", camera_list[cam_idx].serialNumber);
    return status;
}

__declspec(dllexport) int LVPeakSaveConfig(unsigned long long cam_id, const char *filename) {
    if (!open_cameras.contains(cam_id)) {
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    peak_camera_handle camera = open_cameras[cam_id];
    peak_status status = peak_CameraSettings_DiskFile_Store(camera, filename);
    return status;
}

__declspec(dllexport) int LVPeakLoadConfig(unsigned long long cam_id, const char *filename) {
    if (!open_cameras.contains(cam_id)) {
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    peak_status status = PEAK_STATUS_SUCCESS;
    peak_camera_handle camera = open_cameras[cam_id];

    peak_access_status access_status = peak_CameraSettings_DiskFile_GetAccessStatus(camera);
    // cout << format("Access Status: {:#06x}\n", (int) access_status);

    status = peak_CameraSettings_DiskFile_Apply(camera, filename);
    return status;
}

__declspec(dllexport) int __cdecl LVPeakStartAcquisition(int camera_id) {
    if (!open_cameras.contains(camera_id)) {
        cerr << "Camera not open\n";
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    const peak_camera_handle camera = open_cameras[camera_id];
    peak_status status = PEAK_STATUS_SUCCESS;
    if (peak_Acquisition_IsStarted(camera) == PEAK_TRUE) {
        return PEAK_STATUS_SUCCESS;
    }
    // Set Pixel Format to 1-byte grayscale
    status = peak_PixelFormat_Set(camera, PEAK_PIXEL_FORMAT_MONO8);
    OK_OR_RETURN(status)
    // Set Framerate to maximum
    double minFramerate, maxFramerate, incFramerate;
    status = peak_FrameRate_GetRange(camera, &minFramerate, &maxFramerate, &incFramerate);
    OK_OR_RETURN(status)
    status = peak_FrameRate_Set(camera, maxFramerate);
    OK_OR_RETURN(status)
    frame_timeout_ms = (3000 / maxFramerate) + 0.5;
    status = peak_Acquisition_Start(camera, PEAK_INFINITE);
    OK_OR_RETURN(status)
    return status;
}

__declspec(dllexport) int __cdecl LVPeakStopAcquisition(int camera_id) {
    if (!open_cameras.contains(camera_id)) {
        cerr << "Camera not open\n";
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    const peak_camera_handle camera = open_cameras[camera_id];
    if (peak_Acquisition_IsStarted(camera) != PEAK_TRUE) {
        return PEAK_STATUS_SUCCESS;
    }
    peak_status status = peak_Acquisition_Stop(camera);
    OK_OR_RETURN(status)
    return status;
}


__declspec(dllexport) peak_status PeakGetFrame(const int camera_id, cv::Mat &img) {
    if (!open_cameras.contains(camera_id)) {
        cerr << "Camera not open\n";
        return PEAK_STATUS_INVALID_PARAMETER;
    }
    const peak_camera_handle camera = open_cameras[camera_id];
    peak_status status = PEAK_STATUS_SUCCESS;
    if (peak_Acquisition_IsStarted(camera) != PEAK_TRUE) {
        status = static_cast<peak_status>(LVPeakStartAcquisition(camera_id));
        OK_OR_RETURN(status)
    }

    peak_frame_handle frame = nullptr;
    for (int i = 0; i < 10; i++) { // Try up to 10 times to get an image
        status = peak_Acquisition_WaitForFrame(camera, frame_timeout_ms, &frame);
        if (status == PEAK_STATUS_TIMEOUT) continue;
        break;
    }
    OK_OR_RETURN(status);

    peak_frame_info frame_info;
    peak_Frame_GetInfo(frame, &frame_info);
    if (PEAK_ERROR(status)) {
        (void) peak_Frame_Release(camera, frame);
        OK_OR_RETURN(status);
    }
    img = cv::Mat(frame_info.roi.size.height, frame_info.roi.size.width, CV_8U,
                  (void *) frame_info.buffer.memoryAddress, frame_info.roi.size.width);
    (void) peak_Frame_Release(camera, frame);
    return status;
}

__declspec(dllexport) int LVPeakGetFrame(int camera_id, char *imgPtr,
                                         int imgLineWidth, int imgWidth,
                                         int imgHeight) {
    cv::Mat lv_img = cv::Mat(imgHeight, imgWidth, CV_8U, imgPtr, imgLineWidth);
    cv::Mat cam_img;
    peak_status status = PeakGetFrame(camera_id, cam_img);
    cam_img.copyTo(lv_img);
    return status;
}
