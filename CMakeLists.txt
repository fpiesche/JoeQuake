cmake_minimum_required(VERSION 3.13)
set(CMAKE_C_STANDARD 99)
include(CPack)
list(APPEND CMAKE_MODULE_PATH "./cmake")

# enable link time optimization for release builds
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO ON)

if (APPLE)
    # Create Universal Binary
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64")
endif()

option(ENABLE_VCPKG "Enable the vcpkg package manager" ON)

if (ENABLE_VCPKG)
    # check if vcpkg is shallow and unshallow it if necessary
    execute_process(
 COMMAND git rev-parse --is-shallow-repository
 WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/thirdparty/vcpkg
 OUTPUT_VARIABLE is_vcpkg_shallow
 OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    if(is_vcpkg_shallow STREQUAL "true")
        message(STATUS "vcpkg is shallow. Unshallowing it now...")
        execute_process(
   COMMAND git fetch --unshallow
   WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/thirdparty/vcpkg"
   RESULT_VARIABLE result
   OUTPUT_VARIABLE output
  )
    endif()

    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/vcpkg/scripts/buildsystems/vcpkg.cmake"
  CACHE STRING "Vcpkg toolchain file")
    # Set this so that all the various find_package() calls don't need an explicit
    # CONFIG option
    set(CMAKE_FIND_PACKAGE_PREFER_CONFIG TRUE)
    if (WIN32)
        set(VCPKG_TARGET_TRIPLET "x86-windows-static" CACHE STRING "")
    endif()
endif()

project(JoeQuake VERSION 0.17.9 LANGUAGES C ASM)
include(dependencies)
include(joequake-gl)

if (WIN32)
    file(GLOB JQ_GASM CONFIGURE_DEPENDS "trunk/*.s")
    # build gas2masm and pre-process assembly files
    add_executable(gas2nasm thirdparty/gas2nasm/gas2nasm.c)
    include(quake-asm)
    add_dependencies(joequake-gl quake-asm)
endif()


if (UNIX AND NOT APPLE)
    install(TARGETS joequake-gl DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/)
    install(FILES "dist/linux/io.github.j0zzz.joequake.desktop" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications")
    install(FILES "dist/linux/io.github.j0zzz.joequake.metainfo.xml" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo")
    install(FILES "dist/linux/io.github.j0zzz.joequake.png" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/256x256/apps")
endif()
