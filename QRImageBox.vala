
using Gtk;

namespace ElementaryQR {
    
    [GtkTemplate (ui = "/com/zer0/elementary_qr/qr_box.ui")]
    public class QRImageBox : Gtk.Box {
        private const int SIZE = 210;

        [GtkChild]
        private Gtk.Image qr_image;
        [GtkChild]
        private Gtk.Button save_button;
        
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

        [GtkCallback (name = "save_button_clicked")]
        protected void save_button_clicked (Gtk.Button source) 
        {
            stdout.printf ("not implemented!\n");
        }
        
        private void draw_qr () 
        {
            var surface = new Cairo.ImageSurface (Cairo.Format.ARGB32, SIZE, SIZE);
            stdout.printf ("drawing text: " + qr_text);
            //QRDecoder.decode (surface, qr_text);
            QREncoder.encode (surface, qr_text);
            qr_image.surface = surface;    
        }
    }
}
