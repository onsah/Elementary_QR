cfg_eQR = configuration_data()
cfg_eQR.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_eQR.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'eQR'))
cfg_eQR.set('GETTEXT_PACKAGE', 'eQR')
cfg_eQR.set('RELEASE_NAME', 'eQR')
cfg_eQR.set('PREFIX', get_option('prefix'))
cfg_eQR.set('VERSION', '1.0.0')
cfg_eQR.set('TESTSRCDIR', meson.source_root())

cfgfile_1 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_eQR)

eQR_deps = [cairo_dep]
eQR_deps += [granite_dep]
eQR_deps += [gtk_3_0_dep]
eQR_deps += [libqrencode_dep]
eQR_deps += [gio_2_0_dep]
eQR_deps += [glib_2_0_dep]
eQR_deps += [gobject_2_0_dep]
eQR_sources = [cfgfile_1]
eQR_sources += ['FileManager.vala']
eQR_sources += ['MainWindow.vala']
eQR_sources += ['QRApp.vala']
eQR_sources += ['QREncoder.vala']
eQR_sources += ['QRImageBox.vala']
eQR_sources += ['Utils.vala']
eQR_sources += ['eQR.vala']
eQR_sources += [elementary_qr_gresource_xml_file_c]
eQR_vala_args = ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
eQR_vala_args += ['--gresources='+join_paths(meson.source_root(),'data/elementary_qr.gresource.xml')]
eQR_vala_args += ['--target-glib=2.38']
eQR_link_args = ['-rdynamic']

executable('eQR',eQR_sources,dependencies: eQR_deps,vala_args: eQR_vala_args,link_args: eQR_link_args,install: true)

