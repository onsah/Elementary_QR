
namespace ElementaryQr {
    public class Application : Gtk.Application {

        private Gtk.Button paste_button;
        private Gtk.Entry text_entry;
        private Gtk.Image qr_code_image;
        private Gtk.Clipboard system_clipboard;
      
        public Application () {
            Object( application_id: "com.qrgen",
	                flags: ApplicationFlags.FLAGS_NONE);
        }

        protected override void activate () {
            var builder = new Gtk.Builder ();
            
            try {
                builder.add_from_file ("main_window.glade").to_string(); 
                builder.connect_signals (this);
            }
            catch (Error e) {
                error ("An error occured while loading file: %s", e.message);
            }
            
            var window = builder.get_object ("qr_application_window") as Gtk.ApplicationWindow;
            paste_button = builder.get_object ("paste_button") as Gtk.Button;
            text_entry = builder.get_object ("text_entry") as Gtk.Entry;
            qr_code_image = builder.get_object ("qr_code_image") as Gtk.Image;
            
            window.application = this;
            
            window.show_all ();
            
            var display = window.get_display ();
            system_clipboard = Gtk.Clipboard.get_default (display);
        }
        
        [CCode (instance_pos = -1)]
        protected void on_paste_button_clicked (Gtk.Button source) {
            text_entry.text = system_clipboard.wait_for_text ();
        }
        
        [CCode (instance_pos = -1)]
        protected void on_window_destroyed(Gtk.Window source) {
            stdout.printf ("Destroying...");
        }
        
        [CCode (instance_pos = -1)]
        protected void text_changed (Gtk.Entry source) {
            stdout.printf ("Generating the image...");
        }
        
        public static int main(string[] args) {
            var qrapp = new Application ();
            return qrapp.run (args);
        }  
    }
}

