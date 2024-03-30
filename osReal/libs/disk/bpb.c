//https://wiki.osdev.org/FAT#FAT_32 -> imp. details, BPB
// followed tutorial in fatgen103
static uint8_t bpb_buffer[512];
static bpb_raw_t bpb_info; 
static FAT_info_t FAT_info;

void bpb_init()
{

    // Volume sector 0, located at 1MB (in fat_32)
    ata_read_sector_u8(bpb_buffer, BPB_VOLUME_OFFSET);
    bpb_info = *((bpb_raw_t* )(bpb_buffer));
    
    if(bpb_info.BPB_FATSz16 != 0)
    {
        tty_putString("ERROR - ONLY FAT32 ALLOWED");
        asm volatile("cli; hlt;");
    }

    FAT_info.total_sectors = bpb_info.BPB_TotSec32;
    FAT_info.fat_size = bpb_info.BPB_FATSz32;

    FAT_info.rootDirSectors = ((bpb_info.BPB_RootEntCnt * 32) + (bpb_info.BPB_BytsPerSec - 1)) / bpb_info.BPB_BytsPerSec;
    FAT_info.firstDataSector = bpb_info.BPB_RsvdSecCnt + (bpb_info.BPB_NumFATs * FAT_info.fat_size) + FAT_info.rootDirSectors;
    FAT_info.firstFatSector = bpb_info.BPB_RsvdSecCnt;
    FAT_info.dataSectorCount = FAT_info.total_sectors - (bpb_info.BPB_RsvdSecCnt + (bpb_info.BPB_NumFATs * FAT_info.fat_size) + FAT_info.rootDirSectors);
    FAT_info.clusterCount = FAT_info.dataSectorCount / bpb_info.BPB_SecPerClus;
    FAT_info.rootSec = FAT_info.firstDataSector - FAT_info.rootDirSectors;
}

/*
    tty_putString_nl(bpb_info.BS_FilSysType);
    tty_putInt_nl(bpb_info.BPB_NumFATs);
    tty_putInt_nl(bpb_info.BPB_BytsPerSec);
    tty_putInt_nl(FAT_info.fat_size); 
    tty_putInt_nl(FAT_info.firstFatSector);
    tty_putInt_nl(BPB_VOLUME_OFFSET);
*/