# root/arch/x86_64/examples/avx

# Compiler ophalen
cc = meson.get_compiler('c')

# AVX vlaggen voor assemblage
avx_flags = ['-mavx']
avx2_flags = ['-mavx2', '-mfma']
avx512_flags = ['-mavx512f', '-mavx512dq']

subdir('avx2_addArrays')
subdir('avx512_addArrays')
subdir('avx_addArrays')
