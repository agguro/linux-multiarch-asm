#ifndef OOP_MACROS_H
#define OOP_MACROS_H 1

# ---------------------------------------------------------
# STAP 1: Haal de architectuur-specifieke kennis op
# Dit leest 'aggregator.h' -> die leest 'arch_defs.h'
# Nu weet de assembler: PTR_SIZE = 8
# ---------------------------------------------------------
#include <oop/aggregator.h>

# ---------------------------------------------------------
# STAP 2: Nu kunnen we de generieke bestanden inladen
# Omdat PTR_SIZE nu bekend is, zal class.h niet meer crashen.
# ---------------------------------------------------------
#include "class.h"      
#include "vtable.h"
#include "new.h"
#include "delete.h"
#include "call.h"
#include "rtti.h"
#include "object.h"

#endif
