# How to Calibrate the Gantry Software, </br>*or "What the heck are all these config files?"*

Pixel module assembly requires very precise calibration of the parts on the gantry table as well as the required tooling. This calibration information, as well as important configuration data is stored in a series of configuration files. This document will go through these files one-by-one to explain their contents as well as how to remeasure them for a new or modified Gantry.



## `geometry_definitions.ini`

Geometry definitions contain positions of interest, such as fiducial markings, for parts that can be moved around the gantry table. These positions are defined relative to the center of the part in question. These are best acquired from mechanical drawings of the parts, but can also be measured. As an example, consider a part of the file

```ini
[HDI]
fid_TR = 8.7595,-32.460,0
fid_TL = -8.7595,-24.3599,0
fid_BL = -8.7595,32.460,0
fid_BR = 8.7595,32.460,0
```

This is saying that in the local coordinate sytem of an HDI (with (0, 0, 0) in the middle of the HDI in X-Y and on the top surface in Z) the four fiducial markings are found at the specified coordinates.

This is done so that if one specifies a center and orientation of a part such as an HDI on the gantry table, it's just a matter of a coordinate system change to calculate the "global", i.e. gantry coordinate system, coordinates of all the positions of interest from the local positions specified here in `geometry_definitions.ini`.

## `ATTRIBUTES_\*.ini`

The LabVIEW IMAQdx camera drivers require a file in a specific format to specify all of the settings of a camera. These settings include things such as the capture resolution, brightness, vertical-flip, and so on. In order to avoid having these settings "float", a file with specific settings is kept for each camera and the camera is programmed with these settings upon startup. To aide in making these files, there is a helper VI called `Commissioning Helpers/Camera Identification.vi`.

## `camera_configuration.ini`

This is for application level (ie not IMAQ) information about the connected cameras. Here is an example entry:

```ini
[GANTRY HEAD]
CameraGroup = 1
VendorName =UI148xSE-M_4002725945
SerialNumberHigh = 10FE58
SerialNumberLow  = 2443E66F
FOV-x = 1.095
FOV-y = 0.824
```

The `CameraGroup` specifies that this camera is part of `CameraGroup` 1. Within a `CameraGroup`, only one camera can be open at a time. Some camera drivers only support capturing images from one camera at a time. So for example, if you have two identical cameras connected, it is necessary to keep track of which one is open so as not to attempt to open both of them at once. The `Gantry` class keeps track of this and opens/closes connections as needed, but the groups must be specified in this config file.

`VendorName`, `SerialNumberHigh`, and `SerialNumberLow` are used to match a camera with it's name. In this case, the camera with this identifying information is matched with the ID `GANTRY HEAD`.

`FOV-x`, and `FOV-y` specify the field-of-view of that particular camera. It is used to translate between pixel coordinates and gantry coordinates.

# `dispenser_parameters.ini`

Simple file that contains a single entry that is the DAQmx hardware address for the Dispenser:

```ini
[HARDWARE]
hardware_address = cDAQ1Mod6/port0/line7
```

# `fiducial_parameters.ini`

Specifies the parameters to be used in the fiducial finding algorithm. There are different sets of parameters for different types of fiducials, but the only ones that are currently used are `HDI` and `BBM`. 

```ini
[HDI] 
shrink_factor    = 4     # Shrink image by this factor to increase processing speed
color_groups     = 2     # Number of groups to use in the K-means foreground/background segmentation
dilate_size      = 5     # Size of dilating element in pixels to fill in gaps
size_min         = 0.2   # Cuts on the size of fiducial element as a fraction of the frame
size_max         = 0.26  # --
aspect_ratio_min = 0.9   # Cuts on the aspect ratio on the minimum-bounding-box of the fiducial
aspect_ratio_max = 1.1   # --
```

# `general_configuration.ini`

A catch-all for configuration data that doesn't merit it's own config file. It contains configuration specific for the potting and gluing processes.

# `manifold_parameters.ini`

Specifies two important lookup tables. The first is the referred to as `PORTS`. This associates an index to a hardware path that is ultimately wired up control a specific vacuum line. The second is called `CHANNELS`. This associates a semantic name (eg `gantry_head_inner`) to an index. This level of indirection is important because there isn't a 1:1 mapping between semantic names and vacuum lines. For example, `module_chuck_0_slot_0` and `module_chuck_0_slot_1` share the same vacuum line.

# `part_locations.ini`

This stores the "default" positions of parts on the gantry table. This information is used in conjuction with the fiducial positions in `geometry_definitions.ini` to calculate where the fiducial markings on parts should be. Once this known, an automated procedure can go to the fiducial positions, perform an autofocus, and take an image. As long as the alignment is good enough that the the fiducial ends up within the FOV of the camera, the automated fiducial finder can localize the fiducial within the image.

The actual location/orientation is stored as a 3d-vector and a 3d-rotation expressed as a [quaternion](https://en.wikipedia.org/wiki/Quaternion). There is a helper to measure these quantities: `Commissioning Helpers/HDI-BBM Start Position Acquire.vi`.

```ini
chuck_0_slot_0_center = 22.589052,245.132000,63.007994
chuck_0_slot_0_orient = -0.000000,0.000000,-0.000084,1.000000
```

# `potting_def_pos.ini`

**DEPRECIATED**

# `safe_move_pos_data.dat`

Listing of information used in the "Safe Move" or "Move to Name" functions. It specifies a series of named positions across the gantry table. These generally correspond to roughly above each of the chucks, the tool rack, home, and a handful of other positions. In addition to the positions, this file also includes pairs of positions that are generally "safe" to move between in straight lines.

This makes it simpler to, for example, tell the gantry to go to Chuck 1 and not have to reference the coordinates of Chuck 1 explicitely and trust that the gantry won't crash into anything on the way.

Positions are specified using the following format:

```
pos home                      0         0        0
pos module_chuck_1            296       245      0
```

And connecting two positions is done like:

```
edg home module_chuck_0
```

# `test_images.ini`

References some test images stored in `Data/` to be used in lieu of real images when running in virtual mode.
