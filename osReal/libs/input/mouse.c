
static char mouse_cycle = 0;
static uint8_t mouse_byte[3];
static int32_t mouse_x = 0;
static int32_t mouse_y = 0;
volatile uint8_t mouse_down = 0;
static uint16_t saveBuffer[CHAR_HEIGHT * CHAR_WIDTH];

#define MOUSE_LEFT 1
#define MOUSE_RIGHT 2

static volatile int8_t mouse_edgeType = 0;

static onClick_fn *mouse_clickFn = 0;
static onMove_fn *mouse_moveFn = 0;

void mouse_onClick(onClick_fn *fn)
{
  mouse_clickFn = fn;
}

void mouse_onMove(onMove_fn *fn)
{
  mouse_moveFn = fn;
}

static void mouse_handleClick(uint8_t data)
{
  mouse_down = data & 0b00000111;
  if (mouse_clickFn != 0)
  {
    if ((mouse_edgeType == 0 && mouse_down > 0) || (mouse_edgeType == 1 && mouse_down == 0)) // clicked or falling action
    {
      mouse_edgeType = mouse_down > 0;
      // gfx_drawInt(mouse_edgeType, 10, 10);
      mouse_clickFn(mouse_x, mouse_y, mouse_edgeType);
    }
  }
}

static void mouse_render(int8_t dx, int8_t dy)
{
  if (mouse_y < 12)
  {
    mouse_y = 12;
  }
  if (mouse_x < 0)
  {
    mouse_x = 0;
  }
  int dBuffing = VGARAM == VGA_BACKBUFFER;
  gfx_db_end();

  gfx_drawBuffer(mouse_x, mouse_y - 12, CHAR_WIDTH, CHAR_HEIGHT, saveBuffer);

  mouse_x += dx;
  mouse_y -= dy;

  gfx_getRect(mouse_x, mouse_y - 12, CHAR_WIDTH, CHAR_HEIGHT, saveBuffer);
  gfx_drawMouse(mouse_x, mouse_y);
  if (dBuffing)
  {
    gfx_db_begin();
  }
}

static void mouse_handleMove(int8_t dx, int8_t dy)
{
  if (mouse_moveFn != 0)
  {
    mouse_moveFn(mouse_x, mouse_y);
  }
  mouse_render(dx, dy);
}

void mouse_handler(regs32 r)
{
  switch (mouse_cycle)
  {
  case 0:
    mouse_byte[0] = inb(0x60);
    mouse_handleClick(mouse_byte[0]);
    mouse_cycle++;
    break;
  case 1:
    mouse_byte[1] = inb(0x60);
    mouse_cycle++;
    break;
  case 2:
    mouse_byte[2] = inb(0x60);
    mouse_handleMove((int8_t)mouse_byte[1], (int8_t)mouse_byte[2]);
    mouse_cycle = 0;
    break;
  }
}

void mouse_wait(unsigned char a_type) // unsigned char
{
  unsigned int _time_out = 1000000; // unsigned int
  if (a_type == 0)
  {
    while (_time_out--) // Data
    {
      if ((inb(0x64) & 1) == 1)
      {
        return;
      }
    }
    return;
  }
  else
  {
    while (_time_out--) // Signal
    {
      if ((inb(0x64) & 2) == 0)
      {
        return;
      }
    }
    return;
  }
}

char mouse_read()
{
  // Gets response from mouse
  mouse_wait(0);
  return inb(0x60);
}

// not my code
void mouse_write(unsigned char a_write) // unsigned char
{
  // Wait to be able to send a command
  mouse_wait(1);
  // Tell the mouse we are sending a command
  outb(0x64, 0xD4);
  // Wait for the final part
  mouse_wait(1);
  // Finally write
  outb(0x60, a_write);
}

int mouse_detect()
{
  unsigned char tmp = mouse_read();
  if (tmp != 0xFA)
    return 0; // No mouse
  else
    return 1; // Mouse there
}

// not my code
void mouse_init()
{
  mouse_write(0xF4); // enable

  while (inb(0x60) != 0xFA);

  outb(0x64, 0x20); // enable int

  unsigned char res = inb(0x60);
  res |= 1 << 1;

  outb(0x64, 0x60);
  outb(0x60, res);

  gfx_getRect(0, 0, CHAR_WIDTH, CHAR_HEIGHT, saveBuffer);
}