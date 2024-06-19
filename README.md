# Work in progress OS
## currently working
* GDT
* IDT
* Interrupt handling
  * Mouse and Keyboard controllers
* Simple graphics
* Simple window server
  * Drag and drop
  * Click to bring to top
  * Click X to close
  * Interaction
      * Widgets (only input and text for now)
      * Selectable event types: mouse move, click, keyboard, expose
  * Re-sizing
* Double buffering
* File access
* Executing ELF linked files (with no data segment at the moment)
* Syscalls

sources:  
* fatgen103.pdf
* OsDev
* Linux Foundation (elf)

note: For some reason I chose to not link the programs and instead try to include them all together.
<img width="752" alt="Screen Shot 2024-03-25 at 11 03 11 PM" src="https://github.com/FISHARMNIC/osWIP/assets/73864341/feb4f62f-3eea-444f-aea5-e413156adee6">
