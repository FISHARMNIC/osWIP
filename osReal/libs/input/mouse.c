
char mouse_cycle=0;     //unsigned char
uint8_t mouse_byte[3];    //signed char
uint8_t mouse_x=0;         //signed char
uint8_t mouse_y=0;         //signed char

int times2 = 0;
void mouse_handler() //struct regs *a_r (not used but just there)
{
  // needs to be formattd as irq
  switch(mouse_cycle)
  {
    case 0:
      mouse_byte[0]=inb(0x64);
      mouse_cycle++;
      break;
    case 1:
      mouse_byte[1]=inb(0x64);
      mouse_cycle++;
      break;
    case 2:
      mouse_byte[2]=inb(0x64);
      mouse_x=mouse_byte[1];
      mouse_y=mouse_byte[2];
      mouse_cycle=0;
      break;
  }

  gfx_drawString("Got mouse", 150, 150);
  gfx_drawInt(times2++, 250,150);
}

void mouse_wait(unsigned char a_type) //unsigned char
{
  unsigned int _time_out=1000000; //unsigned int
  if(a_type==0)
  {
    while(_time_out--) //Data
    {
      if((inb(0x64) & 1)==1)
      {
        return;
      }
    }
    return;
  }
  else
  {
    while(_time_out--) //Signal
    {
      if((inb(0x64) & 2)==0)
      {
        return;
      }
    }
    return;
  }
}

char mouse_read()
{
  //Gets response from mouse
  mouse_wait(0); 
  return inb(0x60);
}

void mouse_write(unsigned char a_write) //unsigned char
{
  //Wait to be able to send a command
  mouse_wait(1);
  //Tell the mouse we are sending a command
  outb(0x64, 0xD4);
  //Wait for the final part
  mouse_wait(1);
  //Finally write
  outb(0x60, a_write);
}

void mouse_init()
{
  unsigned char _status;  //unsigned char

  //Enable the auxiliary mouse device
  mouse_wait(1);
  outb(0x64, 0xA8);
  
  //Enable the interrupts
  mouse_wait(1);
  outb(0x64, 0x20);
  mouse_wait(0);
  _status=(inb(0x60) | 2);
  mouse_wait(1);
  outb(0x64, 0x60);
  mouse_wait(1);
  outb(0x60, _status);
  
  //Tell the mouse to use default settings
  mouse_write(0xF6);
  mouse_read();  //Acknowledge
  
  //Enable the mouse
  mouse_write(0xF4);
  mouse_read();  //Acknowledge
}
