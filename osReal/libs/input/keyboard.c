static volatile unsigned char keyboard_sc = 0; // can't cache in getch
static volatile onKey_fn *keyboard_onPressFn = 0;

void keyboard_onPress(onKey_fn *fn)
{
  keyboard_onPressFn = (volatile onKey_fn *)fn;
}

void keyboard_handler(regs32 r)
{
  keyboard_sc = inb(KEYBOARD_PORT);
  if (KEYCODE_RISING && (keyboard_onPressFn != 0))
  {
    (keyboard_onPressFn)(KEYSET[(int)keyboard_sc]);
  }
}

char getKeyCode_withInterrupts()
{
  while (keyboard_sc >= 128); // wait until press
  char old = keyboard_sc;
  while (keyboard_sc == old); // wait until release or other key pressed
  return old >= 128 ? old - 128 : old; // get original char
}

char getKeyCode_noInterrupts()
{
  // need to disable mouse
  while ((keyboard_sc = inb(0x60)) >= 128); // wait until press
  char old = keyboard_sc;
  while (inb(0x60) == old); // wait until release or other key pressed
  return old >= 128 ? old - 128 : old; // get original char
}

char getKeyCode()
{
  return _interrupts_enabled_? getKeyCode_withInterrupts() : getKeyCode_noInterrupts();
}


char getch()
{
  onKey_fn *onk = keyboard_onPressFn; 
  keyboard_onPressFn = 0; // destroy event handler to prioritize stdio

  char ret = getKeyCode();

  keyboard_onPressFn = (volatile onKey_fn *)onk;
  return ret;
}

int gets(char *buffer)
{
  onKey_fn *onk = keyboard_onPressFn; // destroy event handler to prioritize stdio
  keyboard_onPressFn = 0;

  char got = 0;
  while ((got = getKeyCode()) != KEY_ENTER)
  {
    if (got == KEY_BACKSPACE)
    {
      buffer--;
      *buffer = 0;
    }
    else if(got == KEY_ESC)
    {
      break;
    }
    else
    {
      *buffer = KEYSET[(int)got];
      buffer++;
    }
  }
  *buffer = 0;

  keyboard_onPressFn = (volatile onKey_fn *)onk;
  return 0;
}