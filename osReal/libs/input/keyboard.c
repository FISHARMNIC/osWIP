int times = 0;

void keyboard_handler()
{
    unsigned char scan_code = inb(KEYBOARD_PORT);
      gfx_drawString("Got keyboard", 150, 150);
  gfx_drawInt(times++, 250,150);
}