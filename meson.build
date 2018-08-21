project('eQR',['c','vala'])

add_global_arguments('-DGETTEXT_PACKAGE="eQR"',language: 'c')

cairo_dep = dependency('cairo')
granite_dep = dependency('granite')
gtk_3_0_dep = dependency('gtk+-3.0')
libqrencode_dep = dependency('libqrencode')
gio_2_0_dep = dependency('gio-2.0')
glib_2_0_dep = dependency('glib-2.0')
gobject_2_0_dep = dependency('gobject-2.0')

elementary_qr_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/elementary_qr.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

elementary_qr_gresource_xml_file_c = elementary_qr_gresource_xml_generator.process(['data/elementary_qr.gresource.xml'])

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'eQR'),join_paths(meson.current_source_dir(),'data/local','','*'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc','eQR'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/elementary_qr.gschema.xml', install_dir: join_paths(get_option('prefix'),get_option('datadir'), 'glib-2.0', 'schemas'))
meson.add_install_script('meson_scripts/install_schemas.py')
subdir('src')
