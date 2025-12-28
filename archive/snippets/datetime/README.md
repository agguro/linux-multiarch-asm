# Date Gadgets: Branch-Free Logic (v1.0)

A suite of high-performance assembly routines for date and calendar calculations, optimized to eliminate conditional jumps.

## Authors
- **agguro**: Logic & Implementation

## Key Features
- **Branch-Free**: Most routines (Trimester, Weekend, DaysInMonth) use bit-manipulation rather than `CMP/JMP`.
- **Hacker's Delight Techniques**: Uses advanced bit-arithmetic for non-linear calendar sequences.
- **Minimal Footprint**: Routines utilize single registers where possible to keep the CPU cache and registers clean.

## Routine Reference
| Routine | Input | Output | Description |
| :--- | :--- | :--- | :--- |
| `semester` | Month (1-12) | 1-2 | Half-year period |
| `quadrimester` | Month (1-12) | 1-3 | 4-month period |
| `trimester` | Month (1-12) | 1-4 | 3-month period |
| `daysinmonth` | Month (1-12) | 28-31 | Days in month (Feb=28) |
| `weekend` | Day (1-7) | 0-1 | 1 if Sat/Sun, else 0 |
| `leapyear` | Year (Hex) | 0-1 | 1 if Leap Year, else 0 |
| `shiftedmonth` | Month (1-12) | Shifted ID | Easter Sunday calculation |
