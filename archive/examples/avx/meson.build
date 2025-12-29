# archive/examples/avx/meson.build
#
# AVX subtree policy:
# - These examples are C/C++ programs with NASM helpers
# - They are linked via the compiler driver
# - Instruction-set selection is defined here
# - Actual build logic lives in leaf directories

# Common optimization level for AVX examples
avx_common_cpp_args = [
  '-O2',
]

# Instruction-set–specific flags
avx_cpp_args      = avx_common_cpp_args + ['-mavx']
avx2_cpp_args     = avx_common_cpp_args + ['-mavx2']
avx512_cpp_args   = avx_common_cpp_args + ['-mavx512f']

# Descend into examples
subdir('avx_addArrays')
subdir('avx2_addArrays')
subdir('avx512_addArrays')

