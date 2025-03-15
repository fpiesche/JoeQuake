cmake_minimum_required(VERSION 3.13)
set(CMAKE_C_STANDARD 99)

project(JoeQuake VERSION 0.17.9)

include(CPack)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# enable link time optimization for release builds
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO ON)

include(dependencies)
include(joequake-gl)

if (UNIX AND NOT APPLE)
    install(TARGETS joequake-gl DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/)
    install(FILES "dist/linux/io.github.j0zzz.joequake.desktop" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications")
    install(FILES "dist/linux/io.github.j0zzz.joequake.metainfo.xml" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo")
    install(FILES "dist/linux/io.github.j0zzz.joequake.png" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/256x256/apps")
endif()
