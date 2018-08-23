public class Dialogs 
{
    private static Gtk.FileChooserDialog _save_dialog;

    public static Gtk.FileChooserDialog save_dialog 
    {
        get 
        {
            if (_save_dialog == null) {
                _save_dialog = create_file_chooser (
                    "Select folder to save pictures",
                    null
                );
            }
            return _save_dialog;
        }
    }

    private static Gtk.FileChooserDialog create_file_chooser (string title, Gtk.Window? parent)
    {
        var dialog = new Gtk.FileChooserDialog (
            title, 
            parent,
            Gtk.FileChooserAction.SAVE,
            "_Cancel", Gtk.ResponseType.CANCEL,
            "_Save", Gtk.ResponseType.ACCEPT
        );
        var filter = new Gtk.FileFilter ();
        dialog.filter = filter;
        dialog.select_multiple = false;
        dialog.set_current_folder_uri (FileManager.directory ?? DEFAULT_DIR);

        return dialog;
    }
}