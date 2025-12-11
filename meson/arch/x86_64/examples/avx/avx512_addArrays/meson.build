# arch/x86_64/examples/avx/avx512_addArrays/meson.build

# 1. Compiler Flags
# We gebruiken hier GEEN -nostdlib omdat je <iostream> gebruikt.
cpp_args = [
  '-g',               # Debug info (nodig voor SDE/GDB)
  '-O2',
  '-std=c++17',       # C++17 standaard
  '-Wall',
  '-Wextra',
  '-no-pie',          # Zorgt voor eenvoudigere adressering
  '-fno-asynchronous-unwind-tables' # Houdt de assembly output schoner
]

linker_flags = [
  '-no-pie',          # Geen Position Independent Executable (makkelijker debuggen)
]

# 2. Source Files
# Hier combineren we je C++ driver met je Assembly routine
sources = [
  'main.cpp',
  'avx512_addArrays.s'
]

# 3. Executable Bouwen
# We slaan het resultaat op in 'exe_avx512'
exe_avx512 = executable(
  'avx512_addArrays',
  sources,
  cpp_args : cpp_args,
  c_args: avx512_flags,
  link_args : linker_flags,
  install : false
)

# 4. Test configuratie (Met Intel SDE)
# We zoeken de SDE tool specifiek voor dit project
sde = find_program('sde64', '/opt/sde/sde64', required: false)

if sde.found()
    # We vertellen SDE om de executable te draaien.
    # De dubbele streep '--' is belangrijk: argumenten erna zijn voor jouw programma.
    test('avx512_addArrays', 
         sde, 
         args: ['-skx', '--', exe_avx512],
         verbose: true
    )
else
    message('⚠️  Intel SDE niet gevonden. AVX512 test wordt overgeslagen.')
endif
