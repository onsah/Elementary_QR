project('elementaryqr', 'vala', 'c')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala' )
add_project_arguments('--gresources=' + meson.current_source_dir() + '/views/elementary_qr.gresources.xml', language: 'vala')

add_project_arguments(  ['--target-glib=2.38'], language: 'vala')

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0', version: '>=2.38')
gtk = dependency('gtk+-3.0')
cairo = dependency('cairo')
qrencode = dependency('libqrencode')

run_command('glib-compile-resources', 'views/elementary_qr.gresources.xml', 
                                      '--target=resources.c', 
                                      '--sourcedir=' + join_paths(meson.current_source_dir(), 'views'), 
                                      '--generate-source')

src = ['MainWindow.vala', 'QRApp.vala', 'QREncoder.vala', 'QRImageBox.vala', 'resources.c']

executable( 'elementaryqr', src, 
            dependencies: [glib, gobject, gtk, cairo, qrencode])
