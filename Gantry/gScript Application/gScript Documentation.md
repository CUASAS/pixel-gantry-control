 # gScript (Gantry Script) Documentation

gScript is an interpreted language similar to assembly. A gScript source code file is a plain text file with one statement per line. Statements are executed in sequence from top to bottom. A statement has the form

```
COMMAND ARG0 ARG1 ... ARGN
```

`COMMAND` must be one of the build in commands as specified below. Arguments can be of various forms, including numeric and string literals, variables, or references to memory. The syntax for these forms will be described below.

The gScript interpreter has memory that is split into two parts. The first is a variable table. When you reference a variable with the `$VAR` syntax, gScript looks into the variable table to either read or write to that variable. Whether a read or write occurs depends on the command. Trying to read from a variable that has not been initialized will result in an error. The second part of memory is called Main Memory. It consists of an array of memory cells that can be accessed with bracket syntax, e.g. `[10]` to access the cell at address 10. The bracket syntax can also be used in conjuntion with variables. This is accomplished via the syntax `[$var]`.

Comments are indicated with a `#`, with all characters after it being ignored. 

```
# This whole line is a comment
ADD $res 12 -6  # This a comment sharing a line with a statement.
```

In addition to the above mentioned memory, there is also the internal state of the gantry that is stored in a `FlexWorktable` object. The format of this section of memory is key-value pairs and is initially populated with the contents of `flex_config.txt`. Elements in the `FlexWorktable` can be accessed with the `FLEXREAD` and `FLEXWRITE` commands. The contents of the FlexWorktable can be dumped to the console with the `DUMPSTATE` command.

## Labels

To reference specific lines of code, for example when using a `GOTOIF`, Labels can be used. The syntax for labels is the following:

```
@LABEL COMMAND args
```

The presence of a label does not effect the execution of the statement on its line.

## Type System

gScript has a simple type system, supporting four types in memory (both for variables and in main memory) and five types for literals. In memory, the four supported types are integers, floats, 3d vectors, and 3d rotations. Internally, these are all stored as a four-tuple of 64-bit floats with a tag designating the type of the stored value. You can see this in the "Memory View" tab of the main UI. To access specific fields in vectors (and in fact any value), a dot syntax is supported. For example. If there is a variable called `$var`, one can access the `y` element with `$var.y`. It's also important to keep in mind that "integers" are stored as 64-bit floats. This could result in rounding errors for large numbers, so avoid relying on large integers being exact. For literals, in addition to the four memory types, string literals are supported for certain commands. Examples of literals are:

  - **float**: `10.0`, `3.14E-2`
  - **integer**: `0`, `12`, `-568`
  - **3D Vector**: `{12,13.7,-2}`, Don't put spaces between the values!
  - **Composite 3D Vector**: `{$A,$B.x,-2}`, a vector created (at least partially) from other variables.
  - **3D Rotation**: `{0.1,0.9,.16,0}`, Again, no spaces
  - **string**: `a_string`, `"a string with spaces"`, Quote escaping is not currently supported

But what about booleans? Boolean types are not supported in memory, but in commands that expect a boolean (e.g. `GOTOIF`) an argument is interpreted as false if the number in the first (the `x`) slot rounds to zero. Otherwise, it is interpreted as true.

### String Interpolation

Although strings are not an in-memory datatype in gScript, you can still create them dynamically at runtime using *string interpolation*. This is perhaps best explained with an example.

```
COPY $count 2
SNAPSHOT gantryhead "sample_image_{$count}.png"
```

The second argument in the `SNAPSHOT` command is the filename to save the snapshot image as. In this case, the `{$count}` section will be replaced with the value of the variable `$count` - ie "sample_image_2.png". Many (although not all) functions which expect string inputs support this functionality. You can also supply an optional type that will determine how the content of the variable is formatted. For example, consider the following snippet.

```
GETPOS $curr
CHOICEPOPUP "You are at {$curr:%v}. Is this correct?"
```

This gets the current position and then asks the user if that is the correct place to be. The `:%v` tells the string interpolation routine to format that value as a vector. The possible format options are: `%d`, `%b`, `%f`, and `%v`.

### Tick Expressions

It is often convenient to be able to do simple calculations and pass the result to a command, a function call, or to determine whether a `GOTOIF` get's executed. To help with this, "Tick Expressions" were added in `gScript v2.1`. They allow you to put a simple calculation in any place where you would normally put a variable, constant, or main memory access. Take a simple example. We have a variable and we want to print out double the number. Without using tick expressions this would be done like:

```
COPY $N 10
MUL $2N 2 $N
PRINT "%d" $2N
```

Now, using a tick expression:

```
COPY $N 10
PRINT "%d" `$N*2`
```

