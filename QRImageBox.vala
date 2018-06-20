
using Gtk;

namespace ElementaryQR {
    
    [GtkTemplate (ui = "/com/zer0/elementary_qr/qr_box.ui")]
    public class QRImageBox : Gtk.Box {
        private const int SIZE = 210;

        [GtkChild]
        private Gtk.Image qr_image;
        
        private string _qr_text;
        
        public string qr_text
        {
            get 
            {
                return _qr_text;
            }
            set 
            {
                _qr_text = value;
                draw_qr ();
            }
        }
        
        private void draw_qr () 
        {
            //var surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, SIZE, SIZE);
            stdout.printf ("drawing text: " + qr_text + "\n");
            if (!QREncoder.encode_image (qr_image, qr_text)) {
                stdout.printf ("Couldn't generate the QR code, text may be empty.\n");
            }
        }
    }
}
