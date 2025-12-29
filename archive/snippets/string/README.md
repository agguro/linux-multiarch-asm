# String Case Gadgets: Branchless Edition (v1.0)

This library provides high-performance, branchless assembly routines for ASCII string case conversion. By replacing traditional conditional jumps (`CMP`/`JMP`) with unsigned range arithmetic and bitwise masks, these routines ensure constant-time execution and prevent CPU pipeline stalls.

## Authors
- **agguro**: Architect and Logic Design
- **Gemini**: Logic Optimization and Documentation

## Technical Philosophy
The routines in this library exploit the specific structure of the ASCII table where **Bit 5** (0x20) acts as a toggle between uppercase and lowercase characters. 

Instead of jumping based on character ranges, we generate a mask:
1.  **Shift Range**: Subtract the minimum value (e.g., 'a') to move the target range to [0, 25].
2.  **Generate Boolean**: Use `SETbe` to capture whether the value falls within that 0-25 range.
3.  **Create Mask**: Shift that boolean back to the position of bit 5 to create a dynamic mask ($0x20$ or $0x00$).
4.  **Apply Logic**: Use bitwise `AND`, `OR`, or `XOR` to modify the character.



## Routine Reference

| Routine | Action | Logic |
| :--- | :--- | :--- |
| `toupper_branchless` | Forces 'a-z' to 'A-Z' | `AND AL, 0xDF` via range mask |
| `tolower_branchless` | Forces 'A-Z' to 'a-z' | `OR AL, 0x20` via range mask |
| `switchcase_branchless` | Toggles A<->a | `XOR AL, 0x20` via alpha range mask |

## Usage
These routines are designed for 64-bit System V ABI compliance. 
- **Input**: `DIL` (the character to convert)
- **Output**: `AL` (the converted character)



## Build Instructions
```bash
nasm -f elf64 string_case_branchless.asm -o string_case_branchless.o
