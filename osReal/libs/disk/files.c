/// @brief Used for holding directoryTree info
typedef struct
{
    FAT_entryInfo *file;
    linked_t subDir; // only if it is a folder (file->isDir)
} directoryTree_data_t;

linked_t files_directoryTree;
linked_t currentSubDStack;

// look into Interesting information returned by IDENTIFY on ATA PIO osdev

// char currentSubD[256];

char *temp_allNames[200]; // delete
int temp_namesCount = 0;  // delete

void searchDir(uint8_t fsectBuff[512])
{
    uint32_t offset = 0;
    FAT_entryInfo *file = FAT_readEntry(fsectBuff);
    while (file != 0)
    {
        if (file->isDir)
        {
            tty_putString("adding directory: ");
            tty_putString_nl(file->name);

            uint32_t clusterNum = FAT_get_cluster_num(&(file->info));
            if (clusterNum != 0 && clusterNum != 0xFFFFFFFF)
            {
                tty_putString("entering nest: ");
                tty_putInt_nl(clusterNum);
                uint8_t *secBuff = (uint8_t *)malloc(512);
                FAT_readFirstSectorOfCluster(secBuff, clusterNum);
                searchDir(secBuff + 96);
                free(secBuff);
            }
        }
        else
        {
            tty_putString("adding file     : ");
            tty_putString_nl(file->name);
        }
        linked_dict_add(&files_directoryTree, file, file->name);
        temp_allNames[temp_namesCount++] = file->name;
        offset += file->size;
        file = FAT_readEntry(fsectBuff + offset);
    }
}

/// @brief expects no starting slash
/// @param name address of string, turned into everything before slash
/// @return everything after slash
char *dirnameFirstSlash(char *name)
{
    // name++; // skip first root slash, like /dir1/dir2/dir3
    // char* oldStart = name;
    while (*name != '/')
    {
        if (*name == 0)
        {
            return 0;
        }
        name++;
    }
    *name = 0;
    return name + 1;
}

FAT_entryInfo *findDirInDir(char *name, uint8_t fsectBuff[512])
{
    static FAT_entryInfo *file = 0;
    file = FAT_readEntry(fsectBuff);

    uint32_t offset = 0;
    while (file != 0)
    {
        if (file->isDir)
        {
            tty_putString("checking directory: ");
            tty_putString_nl(file->name);
            if (strcmp(file->name, name) == 0)
            {
                tty_putString_nl("is equal");
                return file;
            }
        }
        offset += file->size;
        free(file);
        file = FAT_readEntry(fsectBuff + offset);
    }
    return 0;
}

uint8_t *findDirFromRoot(char *name)
{
    static uint8_t fsectBuff[512];

    char *afterSlash = dirnameFirstSlash(name); // name is now before slash
    uint32_t fromCluster = bpb_info.BPB_RootClus;
back:
    FAT_readFirstSectorOfCluster(fsectBuff, fromCluster);
    FAT_entryInfo *info = findDirInDir(name, fsectBuff);
    fromCluster = FAT_get_cluster_num(&(info->info));
    name = afterSlash;
    if (name != 0)
    {
        afterSlash = dirnameFirstSlash(name);
        free(info);
        goto back;
    }
    tty_putString_nl("directory found");

    return fsectBuff;
}

void readFile(char *dir, char *name, char *outBuffer, int32_t size)
{
    uint8_t *fsectBuff = findDirFromRoot(dir);

    uint32_t offset = 0;
    FAT_entryInfo *file = FAT_readEntry(fsectBuff);
    while (file != 0)
    {
        if (!file->isDir)
        {
            // todo, check if right name
            tty_putString("CHECKING:::");
            tty_putString_nl(file->name);
            if ((strcmp(file->name, name) == 0))
            {
                tty_putString_nl("found!");
                if(size == -1)
                    size = file->info.fileSizeBytes;
                
                uint32_t clusterNum = FAT_get_cluster_num(&(file->info)); // get first cluster of chain
                FAT_readFirstSectorOfCluster(fsectBuff, clusterNum);      // read first cluster

                if (size < 512)
                {
                    memcpy(outBuffer, (char *)fsectBuff, size);
                    free(file);
                    return;
                }

                while (size > 0)
                {
                    memcpy(outBuffer, (char *)fsectBuff, size > 512 ? 512 : size);
                    outBuffer += 512;
                    size -= 512;
                    clusterNum++;
                    FAT_readFirstSectorOfCluster(fsectBuff, clusterNum);
                    free(file);
                }
                return;
            }
        }
        offset += file->size;
        free(file);
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

    char* outBuff = malloc(600);
    readFile("test/test2", "hello.txt", outBuff, 600);
    for (int i = 0; i < 600; i++)
    {
        tty_putChar(outBuff[i]);
    }

    asm("mov $0, %eax; int $49");

}