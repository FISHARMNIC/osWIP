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
// also from fatgen103.pdf
// Note, the bpb is located at the first sector of the VOLUME, not the disk. -> the first sector formatted with FAT
#define SIZE_BYTES(bits) bits * 4
typedef struct
{
    char BS_jmpBoot[3];
    char BS_OEMName[8];
    uint16_t BPB_BytsPerSec; // should be: 512
    uint8_t BPB_SecPerClus;  // should be: 1
    uint16_t BPB_RsvdSecCnt; // should be: 32
    uint8_t BPB_NumFATs;     // should be: 2
    uint16_t BPB_RootEntCnt; // should be: 0
    uint16_t BPB_TotSec16;   // should be: 0 (uses TotSec32 instead)
    uint8_t BPB_Media;
    uint16_t BPB_FATSz16;
    uint16_t BPB_SecPerTrk;
    uint16_t BPB_NumHeads;
    uint32_t BPB_HiddSec;
    uint32_t BPB_TotSec32;
    uint32_t BPB_FATSz32;
    uint16_t BPB_ExtFlags;
    uint16_t BPB_FSVer;
    uint32_t BPB_RootClus;
    uint16_t BPB_FSInfo;
    uint16_t BPB_BkBootSec;
    char BPB_Reserved[12];
    uint8_t BS_DrvNum;
    uint8_t BS_Reserved1;
    uint8_t BS_BootSig;
    uint32_t BS_VolID;
    char BS_VolLab[11];
    char BS_FilSysType[8];
} __attribute__((packed)) bpb_t;


#include "ata.c"
#include "mbr.c"