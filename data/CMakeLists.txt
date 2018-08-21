### CMakeLists automatically created with AutoVala
### Do not edit

EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/elementary_qr.gresource.xml)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/elementary_qr.gresource.xml)
ADD_CUSTOM_COMMAND (
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.c
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/elementary_qr.gresource.xml ${CMAKE_CURRENT_SOURCE_DIR}/interface/elementary_qr.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/qr_box.ui
	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/elementary_qr.gresource.xml

	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/elementary_qr.gresource.xml
)

add_custom_target(elementary_qr_gresource_xml DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.c)
SET (elementary_qr_gresource_xml_C_FILE ${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.c PARENT_SCOPE)
SET (elementary_qr_gresource_xml_H_FILE ${CMAKE_CURRENT_BINARY_DIR}/elementary_qr.gresource.xml.h PARENT_SCOPE)
include(GSettings)
add_schema(elementary_qr.gschema.xml)
