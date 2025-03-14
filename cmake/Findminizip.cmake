################################################################################
#
# MIT License
#
# Copyright (c) 2023 Advanced Micro Devices, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
################################################################################

# Try to find the minizip library
#
# If successful, the following variables will be defined:
# minizip_INCLUDE_DIR
# minizip_LIBRARY
# minizip_STATIC_LIBRARY
# minizip_FOUND

if(MSVC)
    set(minizip_STATIC_LIBRARY_SUFFIX "_static\\${CMAKE_STATIC_LIBRARY_SUFFIX}$")
else()
    set(minizip_STATIC_LIBRARY_SUFFIX "\\${CMAKE_STATIC_LIBRARY_SUFFIX}$")
endif()

find_path(minizip_INCLUDE_DIR NAMES zip.h)
find_library(minizip_LIBRARY NAMES minizip minizip_static)
find_library(minizip_STATIC_LIBRARY NAMES
  minizip_static
  "${CMAKE_STATIC_LIBRARY_PREFIX}minizip${CMAKE_STATIC_LIBRARY_SUFFIX}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    minizip DEFAULT_MSG
    minizip_LIBRARY minizip_INCLUDE_DIR
)

if(minizip_FOUND)
    if(minizip_LIBRARY MATCHES "${minizip_STATIC_LIBRARY_SUFFIX}$")
        set(minizip_STATIC_LIBRARY "${minizip_LIBRARY}")
    elseif (NOT TARGET minizip::libminizip_shared)
        add_library(minizip::libminizip_shared SHARED IMPORTED)
        if(MSVC)
            # IMPORTED_LOCATION is the path to the DLL and IMPORTED_IMPLIB is the "library".
            get_filename_component(minizip_DIRNAME "${minizip_LIBRARY}" DIRECTORY)
            string(REGEX REPLACE "${CMAKE_INSTALL_LIBDIR}$" "${CMAKE_INSTALL_BINDIR}" minizip_DIRNAME "${minizip_DIRNAME}")
            get_filename_component(minizip_BASENAME "${minizip_LIBRARY}" NAME)
            string(REGEX REPLACE "\\${CMAKE_LINK_LIBRARY_SUFFIX}$" "${CMAKE_SHARED_LIBRARY_SUFFIX}" minizip_BASENAME "${minizip_BASENAME}")
            set_target_properties(minizip::libminizip_shared PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${minizip_INCLUDE_DIR}"
          IMPORTED_LOCATION "${minizip_DIRNAME}/${minizip_BASENAME}"
          IMPORTED_IMPLIB "${minizip_LIBRARY}")
            unset(minizip_DIRNAME)
            unset(minizip_BASENAME)
        else()
            set_target_properties(minizip::libminizip_shared PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${minizip_INCLUDE_DIR}"
          IMPORTED_LOCATION "${minizip_LIBRARY}")
        endif()
    endif()
    if(minizip_STATIC_LIBRARY MATCHES "${minizip_STATIC_LIBRARY_SUFFIX}$" AND
     NOT TARGET minizip::libminizip_static)
        add_library(minizip::libminizip_static STATIC IMPORTED)
        set_target_properties(minizip::libminizip_static PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${minizip_INCLUDE_DIR}"
        IMPORTED_LOCATION "${minizip_STATIC_LIBRARY}")
    endif()
endif()

unset(minizip_STATIC_LIBRARY_SUFFIX)

mark_as_advanced(minizip_INCLUDE_DIR minizip_LIBRARY minizip_STATIC_LIBRARY)
