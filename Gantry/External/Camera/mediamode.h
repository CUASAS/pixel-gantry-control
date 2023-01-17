#pragma once

struct MediaMode {
    unsigned int id;
    unsigned int width;
    unsigned int height;
    float framerate;

    MediaMode() {
        id = 0;
        width = 0;
        height = 0;
        framerate = 0;
    };
};
