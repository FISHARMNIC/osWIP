// converts images to PPM for operating system

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

// edit ALSO EDIT 16 and 17
#define WIDTH 100
#define HEIGHT 100

// don't edit
#define INTLEN(x) sizeof(#x)

#define SIZE_ENTRIES (WIDTH * HEIGHT)
// 3 bytes per entry. 24bit RGB
#define SIZE_BYTES (SIZE_ENTRIES * 3)

// 2 bytes per entry. 16bit RGB
#define OUT_SIZE_BYTES (SIZE_ENTRIES * 2)

#define RGBto565(rgb) (((rgb.r & 0b11111000) << 8) | ((rgb.g & 0b11111100) << 3) | (rgb.b >> 3))

typedef struct {
    uint8_t r;
    uint8_t g;
    uint8_t b;
} ppm_col_t;


typedef struct {
    uint8_t skip[3];
    char width_str[INTLEN(100)];
    char height_str[INTLEN(100)];
    char color_str[4];
    ppm_col_t file_begin[SIZE_ENTRIES];
} ppm_t;

ppm_t* load_img()
{
    FILE *fp = fopen("chicken.ppm", "rb");
    // change to just use size macros
    fseek(fp, 0, SEEK_END);
    int length = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    uint8_t *buffer = (uint8_t *)malloc(length);
    fread(buffer, 1, length, fp);
    fclose(fp);
    return (ppm_t*)buffer;
}

int main()
{
    ppm_t* img = load_img();
    ppm_col_t col = img->file_begin[0];

    uint16_t* out= (uint16_t*)malloc(SIZE_ENTRIES);
    for(int i = 0; i < SIZE_ENTRIES; i++)
    {
        out[i] = RGBto565(img->file_begin[i]);
    }

    FILE *fp;
    fp = fopen( "chicken" , "w+");

    fwrite(out, sizeof(uint16_t), SIZE_ENTRIES, fp);
    // printf("%#x %#x %#x\n%#x\n", col.r, col.g, col.b, RGBto565(col));

    free(img);
    free(out);
    return 0;
}