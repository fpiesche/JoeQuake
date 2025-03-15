file(GLOB JQ_SRC CONFIGURE_DEPENDS
    "trunk/*.c"
    "trunk/*.h"
    "trunk/ghost/*.c"
    "trunk/ghost/*.h")

#     trunk/anorm_dots.h
#     trunk/bgmusic.c
#     trunk/bgmusic.h
#     trunk/bspfile.h
#     trunk/cdaudio.h
#     trunk/cd_null.c
#     trunk/chase.c
#     trunk/client.h
#     trunk/cl_demo.c
#     trunk/cl_demoui.c
#     trunk/cl_dzip.c
#     trunk/cl_input.c
#     trunk/cl_main.c
#     trunk/cl_parse.c
#     trunk/cl_slist.c
#     trunk/cl_slist.h
#     trunk/cl_tent.c
#     trunk/cmd.c
#     trunk/cmd.h
#     trunk/common.c
#     trunk/common.h
#     trunk/console.c
#     trunk/console.h
#     trunk/crc.c
#     trunk/crc.h
#     trunk/cvar.c
#     trunk/cvar.h
#     trunk/draw.h
#     trunk/glquake.h
#     trunk/gl_decals.c
#     trunk/gl_draw.c
#     trunk/gl_fog.c
#     trunk/gl_mesh.c
#     trunk/gl_model.c
#     trunk/gl_model.h
#     trunk/gl_refrag.c
#     trunk/gl_rlight.c
#     trunk/gl_rmain.c
#     trunk/gl_rmisc.c
#     trunk/gl_rpart.c
#     trunk/gl_rsurf.c
#     trunk/gl_screen.c
#     trunk/gl_warp.c
#     trunk/host.c
#     trunk/host_cmd.c
#     trunk/image.c
#     trunk/image.h
#     trunk/in_sdl.c
#     trunk/input.h
#     trunk/iplog.c
#     trunk/iplog.h
#     trunk/keys.c
#     trunk/keys.h
#     trunk/mathlib.c
#     trunk/mathlib.h
#     trunk/menu.c
#     trunk/menu.h
#     trunk/modelgen.h
#     trunk/nehahra.c
#     trunk/nehahra.h
#     trunk/net.h
#     trunk/net_bsd.c
#     trunk/net_dgrm.c
#     trunk/net_dgrm.h
#     trunk/net_loop.c
#     trunk/net_loop.h
#     trunk/net_main.c
#     trunk/net_udp.c
#     trunk/net_udp.h
#     trunk/net_vcr.c
#     trunk/net_vcr.h
#     trunk/pr_cmds.c
#     trunk/pr_comp.h
#     trunk/pr_edict.c
#     trunk/pr_exec.c
#     trunk/progdefs.h
#     trunk/progs.h
#     trunk/protocol.h
#     trunk/quakedef.h
#     trunk/quake.ico
#     trunk/render.h
#     trunk/r_part.c
#     trunk/sbar.c
#     trunk/sbar.h
#     trunk/screen.h
#     trunk/security.c
#     trunk/security.h
#     trunk/server.h
#     trunk/snd_codec.c
#     trunk/snd_codec.h
#     trunk/snd_codeci.h
#     trunk/snd_dma.c
#     trunk/snd_sdl.c
#     trunk/snd_mem.c
#     trunk/snd_mix.c
#     trunk/snd_mp3.c
#     trunk/snd_mp3.h
#     trunk/snd_mp3tag.c
#     trunk/snd_vorbis.c
#     trunk/snd_vorbis.h
#     trunk/sound.h
#     trunk/spritegn.h
#     trunk/sv_main.c
#     trunk/sv_move.c
#     trunk/sv_phys.c
#     trunk/sv_user.c
#     trunk/sys.h
#     trunk/sys_linux.c
#     trunk/version.c
#     trunk/version.h
#     trunk/vid.h
#     trunk/vid_common_gl.c
#     trunk/vid_sdl.c
#     trunk/view.c
#     trunk/view.h
#     trunk/wad.c
#     trunk/wad.h
#     trunk/winquake.h
#     trunk/world.c
#     trunk/world.h
#     trunk/zone.c
#     trunk/zone.h
#     trunk/demoparse.c
#     trunk/demoparse.h
#     trunk/demoseekparse.c
#     trunk/democam.c
#     trunk/ghost/ghost.c
#     trunk/ghost/ghost.h
#     trunk/ghost/ghost_private.h
#     trunk/ghost/ghostparse.c
#     trunk/ghost/demosummary.c
#     trunk/ghost/demosummary.h
# )

if (UNIX)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/conproc.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_edge.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_init.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_modech.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_polyse.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_scan.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_sky.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_sprite.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_surf.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/d_zpoint.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie_avi.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/movie_avi.h)
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
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_glx.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_wgl.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/unzip.c)
    # Windows-specific source files
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/cd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/in_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/mglwin.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wins.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wins.h)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/net_wipx.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/snd_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/sys_win.c)
    list(REMOVE_ITEM JQ_SRC ${CMAKE_CURRENT_SOURCE_DIR}/trunk/vid_win.c)
elseif (WIN32)
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

target_link_libraries(joequake-gl PRIVATE
    minizip
    png
    jpeg
    GL
    m
    dl
    vorbisfile
    vorbis
    ogg
    mad
    SDL2::SDL2
    SDL2::SDL2main
)
