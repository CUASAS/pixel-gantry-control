#pragma once

#include <mfapi.h>
#include <mfidl.h>
#include <mfreadwrite.h>
#include <map>
#include <string>
#include "mediamode.h"

#include "extcode.h"
#include "ILVDataInterface.h"
#include "ILVTypeInterface.h"

extern "C" {
    __declspec(dllexport) int __cdecl CleanupDevice(const char* cam_name);
    __declspec(dllexport) int __cdecl InitDevice(const char* cam_name, int mode_id, int* width, int* height);
    __declspec(dllexport) int __cdecl CountCaptureDevices(int* count);
    __declspec(dllexport) int __cdecl GetCaptureDeviceName(int cam_id, LStrHandle name_lsh);
    __declspec(dllexport) int __cdecl CheckForFail(const char* cam_name);
    __declspec(dllexport) int __cdecl GetErrorCode(const char* cam_name);
    __declspec(dllexport) int __cdecl GetErrorLine(const char* cam_name);
    __declspec(dllexport) int __cdecl GetProperty(const char* cam_name, const char* prop_name, float* val, int* autoval);
    __declspec(dllexport) int __cdecl SetProperty(const char* cam_name, const char* prop_name, float val, int autoval);
    __declspec(dllexport) int __cdecl GetAvailableModes(const char* cam_name, UHandle* ids, UHandle* widths,
                                                        UHandle* heights, UHandle* framerates);
    __declspec(dllexport) int __cdecl DoCapture(const char* cam_name);
    __declspec(dllexport) int __cdecl IsCaptureDone(const char* cam_name);
    __declspec(dllexport) int __cdecl GetFrame(const char* cam_name, char *dst_imgPtr, int dst_imgLineWidth,
                                               int dst_imgWidth, int dst_imgHeight);
    __declspec(dllexport) int __cdecl Init();
}

int GetAvailableModes2(const char* cam_name, std::map<int, MediaMode> &modes);
int GetCaptureDeviceName2(int cam_id, std::string &name);


