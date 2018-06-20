namespace ElementaryQR 
{ 
    public class QREncoder
    {
        private const int LEVEL = 1;
        private const int BLOCK_SIZE = 10;

        public static void encode(Cairo.Surface surface ,string text)
        {
            var qrcode = new QRcode.encodeString8Bit (text, LEVEL, EcLevel.M);
            var context = new Cairo.Context (surface);
            double color = 1.0; //default is white
            context.save ();
            
            var width = qrcode.width;
            int bufferx = 0, buffery = 0;
            for (int i = 0; i < width; ++i) {
                for(int j = 0; j < width; ++j) {
                    var pos = (i * width) + j;
                    if (is_filled (qrcode.data[pos])) {
                        color = 0.0;
                    } else {
                        color = 1.0;
                    }
                    context.set_source_rgba (color, color, color, 1);
                    context.rectangle (bufferx, buffery, BLOCK_SIZE, BLOCK_SIZE);
                    context.fill ();
                    bufferx = (bufferx + BLOCK_SIZE) % (BLOCK_SIZE * width);
                }
                buffery += BLOCK_SIZE;
            }
        }

        private static bool is_filled(uint8 block)
        { 
            return block % 2 == 1;
        }
    }    
}