# Pixel Gantry Control

This project contains control and automation softare for CMS FPIX module assembly.

## Setup

This software is written primarily in LabVIEW and therefore requires LabVIEW itself as well as some NI toolkits to be installed to function. The software is currently developed on Windows 10 64-bit. Other operating systems may work but are not guaranteed.

### Getting the Code

Checkout this repository with

```
git clone git@github.com:CUASAS/pixel-gantry-control.git
```


### Installing LabVIEW

I've found that having other versions of Labview (esp 2018+) installed confuses the toolkit installers and they fail to install the support for 2017 that is needed. Therefore if possible start with a fresh system or remove all other National Instruments software prior to following these instructions.

Install [LabVIEW 2017 (64-bit)](http://www.ni.com/download/labview-development-system-2017/6698/en/). Select "I am a current user of LabVIEW Development System" and go through the installer.

Repeat this process for the three required toolkits:

  1. NI Vision Acquisition Software 18.0 [link](http://www.ni.com/download/ni-vision-acquisition-software-18.0/7552/en/)
  2. Vision Development Module 2017 [link](http://www.ni.com/download/vision-development-module-2017/6640/en/)
  3. NI-DAQmx 18.6 [link](http://www.ni.com/en-us/support/downloads/drivers/download.ni-daqmx.html#291872)

Some of the above steps require an activation key. If you are eligible to use it, the [CERN LabVIEW license](https://readthedocs.web.cern.ch/display/MTA/NI%20products%20activation) covers them. Otherwise, arrange for a license on your own or from your institution.

### Installing the Aerotech Software

Run the Aerotech installer. The installer doesn't put the Aerotech VIs in a place where LabVIEW knows to look. To fix this, run `Aerotech Dumbness Fixer.vi` to copy the VIs to `user.lib`. This step will likely need LabVIEW to be started as an administrator since it is moving files around in `Program Files`.


### Installing gVision API

Due to large binary file sizes, the gVision API is not included in the git repository. Instead, you need to download the [latest releast](https://github.com/CUASAS/pixel-gantry-vision/releases). Download the zip archive and unzip it into `pixel-gantry-control\Gantry\Shared Components\`.


### Selecting a Config

Inside the `Config` directory are seveal folders containing configuration files for specific gantries. By default, the `Nebraska` configuration is used, but this can be changed by editing the content of `Config/config.txt` to one of the other configurations.
