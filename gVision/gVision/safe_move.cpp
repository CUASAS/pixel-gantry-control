#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <queue>
#include <vector>
#include <map>
#include <set>
#include <string>
#include <algorithm>
#include <cmath>
#include <cstdlib>

#define MAX_PATH_LENGTH 100

extern "C" __declspec(dllexport) int __cdecl get_safe_path(const char* filename,
                                                           const char* start_label,
                                                           const char* end_label,
                                                           int* num_points,
                                                           float* coordinate_list);



class Point {
public:
    std::string label;
    float x;
    float y;
    float z;
    Point() {
        label = "";
        x = 0;
        y = 0;
        z = 0;
    }
    Point(std::string label_par, float x_par, float y_par, float z_par) {
        label = label_par;
        x = x_par;
        y = y_par;
        z = z_par;
    }
};

typedef std::map<std::string, Point> points_t;
typedef std::map<std::string, std::set<std::string> > edges_t;

class Path {
public:
    double length_mm;
    std::vector<std::string> points;

    Path() {
        length_mm = 0;
    }

    void add_point(points_t all_points, std::string new_label) {
        if (points.size() != 0) {
            std::string prev_label = points.back();
            Point prev = all_points[prev_label];
            Point next = all_points[new_label];
            length_mm += sqrt(pow(prev.x - next.x, 2) +
                              pow(prev.y - next.y, 2) +
                              pow(prev.z - next.z, 2));
        }
        points.push_back(new_label);
    }
};


class PathComparator {
    bool reverse;
public:
    PathComparator(const bool& revparam = false) {
        reverse = revparam;
    }

    bool operator() (const Path& lhs, const Path& rhs) const
    {
         
        bool comp;
        if (lhs.points.size() > rhs.points.size()) {
                comp = true;
        } else if (lhs.points.size() < rhs.points.size()) { 
                comp = false;
        } else {
                comp = lhs.length_mm > rhs.length_mm;
        }

        if (reverse) {
            return !comp;
        } else {
            return comp;
        }
    }
};


std::vector<std::string> &split(const std::string &s, char delim,
    std::vector<std::string> &elems) {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}

std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    split(s, delim, elems);
    return elems;
}

void parse_points(std::string filename,
    points_t& points,
    edges_t& edges) {
    std::ifstream infile(filename.c_str());

    if (infile.is_open()) {
        std::string line;
        while (std::getline(infile, line)) {
            if (line.size() == 0 || line[0] == '#') continue;
            std::vector<std::string> tokens = split(line, ' ');
            if (tokens.size() == 0) continue;
            if (tokens[0] == "pos") {  // Parse pos spec
                if (tokens.size() != 5) {
                    std::cout << "Invalid line: \"" << line << "\"\n";
                    continue;
                }
                std::string label = tokens[1];
                float x = std::atof(tokens[2].c_str());
                float y = std::atof(tokens[3].c_str());
                float z = std::atof(tokens[4].c_str());
                points.insert(std::pair<std::string, Point>(label, Point(label, x, y, z)));
            }
            else if (tokens[0] == "edg") {  // Parse edge
                if (tokens.size() != 3) {
                    std::cout << "Invalid line: \"" << line << "\"\n";
                    continue;
                }
                std::string p1 = tokens[1];
                std::string p2 = tokens[2];
                edges[p1].insert(p2);
                edges[p2].insert(p1);
            }
        }
    }
    else {
        std::cout << "Could not find input file" << std::endl;
    }
}

/* find_optimum_path
* Computes an optimum path from start_pt to end_point using Dijkstra's
* Algorithm.
*/
Path calculate_optimum_path(std::string start_pt_label,
    std::string end_pt_label,
    points_t points,
    edges_t edges) {
    std::priority_queue<Path, std::vector<Path>, PathComparator> queue;

    Path start;
    start.add_point(points, start_pt_label);
    queue.push(start);
    while (queue.size() > 0) {
        Path top = queue.top();
        queue.pop();
        Point curr = points[top.points.back()];
        if (curr.label == end_pt_label) {
            return top;
        }
        std::set<std::string> connected_points = edges[curr.label];
        std::set<std::string>::iterator it;
        for (it = connected_points.begin(); it != connected_points.end(); ++it) {
            std::string next_pt_label = *it;
            std::vector<std::string>::iterator find_it;
            find_it = std::find(top.points.begin(), top.points.end(), next_pt_label);
            if (find_it == top.points.end()) { // Haven't already visited next_pt
                Path new_path = top;
                new_path.add_point(points, next_pt_label);
                queue.push(new_path);
            }
        }
    }
    std::cout << "ERROR: Unable to find any path!\n";
    return Path();
}

void dump_points(points_t& points, edges_t& edges) {
    points_t::iterator p_it;
    for (p_it = points.begin(); p_it != points.end(); ++p_it) {
        Point p = p_it->second;
        std::cout << p.label << " " << p.x << " " << p.y << " " << p.z;
        std::set<std::string>::iterator e_it;
        for (e_it = edges[p_it->first].begin(); e_it != edges[p_it->first].end();++e_it) {
            if (e_it == edges[p_it->first].begin()) std::cout << "  -> " << *e_it;
            else std::cout << ", " << *e_it;
        }
        std::cout << std::endl;
    }
}
__declspec(dllexport) int __cdecl get_safe_path(const char* filename,
                                                const char* start_label,
                                                const char* end_label,
                                                int* num_points,
                                                float* coordinate_list) {
    int& N = *num_points;
    std::string from(start_label);
    std::string to(end_label);

    points_t points;
    edges_t edges;
    parse_points(filename, points, edges);
    dump_points(points, edges);
    Path optimum_path = calculate_optimum_path(from, to, points, edges);
    N = optimum_path.points.size();
    if (N > MAX_PATH_LENGTH) return -1;
    int i = 0;
    std::vector<std::string>::iterator it;
    for (it = optimum_path.points.begin(); it != optimum_path.points.end(); ++it) {
        Point pt = points[*it];
        *(coordinate_list + i * 3 + 0) = pt.x;
        *(coordinate_list + i * 3 + 1) = pt.y;
        *(coordinate_list + i * 3 + 2) = pt.z;
        i++;
    }
    return 0;
}
