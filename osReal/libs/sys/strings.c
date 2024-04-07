void itoa(int32_t number, char* buff)
{
    if(number < 0)
    {
        number = -number;
        *(buff++) = '-';
    }

    int len = numLen(number) - 1;
    buff += len + 1;
    *(buff--) = 0;

    if (number == 0) {
        *buff = '0';
    }
    else
    {
        while (number >= 1)
        {
            *buff = (char)(number % 10) + 48;
            number /= 10;
            buff--;
        }
    }
}

void memcpy(char* dest, char* src, uint32_t size)
{
    while(size > 0)
    {
        *dest = *src;
        dest++;
        src++;
        size--;
    }
}

uint32_t strcut(char* string, char c)
{
    int len = 0;
    while(*string != c)
    {
        len++;
        string++;
    }
    *string = 0;
    return len;
}

uint32_t strlen(char* string)
{
    int len = 0;
    while(*string != 0)
    {
        len++;
        string++;
    }
    return len;
}

uint32_t strcmp(char* a, char* b)
{
    while(*a == *b)
    {
        if(*a == 0) return 0;
        a++;
        b++;
    }
    return *a - *b;
}

void strcat(char* a, char* b)
{
    memcpy(a + strlen(a), b, strlen(b) + 1);
}

void strcatch(char* a, char b)
{
    char* offset = a + strlen(a);
    *(offset) = b;
    *(offset + 1) = 0;
}