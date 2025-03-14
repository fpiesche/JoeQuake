#
# - Find mad libraries, which might be mad-ng with a
#   compatibility layer and the name minzip
#
#  mad_INCLUDE_DIRS - where to find mad headers.
#  mad_LIBRARIES    - List of libraries when using mad.
#  mad_FOUND        - True if mad is found.
#  mad_DLL_DIR      - (Windows) Path to the mad DLL.
#  mad_DLL          - (Windows) Name of the mad DLL.

if(NOT USE_REPOSITORY)
    find_package(PkgConfig QUIET)
    pkg_search_module(mad QUIET mad)
endif()

find_path(mad_INCLUDE_DIR
  NAMES
    mad.h
  HINTS
    ${mad_INCLUDE_DIRS}
    "${mad_HINTS}/include"
)

get_filename_component(mad_PARENT_DIR ${mad_INCLUDE_DIR} DIRECTORY)
if(EXISTS "${mad_PARENT_DIR}/mad.h")
    set(mad_INCLUDE_DIR "${mad_PARENT_DIR}")
endif()

find_library(mad_LIBRARY
  NAMES
    mad
  HINTS
    ${mad_LIBRARY_DIRS}
    "${mad_HINTS}/lib"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(mad
  REQUIRED_VARS   mad_LIBRARY mad_INCLUDE_DIR
  VERSION_VAR     mad_VERSION)

if(mad_FOUND)
    set(mad_LIBRARIES ${mad_LIBRARY})
    set(mad_INCLUDE_DIRS ${mad_INCLUDE_DIR})
    set(HAVE_mad ON)

    if(WIN32)
        set(mad_DLL_DIR "${mad_HINTS}/bin"
      CACHE PATH "Path to mad DLL"
    )
        file(GLOB _mad_dll RELATIVE "${mad_DLL_DIR}"
      "${mad_DLL_DIR}/mad.dll"
    )
        set(mad_DLL ${_mad_dll}
      CACHE FILEPATH "mad DLL file name"
    )
        file(GLOB _mad_pdb RELATIVE "${mad_DLL_DIR}"
      "${mad_DLL_DIR}/mad.pdb"
    )
        set(mad_PDB ${_mad_pdb}
      CACHE FILEPATH "mad PDB file name"
    )
        mark_as_advanced(mad_DLL_DIR mad_DLL mad_PDB)
    endif()
else()
    set(mad_LIBRARIES)
    set(mad_INCLUDE_DIRS)
    set(mad_DLL_DIR)
    set(mad_DLL)
endif()

mark_as_advanced(mad_LIBRARIES mad_INCLUDE_DIRS)
