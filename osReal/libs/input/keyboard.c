int times = 0;

void keyboard_handler()
{
    unsigned char scan_code = inb(KEYBOARD_PORT);
      puts("Got mouse", 150, 150);
  putch(times++, 250,150);
}