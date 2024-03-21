// very slow old program. rewrite later using linked list

#define MAX_MEMORY 2000

char malloc_memory[MAX_MEMORY];  // Let the compiler designate some static memory for us
uint16_t malloc_start[MAX_MEMORY]; // Where our memory segments will start
uint16_t malloc_end[MAX_MEMORY];   // Where out memory segments will end
uint16_t malloc_index = 1;         // Where to write into the start/end
uint16_t malloc_free_spot = 0;     // Most recent free memory spot

uint16_t arr_index_return = 0;
char array_includes(uint16_t *array, uint16_t value)
{
    for (uint16_t i = 0; i < MAX_MEMORY; i++)
    {
        if (array[i] == value)
        {
            arr_index_return = i;
            return 1; // Return the index (1 indexed)
        }
    }
    return 0;
}

void *malloc(uint16_t size)
{
    uint16_t position;
    uint16_t free_chars_read = 0;
    uint16_t whereInArr;

    for (position = 0; position < MAX_MEMORY; position++)
    {
        // Find if in a designated block
        if (array_includes(malloc_start, position) == 0)
        { // If not in block (offset)
            if (free_chars_read == size)
            {
                malloc_end[malloc_index] = position;
                malloc_start[malloc_index] = position - size;
                malloc_index++;
                return (void *)(malloc_memory + position - size); // Return the base address of the block
            }
            free_chars_read++;
        }
        else
        {                                            // If in block
            position = malloc_end[arr_index_return]; // Jump to the end
            free_chars_read = 0;
        }
    }
    malloc_index++;
    return 0;
}
void free(void *ptr)
{
    uint16_t baseAddress = (char *)ptr - malloc_memory;
    array_includes(malloc_start, baseAddress);
    for (uint16_t i = malloc_start[arr_index_return]; i < malloc_end[arr_index_return]; i++)
    {
        malloc_memory[i] = 0; // clear the section of memory
    }

    // reset the saved positions
    malloc_start[arr_index_return] = 0;
    malloc_end[arr_index_return] = 0;

    // printf("***%" PRIu16 "\n", baseAddress);
}