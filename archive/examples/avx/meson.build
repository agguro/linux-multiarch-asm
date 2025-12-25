# archive/examples/avx/meson.build

# AVX compilation flags for all subprojects
avx_cpp_args = [
  '-O2',
  '-mavx',
]

avx_link_args = [
  '-z', 'noexecstack',
]

# Make them visible to subdirs
subdir('avx_addArrays')
subdir('avx2_addArrays')
subdir('avx512_addArrays')

