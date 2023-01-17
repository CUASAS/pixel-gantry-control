#include "interface.h"
#include "capture.h"
#include "scopedrelease.h"
#include "choosedeviceparam.h"

#include "opencv2/opencv.hpp"
#include "opencv2/imgproc.hpp"

#include <vector>
#include <string>
#include <sstream>
#include <map>
#include <stdexcept>

std::map<std::string, CaptureClass *> gDevice;
std::map<std::string, int> gIds;
std::map<std::string, int> gDoCapture;
std::map<std::string, int> gOptions;
std::map<std::string, int *> gBuffer;

bool is_setup = false;

int CleanupDevice(const char* cam_name) {
    Init();
    try {
        CaptureClass *cc = gDevice.at(cam_name);
        cc->deinitCapture();
        delete cc;
        gDevice.erase(cam_name);

        int *buffer = gBuffer.at(cam_name);
        delete buffer;
        gBuffer.erase(cam_name);
    } catch (std::out_of_range &e) {
        return 0;
    }
    return 0;
}

int InitDevice(const char* cam_name, int mode_id, int* width, int* height) {
    Init();
    gDoCapture[cam_name] = 0;
    gOptions[cam_name] = 0;
    if (gDevice.find(cam_name) != gDevice.end()) {
        CleanupDevice(cam_name);
    }
    gDevice[cam_name] = new CaptureClass();
    int id = gIds[cam_name];
    HRESULT hr = gDevice[cam_name]->initCapture(id, mode_id, cam_name);
    if (FAILED(hr)) {
        delete gDevice[cam_name];
        gDevice.erase(cam_name);
    } else {
        *width = gDevice[cam_name]->mCaptureBufferWidth;
        *height = gDevice[cam_name]->mCaptureBufferHeight;
        gBuffer[cam_name] = new int[*width * *height];
    }
    return hr;
}


int CountCaptureDevices(int* count) {
    Init();
    HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    if (FAILED(hr)) return 0;

    hr = MFStartup(MF_VERSION);
    if (FAILED(hr)) return 0;

    // choose device
    IMFAttributes *attributes = nullptr;
    hr = MFCreateAttributes(&attributes, 1);
    ScopedRelease<IMFAttributes> attributes_s(attributes);
    if (FAILED(hr)) return 0;

    hr = attributes->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE, MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
    if (FAILED(hr)) return 0;

    ChooseDeviceParam param = {nullptr};
    hr = MFEnumDeviceSources(attributes, &param.mDevices, &param.mCount);
    if (FAILED(hr)) return 0;

    *count = (int) param.mCount;

    for(int i=0; i<*count; i++) {
        std::string name;
        GetCaptureDeviceName2(i, name);
        gIds[name] = i;
    }
    return 0;
}

int GetCaptureDeviceName(int cam_id, LStrHandle name_lsh) {
    std::string name_;
    GetCaptureDeviceName2(cam_id, name_);
    LStrPrintf(name_lsh, (CStr) "%s", name_.c_str());
    return 0;
}

int GetCaptureDeviceName2(int cam_id, std::string &name_) {
    Init();

    HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    if (FAILED(hr)) return hr;

    hr = MFStartup(MF_VERSION);
    if (FAILED(hr)) return hr;

    // choose device
    IMFAttributes *attributes = nullptr;
    hr = MFCreateAttributes(&attributes, 1);
    ScopedRelease<IMFAttributes> attributes_s(attributes);
    if (FAILED(hr)) return hr;

    hr = attributes->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE, MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
    if (FAILED(hr)) return hr;

    ChooseDeviceParam param = {nullptr};
    hr = MFEnumDeviceSources(attributes, &param.mDevices, &param.mCount);
    if (FAILED(hr)) return hr;

    if (cam_id < (signed) param.mCount) {
        WCHAR *name = nullptr, *ser = nullptr;
        UINT32 len = 255;
        hr = param.mDevices[cam_id]->
                GetAllocatedString(MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME, &name, &len);
        if (FAILED(hr)) return hr;
        std::wstring name_ws(name);
        std::string name_str(name_ws.begin(), name_ws.end());
        CoTaskMemFree(name);

        hr = param.mDevices[cam_id]->
                GetAllocatedString(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK, &ser, &len);
        if (FAILED(hr)) return hr;
        std::wstring ser_ws(ser);
        std::string ser_str(ser_ws.begin(), ser_ws.end());
        CoTaskMemFree(ser);

        std::stringstream ss(ser_str);
        std::string part;
        std::vector<std::string> parts;
        while (std::getline(ss, part, '#')) parts.push_back(part);
        if (parts.size() >= 3) {
            part = parts[2];
        } else {
            part = "";
        }
        name_ = name_str + " | " + part;
        return 0;
    }
    return -1;
}


