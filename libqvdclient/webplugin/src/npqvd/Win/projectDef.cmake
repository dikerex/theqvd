#/**********************************************************\ 
# Auto-generated Windows project definition file for the
# QVD Web Client Plugin project
#\**********************************************************/

# Windows template platform definition CMake file
# Included from ../CMakeLists.txt

# remember that the current source dir is the project root; this file is in Win/
file (GLOB PLATFORM RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    Win/[^.]*.cpp
    Win/[^.]*.h
    Win/[^.]*.cmake
    )

# use this to add preprocessor definitions
add_definitions(
    /D "_ATL_STATIC_REGISTRY"
)

SOURCE_GROUP(Win FILES ${PLATFORM})

set (SOURCES
    ${SOURCES}
    ${PLATFORM}
    )

add_windows_plugin(${PROJECT_NAME} SOURCES)

# This is an example of how to add a build step to sign the plugin DLL before
# the WiX installer builds.  The first filename (certificate.pfx) should be
# the path to your pfx file.  If it requires a passphrase, the passphrase
# should be located inside the second file. If you don't need a passphrase
# then set the second filename to "".  If you don't want signtool to timestamp
# your DLL then make the last parameter "".
#
# Note that this will not attempt to sign if the certificate isn't there --
# that's so that you can have development machines without the cert and it'll
# still work. Your cert should only be on the build machine and shouldn't be in
# source control!
# -- uncomment lines below this to enable signing --
#firebreath_sign_plugin(${PROJECT_NAME}
#    "${CMAKE_CURRENT_SOURCE_DIR}/sign/certificate.pfx"
#    "${CMAKE_CURRENT_SOURCE_DIR}/sign/passphrase.txt"
#    "http://timestamp.verisign.com/scripts/timestamp.dll")

#:\cygwin\usr\include\sys/_types.h(36): error C2144: syntax error : '__int64' should be preceded by ';' [C:\jenkins\workspace\w20-webplugin-master\build\i686-pc-cygwin\projects\npqvd\npqvd.vcxproj]
#
add_definitions(-D__extension__=)
add_definitions(-DQVD_FIREBREATH_WINDOWS)

# Add the qvdclient library from env vars
include_directories("$ENV{QVDCLIENT_INCLUDE}" "$ENV{CURL_INCLUDE}" "$ENV{CYGWIN_INCLUDE}")

# set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_FLAGS "/clr:oldSyntax")

# add library dependencies here; leave ${PLUGIN_INTERNAL_DEPS} there unless you know what you're doing!
target_link_libraries(${PROJECT_NAME}
    ${PLUGIN_INTERNAL_DEPS}
    "$ENV{QVDCLIENT_LIB}"
    "$ENV{QVDCLIENT_EXTRA_LIBS}"
    )

set(WIX_HEAT_FLAGS
    -gg                 # Generate GUIDs
    -srd                # Suppress Root Dir
    -cg PluginDLLGroup  # Set the Component group name
    -dr INSTALLDIR      # Set the directory ID to put the files in
    )

add_wix_installer( ${PLUGIN_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/Win/WiX/npqvdInstaller.wxs
    PluginDLLGroup
    ${FB_BIN_DIR}/${PLUGIN_NAME}/${CMAKE_CFG_INTDIR}/
    ${FB_BIN_DIR}/${PLUGIN_NAME}/${CMAKE_CFG_INTDIR}/${FBSTRING_PluginFileName}.dll
    ${PROJECT_NAME}
    )

# This is an example of how to add a build step to sign the WiX installer
# -- uncomment lines below this to enable signing --
#firebreath_sign_file("${PLUGIN_NAME}_WiXInstall"
#    "${FB_BIN_DIR}/${PLUGIN_NAME}/${CMAKE_CFG_INTDIR}/${PLUGIN_NAME}.msi"
#    "${CMAKE_CURRENT_SOURCE_DIR}/sign/certificate.pfx"
#    "${CMAKE_CURRENT_SOURCE_DIR}/sign/passphrase.txt"
#    "http://timestamp.verisign.com/scripts/timestamp.dll")

# This is an example of how to create a cab
# -- uncomment lines below this to enable signing --
#create_cab(${PLUGIN_NAME}
#    ${CMAKE_CURRENT_SOURCE_DIR}/Win/Wix/npqvd.ddf
#    ${CMAKE_CURRENT_SOURCE_DIR}/Win/Wix/npqvd.inf
#    ${FB_BIN_DIR}/${PLUGIN_NAME}/${CMAKE_CFG_INTDIR}/
#    ${PROJECT_NAME}_WiXInstallExe
#    )
