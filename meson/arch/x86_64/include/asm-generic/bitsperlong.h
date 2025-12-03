/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef __ASM_GENERIC_BITS_PER_LONG
#define __ASM_GENERIC_BITS_PER_LONG

/*
 * There seems to be no way of detecting this automatically from user
 * space, so 64 bit architectures should override this in their
 * bitsperlong.h.
 */
 
#ifndef __BITS_PER_LONG
#define __BITS_PER_LONG 64
#endif

#endif /* __ASM_GENERIC_BITS_PER_LONG */
