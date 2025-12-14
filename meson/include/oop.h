#ifndef OOP_H
#define OOP_H 1

/* =========================================================
 * Project: Assembly-based Object-Oriented Programming (OOP)
 * File: oop.h (Master Include Header in the root 'include' folder)
 * ---------------------------------------------------------
 * This is the ONLY header users should include (e.g., #include <oop.h>).
 * It aggregates all architecture-specific definitions and generic logic.
 * ========================================================= */

/* ---------------------------------------------------------
 * STEP 1: Architecture Aggregator (Specific Implementations)
 * ---------------------------------------------------------
 * This crucial file must define:
 * 1. PTR_SIZE (e.g., 8 for x86_64, 4 for MIPS).
 * 2. The *IMPL macros (NEW_IMPL, DELETE_IMPL, VCALL_IMPL, etc.).
 *
 * NOTE: We assume 'aggregator.h' internally includes the specific 
 * architecture file, e.g., arch/x86_64/include/oop/oop_arch.h
 */
#include <oop/aggregator.h>

/* ---------------------------------------------------------
 * STEP 2: Generic OOP Logic (Frontend)
 * ---------------------------------------------------------
 * These files define the portable macro interfaces and structure offsets.
 * They rely on PTR_SIZE being set by Step 1.
 */
#include "oop/object.h"  /* OBJECT.vptr */
#include "oop/class.h"   /* CLASS, FIELD, ENDCLASS */
#include "oop/vtable.h"  /* VTABLE, VFUNC */
#include "oop/new.h"     /* NEW (calls NEW_IMPL) */
#include "oop/delete.h"  /* DELETE (calls DELETE_IMPL) */
#include "oop/vcall.h"   /* VCALL (calls VCALL_IMPL) */
#include "oop/rtti.h"    /* RTTI related macros (SET_TYPE, TYPEINFO, etc.) */

#endif
