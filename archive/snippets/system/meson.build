# archive/snippets/system/meson.build

files = [
    'sleep',
    'pagesize',
    'ftok'
]

lst_build_dir = join_paths(meson.current_build_dir(), 'lst')
lst_dir = custom_target(
    '_lst_dir',
    output: 'lst',
    command: ['mkdir', '-p', lst_build_dir],
)

foreach name : files
    asm_file = name + '.asm'

    # --- Assemble (debug) ---
    custom_target(
        name + '_obj_debug',
        input: asm_file,
        output: name + '.debug.o',
        depends: lst_dir,
        command: [nasm] + nasm_common_flags + [
            '-g',
            '-Fdwarf',
            '-l', join_paths(lst_build_dir, name + '.debug.lst'),
            '-o', '@OUTPUT@',
            '@INPUT@',
        ],
        build_by_default: true,
    )

    # --- Assemble (release) ---
    custom_target(
        name + '_obj_release',
        input: asm_file,
        output: name + '.o',
        depends: lst_dir,
        command: [nasm] + nasm_common_flags + [
            '-l', join_paths(lst_build_dir, name + '.lst'),
            '-o', '@OUTPUT@',
            '@INPUT@',
        ],
        build_by_default: true,
    )
endforeach
