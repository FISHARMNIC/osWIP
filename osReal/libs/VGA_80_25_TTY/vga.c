#include <stdint.h>

#define VGA_ADDR 0xb8000

uint8_t STDOUT_COL = 15;

// display buffer
uint16_t * stdout = (uint16_t *) VGA_ADDR;

// format color for a vga entry
static inline uint8_t formatVGA(uint8_t fg, uint8_t bg)
{
    return (fg << 4) | bg;
}


void putch(char ch)
{

    *stdout = STDOUT_COL << 8 | ch;
    stdout++;
}

void deletech()
{
    stdout--;
    *stdout = 0;
}

void puts(char * str)
{
    while(*str)
    {
        putch(*str);
        str++;
    }
}


int numLen(unsigned x)
{
    // this is either a fun exercise in optimization
    // or it's extremely premature optimization.
    if (x >= 100000)
    {
        if (x >= 10000000)
        {
            if (x >= 1000000000)
                return 10;
            if (x >= 100000000)
                return 9;
            return 8;
        }
        if (x >= 1000000)
            return 7;
        return 6;
    }
    else
    {
        if (x >= 1000)
        {
            if (x >= 10000)
                return 5;
            return 4;
        }
        else
        {
            if (x >= 100)
                return 3;
            if (x >= 10)
                return 2;
            return 1;
        }
    }
}


void puti(uint32_t number)
{
    //number -= 2058624;
    int len = numLen(number) - 1;
    stdout += (uint16_t)len;
    if (number == 0) {
        putch('0');
    }
    else
    {
        while (number >= 1)
        {
            putch((char)(number % 10) + 48);
            number /= 10;
            stdout -= 2;
        }
        stdout += ((len + 1) * 2) - 2;
    }
}
