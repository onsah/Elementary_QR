
namespace ElementaryQr { 
    public class QrImageBox : Gtk.Box {

        Gtk.Image qr_code_image;
        Gtk.Button save_button;
        
        public QrImageBox () {
            //...
        }

        public void generate_qr (string text) {
            var qr_code = QRcode.encodeString8bit (text, 20, EcLevel.M);
            var rsvg = Rsvg.Handle.from_data (qr_code.data);
        }
    }
}
