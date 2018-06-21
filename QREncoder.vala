namespace ElementaryQR 
{ 
    public class QREncoder
    {
        private const int LEVEL = 1;
        private const int BLOCK_SIZE = 10;

        [Deprecated]
        public static bool encode(Cairo.Surface surface, string text)
        {
            if (text == null || text.strip () == "") {
                stdout.printf ("Empty text can not be decoded.\n");
                return false;
            }
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
            return true;
        }

        public static bool encode_image(Gtk.Image image, string text, int version)
        {
            if(text == null || text == "") {
                stdout.printf ("empty text can not be decoded\n");
                return false;
            }
            var qrcode = new QRcode.encodeString8Bit (text, version, EcLevel.M);
            var size = qrcode.width;
            var qr_code_size = size * BLOCK_SIZE;
            var surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, 
                                                qr_code_size, 
                                                qr_code_size);
            var context = new Cairo.Context (surface);
            
            var color = 1d;
            var bufferx = 0, buffery = 0;
            for (int i = 0; i < size; ++i) {
                for (int j = 0; j < size; ++j) {
                    var pos = (i * size) + j;
                    color = is_filled (qrcode.data[pos]) ? 0d : 1d;
                    context.set_source_rgba (color, color, color, 1);
                    context.rectangle (bufferx, buffery, BLOCK_SIZE, BLOCK_SIZE);
                    context.fill ();
                    bufferx += BLOCK_SIZE;
                }
                buffery += BLOCK_SIZE;
                bufferx = 0;
            }
            image.surface = surface;
            return true;
        }

        private static bool is_filled(uint8 block)
        { 
            return block % 2 == 1;
        }
    }    
}