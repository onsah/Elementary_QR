namespace ElementaryQR { 
    
    public class FileManager 
    {
        private const string DIR_SETTING = "save-directory";

        private static string DEFAULT_DIR = GLib.Environment.get_user_special_dir (GLib.UserDirectory.PICTURES) + "/QR";

        private static GLib.Settings _settings
        {
            owned get { return new Settings ("com.zer0.ElementaryQr"); }
        }

        // Last directory used to save the image as uri format
        public static string? directory 
        {
            owned get { return _settings.get_string (DIR_SETTING); }
            private set { _settings.set_string (DIR_SETTING, value); }
        }

        public static bool save_png (Gtk.Image image, GLib.File file) 
        {
            directory = file.get_parent ().get_uri ();
            var path = file.get_path ();
            if (!path.has_suffix (".png")) {
                path = path + ".png";
            }
            return image.surface.write_to_png (path) == Cairo.Status.SUCCESS;
        }
    }
}