-- add target
target("pdcurses")

    -- enable this target
    if not has_config("pdcurses") then
        set_default(false)
    end

    -- make as a static library
    set_kind("static")

    -- add includes directory
    add_includedirs("pdcurses", {public = true})

    -- add the common source files
    add_files("pdcurses/pdcurses/*.c", "pdcurses/wincon/*.c")

    -- add definitions
    add_defines("PDC_WIDE")

    -- set languages
    set_languages("c89")

    -- unset warnings
    set_warnings("none")

    -- msvc 2026 reports C4723 for slk.c during link-time code generation,
    -- where the unset warnings do not apply and the warning fails the link
    if is_plat("windows") and is_mode("release") then
        set_optimize("fastest")
    end
