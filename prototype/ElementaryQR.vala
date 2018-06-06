
namespace ElementaryQR {

    [GtkTemplate (ui = "./main_window.glade")]
    public class Application : Gtk.ApplicationWindow {
        
        [GtkChild]
        private Gtk.Button paste_button;
        [GtkChild]
        private Gtk.Button generate_button
        [GtkChild]
        private Gtk.Entry text_entry;
        [GtkChild]
        private Gtk.Image qr_code_image;
    }
    
    public Application () {
        Object( application_id: "com.qrgen",
            flags: ApplicationFlags.FLAGS_NONE);
    }
}
