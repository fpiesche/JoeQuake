cmake_minimum_required(VERSION 3.13)
set(CMAKE_C_STANDARD 99)

project(JoeQuake VERSION 0.17.9)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# enable link time optimization for release builds
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO ON)

# packages
find_package(PkgConfig QUIET)
find_package(OpenSSL REQUIRED)
find_package(SDL2 REQUIRED)
find_package(PNG REQUIRED)
find_package(jpeg REQUIRED)
find_package(zstd REQUIRED)
pkg_search_module(minizip REQUIRED minizip)
pkg_search_module(MAD REQUIRED mad)

add_subdirectory(trunk)

if (UNIX AND NOT APPLE)
    install(TARGETS joequake-gl DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/)
#    install(FILES "dist/linux/io.github.j0zzz.JoeQuake.desktop" DESTINATION "share/applications")
#    install(FILES "dist/linux/io.github.j0zzz.JoeQuake.metainfo.xml" DESTINATION "share/metainfo")
#    install(FILES "dist/linux/io.github.j0zzz.JoeQuake.svg" DESTINATION "share/icons/hicolor/scalable/apps")
endif()
