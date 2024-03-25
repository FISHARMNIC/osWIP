#pragma once
#include "../ports/include.h"

#define STATUS_BSY 0x80
#define STATUS_RDY 0x40
#define STATUS_DRQ 0x08
#define STATUS_DF 0x20
#define STATUS_ERR 0x01

#define ATA_WAIT_RDY() while (!(inb(0x1F7) & STATUS_RDY))
#define ATA_WAIT_BSY() while (inb(0x1F7) & STATUS_BSY)
#define ATA_WAIT_DRQ() while (!(inb(0x1F7) & STATUS_DRQ))

#define NOP_DELAY(s)            \
    for (int n = 0; n < s; n++) \
    asm("nop")

// offset table https://wiki.osdev.org/FAT#FAT_32 -> imp. details, BPB
#define SIZE_BYTES(bits) bits * 4
typedef struct
{
    int jmp_ptr_offset : SIZE_BYTES(3);
    int oem_identifier : SIZE_BYTES(8);
    
    char bytes_per_sector[2];
    char sectors_per_cluster[1];
    char num_reserved_sectors
} mbr_t;
#define MBR_JMP_PRT 0
#define MBR_OEM 3
#define MBR_BYTES_PER_SECTOR 11
#define MBR_SECTORS_PER_CLUSTER 13
#define MBR_RESERVED_SECTORS 14

#include "ata.c"
#include "mbr.c"