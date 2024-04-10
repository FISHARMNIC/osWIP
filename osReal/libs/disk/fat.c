uint32_t FAT_first_sector_of_cluster(uint32_t cluster) // This is RELATIVE. Must add BPB_VOLUME_OFFSET
{
    return ((cluster - 2) * bpb_info.BPB_SecPerClus) + FAT_info.firstDataSector;
}

static inline uint32_t FAT_clusterToGlobalSector(uint32_t cluster)
{
    return FAT_first_sector_of_cluster(cluster + BPB_VOLUME_OFFSET);
}

static inline void FAT_readFirstSectorOfCluster(uint8_t fsectBuff[512], uint32_t cluster)
{
    ata_read_sector_u8(fsectBuff, FAT_clusterToGlobalSector(cluster));
}

void FAT_get_entry_from_cluster(FAT_cluster_info_t* data, uint32_t cluster)
{
    uint32_t offset = cluster * 4;
    data->secNum = bpb_info.BPB_RsvdSecCnt + (offset / bpb_info.BPB_BytsPerSec); 
    data->entryOffset = offset % bpb_info.BPB_BytsPerSec; 
    // read form "secNum"
}

uint32_t FAT_get_cluster_num(FAT_entry_t* data)
{
    return data->clusNumLow | ((uint32_t)(data->clusNumHigh) << 16);
}

FAT_entryInfo* FAT_readEntry(uint8_t* fsectBuff)
{
    static char outputName16[64];
    static char outputName8[64];

    FAT_entry_t* file;
    
    if(fsectBuff[0] == 0) 
    {
        tty_putString_nl("END");
        return 0;
    }
    if(fsectBuff[0] == 0xE5) {
        tty_putString_nl("UNUSED");
        return 0; // shouldnt stop, just unsused. Fixed later
    } else {

        FAT_entryInfo* returnSt = (FAT_entryInfo*) malloc(sizeof(FAT_entryInfo));

        if(fsectBuff[11] == 0x0F) { // long file name entry
            //tty_putString_nl("LONG FILE NAME");

            uint32_t fnOffset = 0;
            uint32_t bOff = 0;
            FAT_longFileName_t* fileName;
            
            jmpback:
            fileName = (FAT_longFileName_t*) fsectBuff + fnOffset;

            memcpy(outputName16 + bOff,      fileName->firstChars, 5 * 2); // LFN are 16bits, so 5 chars * 2
            memcpy(outputName16 + 10 + bOff, fileName->secChars,   6 * 2);
            memcpy(outputName16 + 22 + bOff, fileName->lastChars,  2 * 2);

            if(!(fileName->order & 0x40)) { // multiple long file names can be chained. Too lazy. 
                tty_putString_nl("MULTIPLE LFN NOT IMPLEMENTED");
                fnOffset += sizeof(FAT_longFileName_t);
                bOff += 22;
                goto jmpback;
                //asm volatile("cli; hlt;");
            }
            outputName16[(13 * (bOff + 1))] = 0;
            
            // todo, rework using only one outStr, not outputName8
            for(int i = 0; i < 14; i++)
            {
                outputName8[i] = outputName16[i * 2];
            }

            uint32_t len = strlen(outputName8) + 1;
            char* outStr = (char*) malloc(len);
            memcpy(outStr, outputName8, len);

            file = (FAT_entry_t*) ((char*)fsectBuff + (sizeof(FAT_longFileName_t) * (1 + fnOffset))); // possible error here, maybe add 1?
            
            returnSt->info = *file;
            returnSt->name = outStr;
            returnSt->isDir = file->attributes == 0x10;
            returnSt->size = sizeof(FAT_longFileName_t) + sizeof(FAT_entry_t);
            return returnSt;
        } else {                    // normal
            //tty_putString("SHORT FILE NAME: ");
            file = (FAT_entry_t*) fsectBuff;
            //for(int i = 0; i < 20; i++)
                //tty_putChar(((char*)(file))[i]);

            uint32_t len = strcut(file->fileName, ' ') + 1;
            char* outStr = (char*) malloc(len);
            memcpy(outStr, file->fileName, len);

            //tty_putString_nl(outStr);

            returnSt->info = *file;
            returnSt->name = outStr;
            returnSt->isDir = file->attributes == 0x10;
            returnSt->size = sizeof(FAT_entry_t);
            return returnSt;
        }
    }
}