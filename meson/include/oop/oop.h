#ifndef OOP_H
#define OOP_H 1

/* ==========================================
 * Project: Assembly-based Object-Oriented Programming (OOP)
 * File: oop.h (Master Include Header)
 * ------------------------------------------
 * This file includes all necessary frontend definitions 
 * (class structure, object layout, and portable interfaces) 
 * and the specific architecture backend.
 * ========================================== */

/* --- 1. Core Structure and Layout --- */
#include "include/oop/class.h"  /* CLASS, FIELD, EXTENDS, ENDCLASS (with padding) */
#include "include/oop/object.h" /* OBJECT.vptr (Offset of the VTable pointer) */
#include "include/oop/vtable.h" /* VTABLE (Vtable definition helper) */

/* --- 2. Portable Interfaces (Frontends) --- */
#include "include/oop/new.h"    /* NEW macro (delegates to NEW_IMPL) */
#include "include/oop/delete.h" /* DELETE macro (delegates to DELETE_IMPL) */
#include "include/oop/call.h"   /* VCALL macro (delegates to VCALL_IMPL) */
#include "include/oop/rtti.h"   /* Runtime Type Information (RTTI) macros (e.g., IS_A, DYNAMIC_CAST) */

/* --- 3. Architecture Backend Aggregator --- */
/* This file must define the *IMPL macros (NEW_IMPL, DELETE_IMPL, VCALL_IMPL) 
 * specific to the target CPU/OS environment (e.g., x86_64/Linux). 
 */
#include "arch/x86_64/include/oop/oop_arch.h"

#endif
