#
# - Find jpeg libraries, which might be jpeg-ng with a
#   compatibility layer and the name minzip
#
#  jpeg_INCLUDE_DIRS - where to find jpeg headers.
#  jpeg_LIBRARIES    - List of libraries when using jpeg.
#  jpeg_FOUND        - True if jpeg is found.
#  jpeg_DLL_DIR      - (Windows) Path to the jpeg DLL.
#  jpeg_DLL          - (Windows) Name of the jpeg DLL.

if(NOT USE_REPOSITORY)
    find_package(PkgConfig QUIET)
    pkg_search_module(jpeg QUIET jpeg)
endif()

find_path(jpeg_INCLUDE_DIR
  NAMES
    jpeglib.h
  HINTS
    ${jpeg_INCLUDE_DIRS}
    "${jpeg_HINTS}/include"
)

get_filename_component(jpeg_PARENT_DIR ${jpeg_INCLUDE_DIR} DIRECTORY)
if(EXISTS "${jpeg_PARENT_DIR}/jpeglib.h")
    set(jpeg_INCLUDE_DIR "${jpeg_PARENT_DIR}")
endif()

find_library(jpeg_LIBRARY
  NAMES
    jpeg
  HINTS
    ${jpeg_LIBRARY_DIRS}
    "${jpeg_HINTS}/lib"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(jpeg
  REQUIRED_VARS   jpeg_LIBRARY jpeg_INCLUDE_DIR
  VERSION_VAR     jpeg_VERSION)

if(jpeg_FOUND)
    set(jpeg_LIBRARIES ${jpeg_LIBRARY})
    set(jpeg_INCLUDE_DIRS ${jpeg_INCLUDE_DIR})
    set(HAVE_jpeg ON)

    if(WIN32)
        set(jpeg_DLL_DIR "${jpeg_HINTS}/bin"
      CACHE PATH "Path to jpeg DLL"
    )
        file(GLOB _jpeg_dll RELATIVE "${jpeg_DLL_DIR}"
      "${jpeg_DLL_DIR}/jpeg.dll"
    )
        set(jpeg_DLL ${_jpeg_dll}
      CACHE FILEPATH "jpeg DLL file name"
    )
        file(GLOB _jpeg_pdb RELATIVE "${jpeg_DLL_DIR}"
      "${jpeg_DLL_DIR}/jpeg.pdb"
    )
        set(jpeg_PDB ${_jpeg_pdb}
      CACHE FILEPATH "jpeg PDB file name"
    )
        mark_as_advanced(jpeg_DLL_DIR jpeg_DLL jpeg_PDB)
    endif()
else()
    set(jpeg_LIBRARIES)
    set(jpeg_INCLUDE_DIRS)
    set(jpeg_DLL_DIR)
    set(jpeg_DLL)
endif()

mark_as_advanced(jpeg_LIBRARIES jpeg_INCLUDE_DIRS)
