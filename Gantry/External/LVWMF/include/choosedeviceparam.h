#pragma once

struct ChooseDeviceParam {
    IMFActivate **mDevices;    // Array of IMFActivate pointers.
    unsigned int mCount;          // Number of elements in the array.
    unsigned int mSelection;      // Selected device, by array index.

    ~ChooseDeviceParam() {
        for (int i = 0; i < mCount; i++) {
            if (mDevices[i])
                mDevices[i]->Release();
        }
        CoTaskMemFree(mDevices);
    }
};
