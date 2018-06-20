using Gtk;

namespace ElementaryQR {

    [GtkTemplate (ui = "/com/zer0/elementary_qr/elementary_qr.ui")]
    public class MainWindow : Gtk.ApplicationWindow 
    {
    
        [GtkChild]
        private Gtk.Entry text_entry;
        [GtkChild]
        private Gtk.Box root_box;
        
        private QRImageBox image_box;
        
        public MainWindow (Gtk.Application app) 
        {
            Object (application: app);
            image_box = new QRImageBox ();
            
            root_box.add (image_box);   
            root_box.show_all ();
        }
        
        [GtkCallback]
        private void generate_button_clicked (Button source)
        {
            image_box.qr_text = text_entry.text;    //This handles redrawing 
        }
        
        [GtkCallback]
        private void paste_button_clicked (Button source)
        {
            var display = this.get_display ();
            var clipboard = Gtk.Clipboard.get_default (display);
            
            var text = clipboard.wait_for_text ();
            text_entry.text = text ?? "";
        }
    }
}
