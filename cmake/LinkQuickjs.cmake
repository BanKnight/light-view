include(FetchContent)

macro(LinkQuickjs TARGET ACCESS)
    FetchContent_Declare(
        quickjs
        GIT_REPOSITORY https://github.com/BanKnight/quickjs-cmake
    )

    FetchContent_GetProperties(quickjs)

    if (NOT quickjs_POPULATED)
        FetchContent_Populate(quickjs)

        add_subdirectory(${quickjs_SOURCE_DIR} ${quickjs_BINARY_DIR} EXCLUDE_FROM_ALL)

    endif()

    target_include_directories(${TARGET} ${ACCESS} ${quickjs_SOURCE_DIR})

    target_link_libraries(${TARGET} ${ACCESS} quickjs)

    add_dependencies(${TARGET} quickjs)

endmacro()