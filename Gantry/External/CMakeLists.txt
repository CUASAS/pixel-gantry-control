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

## Method 1: Print all imported targets
#message(STATUS "Imported targets:")
#get_property(importedTargets DIRECTORY PROPERTY IMPORTED_TARGETS)
#foreach(target ${importedTargets})
#    message(STATUS "  ${target}")
#endforeach()

## Method 2: More detailed information about targets
#foreach(target ${importedTargets})
#    message(STATUS "\nTarget: ${target}")
#    # Check if target exists (safety check)
#    if(TARGET ${target})
#        # Get target type
#        get_target_property(target_type ${target} TYPE)
#        message(STATUS "  Type: ${target_type}")
#
#        # Get include directories
#        get_target_property(target_includes ${target} INTERFACE_INCLUDE_DIRECTORIES)
#        if(target_includes)
#            message(STATUS "  Include dirs: ${target_includes}")
#        endif()
#
#        # Get linked libraries
#        get_target_property(target_libs ${target} INTERFACE_LINK_LIBRARIES)
#        if(target_libs)
#            message(STATUS "  Links to: ${target_libs}")
#        endif()
#
#        # Get compile definitions
#        get_target_property(target_defs ${target} INTERFACE_COMPILE_DEFINITIONS)
#        if(target_defs)
#            message(STATUS "  Definitions: ${target_defs}")
#        endif()
#    endif()
#endforeach()


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



#set(WMF_LIB dxva2.lib evr.lib mf.lib mfplat.lib mfplay.lib mfreadwrite.lib mfuuid.lib shlwapi.lib )
#file(GLOB LVWMF_SRC "LVWMF/src/*.cpp" "LVWMF/include/*.h")
#add_library(LVWMF SHARED ${LVWMF_SRC})
#target_include_directories(LVWMF PUBLIC  "LVWMF/include/" ${LV_INC} ${OPENCV_INC})
#target_link_directories(LVWMF PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
#target_link_libraries(LVWMF PUBLIC ${OPENCV_LIB} ${LV_LIB} ${WMF_LIB})
#
#add_executable(test_LVWMF LVWMF/test/test_LVWMF.cpp ${LVWMF_SRC})
#target_include_directories(test_LVWMF PUBLIC "./" ${OPENCV_INC} ${LV_INC})
#target_link_directories(test_LVWMF PUBLIC ${OPENCV_LIBDIR} ${LV_LIBDIR})
#target_link_libraries(test_LVWMF PUBLIC ${WMF_LIB} ${OPENCV_LIB} ${LV_LIB})
