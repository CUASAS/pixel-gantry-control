#include <iostream>

#include <ids_peak_comfort_c/ids_peak_comfort_c.h>
#include <lvpeak.h>
#include <map>
#include <vector>

using namespace std;

bool initialized = false;
map<unsigned long long, peak_camera_handle> open_cameras;





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
    status = peak_Camera_Close(camera);
    OK_OR_RETURN(status)
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

    for (std::pair<unsigned long long, peak_camera_handle> open_camera : open_cameras) {
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
    peak_camera_handle camera = open_cameras[cam_id];
    peak_status status = peak_CameraSettings_DiskFile_Apply(camera, filename);
    return status;
}
