# Elementary_QR
QR generator for elementary OS 

## Dependencies
- valac
- gtk+
- cairo
- [libqrencode](https://github.com/fukuchi/libqrencode)
- gobject with version al least 2.38

## Building
```
meson build && cd build 
ninja
```

## Running
You can run the program from the terminal simply writing
``./elementaryqr``

## Credits
I have inspired by [genQR application](https://github.com/haecker-felix/genQR) while I was writing this app.
