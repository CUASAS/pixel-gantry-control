#include <vector>
#include <string>
#include <sstream>

#include "opencv2/opencv.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

#include "extcode.h"
#include "ILVDataInterface.h"
#include "ILVTypeInterface.h"

extern "C" {
__declspec(dllexport) void __cdecl set_debug(int new_debug);
__declspec(dllexport) void __cdecl show(cv::Mat img);
__declspec(dllexport) void __cdecl dump_log(LStrHandle lsh);
};

void log(const std::string &data);

void log(std::stringstream &data);

int color_code(const char *lv_color_code);
