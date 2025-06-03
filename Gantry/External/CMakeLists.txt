# This build was tested on Windows 10 using the Visual Studio 2019 64-bit toolchain
cmake_minimum_required(VERSION 3.31)
project(GantryExt
        VERSION 1.0
        DESCRIPTION "Extension Module for pixel-gantry-control"
        LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_STANDARD 99)


set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};C:/opencv/build")
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/cmake")
find_package(OpenCV 4.9 REQUIRED)
find_package(LabVIEW REQUIRED)
find_package(ids_peak_comfort_c REQUIRED HINTS "C:/Program Files/IDS/ids_peak/comfort_sdk" )


file(GLOB PatternRecognition_SRC "PatternRecognition/src/*.cpp")
file(GLOB PatternRecognition_INC "PatternRecognition/include/*.h")
file(GLOB PatternRecognition_TEST "PatternRecognition/test/*")


add_library(PatternRecognition SHARED ${PatternRecognition_SRC})
target_include_directories(PatternRecognition PUBLIC "PatternRecognition/include" LabVIEW opencv_world)
#target_link_directories(PatternRecognition PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR} LabVIEW opencv::opencv_world)
target_link_libraries(PatternRecognition PUBLIC LabVIEW opencv_world)

add_executable(test_PatternRecognition ${PatternRecognition_TEST})
target_link_libraries(test_PatternRecognition PUBLIC PatternRecognition)

#### LVPeak Library
add_library(LVPeak SHARED LVPeak/include/lvpeak.h LVPeak/src/lvpeak.cpp)
target_link_libraries(LVPeak LabVIEW ids_peak_comfort_c::ids_peak_comfort_c opencv_world)
target_include_directories(LVPeak PUBLIC ${LabVIEW_INCLUDE_DIRS} LVPeak/include/)
ids_peak_comfort_c_deploy(LVPeak)

add_executable(test_LVPeak LVPeak/test/test.cpp)
target_link_libraries(test_LVPeak LVPeak)
target_include_directories(test_LVPeak PUBLIC LVPeak/include/ )
ids_peak_comfort_c_deploy(test_LVPeak)



set(WMF_LIB dxva2.lib evr.lib mf.lib mfplat.lib mfplay.lib mfreadwrite.lib mfuuid.lib shlwapi.lib )
file(GLOB LVWMF_SRC "LVWMF/src/*.cpp" "LVWMF/include/*.h")
add_library(LVWMF SHARED ${LVWMF_SRC})
target_link_libraries(LVWMF PUBLIC LabVIEW opencv_world ${WMF_LIB})
target_include_directories(LVWMF PUBLIC  "LVWMF/include/" ${LabVIEW_INCLUDE_DIRS} opencv_world)
#
#add_executable(test_LVWMF LVWMF/test/test_LVWMF.cpp ${LVWMF_SRC})
#target_include_directories(test_LVWMF PUBLIC "./" ${OPENCV_INC} ${LV_INC})
#target_link_directories(test_LVWMF PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
#target_link_libraries(test_LVWMF PUBLIC ${WMF_LIB} ${OPENCV_LIB} ${LV_LIB})