Note that this eliminates one line of code and the awkward `$2N` variable. The normal arithmetic operations are supported (`*`, `/`, `%`, `+`, `-`). There is also `//` for integer division. Comparison operations are also supported (`==`, `!=`, `>`, `<`, `>=`, `<=`). Since integers are stored internally as floating point numbers, comparison is subject to floating-point error. To account for this, integer versions of the comparison functions are supplied (`=i=`, `!i=`, `>i=`, `<i=`) and should be used when the inputs are integers.

**Caveats:**
  - Only expressions of the form `{value}{operation}{value}` are supported. More complex expressions must be broken up and performed one at a time.
  - Only scalar numbers are supported. If a vector or quaternion is supplied, the `.x` component will be used.

### Error Handling

The interpreter has three error-handling modes

  - `default`: If a command returns an error, it is logged and any running script is aborted.
  - `prompt`: If a command returns an error, a popup is presented to the user with the error message and an option to abort the script or continue.
  - `setvar`: If a command returns an error, the variable `$ERR` is set to the error code. Subsequent code can read this value and act accordingly.
  
Upon startup, the error handling mode is `default`. The `SETERRORMODE` command can be used to change the error mode.

### Functions

`gScript` has support for reusable code in the form of functions. Following is a minimal example showing how this works.

```
CALL @add_function 10 10 -> $result
PRINT "%d" $result
END

@add_function(A,B)
    ADD $sum $A $B
    RETURN $sum
```

There are three essential elements here. First, the invocation of `CALL` requires the function to call (in this case "`@add_function`") followed by the arguments to that function. Here we pass two arguments, 10 and 10. If you wish to use the return value of the function, add a `->` after the arguments followed by the variables where you would like the results saved.

The second important thing is the actual declaration of the function. The syntax for this is an `@` followed by the name of the function, then, if the function has arguments, a comma-separated list surrounded by parenthases. Note that there must not be any whitespace in the declaration. In the above example, the value passed in `CALL` are bound to the variables specified in the function declaration (ie `$A=10`, `$B=10`).

Finally, the `RETURN` statement takes a list of values and binds them to the variables specified in the preceeding `CALL`. In this case, `$result` will receive the value of `$sum`, which is itself just `10+10=20`.

It's important to note that a `CALL` creates a new namespace (aka a new stack frame) so any new variables defined in a function will not overwrite those in the calling context. This also means that any variables not given to `RETURN` will be lost.

Finally, if a variable is read that is not defined in the current function, then the interpreter will search down the stack until it finds it. This could be useful if, for example, you have a script which relies on several unchanging configuration variables that are set once near the start of execution and then not modified further. In this case, it would be annoying to have to pass these variables into every function that needs them. So instead they can just be referenced directly using this mechanism.


## Command Listing

### General Commands

#### `PASS`

Does nothing. Mostly used internally.

*Format:* `PASS`


#### `COPY`

Copies the contents of `src` to `dest`.

*Format:* `COPY dest src`

  - `dest`: Writable location to copy to
  - `src`: Readable location to copy from


#### `PRINT`

Used to print to the console on the bottom of the UI. The arguments are any readable value while `format` specifies how the arguments are to be printed. Supported format codes are listed in the table below. To omit the timestamp prefix, replace `PRINT` with `XPRINT`.

| gScript Format |                  Description                          |
|----|-------------------------------------------------------------------|
| %f | Equivalent to the `printf` format string `%0.3f`                  |
| %d | Equivalent to the `printf` format string `%d`                     |
| %v | Formats the value as a vector. `{x,y,z}`                          |
| %q | Formats the value as a quaternion. `{x,y,z,w}`                    |
| %r | Converts a quaternion to a rotation in x-y plane.                 |
| %b | Evaluates argument as a boolean. Becomes either `True` or `False` |

*Format:* `PRINT format arg1 arg2 argn`

  - `format`: The format string
  - `arg1`, `arg2`, `argn`: Readable values to insert into format string


#### `GOTO`

Used for flow control. Goes to the command at the line specified by `dest`. Recommend using in conjunction with labels to be robust against changing line numbers.

*Format:* `GOTO dest`

  - `dest`: The address of the statement to execute next. Can be a Label.


#### `GOTOIF`

Used for flow control. Goes to the command at the line specified by `dest` if the `cond` evaluates to `True`, otherwise proceed to the next statement. Recommend using in conjunction with labels to be robust against changing line numbers.

*Format:* `GOTOIF dest cond`

  - `dest`: The address of the statement to execute next. Can be a Label.
  - `cond`: If interpreted as `True` then `GOTO` `dest`, otherwise proceed to next statement.


#### `GOTOIFN`

Same as `GOTOIF`, except it goes to the command at `dest` if `cond` is evaluated to `False`.

