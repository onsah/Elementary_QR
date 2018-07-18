using Gtk;

namespace ElementaryQR {
    
    [GtkTemplate (ui = "/com/zer0/elementary_qr/qr_box.ui")]
    public class QRImageBox : Gtk.Box {
        private const int SIZE = 210;

        [GtkChild]
        private Gtk.Image qr_image;
        
        private string _qr_text;
        private string old_text;

        private int _version = 1;

        public int version 
        { 
            get { return _version; } 
            set { if(value > 0 && value < 41) _version = value; } 
            //  See: http://www.qrcode.com/en/about/version.html
        }
        
        // Setting this to the value may not change the image depending on the difference with the old text but it will always set the text so it is possible to be force to drawing
        public string qr_text
        {
            get { return _qr_text ?? ""; }
            set 
            { 
                _qr_text = value;
                if (old_text.contains (value) 
                    || value.contains (old_text)  
                    && (value.length - old_text.length).abs () <= 3 )
                    return;
                old_text = qr_text;
                draw_qr ();     
            }
        }
        
        public void draw_qr () 
        {
            //var surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, SIZE, SIZE);
            stdout.printf ("drawing text: " + qr_text + "\n");
            if (!QREncoder.encode_image (qr_image, qr_text, version)) {
                stdout.printf ("Couldn't generate the QR code, text may be empty.\n");
            }
        }
    }
}
