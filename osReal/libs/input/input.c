#include "../ports/ports.h"

#include "mouse.c"
#include "keyboard.c"

const char KEYSET[128] = "`^1234567890-=\b\tqwertyuiop[]\\ asdfghjkl;'\n  zxcvbnm,./      ~!@#$%^&*()_+  QWERTYUIOP{}| ASDFGHJKL:\"   ZXCVBNM<>?";

static inline char kbRead()
{
    return inb(KEYBOARD_PORT);
}

uint8_t getKeyCode()
{
    while (kbRead() <= 0);
    while (kbRead() > 0);
    return kbRead() - 128;
}

char getch()
{
    return KEYSET[getKeyCode()];
}

int gets(char* buffer)
{
    char got = 0;
    while((got = getKeyCode()) != KEY_ENTER)
    {
        if(got == KEY_BACKSPACE) {
            buffer--;
            *buffer = 0;
            //deletech();
        } else {
            //putch(*buffer = KEYSET[got]);
            buffer++;
        }
    }
    *buffer = 0;
    return 0;
}