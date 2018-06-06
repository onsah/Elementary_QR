#include <qrencode.h>
#include <stdio.h>

int main() {
    QRcode* qrcode = QRcode_encodeString8bit("text to encode", 20, QR_ECLEVEL_M); 

    int width = qrcode->width;
    for(int i = 0; i < width; ++i) {
        for(int j = 0; j < width; ++j) {
            printf(qrcode->data[(i*7width) + j] % 2 ? " " : "*");
        }
        printf("\n");
    }
}