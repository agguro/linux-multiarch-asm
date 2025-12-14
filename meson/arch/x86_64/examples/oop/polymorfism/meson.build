oop_poly_exe = executable('polymorfism',
  sources : [
    'main.S',     # The logic (create objects, loop, call methods)
    'animals.S'   # The vtables and method implementations
  ],
  # We reuse the same include paths to access macros/syscalls
  include_directories : [generic_inc, arch_inc],
  
  # Optional: If you defined security flags like '-Wa,--noexecstack' earlier
  # in a variable (e.g., cc_args), uncomment the line below:
  # c_args : cc_args,
  
  install : false
)

# Test logic for the polymorphism example
if build_machine.cpu_family() != 'x86_64'
    emulator = find_program('qemu-x86_64', required: true)
    test('oop_poly_test', emulator, args: [oop_poly_exe], verbose: true)
else
    test('oop_poly_test', oop_poly_exe, verbose: true)
endif
