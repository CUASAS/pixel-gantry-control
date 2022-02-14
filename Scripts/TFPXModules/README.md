# TFPX Module Assembly Scripts

This folder contains scripts to be used in the commissioning process and practice of TFPX module assembly.

## RD53AAssembly_SingleGlass

Scripts used to assemble an HDI to a Single Large Glass Piece. The Single Glass Piece is a substitute for a 2x2 SensorROC.

* **Assembly_RD53A_SingleGlass.gscript.** This script reads site-specific geometry from the flex_config.txt from the Config area corresponding to an assembly site and runs code to assembly the single mock-ROC glass piece with no bond pads. It collects surveillance data using the corners of the mock-ROC and the HDI bond pads after assembly.

* **HDI_Translation_RD53A.gscript.** This script computes the translation and rotation vector for moving the HDI from Chuck 2 to Chuck 1 using the vacuum tool.

* **SensorROC_Translation_RD53A.gscript.** This script computes the translation and rotation vector for moving the Single Glass Piece from the Launchpad to Chuck 1 using the gantry.

## RD53AAssembly_MultiGlass

Scripts used to assemble an HDI to Four Small Glass Pieces. The Small Glass Pieces are substitues for RD53A ROCs that may be individually glued to the HDI.

* **Assembly_RD53A_MultiGlass_twinSucker.gscript.** This script assembles four glass pieces without bond pads to the HDI using the twin sucker tool.

## RD53AAssembly_MultiROC

Scripts used to assemble an HDI to Four RD53A chips.

* **Assembly_RD53A_MultiROC.gscript.** This script assembles four RD53A chips to the HDI using the twin sucker tool.
