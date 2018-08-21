
using Gtk;

namespace ElementaryQR {
    
    [GtkTemplate (ui = "/com/zer0/elementary_qr/interface/qr_box.ui")]
    public class QRImageBox : Gtk.Box {
        private const int SIZE = 210;

        [GtkChild]
        private Gtk.Image qr_image;

        public Gtk.Image image
        {
            get { return qr_image; }
        }
        
        private string _qr_text;
        private string _old_text;

        private string old_text
        {
            get { return _old_text ?? ""; }
            set { _old_text = value; }
        }

        private int _version = 1;

        public int version 
        { 
            get { return _version; } 
            set { if(value > 0 && value < 41) _version = value; } 
            //  See: http://www.qrcode.com/en/about/version.html
        }
        
        public string qr_text
        {
            get { return _qr_text ?? ""; }
            set 
            { 
                _qr_text = value;
                if (old_text.contains (value) 
                || value.contains (old_text)  
                && (value.length - old_text.length).abs () <= 3 ) {
                    return;
                }
                old_text = qr_text;
                draw_qr ();     
            }
        }
                
        public async void draw_qr () 
        {
            // var surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, SIZE, SIZE);
            stdout.printf ("drawing text: " + qr_text + "\n");
            try 
            {
                var surface = QREncoder.encode (qr_text, version);
                qr_image.surface = surface;
            }
            catch (EncodeError e)
            {
                stdout.printf ("Couldn't encode the image: %s\n", e.message);
            }
        }
    }
}
