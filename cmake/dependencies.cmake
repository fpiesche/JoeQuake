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
        set(VCPKG_TARGET_TRIPLET "x64-windows-static" CACHE STRING "")
    endif()
endif()

# actually find dependencies
find_package(PkgConfig QUIET)
find_package(OpenSSL REQUIRED)
find_package(SDL2 REQUIRED)
find_package(PNG REQUIRED)
find_package(jpeg REQUIRED)
find_package(zstd REQUIRED)
pkg_search_module(minizip REQUIRED minizip)
pkg_search_module(MAD REQUIRED mad)
