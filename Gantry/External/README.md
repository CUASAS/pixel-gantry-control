# pixel-gantry-extra

Auxillary libraries for pixel-gantry-control for adding pattern recognition and connecting to databases.

## Dependencies

For development, the following dependencies are required:

- Visual Studio 2019. Other compilers are in principle possible, but not supported
- CMake
- *For Database Development*
    - MySQL Connector C++ [[link]](https://dev.mysql.com/downloads/connector/cpp/)
    - The installer should put the libraries into `C:/Program Files/MySQL/Connector C++ 8.0/`
- *For Vision Development*
    - OpenCV v4.5.5 [[link]](https://opencv.org/releases/)
    - Unzip the above into `C:/opencv/`
