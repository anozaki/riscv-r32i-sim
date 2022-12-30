cmake_minimum_required(VERSION 3.13)

# set the project name
project(test C)

enable_language(ASM)

# Thanks to file embeddev artical for this!

include(cmake/toolchain.cmake)

# set ( CMAKE_C_FLAGS "-g -Wall -ffunction-sections")
set ( STACK_SIZE 0xf00 )
set ( TARGET helloworld )

SET(LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/cmake/turing_complete.ld")
SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles   -fno-exceptions  -Xlinker --defsym=__stack_size=${STACK_SIZE} -T ${LINKER_SCRIPT} -Wl,-Map=${TARGET}.map")

add_executable(helloworld "")
add_subdirectory(src)
target_link_libraries(helloworld)

add_custom_command(TARGET ${TARGET} POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -d ${TARGET}.elf > ${TARGET}.disasm
        COMMENT "Invoking: Disassemble")

# "-O ihex" if you want intel hex file
add_custom_command(TARGET ${TARGET} POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary  ${TARGET}.elf  ${TARGET}.bin
        COMMENT "Invoking: Hexdump")

set_target_properties(${TARGET} PROPERTIES ADDITIONAL_CLEAN_FILES
        "${TARGET}.bin;${TARGET}.hex;${TARGET}.map;${TARGET}.disasm")