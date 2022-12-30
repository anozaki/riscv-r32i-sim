add_subdirectory(runtime)

target_include_directories(helloworld
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc)

target_sources(helloworld
  PRIVATE
    helloworld.c
    digital.S
)