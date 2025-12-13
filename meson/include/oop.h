#ifndef OOP_H
#define OOP_H 1

# ---------------------------------------------------------
# STAP 1: Architecture Aggregator
# Haalt PTR_SIZE en specifieke implementaties op.
# ---------------------------------------------------------
#include <oop/aggregator.h>

# ---------------------------------------------------------
# STAP 2: Generic OOP Logic
# Nu PTR_SIZE bekend is, laden we de abstracte definities.
# Let op de 'oop/' prefix, want we zitten nu in de root include map.
# ---------------------------------------------------------
#include "oop/class.h"
#include "oop/vtable.h"
#include "oop/new.h"
#include "oop/delete.h"
#include "oop/call.h"
#include "oop/rtti.h"
#include "oop/object.h"

#endif
