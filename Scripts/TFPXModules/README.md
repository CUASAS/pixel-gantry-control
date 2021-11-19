# TFPX Module Assembly Scripts

This folder contains scripts to be used in the commissioning process and practice of TFPX module assembly.

## RD53A Assembly for HDI to Single 2x2 Mock-ROC

Scripts used to assemble a single mock-ROC with the footprint of a 2x2 SensorROC to an HDI.

Folder name: RD53AAssembly_SingleROC

* Script: Assembly_RD53A_SingleGlass.gscript.

  This script reads site-specific geometry from the flex_config.txt from the Config area corresponding to an assembly site and runs code to assembly the single mock-ROC glass piece with no bond pads. It collects surveillance data using the corners of the mock-ROC and the HDI bond pads after assembly.


