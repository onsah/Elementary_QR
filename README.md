# Elementary_QR
QR generator for elementary OS 

## Dependencies
- valac
- gtk+
- cairo
- [libqrencode](https://github.com/fukuchi/libqrencode)
- gobject with version al least 2.38
- [granite](granite)

## Building
```
autovala meson
meson build && cd build 
ninja
```
You can build using cmake if you want.

## Running
You can run the program from the terminal simply writing in the build/src directory
``./eQR``

## Credits
I have inspired by [genQR application](https://github.com/haecker-felix/genQR) while I was writing this app.
