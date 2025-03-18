if (WIN32)
    foreach(file ${JQ_GASM})
        execute_process(COMMAND ${CMAKE_C_COMPILER} /nologo /EP ${file}
            OUTPUT_FILE ${file}.spp)
        execute_process(COMMAND build/bin/gas2masm.exe
           INPUT_FILE ${file}.spp
           OUTPUT_FILE ${file}.asm)
        execute_process(COMMAND ml.exe /nologo /c /Cp /coff /Fo${file}.obj /Zm /Zi ${file}.asm)
    endforeach()
endif()
