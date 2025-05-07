![gScript Interpreter](https://raw.githubusercontent.com/CUASAS/pixel-gantry-control/master/gScript_header.png)

This project contains control and automation softare for particle detector module assembly using Aerotech gantry based systems. Primarily it provides a programming environment and interpreter for [gScript](https://github.com/CUASAS/pixel-gantry-control/blob/master/Gantry/gScript%20Application/gScript%20Documentation.md) which is a simple text-based language specifically designed to make developing routines on these systems as pain-free as possible. This includes facilities to:

  1. Perform relative and absolute motion, as well as a "graph-based" motion between a set of named, predefined points
  2. Communication with cameras, including both the gantry-head mounted camera as well as auxillary USB cameras
  3. Control of vacuum lines through a Festo vacuum manifold paired with an NI compactDAQ switch unit
  4. Perform automatic pattern recognition to identify points-of-interest within any camera's field of vision
  5. Coordinate fitting to find a component's location and orientation in the gantry's coordinate system based on measurements of reference points on the part
  6. Communicate with component tracking databases to automatically register when an assembly has occurred


## Setup

An installer (found under [Releases](https://github.com/CUASAS/pixel-gantry-control/releases)) is available for download which packages a compiled executable version of the project. Try this if you do not intend to modify the underlying LabVIEW code.

## Selecting a Project Folder

A "project folder" is defined as any folder that contains a `Config\` subdirectory containing any configuration files and a `Scripts\` directory to store any gScript files. An example of this can be found in the [Example Project](https://github.com/CUASAS/pixel-gantry-control/tree/master/Example%20Project) folder in this repository. Upon first running of the gScript interpreter, the user is prompted to select the project folder on their filesystem. This is then stored in `~/AppData/Local/gScript/gscript_config.ini` and can be updated there if needed.

### Listing of Site Project Folders

| Site      | URL                                                                 |
|-----------|---------------------------------------------------------------------|
| UNL       | https://github.com/nebraska-silicon-lab/gantry-config-nebraska      |
| FNAL      | https://github.com/nebraska-silicon-lab/gantry-config-fnal          |
| Purdue    | https://github.com/PurdueHEPex/pixel-config-purdue                  |
| CUA       | https://github.com/CUASAS/gantry-config-cua                         |

### Listing Shared Scripts

| Project | URL                                                            |
|---------|----------------------------------------------------------------|
| TFPX    | https://gitlab.cern.ch/cms_tk_ph2/gscript-tfpxmodules          |
| ETL     | https://github.com/bu-etl/gscript-ETLModules                   |

Please create a PR to be added to either of these lists.

## Getting Help

If you discover a bug or would like to request a feature, please feel free to open an [issue](https://github.com/CUASAS/pixel-gantry-control/issues). If you have general questions about how to use the software, create a [discussion](https://github.com/CUASAS/pixel-gantry-control/discussions).

There is also a developing set of tutorials on various aspects of `gScript` programming developing [here](https://drive.google.com/drive/folders/1jjhutLgPGgwVizSZdoIk1yHqYb2zJ_WL?usp=sharing).

## For Developers

### Getting the Code

If you intend to modify the underlying LabVIEW code, you can start by cloning this repository with

```
git clone git@github.com:CUASAS/pixel-gantry-control.git
```


### Installing LabVIEW

Using the `NI Package manager`, install LabVIEW 2024 Q1 (64-bit)

Next use `NI Package Manager` to install NI-DAQmx and IMAQdx. Valid licenses for these packages are required on the development machine. 
