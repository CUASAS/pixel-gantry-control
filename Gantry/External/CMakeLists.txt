# This build was tested on Windows 10 using the Visual Studio 2019 64-bit toolchain
cmake_minimum_required(VERSION 3.21)
project(GantryExt
        VERSION 1.0
        DESCRIPTION "Extension Module for pixel-gantry-control"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

# To get these libs, download the OpenCV 4.5.5 installer for windows and unpack it to C:
set(OPENCV_INC "C:/opencv/build/include")
set(OPENCV_LIBDIR "C:/opencv/build/x64/vc16/lib")
set(OPENCV_LIB "opencv_world490")

set(LV_INC "C:/Program Files/National Instruments/LabVIEW 2024/cintools/")
set(LV_LIBDIR "C:/Program Files/National Instruments/LabVIEW 2024/cintools/")
set(LV_LIB "labviewv")

set(WMF_LIB
        dxva2.lib
        evr.lib
        mf.lib
        mfplat.lib
        mfplay.lib
        mfreadwrite.lib
        mfuuid.lib
        shlwapi.lib
        #        kernel32.lib
        #        user32.lib
        #        gdi32.lib
        #        winspool.lib
        #        comdlg32.lib
        #        advapi32.lib
        #        shell32.lib
        #        ole32.lib
        #        oleaut32.lib
        #        uuid.lib
        #        odbc32.lib
        #        odbccp32.lib
        )

add_library(Vision SHARED Vision/vision.cpp Vision/vision.h Vision/vision_utils.cpp Vision/vision_utils.h)
target_include_directories(Vision PUBLIC "include/" ${LV_INC} ${OPENCV_INC})
target_link_directories(Vision PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
target_link_libraries(Vision PUBLIC ${OPENCV_LIB} ${LV_LIB})

add_executable(test_Vision Vision/test_Vision.cpp)
target_link_libraries(test_Vision PUBLIC Vision)

set(escapi
        Camera/capture.cpp
        Camera/capture.h
        Camera/choosedeviceparam.h
        Camera/conversion.cpp
        Camera/conversion.h
        Camera/interface.cpp
        Camera/scopedrelease.h
        Camera/videobufferlock.cpp
        Camera/videobufferlock.h
        Camera/mediamode.h
        Camera/captureproperties.h)

add_library(Camera SHARED ${escapi})
target_include_directories(Camera PUBLIC  "include/" ${LV_INC} ${OPENCV_INC})
target_link_directories(Camera PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
target_link_libraries(Camera PUBLIC ${OPENCV_LIB} ${LV_LIB} ${WMF_LIB})

add_executable(test_Camera Camera/test_camera.cpp ${escapi})
target_include_directories(test_Camera PUBLIC "./" ${OPENCV_INC} ${LV_INC})
target_link_directories(test_Camera PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
target_link_libraries(test_Camera PUBLIC ${WMF_LIB} ${OPENCV_LIB} ${LV_LIB})
