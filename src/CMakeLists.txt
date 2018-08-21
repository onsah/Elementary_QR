### CMakeLists automatically created with AutoVala
### Do not edit

set (DATADIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}")
set (PKGDATADIR "${DATADIR}/eQR")
set (GETTEXT_PACKAGE "eQR")
set (RELEASE_NAME "eQR")
set (CMAKE_C_FLAGS "")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (VERSION "1.0.0")
set (TESTSRCDIR "${CMAKE_SOURCE_DIR}")
set (DOLLAR "$")

configure_file (${CMAKE_SOURCE_DIR}/src/Config.vala.base ${CMAKE_BINARY_DIR}/src/Config.vala)
add_definitions(-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")
set (VERSION "1.0.0")
add_definitions (${DEPS_CFLAGS})
link_libraries ( ${DEPS_LIBRARIES} )
link_directories ( ${DEPS_LIBRARY_DIRS} )
find_package (Vala REQUIRED)
include (ValaVersion)
ensure_vala_version ("0.36" MINIMUM)
include (ValaPrecompile)

set (VALA_PACKAGES ${VALA_PACKAGES} cairo)
set (VALA_PACKAGES ${VALA_PACKAGES} granite)
set (VALA_PACKAGES ${VALA_PACKAGES} gtk+-3.0)
set (VALA_PACKAGES ${VALA_PACKAGES} libqrencode)
set (VALA_PACKAGES ${VALA_PACKAGES} gio-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} glib-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} gobject-2.0)

set (APP_SOURCES ${APP_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/Config.vala)
set (APP_SOURCES ${APP_SOURCES} FileManager.vala)
set (APP_SOURCES ${APP_SOURCES} MainWindow.vala)
set (APP_SOURCES ${APP_SOURCES} QRApp.vala)
set (APP_SOURCES ${APP_SOURCES} QREncoder.vala)
set (APP_SOURCES ${APP_SOURCES} QRImageBox.vala)
set (APP_SOURCES ${APP_SOURCES} Utils.vala)
set (APP_SOURCES ${APP_SOURCES} eQR.vala)

set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --vapidir=${CMAKE_SOURCE_DIR}/src/vapis )

if ((${CMAKE_BUILD_TYPE} STREQUAL "Debug") OR (${CMAKE_BUILD_TYPE} STREQUAL "RelWithDebInfo"))
	set(COMPILE_OPTIONS ${COMPILE_OPTIONS} "-g")
endif()

set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --target-glib=2.38 )
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --gresources=${CMAKE_SOURCE_DIR}/data/elementary_qr.gresource.xml )

vala_precompile(VALA_C eQR
	${APP_SOURCES}
PACKAGES
	${VALA_PACKAGES}
OPTIONS
	${COMPILE_OPTIONS}
)

SET (VALA_C ${VALA_C} ${elementary_qr_gresource_xml_C_FILE})
add_executable(eQR ${VALA_C})
set ( eQR_DEPENDENCIES ${eQR_DEPENDENCIES} elementary_qr_gresource_xml )
add_dependencies( eQR ${eQR_DEPENDENCIES} )


install(TARGETS
	eQR
RUNTIME DESTINATION
	${CMAKE_INSTALL_BINDIR}
)
if(HAVE_VALADOC)
	valadoc(eQR
		${CMAKE_BINARY_DIR}/valadoc/eQR
		${APP_SOURCES}
	PACKAGES
		${VALA_PACKAGES}
	CUSTOM_VAPIS
		${CUSTOM_VAPIS_LIST}
	)
	install(DIRECTORY
		${CMAKE_BINARY_DIR}/valadoc
	DESTINATION
		${CMAKE_INSTALL_DATAROOTDIR}/doc/eQR
	)
endif()
