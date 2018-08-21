//using Gtk;

namespace ElementaryQR {

    [GtkTemplate (ui = "/com/zer0/elementary_qr/interface/elementary_qr.ui")]
    public class MainWindow : Gtk.ApplicationWindow 
    {
        [GtkChild]
        private Gtk.Overlay main_overlay;
    
        [GtkChild]
        private Gtk.Entry text_entry;

        [GtkChild]
        private Gtk.Box root_box;
        
        private QRImageBox image_box;

        private Granite.Widgets.Toast toast;

        construct {
            image_box = new QRImageBox ();
            toast = new Granite.Widgets.Toast ("File saved successfully");
            toast.set_default_action (null);
            
            main_overlay.add_overlay (toast);
            root_box.add (image_box);
        }

        public MainWindow (Gtk.Application app) 
        {
            Object (application: app);
            
            paste_from_clipboard (text_entry);
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
            var chooser = FileManager.create_file_chooser ("Select folder to save pictures", this);
            if (chooser.run () == Gtk.ResponseType.ACCEPT) {
                var file = chooser.get_file ();
                if (FileManager.save_png (image_box.image, file)) {
                    toast.send_notification ();
                }
            }
            chooser.destroy ();
        }

        [GtkCallback]
        private void text_entry_changed ()
        {
            image_box.qr_text = text_entry.text;
        }

        [GtkCallback]
        private void on_window_destroyed ()
        {
            
        }

        private void paste_from_clipboard (Gtk.Entry entry) 
        {
            var display = this.get_display ();
            var clipboard = Gtk.Clipboard.get_default (display);
            var text = clipboard.wait_for_text ();
            entry.text = text ?? "";
        }   
    }
}
/*private class HeaderBar : Gtk.HeaderBar 
{
    public HeaderBar () 
    {
        base.title = "QR Generator";
        base.show_close_button = true;
        base.spacing = 0;

        var pref_img = new Gtk.Image.from_icon_name ("preferences-system");

    }
}*/