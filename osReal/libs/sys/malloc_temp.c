#define MAX_MEMORY 10000
char malloc_memory[MAX_MEMORY];
char* ptr = (char*) malloc_memory;

void* malloc(uint16_t size)
{
    ptr += size + 1;
    return (void*)(ptr - size - 1);
}

void free(void *ptr)
{

}