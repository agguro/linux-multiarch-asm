ORG 0
BITS 16

BootCat:
     DD   1
     DB   "Agguro Bootable CD        "
     DB   0x55, 0xAA                              ; must be last
TIMES 2048-($-BootCat)   DB 0
