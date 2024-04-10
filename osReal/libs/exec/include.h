#pragma once 

// three structs from linux foundation
typedef struct
{
    unsigned char ident[16];
    uint16_t type;
    uint16_t machine;
    uint32_t version;
    uint32_t entry;
    uint32_t phoff;
    uint32_t shoff;
    uint32_t flags;
    uint16_t ehsize;
    uint16_t phentsize;
    uint16_t phnum;
    uint16_t shentsize;
    uint16_t shnum;
    uint16_t shstrndx;
} elf_header_t;

typedef struct
{
    uint32_t name;
    uint32_t type;
    uint32_t flags;
    uint32_t addr;
    uint32_t offset; // this gives the offset in the file. Use this
    uint32_t size;
    uint32_t link;
    uint32_t info;
    uint32_t addralign;
    uint32_t entsize;
} elf_sh_t;

typedef struct {
	uint32_t	type;
	uint32_t	offset;
	uint32_t	vaddr;
	uint32_t	paddr;
	uint32_t	filesz;
	uint32_t	memsz;
	uint32_t	flags;
	uint32_t	align;
} elf_ph_t;

// important data for actually runnning it
typedef struct {
    uint32_t entry_fileOff; // offset of entry within file. full offset
    uint32_t text_offset;
    uint32_t text_size;
    uint32_t data_offset;
    uint32_t data_size; // includes data, rodata, bss
    char *file;
    uint32_t file_size;
} elf_section_offsets_t;

enum
{
    SHT_NULL,
    SHT_PROGBITS,
    SHT_SYMTAB,
    SHT_STRTAB,
    SHT_RELA,
    SHT_HASH,
    SHT_DYNAMIC,
    SHT_NOTE,
    SHT_NOBITS,
    SHT_REL,
    SHT_SHLIB,
    SHT_DYNSYM,
    SHT_INIT_ARRAY,
    SHT_FINI_ARRAY,
    SHT_PREINIT_ARRAY,
    SHT_GROUP,
    SHT_SYMTAB_SHNDX,
};

#define SHF_WRITE 0x1
#define SHF_ALLOC 0x2
#define SHF_EXECINSTR 0x4
#define SHF_MERGE 0x10
#define SHF_STRINGS 0x20
#define SHF_INFO_LINK 0x40
#define SHF_LINK_ORDER 0x80
#define SHF_OS_NONCONFORMING 0x100
#define SHF_GROUP 0x200
#define SHF_TLS 0x400
#define SHF_MASKOS 0x0ff00000
#define SHF_MASKPROC 0xf0000000

#define CHECK_TYPE(e, _type)   (e->type == _type)
#define CHECK_FLAGS(e, _flags) ((e->flags ^ (_flags)) == 0) 
/* 
XOR places 1 in any bit where that flag is wrong.
If all right ->  0x0000000
if some wrong -> 0x0001000
If number = 0, then it was correct
*/
#define IS_BSS(e)     ((e->size != 0) && (CHECK_TYPE(e, SHT_NOBITS)   && (CHECK_FLAGS(e, SHF_ALLOC + SHF_WRITE))))
#define IS_DATA(e)    ((e->size != 0) && (CHECK_TYPE(e, SHT_PROGBITS) && (CHECK_FLAGS(e, SHF_ALLOC + SHF_WRITE))))
#define IS_RODATA(e)  ((e->size != 0) && (CHECK_TYPE(e, SHT_PROGBITS) && (CHECK_FLAGS(e, SHF_ALLOC))))
#define IS_TEXT(e)    ((e->size != 0) && (CHECK_TYPE(e, SHT_PROGBITS) && (CHECK_FLAGS(e, SHF_ALLOC + SHF_EXECINSTR))))
//#define IS_RELTEXT(e) ((e->size != 0) && (CHECK_TYPE(e, SHT_REL)      && (CHECK_FLAGS(e, SHF_ALLOC))))

#include "elf_exec.c"
#include "elf_header.c"