# Pixel Gantry Control

This project contains control and automation softare for particle detector module assembly using Aerotech gantry based systems. The software is currently divided into two parts:

  1. A `Shared Components` section of the code that, among other things, provides a single interface to any relavent hardware. It also provides other useful features such as automatic pattern recognition, graph-based motion, absolute orientation calculations, and configuration management.
  2. An interpreter based on the [gScript command set](https://github.com/CUASAS/pixel-gantry-control/blob/master/Gantry/gScript%20Application/gScript%20Documentation.md) that allows users to develop routines in a simple text-based language.

## Setup

This software is written primarily in LabVIEW and therefore requires LabVIEW itself as well as some NI toolkits to be installed to function. The software is currently developed on Windows 10 64-bit. Other operating systems may work but are not guaranteed.

An experimental distribution (found under [Releases](https://github.com/CUASAS/pixel-gantry-control/releases)) is available for download which packages a compiled executable version of the project. Try this if you do not intend to modify the underlying LabVIEW code.

### Getting the Code

Checkout this repository with

```
git clone git@github.com:CUASAS/pixel-gantry-control.git
```


### Installing LabVIEW

I've found that having other versions of Labview (esp 2018+) installed confuses the toolkit installers and they fail to install the support for 2017 that is needed. Therefore if possible start with a fresh system or remove all other National Instruments software prior to following these instructions.

Install [LabVIEW 2017 (64-bit)](http://www.ni.com/download/labview-development-system-2017/6698/en/).

Repeat this process for the three required toolkits:

  1. NI Vision Acquisition Software 18.0 [link](http://www.ni.com/download/ni-vision-acquisition-software-18.0/7552/en/)
  2. Vision Development Module 2017 [link](http://www.ni.com/download/vision-development-module-2017/6640/en/)
  3. NI-DAQmx 18.6 [link](http://www.ni.com/en-us/support/downloads/drivers/download.ni-daqmx.html#291872)

Valid licenses for the above packages are required. Newer versions of the toolkits should work, but these have been tested. However, newer versions of LabVIEW **are not** currently supported.

### Installing the Aerotech Software

Run the Aerotech installer. The installer doesn't put the Aerotech VIs in a place where LabVIEW knows to look. To fix this, run `Aerotech Dumbness Fixer.vi` to copy the VIs to `user.lib`. This step will likely need LabVIEW to be started as an administrator since it is moving files around in `Program Files`.


### Installing gVision API

Due to large binary file sizes, the gVision API is not included in the git repository. Instead, you need to download the [latest releast](https://github.com/CUASAS/pixel-gantry-vision/releases). Download the zip archive and unzip it's contents into `pixel-gantry-control\Gantry\Shared Components\gVision API\`. If the zip file contains any redistributable installers, run those now to install any required libraries.


### Selecting a Config

Inside the `Config` directory are seveal folders containing configuration files for specific gantries. By default, the `Nebraska` configuration is used, but this can be changed by editing the content of `Config/config.txt` to one of the other configurations.

### Getting Help

If you discover a bug or would like to request a feature, please feel free to open an [issue](https://github.com/CUASAS/pixel-gantry-control/issues). If you have general questions about how to use the software, create a [discussion](https://github.com/CUASAS/pixel-gantry-control/discussions).

There is also a developing set of tutorials on various aspects of `gScript` programming developing [here](https://drive.google.com/drive/folders/1jjhutLgPGgwVizSZdoIk1yHqYb2zJ_WL?usp=sharing).
