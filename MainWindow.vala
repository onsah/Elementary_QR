//using Gtk;

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
            
            paste_from_clipboard (text_entry);

            root_box.add (image_box);   
            root_box.show_all ();
        }
        
        [GtkCallback]
        private void generate_button_clicked (Gtk.Button source)
        {
            image_box.qr_text = text_entry.text;
            image_box.draw_qr (); //Force to draw
        }

        [GtkCallback]
        private void save_button_clicked (Gtk.Button source)
        {
            stdout.printf("Not implemented yet.\n");
        }

        [GtkCallback]
        private void text_entry_changed ()
        {
            image_box.qr_text = text_entry.text;    // Generate qr code if text is different enough
        }

        private void paste_from_clipboard(Gtk.Entry entry) 
        {
            var display = this.get_display ();
            var clipboard = Gtk.Clipboard.get_default (display);
            var text = clipboard.wait_for_text ();
            entry.text = text ?? "";
        } 
    }
}
