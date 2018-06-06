using ElementaryQr;
using Rsvg;

namespace ElementaryQr { 

    public static int main (string[] args) {
        const string text = "this is the text to be translated";
        
        var code = new QRcode.encodeString8Bit (text, 20, EcLevel.M);
        
        int width = code.width;
        for(int i = 0; i < width; ++i) {
            for(int j = 0; j < width; ++j) {
                stdout.printf (code.data[(i * width) + j] % 2 == 0 ? " " : "*");
            }
            stdout.printf("\n");
        }
        
        return 0;
    }
}
