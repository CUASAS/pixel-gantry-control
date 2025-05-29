#pragma once

enum CAPTURE_PROPERTIES {
    CAPTURE_BRIGHTNESS,
    CAPTURE_CONTRAST,
    CAPTURE_HUE,
    CAPTURE_SATURATION,
    CAPTURE_SHARPNESS,
    CAPTURE_GAMMA,
    CAPTURE_COLORENABLE,
    CAPTURE_WHITEBALANCE,
    CAPTURE_BACKLIGHTCOMPENSATION,
    CAPTURE_GAIN,
    CAPTURE_PAN,
    CAPTURE_TILT,
    CAPTURE_ROLL,
    CAPTURE_ZOOM,
    CAPTURE_EXPOSURE,
    CAPTURE_IRIS,
    CAPTURE_FOCUS,
    CAPTURE_PROP_MAX
};

// Options accepted by above:
// Return raw data instead of converted rgb. Using this option assumes you know what you're doing.
#define CAPTURE_OPTION_RAWDATA 1
// Mask to check for valid options - all options OR:ed together.
#define CAPTURE_OPTIONS_MASK (CAPTURE_OPTION_RAWDATA)
