======
GANTRY
======
This project contains control and automation softare for CMS FPIX module assembly.

## Installing gVision API

Due to large binary file sizes, the gVision API is no longer included in this repository. Instead, it can be downloaded in compressed form from this url

```
http://t3.unl.edu/~cfangmeier/gVision_API.zip
```

Unzip this into `pixel-gantry-control\Gantry\Shared Components\`






**Instructions Below are out of date, to be updated in the near future**

-----
Setup
-----
1. Install windows 7 64bit Enterprise
     NOTE: Not windows 8 or newer since it's not supported by Aerotech software
2. Run window's update, install updates, wait for updates to complete, may require several rounds up updates
3. Install Labview 2011
4. Install NI Vision Acquisition Software September 2011 - Windows 7 32-bin/7 64-bit/Vista/XP. 
     Use the same product code as the full labview install.
4. (Optional) Install Alternative Web-browser, eg. Firefox,Chrome
5. (Optional) Install Antivirus Software (Microsoft Security Essentials or equivalent)
6. Install "Git for Windows". During Install, select to use optional unix tools. All other settings unchanged
7. Install aerotech software
    
    Go to
    http://www.aerotechmotioncontrol.com/a32downloads1.asp
    and enter the key
    
    ************************
    
    Select version 4.03.002. 
    The LabVIEW libraries are included in the installer so no additional downloads are needed.
    
    The software needs to be activated and it can be done at
    https://activation.aerotech.com/
    
8. Configure Firewire card for use with Aerotech software. Refer to "Getting Started" guide in Aerotech help for instructions
9. Install Microsoft Visual Studio Community 2015
    Choose custom install and enable C++ features
10. Setup git ssh key
    -Launch git bash
		- $cd
		- $mkdir .ssh
		- $ssh-keygen -t rsa -b 4096
		- $cat id_rsa.pub
		Copy the public key to your account on git.unl.edu . You may need to wait several minutes for the key to properly register
10. Checkout project from git.unl.edu
11. Add the directory containing the shared library files(.dll) to your system path variable. Without doing this LabVIEW will complain about
      being unable to find one of the dependencies of gVision.dll(eg. opencvcore).
