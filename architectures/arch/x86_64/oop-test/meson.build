# --- Compiler Instellingen ---
# Zorg ervoor dat de C-compiler (voor .s bestanden) en C++-compiler beschikbaar zijn
c_compiler = meson.get_compiler('c')
cpp_compiler = meson.get_compiler('cpp')

# Algemene Vlaggen
common_flags = [
  '-Wall',
  '-Wextra',
  '-fPIC',       # Position Independent Code (PIE) vlag
  '-no-pie',     # Sommige linkers vereisen -no-pie bij het linken van C en Assembly 
  '-O3'
]

# Assembly Vlaggen
# We gebruiken de C-compiler (cc) om de .s bestanden te assembleren.
# -Wa,--noexecstack is goed voor beveiliging
asm_flags = common_flags + ['-Wa,--noexecstack']

# C++ Vlaggen (voor main.cpp)
cpp_flags = common_flags + ['-std=c++17']


# --- Bronbestanden ---
# De universele object klasse
object_source = files('object.s')

# Het C++ testprogramma
main_source = files('main.cpp')


# --- Executable Targets ---
# Definieer het uiteindelijke uitvoerbare bestand
executable('oop_test',
  object_source,
  main_source,
  
  # Stel de vlaggen in per taal (Assembly via C, C++ via C++)
  c_args: asm_flags,
  cpp_args: cpp_flags,
  
  # Linkt automatisch met libc en libstdc++
  link_with: [], 
  install: false
)

# Optioneel: Print instructies na configuratie
message('Build is geconfigureerd. Voer "ninja -C builddir" uit om te compileren.')
