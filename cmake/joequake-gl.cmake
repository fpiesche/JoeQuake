file(GLOB JQ_SRC CONFIGURE_DEPENDS
    "trunk/*.c"
    "trunk/*.h"
    "trunk/ghost/*.c"
    "trunk/ghost/*.h")

if (UNIX)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_edge.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_init.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_modech.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_polyse.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_scan.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_sky.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_sprite.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_surf.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_zpoint.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_aclip.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_alias.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_bsp.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_draw.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_edge.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_efrag.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_light.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_local.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_main.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_misc.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_model.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_rast.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_screen.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_shared.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_sky.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_sprite.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_surf.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/r_vars.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_glx.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_wgl.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/unzip.c)
    # Windows-specific source files
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/cd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/conproc.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/conproc.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/in_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/mglwin.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie_avi.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie_avi.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wins.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wins.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wipx.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/snd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/sys_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_win.c)
elseif (WIN32)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/cd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/in_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/snd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_win.c)
    # Unix-specific source files
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_bsd.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_udp.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_udp.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/sys_linux.c)
endif()

add_executable(joequake-gl ${JQ_SRC})

target_compile_definitions(joequake-gl
    PRIVATE GLQUAKE SDL2 USE_CODEC_VORBIS USE_CODEC_MP3
)

set_target_properties(joequake-gl PROPERTIES
 RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
 OUTPUT_NAME "${OUTPUT_NAME}"
)

if(WIN32 OR APPLE)
    target_link_libraries(joequake-gl PRIVATE
        JPEG::JPEG
        mad::mad
        unofficial::minizip::minizip
    )
else()
    target_link_libraries(joequake-gl PRIVATE
        jpeg
        mad
        minizip
    )
endif()

if(UNIX)
    target_link_libraries(joequake-gl PRIVATE
        SDL2::SDL2
        SDL2::SDL2main
    )
endif()

target_link_libraries(joequake-gl PRIVATE
    GL
    m
    ogg
    PNG::PNG
    ${CMAKE_DL_LIBS}
    vorbis
    vorbisfile
)
