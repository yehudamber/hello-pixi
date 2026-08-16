# Provide a function to enable a sensible set of compiler warnings for a target.
# Usage: enable_cxx_warnings(<target>)
function(enable_cxx_warnings target)
    if(NOT TARGET ${target})
        message(FATAL_ERROR "enable_cxx_warnings: target '${target}' does not exist")
    endif()

    # Apply compiler-specific warning flags per-target using generator expressions.
    # This ensures the flags are attached based on the compiler used for the target.
    target_compile_options(${target} PRIVATE
        # GCC
        $<$<CXX_COMPILER_ID:GNU>:-Wall;-Wextra;-Wpedantic;-Wcast-align;-Wshadow;-Wformat=2;-Wlogical-op;-Wdouble-promotion;-Wconversion;-Werror>
        # Clang
        $<$<CXX_COMPILER_ID:Clang,AppleClang>:-Wall;-Wextra;-Wpedantic;-Wshadow;-Wformat=2;-Wconversion;-Wdouble-promotion;-Wimplicit-fallthrough;-Werror>
        # MSVC
        $<$<CXX_COMPILER_ID:MSVC>:/external:W0;/W4;/w14242;/w14263;/w14265;/w14287;/w14296;/w14545;/w14546;/w14547;/w14549;/w14555;/w14826;/w14905;/w14906;/w14928;/WX>
    )
endfunction()
