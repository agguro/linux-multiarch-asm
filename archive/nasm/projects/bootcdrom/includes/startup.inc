%ifndef _ASM_BOOTCD_INC_
     %define   _ASM_BOOTCD_INC_ 1

     %define   KERNELSTARTCS   0x0070   ; we load the kernel at 0070:0000 the I/O drivers from IO.SYS and IBMBIO.COM
     %define   KERNELSTARTIP   0x0000   ; this gives us 0070:0000 - 07C0:0000 memory to use for kernel.bin
     %define   SHELLCS           0x3000
     %define   SHELLIP           0x0000
     %define   SHELLSS           0x7000
     %define   SHELLSP           0xFFFE
     
STRUC SPECIFICATION_PACKET_STRUC
     .packed_size:                 resb      1
     .boot_media_type:             resb      1
     .drive_number:                resb      1
     .controller_index:            resb      1
     .logical_block_address:       resd      1
     .device_specification:        resw      1
     .buffer_segment:              resw      1
     .load_segment:                resw      1
     .virtual_sectors:             resw      1
     .cylinder_count:              resb      1
     .sector_count:                resb      1
     .head_count:                  resb      1
ENDSTRUC

%macro SPECIFICATION_PACKET 1
     %1:  ISTRUC SPECIFICATION_PACKET_STRUC
          at   SPECIFICATION_PACKET_STRUC.packed_size,                 db        0x13
          at   SPECIFICATION_PACKET_STRUC.boot_media_type,             db        0
          at   SPECIFICATION_PACKET_STRUC.drive_number,                db        0
          at   SPECIFICATION_PACKET_STRUC.controller_index,            db        0
          at   SPECIFICATION_PACKET_STRUC.logical_block_address,       dd        0
          at   SPECIFICATION_PACKET_STRUC.device_specification,        dw        0
          at   SPECIFICATION_PACKET_STRUC.buffer_segment,              dw        0
          at   SPECIFICATION_PACKET_STRUC.load_segment,                dw        0
          at   SPECIFICATION_PACKET_STRUC.virtual_sectors,             dw        0
          at   SPECIFICATION_PACKET_STRUC.cylinder_count,              db        0
          at   SPECIFICATION_PACKET_STRUC.sector_count,                db        0
          at   SPECIFICATION_PACKET_STRUC.head_count,                  db        0
     IEND
     %define %1.packed_size                 %1+SPECIFICATION_PACKET_STRUC.packed_size
     %define %1.boot_media_type             %1+SPECIFICATION_PACKET_STRUC.boot_media_type
     %define %1.drive_number                %1+SPECIFICATION_PACKET_STRUC.drive_number
     %define %1.controller_index            %1+SPECIFICATION_PACKET_STRUC.controller_index
     %define %1.logical_block_address       %1+SPECIFICATION_PACKET_STRUC.logical_block_address
     %define %1.device_specification        %1+SPECIFICATION_PACKET_STRUC.device_specification
     %define %1.buffer_segment              %1+SPECIFICATION_PACKET_STRUC.buffer_segment
     %define %1.load_segment                %1+SPECIFICATION_PACKET_STRUC.load_segment
     %define %1.virtual_sectors             %1+SPECIFICATION_PACKET_STRUC.virtual_sectors
     %define %1.cylinder_count              %1+SPECIFICATION_PACKET_STRUC.cylinder_count
     %define %1.sector_count                %1+SPECIFICATION_PACKET_STRUC.sector_count
     %define %1.head_count                  %1+SPECIFICATION_PACKET_STRUC.head_count
%endmacro

STRUC DISK_ADDRESS_PACKET_STRUC
     .size:                        resb      1
     .reserved:                    resb      1
     .sectors_to_read:             resw      1
     .offset:                      resw      1
     .segment:                     resw      1
     .start_absolute_sector:       resd      1
     .transfer_buffer_address:     resd      1
ENDSTRUC

%macro DISK_ADDRESS_PACKET 3
     %1:  ISTRUC DISK_ADDRESS_PACKET_STRUC
          at   DISK_ADDRESS_PACKET_STRUC.size,                        db        16
          at   DISK_ADDRESS_PACKET_STRUC.reserved,                    db        0
          at   DISK_ADDRESS_PACKET_STRUC.sectors_to_read,             dw        1
          at   DISK_ADDRESS_PACKET_STRUC.offset,                      dw        %3
          at   DISK_ADDRESS_PACKET_STRUC.segment,                     dw        %2
          at   DISK_ADDRESS_PACKET_STRUC.start_absolute_sector,       dd        16
          at   DISK_ADDRESS_PACKET_STRUC.transfer_buffer_address,     dd        0
     IEND
     %define %1.size                         %1+DISK_ADDRESS_PACKET_STRUC.size
     %define %1.sectors_to_read              %1+DISK_ADDRESS_PACKET_STRUC.sectors_to_read
     %define %1.offset                       %1+DISK_ADDRESS_PACKET_STRUC.offset
     %define %1.segment                      %1+DISK_ADDRESS_PACKET_STRUC.segment
     %define %1.start_absolute_sector        %1+DISK_ADDRESS_PACKET_STRUC.start_absolute_sector
     %define %1.transfer_buffer_address      %1+DISK_ADDRESS_PACKET_STRUC.transfer_buffer_address
%endmacro

%endif
