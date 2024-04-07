static volatile unsigned char keyboard_sc = 0; //must be volatile so that compiler doesn't cache in getch func_ttions

void keyboard_handler(regs32 r)
{
  keyboard_sc = inb(KEYBOARD_PORT);
}

char getKeyCode()
{
  while (keyboard_sc >= 128); // wait until press
  char old = keyboard_sc;
  while (keyboard_sc == old);  // wait until release or other key pressed
  return old >= 128? old - 128 : old;   // get original char
}

char getch()
{
  return KEYSET[(int) getKeyCode()];
}

int gets(char* buffer)
{
    char got = 0;
    while((got = getKeyCode()) != KEY_ENTER)
    {
        if(got == KEY_BACKSPACE) {
            buffer--;
            *buffer = 0;
        } else {
            buffer++;
        }
    }
    *buffer = 0;
    return 0;
}