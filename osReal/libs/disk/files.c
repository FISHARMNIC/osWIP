linked_t files_directoryTree;

// look into Interesting information returned by IDENTIFY on ATA PIO osdev

// todo: once we find a dir, load each cluster chain. If theres more dirs in there, do that too
// void nest(FAT_entryInfo* file)
// {
//     while(FAT_get_cluster_num(file) != 0xFFFFFFFF)
//     {
//         FAT_readFirstSectorOfCluster(FAT_get_cluster_num(file));
//         FAT_entryInfo* file_clus = FAT_readEntry(fsectBuff); 
//     }
// }

char* temp_allNames[200];
int temp_namesCount = 0;
void searchDir(uint8_t fsectBuff[512])
{
    uint32_t offset = 0;
    FAT_entryInfo* file = FAT_readEntry(fsectBuff); 
    while(file != 0)
    {
        if(file->isDir)
        {
            tty_putString("adding directory: ");
            tty_putString_nl(file->name);
            uint32_t clusterNum = FAT_get_cluster_num(&(file->info));
            if(clusterNum != 0 && clusterNum != 0xFFFFFFFF)
            {
                tty_putString("entering nest: ");
                tty_putInt_nl(clusterNum);
                uint8_t* secBuff = (uint8_t*)malloc(512);
                FAT_readFirstSectorOfCluster(secBuff, clusterNum);
                searchDir(secBuff + 96);
                free(secBuff);
            }
        } else {
            tty_putString("adding file     : ");
            tty_putString_nl(file->name);
        }
        linked_dict_add(&files_directoryTree, file, file->name); 
        temp_allNames[temp_namesCount++] = file->name;
        offset += file->size;
        file = FAT_readEntry(fsectBuff + offset);
    }
}

void run_disk_test()
{
    gfx_clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0, 0, 65, &gfx_current_ctx, &tty_current_ctx);

    tty_putString("CREATING FS DIRECTORIES\n");
    
    bpb_init();
    //tty_putInt_nl(bpb_info.BPB_RootClus);
    uint8_t fsectBuff[512];
    
    // Using a dump, the dir name at cluster 3 should be GRUB. Its not located at the beggining however.
    // How to get offset?
    FAT_readFirstSectorOfCluster(fsectBuff, bpb_info.BPB_RootClus); // 
    
    searchDir(fsectBuff);

    gfx_clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0, 0, 65, &gfx_current_ctx, &tty_current_ctx);

    tty_putInt(temp_namesCount);
    tty_putString_nl(" Files and directories");
    for(int i = 0; i < temp_namesCount; i++)
    {
        tty_putString(temp_allNames[i]);
        tty_putChar(' ');
    }

    tty_putString_nl("TESTING ACCESS");
    tty_putString_nl(linked_dict_read(files_directoryTree, "boot", FAT_entryInfo*)->name);

}