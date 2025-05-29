# Stolen from: https://github.com/samangh/libsg_cmake/blob/master/cmake/FindLabVIEW.cmake
set(LABVIEW_MIN_VER 2020 STRING "Minimum LabVIEW version to use")
set(LABVIEW_MAX_VER 2025 STRING "Maximum LabVIEW version to use")

# Use 32-bit in x86 and 64-bit in x64 by looking at pointer size
# macOS and Linux only use have 64-bit LabVIEW
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    foreach(VER RANGE ${LABVIEW_MIN_VER} ${LABVIEW_MAX_VER})
        list(APPEND LABVIEW_HINTS
                # MacOS
                "/Applications/National\ Instruments/LabVIEW\ ${VER}\ 64-bit/cintools/Mach-O"
                "/Applications/National\ Instruments/LabVIEW\ ${VER}\ 64-bit/cintools"
                #Linux
                "/usr/local/natinst/LabVIEW-${VER}-64/cintools"
                #Windows
                "C:\\Program Files\\National Instruments\\LabVIEW ${VER}\\cintools"
                "C:\\Program Files\\National Instruments\\LabVIEW ${VER}\\cintools")
    endforeach()
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    foreach(VER RANGE ${LABVIEW_MIN_VER} ${LABVIEW_MAX_VER})
        list(APPEND LABVIEW_HINTS "C:\\Program Files (x86)\\National Instruments\\LabVIEW ${VER}\\cintools")
    endforeach()
endif()

find_path(LabVIEW_INCLUDE_DIRS
        NAMES extcode.h
        HINTS ${LabVIEW_DIR} ${LabVIEW_DIR}/cintools ${LabVIEW_DIR}/include ${LABVIEW_HINTS})

find_library(LabVIEW_LIBRARIES
        NAMES lv labviewv
        HINTS ${LabVIEW_DIR} ${LabVIEW_DIR}/cintools ${LabVIEW_DIR}/lib ${LABVIEW_HINTS} ${LABVIEW_HINTS})

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LabVIEW DEFAULT_MSG LabVIEW_LIBRARIES LabVIEW_INCLUDE_DIRS)

if(LabVIEW_FOUND AND NOT TARGET LabVIEW)
    add_library(LabVIEW UNKNOWN IMPORTED)
    set_target_properties(LabVIEW PROPERTIES
            IMPORTED_LINK_INTERFACE_LANGUAGES "C"
            IMPORTED_LOCATION "${LabVIEW_LIBRARIES}"
            INTERFACE_INCLUDE_DIRECTORIES "${LabVIEW_INCLUDE_DIRS}")
endif()