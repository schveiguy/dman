# Drawing a DMan with Raylib

This draws a dman as shown [here](https://github.com/dlang-community/d-mans) using the [raylib](https://www.raylib.com/) library!

![dman](https://user-images.githubusercontent.com/580778/145662610-afa77773-f28e-4328-8631-ccb354a647a0.png)

Steps to build:

1. Copy version 4.0.0 of the raylib library files for your platform into the project directory.
2. Use dub to build the library
3. On Windows, just run the program using `dman.exe`
4. On Linux, use `LD_LIBRARY_PATH=. ./dman`
5. On Macos, use `DYLD_FALLBACK_LIBRARY_PATH=. ./dman`, and satisfy the security warning (go to settings, and trust the dylib).