*Format:* `GOTOIFN dest cond`

  - `dest`: The address of the statement to execute next. Can be a Label.
  - `cond`: If interpreted as `False` then `GOTO` `dest`, otherwise proceed to next statement.

#### `CALL`

Used to call a function. See [Functions](#functions) for more details

*Format:* `CALL dest arg1 arg2 -> ret1 ret2`

  - `dest`: The address of the statement to execute next. Can be a Label.
  - `argn`: Arguments to pass to the function. Should match the number of arguments specified in the function declaration.
  - `ret1`: **Optional** Variables to save any values passed from the function's `RETURN`

#### `RETURN`

Used in functions to return results to the calling context. See [Functions](#functions) for more details

*Format:* `RETURN arg1 arg2`

  - `argn`: Results to return to the calling function.

#### `END`

Stops the execution of the current script.

*Format:* `END`


#### `ADD`

Adds the two arguments piecewise and stores the result in `dest`. The type of `dest` is copied from `arg1`.

*Format:* `ADD dest arg1 arg2`

  - `dest`: Writable location for the result of the addition
  - `arg1`: Readable location for the first input to the addition.
  - `arg2`: Readable location for the second input to the addition.

#### `SUB`

Subtracts the two arguments piecewise and stores the result in `dest`. The type of `dest` is copied from `arg1`. The operation is equivalent to `dest = arg1 - arg2`.


*Format:* `SUB dest arg1 arg2`

  - `dest`: Writable location for the result of the subtraction
  - `arg1`: Readable location for the first input to the subtraction
  - `arg2`: Readable location for the second input to the subtraction
  
#### `MUL`

Multiplies the two arguments piecewise and stores the result in `dest`. The type of `dest` is copied from `arg1`.

*Format:* `ADD dest arg1 arg2`

  - `dest`: Writable location for the result of the multiplication
  - `arg1`: Readable location for the first input to the multiplication.
  - `arg2`: Readable location for the second input to the multiplication.


#### `SIN`

Calculates the sine of the input argument. The input should be in degrees.

*Format:* `SIN dest angle`

  - `dest`: Writable location to store `sin(angle)`
  - `angle`: Readable location for the angle

#### `COS`

Calculates the cosine of the input argument. The input should be in degrees.

*Format:* `COS dest angle`

  - `dest`: Writable location to store `cos(angle)`
  - `angle`: Readable location for the angle

#### `TAN`

Calculates the tangent of the input argument. The input should be in degrees.

*Format:* `TAN dest angle`

  - `dest`: Writable location to store `tan(angle)`
  - `angle`: Readable location for the angle

#### `ATAN2`

Calculates the arctangent based on the slope of a line segment with specified x and y components.

*Format:* `ATAN2 dest x y`

  - `dest`: Writable location to store the arctangent angle in degrees
  - `x`: x component of the line segment
  - `y`: y component of the line segment

#### `ABS`

Calculates the absolute of the input argument. For integers and floats, returns the absolute value. For vectors, returns the length. Rotations are not supported.

*Format:* `ABS dest arg`

  - `dest`: Writable location to store the result of the calculation
  - `arg`: Readable location for the input

#### `POW`

Calculates the exponential `base^power`. Both base and power must be either floats or integers.

*Format:* `ABS dest base power`

  - `dest`: Writable location to store the result of the calculation
  - `base`: Readable location for the base
  - `power`: Readable location for the exponent

#### `INVERT`

Performs an inversion appropriate to the input's type. For floats and integers, it return 1/`arg1`. For vectors, each element is multiplied by -1. For rotations, the sense of the rotation is reversed.

*Format:* `INVERT dest arg1`

  - `dest`: Writable location for the result of the inversion
  - `arg1`: Readable location for the first input to the inversion.

#### `COMPOSE`

Composes two rotations together. Returns the rotation that is the result of rotation `a` followed by rotation `b`.

*Format:* `COMPOSE out a b`

  - `dest`: Writable location to store the result of the composition
  - `a`: Readable location for the first rotation
  - `b`: Readable location for the second rotation

#### `QUAT2EULER`

Converts a rotation from quaternion representation to euler angle representation. The semantics of the angles are described [here](https://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles#Euler_angles_to_quaternion_conversion).

*Format:* `QUAT2EULER yaw pitch roll quat`

  - `yaw`: Writable location to store the yaw (psi) of the rotation
  - `pitch`: Writable location to store the yaw (theta) of the rotation
  - `roll`: Writable location to store the yaw (phi) of the rotation
  - `quat`: Readable location for the input quaternion.

#### `EULER2QUAT`

Converts a rotation from euler angle representation to quaternion representation. The semantics of the angles are described [here](https://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles#Euler_angles_to_quaternion_conversion).

*Format:* `EULER2QUAT quat yaw pitch roll`

  - `quat`: Writable location for the output quaternion.
  - `yaw`: Readable location to access the yaw (psi) of the rotation
  - `pitch`: Readable location to access the yaw (theta) of the rotation
  - `roll`: Readable location to access the yaw (phi) of the rotation

#### `TRANSFORMG2L`

Applies a coordinate tranformation to convert a global (ie gantry) coordinate to a local coordinate. The transformation is described by the offset and rotation between the gantry's coordinate system and the local coordinate system.

*Format:* `TRANSFORMG2L local global offset rotation`

  - `local`: Writable location for the local coordinate
  - `global`: Readable location for the global coordinate
  - `offset`: Readable location for the coordinate transform offset
  - `rotation`: Readable location for the coordinate transform rotation

#### `TRANSFORML2G`

Applies a coordinate tranformation to convert a local coordinate to a global (ie gantry) coordinate. The transformation is described by the offset and rotation between the gantry's coordinate system and the local coordinate system.

*Format:* `TRANSFORMG2L global local offset rotation`

  - `global`: Writable location for the global coordinate
  - `local`: Readable location for the local coordinate
  - `offset`: Readable location for the coordinate transform offset
  - `rotation`: Readable location for the coordinate transform rotation
  
#### `INC` 

Increments the first, the `x`, field in `arg1` by 1 and stores the result in `dest`.

*Format:* `INC dest arg1`

  - `dest`: Writable location for the result of the increment
  - `arg`: Readable location for the value to be incremented

#### `DEC` 

Decrements the first, the `x`, field in `arg1` by 1 and stores the result in `dest`.

*Format:* `DEC dest arg1`

  - `dest`: Writable location for the result of the decrement
  - `arg`: Readable location for the value to be incremented

#### `WAIT`

Pauses execution for the specified number of milliseconds.

*Format:* `WAIT time`

  - `time`: Readable specifying the number of milliseconds to wait

#### `FIT` 

Computes a position/orientation of a part in the gantry's coordinate system by comparing measured reference points with reference points defined by mechanical drawings of that part.

*Format:* `FIT pos rot type fid_tr fid_br fid_bl fid_tl`

  - `pos`: Writable location to store the position resulting from the fit
  - `rot`: Writable location to store the orientation resulting from the fit
  - `type`: The type of part that is being fit. Must correspond to an object in the `geometry.*` namespace that has four corner fiducials positions specified.
  - `fid_tr`: Top-right fiducial position
  - `fid_br`: Bottom-right fiducial position
  - `fid_bl`: Bottom-left fiducial position
  - `fid_tl`: Top-left fiducial position

#### `FITLINE` 

Performs a linear fit in 3d space on a set of input points. Because this command operates on a variable number of points, they must be stored in "main memory", ie memory accessed using the `[addr]` syntax.

*Format:* `FITLINE direction centroid residual mem_start n_points`

  - `direction`: The unit vector that points in the direction of the fitted line
  - `centroid`: A point on the fitted line in the center of the distribution of input points
  - `residual`: The average distance between the fitted line and the input points
  - `mem_start`: An integer specifying where the first point lives in main memory. For example, if the first point is at `[5]`, then it should be `5`.
  - `n_points`: The number of input points. They should be in main memory sequentially after `mem_start`.

#### `FITCIRCLE`

Finds a best-fit circle in the x-y plane to a set of input points. Because this command operates on a variable number of points, they must be stored in "main memory", ie memory accessed using the `[addr]` syntax.

*Format:* `FITLINE center radius residual mem_start n_points autoclose`

  - `center`: The center point of the fitted circle. The z-coordinate is just the mean z-coordinate of the input points.
  - `radius`: The radius of the fitted circle.
  - `residual`: The average distance between the fitted circle and the input points
  - `mem_start`: An integer specifying where the first point lives in main memory. For example, if the first point is at `[5]`, then it should be `5`.
  - `n_points`: The number of input points. They should be in main memory sequentially after `mem_start`.
  - `autoclose`: **Optional** Add the literal string "autoclose" to close the result visualization when finished. If omitted, just click "Continue" to close it.


#### `CHOICEPOPUP`

Creates a popup offering the user two options. Typically used to ask the user a yes or no question.

*Format:* `CHOICEPOPUP choice question yeslabel nolabel`

  - `choice`: Writable location to store the user's choice as 0 (no) or 1 (yes)
  - `question`: The text to be displayed to the user
  - `yeslabel`: **Optional** Label for the "yes" button, Default: "Yes"
  - `nolabel`: **Optional** Label for the "no" button, Default: "No"


#### `GETINTPOPUP`

Creates a popup asking the user to supply a single integer value.

*Format:* `GETINTPOPUP value prompt`

  - `value`: Writable location to store the user's input
  - `prompt`: The text to be displayed to the user, default is "Please provide a number"


#### `GETFLOATPOPUP`

Creates a popup asking the user to supply a single float value.

*Format:* `GETFLOATPOPUP value prompt`

  - `value`: Writable location to store the user's input
  - `prompt`: The text to be displayed to the user, default is "Please provide a number"


#### `GETVECPOPUP`

Creates a popup asking the user to supply a 3d vector

*Format:* `GETVECPOPUP value prompt`

  - `value`: Writable location to store the user's input
  - `prompt`: The text to be displayed to the user, default is "Please provide a vector"


#### `SETLOG`

Specifies the log file to use for the session.

*Format:* `SETLOG logfile`

  - `logfile`: String specifying the log filename. The path is relative to `pixel-gantry-control\Logs`.

#### `CLEARLOG`

Clears the current log. If a log file has been specified, it is cleared as well.

*Format:* `CLEARLOG`

#### `CLEARVARS`

Clears the variable table, including the bottom frame.

*Format:* `CLEARVARS`

#### `DUMPSTATE`

Dumps the internal state of the application to the log.

*Format:* `DUMPSTATE prefix`

  - `prefix`: **Optional** Used to specify a prefix to select only a subset of the internal state variables. For example, `DUMPSTATE geometry` will only dump out the geometry definitions.

#### `LOADCONFIG`

Loads the content of a config file into the internal state of the application.

*Format:* `LOADCONFIG prefix filename`

  - `prefix`: **Optional** Used to specify a prefix to load only items in the config file whose keys begin with that prefix.
  - `filename`: **Optional** Use to specify an alternative config file to load data from. By default, it is the same `flex_config.txt` that is read upon startup.


#### `FLEXREAD`

Reads an object from the internal state of the application (ie the FlexWorktable) and saves it as a gScript variable.

*Format:* `FLEXREAD dest key`

  - `dest`: Writable location to store the value
  - `key`: Key for the object to read from the internal state.

#### `FLEXWRITE`

(Over)writes the value at `key` in the internal state of the application with a gScript variable

*Format:* `FLEXWRITE key src`

  - `key`: Key of the destination
  - `src`: Readable location with the data to be copied to key

#### `SETERRORMODE`

Sets the current error handling mode.

*Format:* `SETERRORMODE mode`

  - `mode`: One of `default`, `prompt`, or `setvar`. See section `Error Handling` for more information.

### Motion Commands

#### `HOME`

Moves the X,Y,and Z axes to their home positions.

*Format:* `HOME if-needed`

  - `if-needed`: **Optional** If the literal string "if-needed" is supplied, the gantry will only home if it hasn't already been homed since the gScript interpreter started.

#### `MOVETO`

Moves the gantry to the absolute position of the vector specified by `pos`.

*Format:* `MOVETO pos speed`

  - `pos`: 3D Vector specifying an absolute position to move to
  - `speed`: **Optional** number to specify the speed of the motion in mm/s. If omitted, use the (rather slow) default speed.

#### `MOVEREL`

Moves the gantry through the displacement specified by the vector `dis`

*Format:* `MOVEREL dis speed`

  - `dis`: 3D Vector specifying a relative motion
  - `speed`: **Optional** number to specify the speed of the motion in mm/s.  If omitted, use the (rather slow) default speed.

#### `MOVENAME`

Moves the gantry to the named position `pos_name`. It must be one of the named positions found in the `graph_motion.pos` namespace of `flex_config.txt`.

*Format:* `MOVENAME pos_name speed direct`

  - `pos_name`: A string literal for the name 
  - `speed`: **Optional** number to specify the speed of the motion in mm/s.  If omitted, fall back to `motion.travel_speed` from the flex_config. If that is not specified either, move at 50 mm/s.
  - `direct` **Optional** If you include the string "direct", the gantry does not return to it's current named position prior to moving on.
  
#### `MOVESAFE`

Moves to coordinate `pos` in two separate vertical and horizontal motions. By default, the vertical motion is performed first if `pos` is higher (ie smaller z) than the current position. If `pos` is lower (larger z), then the horizontal motion is performed first. This behavior can be overridden by supplying the optional `order` argument which can be one of `vertical_first`, `horizontal_first`, or `auto` (for the default behavior). 

*Format:* `MOVESAFE pos speed order`

  - `pos`: 3D vector specifying the absolute position to move to
  - `speed`: **Optional** Number to specify the speed of the motion in mm/s.  If omitted, use the (rather slow) default speed.
  - `order`: **Optional** Override the default behavior to force either the horizontal or vertical motion to occur first.

#### `GETPOS`

Reads the current position of the gantry and saves it into `pos`.

*Format:* `GETPOS pos`

  - `pos`: A writable location to save the current x/y/z position

#### `ROTATE`

Rotates the gantry head by `rot` degrees. If `rot` is a quaternion, the yaw component is used. This is a relative motion.

*Format:* `ROTATE rot speed`

  - `rot`: The amount to rotate in degrees
  - `speed`: **Optional** number to specify the speed of the motion in deg/s.  If omitted, use the (rather slow) default speed.

#### `ROTATETO`

Rotates the gantry head to position `pos`, where `pos` is an absolute coordinate.  If `pos` is a quaternion, the yaw component is used.

*Format:* `ROTATE pos speed`

  - `pos`: The orientation to rotate the gantry head
  - `speed`: **Optional** number to specify the speed of the motion in deg/s.  If omitted, use the (rather slow) default speed.
  
#### `GETROT`

Reads the current rotation of the gantry head in degrees and saves it into `rot`.

*Format:* `GETROT arg1`

  - `rot`: A writeable location to save the current rotation in degrees

#### `JOYSTICK`

*Format:* `JOYSTICK cam_name`

Enables the [Joystick](https://www.aerotech.com/product-catalog/motion-controller/joystick.aspx). If `cam_name` is supplied and matches one of the cameras as specified in the `camera.*` namespace, a video stream from that camera is shown in the popup window. Execution of the script will halt until the 'C' button is pressed on the joystick.

  - `cam_name`: **Optional**. The camera identification for the popup feed. If omitted, `gantryhead` camera is used.

#### `MPGON`

*Format:* `MPGON`

Starts the script in the motion composer to enable the [MPG](https://www.aerotech.com/wp-content/uploads/2020/11/MPG.pdf) hand controller. The script is supplied by Aerotech, but requires some customization for a particular setup to work properly. To use this command, a properly customized set of scripts must reside in `Config/*site*/MPG`.

#### `MPGOFF`

*Format:* `MPGOFF`

Stops the MPG Script.

#### `ACKFAULT`

*Format:* `ACKFAULT`

Clears all axis faults and (re-)enables all exes.

### Vision Commands

#### `SNAPSHOT`

Fetches an image from the specified camera. If filename is specified, the image is saved to that location. Otherwise, a pop-up window will display the image until dismissed.

*Format:* `SNAPSHOT cam_name filename crosshair`

  - `cam_nam` **Optional:** Name of camera to acquire an image from
  - `filename` **Optional:** Filename to save the image to within the `Logs\` folder. Only `.png` format is supported.
  - `crosshair` **Optional:** If the literal string "crosshair" is present, a red crosshair is superimposed on the image.

#### `VIDEO`

Displays a popup windows showing a video stream from a specified camera. If no camera is specified, `gantry_head` is used. In the popup window, clicking on the display will recenter the gantry on that position.

*Format:* `VIDEO cam_name`

#### `AUTOFOCUS`

Takes a series of images spaced roughly 20 um apart within `range`. For each image, the focus is calculated. The focus values are then fit using a gaussian. The center of the gaussian is used as the focal position. Finally, the gantry moves to the focal position. The default image spacing can be overridden by setting the flex_config entry `vision.autofocus.step_size` to a different value. By default, there is no delay between the end of motion and grabbing an image. For low-framerate (<10fps) cameras, this can result in getting an old image from before motion ended. To remedy this, one can add a delay by setting the `vision.autofocus.delay` entry in the flex_config.

*Format:* `AUTOFOCUS res range crop_factor mode`

  - `res`: Writable location to save the position of max focus in the specified range.
  - `range`: Size of window to search for maximum focus centered around the current position.
  - `crop_factor`: **Optional** A value in the range \[0,1) to crop the image before calculating focus. Use this if the field of view contains objects at different heights and you wish to focus specifically on the central area of the image. For example, if `crop_factor=x` the autofocus will crop `x/2` from the top, bottom, left, and right of the image, leaving a cropped image that has `1-x` of the original's height and width.
  - `mode`: **Optional** specify `autoclose` to close the monitor popup when finished. Otherwise window will remain open until close button is pressed.

#### `SETLIGHT`

Sets the intensity of the light associated with camera `cam`. The gantry setup must have hardware support for a controllable light. There are currently three supported modes of control. The mode is set in the `flex_config` with a key of `light.camname.control`. Some control modes also require a hardware address that is specified as `light.camname.hardware_address`. The control modes are as follows:

  - `manual`: No automatic control is enabled. The `SETLIGHT` command does nothing.
  - `minidaq`: Control is done through a module in the NI compactDAQ. In this case, the `hardware_address` should be a DAQmx channel specifier (eg. "cDAQ1Mod1/port0/line30")
  - `npaq`: Control is done through one of the analog outputs on the NPAQ (or other gantry controller). Here, the `hardware_address` should be of the form "AXIS.CHANNEL" (eg. "Y.0" for axis Y channel 0).

*Format:* `SETLIGHT intensity cam`

  - `intensity`: Readable location for the light intensity. Range is [0-100].
  - `cam`: name of camera

#### `SURVEY`

Creates a composite image centered at `loc` with size `x-size` by `y-size`. 

*Format:* `SURVEY loc x-size y-size quality filename`

  - `loc`: Center of image
  - `x-size`: Width of composite image in mm
  - `y-size`: Height of composite image in mm
  - `quality`: Amount to downsample the image. Sometimes necessary when imaging a large area. Options are: `perfect` (no downsampling), `high` (4x downsampling), `medium` (8x), and `low`(16x).
  - `filename`: **Optional**. If supplied, save the image to this file rather than displaying it as a pop up.

#### `FINDFID`

*Format:* `FINDFID loc fidtype`

  - `loc`: Location of the fiducial in gantry coordinates. If no fiducial was found, the result will be {-1,0,0,0} and an error will be thrown.
  - `fidtype`: Specify the type of fiducial you want to find. Needs to correspond to a section in the `vision.*` namespace in `flex_config.txt`.

### Vacuum Commands

#### `SETVAC`

Sets the specified vacuum channel to either on or off depending on the boolean evaluation of `state`.

*Format:* `SETVAC chan state`

  - `chan`: The channel name of Vacuum to set. Must be one of the channels listed in the `vacuum.*`namespace in `flex_config.txt`.
  - `state`: A readable value interpreted as a boolean.

#### `GETVAC`

*Format:* `GETVAC chan dest`

  - `chan`: The channel name of Vacuum to get
  - `dest`: writable location to store that channel's state

### Tooled Routines

Tooled Routines call functions that are defined by the "Tool" subclasses of the LabVIEW Gantry Class. To call these, the script must first execute the `LOADTOOL` command for the specific tool. Afterwards, the `UNLOADTOOL` command must be called.

#### `LOADTOOL`

Loads the specified tool. If the tool is on the tool rack, it is loaded onto the gantry head's tool holder. For this to work properly, two things must be specified. 

First, the position on the tool rack that the tool occupies must be specified in the `flex_config` under the `tool_rack` namespace. For example, if the "picker tool" is sittin in the left-most position (ie position 0) then the required line is `tool_rack.0: picker_tool`.

Second, the tool rack position at which the tool resides must have two corresponding entries in the `graph_motion` section of the `flex_config`. Again, assuming the tool is in position 0, the required entries are `graph_motion.pos.tool_rack_pos_0_in` and `graph_motion.pos.tool_rack_pos_0_out`. The "in" position is 2mm above where the gantry must be to pick up a tool at that tool rack position. This can generally be found by just alligning the tool holder with the tool by eye, recording the position, and then subtracting 2mm from the z coordinate. The "out" position should have the same x and z as the "in", but with y set to be out in front of the tool rack.

With these positions specified, the motion to load the tool is as follows: 

  1. Move to the "out" position
  2. Move to the "in" position
  3. Move down 2mm
  4. Turn on the vacuum to grab the tool (channel name `gantry_head_outer`)
  5. Wait 1500ms, or if specified in flex_config, `tool_exchange_vacuum_delay` ms.
  6. Move up 2mm
  7. Move to "out" position

Finally, because this command utilizes the graph motion feature to navigate to the "in" and "out" positions, the "out" must be connected to the rest of the graph, and the "in" and "out" positions must be connected together. A minimal setup could consist of:

```
graph_motion.pos.home: {0,0,0}
graph_motion.pos.tool_rack_pos_0_in:  {651,16,37} # updated to site's values
graph_motion.pos.tool_rack_pos_0_out: {651,158,37}    # updated to site's values

graph_motion.edge.home.tool_rack_pos_0_out: True
graph_motion.edge.tool_rack_pos_0_out.tool_rack_pos_0_in: True

```

*Format:* `LOADTOOL toolname`

  - `toolname`: The name of the tool. Must be one of those listed in the `tool_rack` namespace of the `flex_config`.

#### `UNLOADTOOL`

Unloads the current tool. Has the same configuration pre-requisites as `LOADTOOL`.

*Format:* `UNLOADTOOL`


#### **Grabber Tool**

#### `LOADSTAMP`

`LOADSTAMP` will pick up any stamp as long as it is given the correct parameters in the config. It will go the named position, perform movement (described below) and return to that named position.

These are (for example with `stamp_number`=1 and the stamp is at `etl_chuck_2`):


```
stamp_info.chuck: etl_chuck_2

stamp.1.rot: 90              # Comment: this rotation is 90 deg or 0 deg usually, 
                             #  its just so the grabber tool is in the correct 
                             #  orientation before it goes to pos1,pos2 etc...
stamp.1.pos1: {1,1,1}        # Not relevant position vectors just place holders 
                             #  and to show they are vectors
stamp.1.pos2: {2,2,2}
stamp.1.pos3: {3,3,3}
stamp.1.pos4: {4,4,4}
```

The order is like this (clockwise starting at pos1, all movement should roughly be in the same plane as drawn in this picture):

        pos1(GRABBER TOOL !NOT CAMERA! directly above stamp)                pos2(pos2 to gain clearance)
        
        
        
        
        
        pos4(where stamp is sitting)                                        pos3(directly below pos2 and in a position it can now slide into pos4 to pick up the stamp)

To obtain these values you will load the grabber tool and grab these positions manually to put in the config. For example, with the grabber tool loaded:

1. You would bring the grabber tool directly overhead of the center of the stamp (pos1)
2. Move gantry over to a safe location (pos2)
3. Bring gantry down such that it can now slide in and pick up the stamp without crashing (pos3)
4. Where grabber tool and stamp will be safely combined (pos4)
And now the grabber tool has picked up the stamp when it moves up to pos 1


*Format:* **LOADSTAMP stamp_number**

  - `stamp_number`: Stamp number tells "LOADSTAMP" what stamp you are loading and should match rot,pos1,pos2,pos3,pos4 in the config


#### `UNLOADSTAMP`

Takes current stamp and unloads it back to where it was resting before the stamp was loaded. 
In order for the stamp to not catch on the side of where you are unloading it, you can supply an offset in the config.

Example of correct config format:
stamp.1.return_offset: {1.0,1,0}*

*Format:* **UNLOADSTAMP**

  - no arguments

#### `APPLYSTAMP`

Takes loaded stamp and stamps a determined target. There are some important parameters to specify in the config, the list is:

geometry.etl_grabber_tool.Zg: {0,0,43.5}
geometry.stamp_1.Zs: {0,0,12.5}

stamp_info.apply_gap: {0,0,1}
stamp_info.apply_time: 1000 #default time for how long you want to stamp the object

![image](https://user-images.githubusercontent.com/70072888/124952714-1732c580-dfda-11eb-8b0f-488ef5755fad.png)


*Format:* **APPLYSTAMP center rot wait**

  - `center`: Center of the object the user wishes to stamp (in camera coordinates, ie measured with the camera)
  - `rot`: rotation of the object the user wishes to stamp
  - `wait`: **Optional** Tells you how long to apply the stamp, if not given it has a default value in the config

#### **Syringe Tool**

#### `POTLINE`

Invokes the Syringe Tool potting routine. Must supply the start and end positions as well as the offset between the gantry camera and the needle tip. Currently, potting parameters (speed, tip-height, etc.) are read from the `POTTING` section of `general_configuration.ini`.

*Format:* `POTLINE start end offset`

  - `start`: 3D position of the start of the desired line of encapsulant
  - `end`: 3D position of the end of the desired line of encapsulant
  - `offset`: Calibrated 3d offset of the needle tip.

#### `POTDOT`

*Format:* `POTLINE pos offset`

  - `start`: 3D position of the desired dot of encapsulant
  - `offset`: Calibrated 3d offset of the needle tip.

#### **Picker Tool**

#### `PICKPART`

Picks up a part using a picker tool. The tool must already be loaded prior to invocation. Requires an accurate gantry-head-camera-offset (called `geometry.tool_holder_offset` in the flex_config) and a tool height/offset for the loaded picker tool. E.g. `geometry.etl_picker_tool.center_offset: {0,0,60.1}`.

*Format:* `PICKPART pos rot vac loc`

  - `pos`: Coordinates of the center of the part
  - `rot`: **Optional** Initial rotation of the part as a quaternion or degrees in the x-y plane. Default=0
  - `vac`: **Optional** If specified, the vacuum line to toggle to release the part.
  - `loc`: **Optional** The named position for the part's location. E.g. "part_staging_area_1". If specified, the gantry moves to this position prior to picking up the part.

#### `PLACEPART`

Places an alredy-picked part using the picker tool. Has the same configuration requirements as `PICKPART`.

*Format:* `PLACEPART pos rot vac loc`

  - `pos`: Target position to place the part.
  - `rot`: **Optional** Target rotation of the part as a quaternion or degrees in the x-y plane. Default=0
  - `vac`: **Optional** If specified, the vacuum line to toggle to hold the part.
  - `loc`: **Optional** The named position for the part's destination. E.g. "part_assembly_area_1". If specified, the gantry moves to this position prior to placing down the part.
