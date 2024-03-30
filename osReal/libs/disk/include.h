// note: all of the FAT data names are from fatgen103.pdf

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
    for (int i = 0; i < s; i++) \
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
} __attribute__((packed)) bpb_raw_t;

typedef struct
{
    uint32_t rootDirSectors;     // number of sectors occupied by root
    uint32_t total_sectors;      // sectors per fat
    uint32_t fat_size;
    uint32_t firstFatSector;
    uint32_t firstDataSector;    // first cluster 2 sector ON VOLUME. To get global, add BPB_VOLUME_OFFSET
    uint32_t dataSectorCount;    // sector count in data region
    uint32_t clusterCount;       // number of clusters
    uint32_t rootSec;            // root directory
} FAT_info_t;

typedef struct
{
    uint32_t secNum;
    uint32_t entryOffset;
} FAT_cluster_info_t;

typedef struct
{
    char fileName[11];
    uint8_t attributes;
    uint8_t _reserved;
    uint8_t creationTimeSec;
    uint16_t creationTime;
    uint16_t creationDate;
    uint16_t lastAccessedDate;
    uint16_t clusNumHigh;
    uint16_t lastModifiedTime;
    uint16_t lastModifiedDate;
    uint16_t clusNumLow;
    uint32_t fileSizeBytes;
} FAT_entry_t;

typedef struct
{
    uint8_t order;
    char firstChars[10];
    uint8_t _attribute;
    uint8_t longEntryType;
    uint8_t checkSum;
    char secChars[12];
    uint16_t _reserved;
    char lastChars[4];
} FAT_longFileName_t;

typedef struct
{
    char* name;
    uint32_t size;
    uint32_t isDir;
    FAT_entry_t info;
} FAT_entryInfo;

#define BPB_VOLUME_OFFSET 2048

#include "ata.c"
#include "bpb.c"
#include "fat.c"
#include "files.c"