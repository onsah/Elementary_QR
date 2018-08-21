namespace ElementaryQR 
{ 
    public class QRApp : Gtk.Application
    {
        private MainWindow mainWindow;

        public QRApp () 
        {
            Object (application_id: "tr.zer0.ElementaryQR", flags: ApplicationFlags.FLAGS_NONE);
        }

        protected override void activate ()
        {
            mainWindow = new MainWindow (this);
            this.add_window (mainWindow);
            mainWindow.show_all (); 
        }

        public static int main(string[] args)
        {
            var app = new QRApp ();
            return app.run (args);
        }
    }    
}