int CheckForFail(const char* cam_name) {
    Init();
    if (!gDevice[cam_name])
        return -1;

    if (gDevice[cam_name]->mRedoFromStart) {
        gDevice[cam_name]->mRedoFromStart = 0;
        gDevice[cam_name]->deinitCapture();
        int cam_id = gIds[cam_name];
        HRESULT hr = gDevice[cam_name]->initCapture(cam_id, gDevice[cam_name]->mode_id, cam_name);
        if (FAILED(hr)) {
            delete gDevice[cam_name];
            gDevice.erase(cam_name);
            return hr;
        }
    }
    return 0;
}

int GetAvailableModes2(const char* cam_name, std::map<int, MediaMode> &modes) {
    Init();
    bool close_after = false;
    if (gDevice.find(cam_name) == gDevice.end()) {
        close_after = true;
        int width, height;
        int ret = InitDevice(cam_name, 0, &width, &height);
        if (FAILED(ret)){
            return ret;
        }
    }
    gDevice[cam_name]->getModes(modes);
    if (close_after) {
        CleanupDevice(cam_name);
    }
    return 0;
}

#define LVFAILED(c) c!=noErr

int GetAvailableModes(const char* cam_name, UHandle* ids, UHandle* widths, UHandle* heights, UHandle* framerates) {
    std::map<int,MediaMode> modes;
    HRESULT hr = GetAvailableModes2(cam_name, modes);
    if (FAILED(hr)) return hr;

    hr = NumericArrayResize(0x03, 1, ids, sizeof(int)*modes.size());
    if (LVFAILED(hr)) return hr;
    hr = NumericArrayResize(0x03, 1, widths, sizeof(int)*modes.size());
    if (LVFAILED(hr)) return hr;
    hr = NumericArrayResize(0x03, 1, heights, sizeof(int)*modes.size());
    if (LVFAILED(hr)) return hr;
    hr = NumericArrayResize(0x09, 1, framerates, sizeof(float)*modes.size());
    if (LVFAILED(hr)) return hr;

    *((int*) **ids) = (int) modes.size();
    *((int*) **widths) = (int) modes.size();
    *((int*) **heights) = (int) modes.size();
    *((int*) **framerates) = (int) modes.size();

    auto ids_ptr = (int*) **ids;
    auto widths_ptr = (int*) **widths;
    auto heights_ptr = (int*) **heights;
    auto framerates_ptr = (float*) **framerates;
    int i = 0;
    for (auto [_, mode] : modes) {
        if (mode.id == 0 && i != 0) continue;
        *(ids_ptr + 1 + i) = (int) mode.id;
        *(widths_ptr + 1 + i) = (int) mode.width;
        *(heights_ptr + 1 + i) = (int) mode.height;
        *(framerates_ptr + 1 + i) = mode.framerate;
        i++;
    }
    return 0;
}


int GetProperty(const char* cam_name, const char* prop_name, float* val, int* autoval) {
    Init();
    CheckForFail(cam_name);
    if (!gDevice[cam_name])
        return -1;
    return gDevice[cam_name]->getProperty(prop_name, *val, *autoval);
}


int SetProperty(const char* cam_name, const char* prop_name, float val, int autoval) {
    Init();
    CheckForFail(cam_name);
    if (!gDevice[cam_name])
        return 0;
    return gDevice[cam_name]->setProperty(prop_name, val, autoval);
}

int Init() {
    if (!is_setup) {
        is_setup = true;
        /* Initialize COM.. */
        CoInitialize(nullptr);
        int _;
        CountCaptureDevices(&_);
    }
    return 0;
}

int DoCapture(const char* cam_name) {
    Init();
    CheckForFail(cam_name);
    gDoCapture[cam_name] = -1;
    return 0;
}

int IsCaptureDone(const char* cam_name) {
    Init();
    CheckForFail(cam_name);
    if (gDoCapture[cam_name] == 1)
        return 1;
    return 0;
}

int GetFrame(const char* cam_name,
             char *dst_imgPtr,
             int dst_imgLineWidth,
             int dst_imgWidth,
             int dst_imgHeight) {
    Init();

    DoCapture(cam_name);
    while(!IsCaptureDone(cam_name));

    try {
        int width = gDevice.at(cam_name)->mCaptureBufferWidth;
        int height = gDevice.at(cam_name)->mCaptureBufferHeight;
        cv::Mat img(height, width, CV_8UC4, (void *) gBuffer.at(cam_name), width * sizeof(int));
        cv::Mat gs(dst_imgHeight, dst_imgWidth, CV_8U, (void *) dst_imgPtr, dst_imgLineWidth);
        cv::cvtColor(img, gs, cv::COLOR_BGR2GRAY);
    } catch (std::out_of_range &e) {
        return -1;
    }
    return 0;
}
