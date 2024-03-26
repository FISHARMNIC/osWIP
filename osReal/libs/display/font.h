// uint8_t MOUSE_FONT[] = {
//     0b00000000,
//     0b00000000,
//     0b00000000,
//     0b00000000,
//     0b00000000,
//     0b00000000,
//     0b00000000,
//     0b00010000,
//     0b00111000,
//     0b01111100,
//     0b11111111,
//     0b11111111,
//     0b00111000,
//     0b00111000,
//     0b00111000,
//     0b00111000
// };

uint8_t MOUSE_FONT_REG[] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b10000000,
    0b11000000,
    0b11100000,
    0b11110000,
    0b11111000,
    0b11111100,
    0b00011000,
    0b00001100,
    0b00000110
};

uint8_t MOUSE_FONT_SIZE[] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b11111000,
    0b11100000,
    0b11110001,
    0b10011001,
    0b10001111,
    0b00000111,
    0b00011111
};

uint8_t* VGA_FONT = (uint8_t*) 
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x3C\x42\x81\xA5\x81\x81\xBD\x99\x81\x42\x3C\x00\x00\x00"
    "\x00\x00\x3C\x7E\xFF\xDB\xFF\xFF\xC3\xE7\xFF\x7E\x3C\x00\x00\x00"
    "\x00\x00\x00\x6C\xFE\xFE\xFE\xFE\x7C\x7C\x38\x10\x00\x00\x00\x00"
    "\x00\x00\x00\x10\x38\x38\x7C\xFE\x7C\x38\x38\x10\x00\x00\x00\x00"
    "\x00\x00\x00\x10\x38\x38\x54\xFE\xFE\x54\x10\x38\x00\x00\x00\x00"
    "\x00\x00\x00\x10\x38\x7C\xFE\xFE\xFE\x38\x38\x7C\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x18\x18\x3C\x3C\x3C\x3C\x18\x18\x00\x00\x00\x00"
    "\xFF\xFF\xFF\xFF\xE7\xE7\xC3\xC3\xC3\xC3\xE7\xE7\xFF\xFF\xFF\xFF"
    "\x00\x00\x3C\x3C\x66\x66\x42\x42\x42\x42\x66\x66\x3C\x3C\x00\x00"
    "\xFF\xFF\xC3\xC3\x99\x99\xBD\xBD\xBD\xBD\x99\x99\xC3\xC3\xFF\xFF"
    "\x00\x00\x00\x1E\x0E\x1A\x32\x78\xCC\xCC\xCC\xCC\x78\x00\x00\x00"
    "\x00\x00\x00\x3C\x66\x66\x66\x66\x3C\x18\x7E\x18\x18\x00\x00\x00"
    "\x00\x00\x00\x18\x1C\x1E\x1B\x18\x18\x78\xF8\x70\x00\x00\x00\x00"
    "\x00\x00\x00\x7F\x63\x63\x63\x63\x63\x67\xE7\xE6\xC0\x00\x00\x00"
    "\x00\x00\x00\x00\x18\x18\xDB\x3C\xE7\x3C\xDB\x18\x18\x00\x00\x00"
    "\x00\x00\x00\x00\xC0\xF0\xFC\xFF\xFC\xF0\xC0\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x03\x0F\x3F\xFF\x3F\x0F\x03\x00\x00\x00\x00\x00"
    "\x18\x3C\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x3C\x18"
    "\x66\x66\x66\x66\x66\x66\x66\x66\x66\x66\x00\x00\x66\x66\x00\x00"
    "\x00\x00\x3E\x7A\x7A\x7A\x7A\x3A\x1A\x1A\x1A\x1A\x1A\x00\x00\x00"
    "\x00\x3C\x66\x60\x30\x38\x6C\x66\x36\x1C\x0C\x06\x66\x3C\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x7E\x7E\x7E\x7E\x7E\x7E\x00\x00"
    "\x18\x3C\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x3C\x18\xFF"
    "\x18\x3C\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18"
    "\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x3C\x18"
    "\x00\x00\x00\x00\x00\x08\x0C\xFE\xFE\x0C\x08\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x10\x30\x7F\x7F\x30\x10\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xFE\x06\x06\x06\x06\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x24\x66\xFF\xFF\x66\x24\x00\x00\x00\x00\x00"
    "\x10\x10\x10\x10\x38\x38\x38\x38\x7C\x7C\x7C\x7C\xFE\xFE\xFE\xFE"
    "\xFE\xFE\xFE\xFE\x7C\x7C\x7C\x7C\x38\x38\x38\x38\x10\x10\x10\x10"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x18\x18\x18\x18\x18\x18\x18\x18\x00\x00\x18\x18\x00\x00\x00"
    "\x00\x66\x66\x66\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x6C\x6C\x6C\xFE\x6C\x6C\x6C\xFE\x6C\x6C\x6C\x00\x00\x00"
    "\x00\x18\x18\x3C\x66\x60\x30\x18\x0C\x06\x66\x3C\x18\x18\x00\x00"
    "\x00\x00\x06\xC6\xCC\xCC\x18\x18\x30\x30\x66\x66\xC6\xC0\x00\x00"
    "\x00\x00\x38\x6C\x6C\x38\x30\x7A\xDE\xCC\xCC\xCC\x76\x00\x00\x00"
    "\x00\x18\x18\x18\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x0C\x18\x18\x30\x30\x30\x30\x30\x30\x30\x18\x18\x0C\x00\x00"
    "\x00\x30\x18\x18\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x18\x18\x30\x00\x00"
    "\x00\x00\x00\x00\x66\x66\x3C\xFF\x3C\x66\x66\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x18\x18\x18\x7E\x18\x18\x18\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x38\x18\x18\x30\x60\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x7E\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\x18\x18\x00\x00\x00"
    "\x03\x03\x06\x06\x0C\x0C\x18\x18\x30\x30\x60\x60\xC0\xC0\x00\x00"
    "\x00\x00\x38\x6C\xC6\xC6\xCE\xD6\xE6\xC6\xC6\x6C\x38\x00\x00\x00"
    "\x00\x00\x18\x38\x78\x18\x18\x18\x18\x18\x18\x18\x7E\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x06\x06\x0C\x18\x30\x60\x60\x7E\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x06\x06\x1C\x06\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x0C\x1C\x3C\x6C\xCC\xCC\xFE\x0C\x0C\x0C\x0C\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x7C\x06\x06\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x1C\x30\x60\x60\x7C\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x7E\x06\x06\x06\x0C\x0C\x18\x18\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x76\x3C\x6E\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x66\x3E\x06\x06\x06\x0C\x38\x00\x00\x00"
    "\x00\x00\x00\x18\x18\x18\x00\x00\x00\x00\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x00\x18\x18\x18\x00\x00\x00\x00\x38\x18\x18\x30\x60\x00"
    "\x00\x00\x00\x06\x0C\x18\x30\x60\x30\x18\x0C\x06\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x7E\x00\x00\x00\x7E\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x60\x30\x18\x0C\x06\x0C\x18\x30\x60\x00\x00\x00\x00"
    "\x00\x3C\x66\x66\x06\x0C\x18\x18\x18\x00\x00\x18\x18\x00\x00\x00"
    "\x00\x00\x7C\xC6\xC6\xC6\xDE\xDE\xDE\xDC\xC0\xC0\x7C\x00\x00\x00"
    "\x00\x00\x18\x3C\x66\x66\x66\x7E\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x7C\x66\x66\x66\x6C\x78\x6C\x66\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x60\x60\x60\x60\x60\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x78\x6C\x66\x66\x66\x66\x66\x66\x66\x6C\x78\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x60\x7C\x60\x60\x60\x60\x7E\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x7C\x60\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x60\x60\x6E\x66\x66\x66\x66\x3E\x00\x00\x00"
    "\x00\x00\x66\x66\x66\x66\x66\x7E\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x00\x00\x00"
    "\x00\x00\x06\x06\x06\x06\x06\x06\x06\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\xC6\xC6\xCC\xCC\xD8\xF0\xD8\xCC\xCC\xC6\xC6\x00\x00\x00"
    "\x00\x00\x60\x60\x60\x60\x60\x60\x60\x60\x60\x60\x7E\x00\x00\x00"
    "\x00\x00\xC6\xEE\xEE\xFE\xD6\xD6\xC6\xC6\xC6\xC6\xC6\x00\x00\x00"
    "\x00\x00\xC6\xC6\xE6\xE6\xF6\xFE\xDE\xCE\xCE\xC6\xC6\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x66\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x7C\x66\x66\x66\x66\x7C\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x66\x66\x66\x66\x66\x66\x3C\x0C\x06\x00"
    "\x00\x00\x7C\x66\x66\x66\x66\x7C\x6C\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x60\x30\x18\x0C\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x66\x66\x66\x66\x66\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x66\x66\x66\x66\x66\x66\x66\x3C\x3C\x18\x18\x00\x00\x00"
    "\x00\x00\xC6\xC6\xC6\xC6\xC6\xD6\xD6\xFE\xEE\xEE\xC6\x00\x00\x00"
    "\x00\x00\xC3\xC3\x66\x3C\x18\x18\x18\x3C\x66\xC3\xC3\x00\x00\x00"
    "\x00\x00\xC3\xC3\x66\x66\x3C\x18\x18\x18\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x7E\x06\x06\x0C\x0C\x18\x30\x30\x60\x60\x7E\x00\x00\x00"
    "\x00\x3C\x30\x30\x30\x30\x30\x30\x30\x30\x30\x30\x30\x3C\x00\x00"
    "\xC0\xC0\x60\x60\x30\x30\x18\x18\x0C\x0C\x06\x06\x03\x03\x00\x00"
    "\x00\x3C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x3C\x00\x00"
    "\x00\x10\x38\x6C\x6C\xC6\xC6\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF"
    "\x00\x18\x18\x0C\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x06\x3E\x66\x66\x66\x3E\x00\x00\x00"
    "\x00\x00\x60\x60\x60\x60\x7C\x66\x66\x66\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x60\x60\x60\x66\x3C\x00\x00\x00"
    "\x00\x00\x06\x06\x06\x06\x3E\x66\x66\x66\x66\x66\x3E\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x66\x7E\x60\x60\x3C\x00\x00\x00"
    "\x00\x00\x1E\x30\x30\x30\x7E\x30\x30\x30\x30\x30\x30\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3E\x66\x66\x66\x66\x66\x3E\x06\x06\x7C"
    "\x00\x00\x60\x60\x60\x60\x7C\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x18\x18\x00\x00\x78\x18\x18\x18\x18\x18\x1E\x00\x00\x00"
    "\x00\x00\x0C\x0C\x00\x00\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x78"
    "\x00\x00\x60\x60\x60\x60\x66\x66\x6C\x78\x6C\x66\x66\x00\x00\x00"
    "\x00\x00\x78\x18\x18\x18\x18\x18\x18\x18\x18\x18\x1E\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xCC\xFE\xD6\xD6\xD6\xD6\xC6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7C\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7C\x66\x66\x66\x66\x66\x7C\x60\x60\x60"
    "\x00\x00\x00\x00\x00\x00\x3E\x66\x66\x66\x66\x66\x3E\x06\x06\x06"
    "\x00\x00\x00\x00\x00\x00\x7C\x66\x66\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3E\x60\x60\x3C\x06\x06\x7C\x00\x00\x00"
    "\x00\x00\x00\x30\x30\x30\x7E\x30\x30\x30\x30\x30\x1E\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x66\x66\x66\x3E\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x66\x66\x3C\x18\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xC6\xC6\xD6\xD6\xD6\x7C\x6C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xC6\xC6\x6C\x38\x6C\xC6\xC6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x66\x66\x66\x3E\x06\x06\x3C"
    "\x00\x00\x00\x00\x00\x00\x7E\x06\x0C\x18\x30\x60\x7E\x00\x00\x00"
    "\x00\x0E\x18\x18\x18\x18\x18\xF0\x18\x18\x18\x18\x18\x0E\x00\x00"
    "\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x00\x00"
    "\x00\xE0\x30\x30\x30\x30\x30\x1E\x30\x30\x30\x30\x30\xE0\x00\x00"
    "\x00\x72\xD6\x9C\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x10\x38\x6C\xC6\xC6\xC6\xFE\x00\x00\x00\x00"
    "\x00\x00\x60\xFC\x60\x7C\x66\x66\x66\x66\x66\x66\x66\x06\x06\x1C"
    "\x00\x00\xF8\x60\x7C\x66\x66\x66\x66\x66\x66\x66\x66\x06\x06\x1C"
    "\x00\x00\x0E\x0C\x18\x00\x7E\x60\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x0C\x18\x00\x7E\x60\x60\x60\x60\x60\x60\x60\x60\x60\x60\x00\x00"
    "\x00\x00\x66\x66\x00\x00\x3C\x66\x66\x7E\x60\x60\x3C\x00\x00\x00"
    "\x66\x66\x00\x7E\x60\x60\x60\x7C\x60\x60\x60\x60\x7E\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x60\x7C\x60\x66\x3C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x60\x7C\x60\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3E\x60\x60\x3C\x06\x06\x7C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x60\x30\x18\x0C\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x18\x18\x00\x00\x78\x18\x18\x18\x18\x18\x1E\x00\x00\x00"
    "\x00\x00\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x00\x00\x00"
    "\x00\x00\x66\x66\x00\x00\x38\x18\x18\x18\x18\x18\x3C\x00\x00\x00"
    "\x66\x66\x00\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x7E\x00\x00\x00"
    "\x00\x00\x0C\x0C\x00\x00\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x0C\x78"
    "\x00\x00\x06\x06\x06\x06\x06\x06\x06\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x6C\x6C\x6E\x6D\x6D\xCE\x00\x00\x00"
    "\x00\x00\x3C\x6C\x6C\x6C\x6C\x6E\x6D\x6D\x6D\x6D\xCE\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xD8\xD8\xD8\xFC\xDA\xDA\xDC\x00\x00\x00"
    "\x00\x00\xD8\xD8\xD8\xD8\xD8\xD8\xFC\xDA\xDA\xDA\xDC\x00\x00\x00"
    "\x00\x00\x60\xFC\x60\x7C\x66\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\xF8\x60\x7C\x66\x66\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x1C\x18\x30\x00\xC6\xCE\xD8\xF0\xD8\xCC\xC6\x00\x00\x00"
    "\x18\x30\x00\xC6\xCE\xD8\xD8\xD8\xF0\xD8\xCC\xCC\xCC\xC6\x00\x00"
    "\x00\x00\x66\x66\x3C\x00\x66\x66\x66\x66\x66\x66\x3C\x0C\x18\xF0"
    "\x66\x3C\x00\x66\x66\x66\x66\x66\x66\x66\x3C\x0C\x18\x70\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x66\x66\x66\x7E\x18\x18\x00"
    "\x00\x00\x66\x66\x66\x66\x66\x66\x66\x66\x66\x66\x7E\x18\x18\x00"
    "\x00\x00\x00\x00\x00\x00\xCC\xD6\xD6\xF6\xD6\xD6\xCC\x00\x00\x00"
    "\x00\x00\xCC\xDE\xD6\xD6\xD6\xF6\xD6\xD6\xD6\xDE\xCC\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xE0\xE0\x60\x7C\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\xF0\xF0\xB0\x30\x30\x3C\x36\x36\x36\x36\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x06\x3E\x66\x66\x66\x3E\x00\x00\x00"
    "\x00\x00\x18\x3C\x66\x66\x66\x7E\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x00\x06\x3C\x60\x7C\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x60\x7C\x66\x66\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xCC\xCC\xCC\xCC\xCC\xCC\xFE\x06\x00\x00"
    "\x00\x00\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xFE\x06\x06\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x6C\x6C\x6C\x6C\x6C\xFE\xC6\x00\x00"
    "\x00\x00\x1E\x36\x66\x66\x66\x66\x66\x66\x66\x66\xFF\xC3\xC3\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x66\x7E\x60\x60\x3C\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x60\x7C\x60\x60\x60\x60\x7E\x00\x00\x00"
    "\x00\x00\x00\x00\x10\x10\x7C\xD6\xD6\xD6\xD6\xD6\x7C\x10\x10\x00"
    "\x00\x10\x7C\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\x7C\x10\x10\x00"
    "\x00\x00\x00\x00\x00\x00\x7E\x60\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x7E\x60\x60\x60\x60\x60\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x33\x66\xCC\x66\x33\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\xCC\x66\x33\x66\xCC\x00\x00\x00\x00\x00\x00"
    "\x22\x88\x22\x88\x22\x88\x22\x88\x22\x88\x22\x88\x22\x88\x22\x88"
    "\xAA\x55\xAA\x55\xAA\x55\xAA\x55\xAA\x55\xAA\x55\xAA\x55\xAA\x55"
    "\xDB\x77\xDB\xEE\xDB\x77\xDB\xEE\xDB\x77\xDB\xEE\xDB\x77\xDB\xEE"
    "\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18"
    "\x18\x18\x18\x18\x18\x18\x18\xF8\xF8\x18\x18\x18\x18\x18\x18\x18"
    "\x00\x00\x00\x00\x00\x00\xC6\xC6\x6C\x38\x6C\xC6\xC6\x00\x00\x00"
    "\x00\x00\xC3\xC3\x66\x3C\x18\x18\x18\x3C\x66\xC3\xC3\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xC6\xCE\xDE\xFE\xF6\xE6\xC6\x00\x00\x00"
    "\x00\x00\xC6\xC6\xCE\xCE\xDE\xFE\xF6\xE6\xE6\xC6\xC6\x00\x00\x00"
    "\x6C\x6C\x6C\x6C\x6C\x6C\xEC\x0C\xEC\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x00\x00\x00\x00\x00\x00\xFC\x0C\xEC\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x6C\x6C\x6C\x6C\x6C\x6C\xEC\x0C\xFC\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\xC6\x7C\x00\xC6\xCE\xDE\xFE\xF6\xE6\xC6\x00\x00\x00"
    "\xC6\x7C\x00\xC6\xC6\xCE\xCE\xDE\xF6\xE6\xE6\xC6\xC6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\xF8\xF8\x18\x18\x18\x18\x18\x18\x18"
    "\x18\x18\x18\x18\x18\x18\x18\x1F\x1F\x00\x00\x00\x00\x00\x00\x00"
    "\x18\x18\x18\x18\x18\x18\x18\xFF\xFF\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\x18\x18\x18\x18\x18\x18\x18"
    "\x18\x18\x18\x18\x18\x18\x18\x1F\x1F\x18\x18\x18\x18\x18\x18\x18"
    "\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\x00\x00\x00\x00\x00\x00\x00"
    "\x18\x18\x18\x18\x18\x18\x18\xFF\xFF\x18\x18\x18\x18\x18\x18\x18"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x6C\x78\x6C\x66\x66\x00\x00\x00"
    "\x00\x00\xC6\xC6\xCC\xCC\xD8\xF0\xD8\xCC\xCC\xC6\xC6\x00\x00\x00"
    "\x6C\x6C\x6C\x6C\x6C\x6C\x6F\x60\x7F\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7F\x60\x6F\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x6C\x6C\x6C\x6C\x6C\x6C\xEF\x00\xFF\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xFF\x00\xEF\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x6C\x6C\x6C\x6C\x6C\x6C\x6F\x60\x6F\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x00\x00\x00\x00\x00\x00\xFF\x00\xFF\x00\x00\x00\x00\x00\x00\x00"
    "\x6C\x6C\x6C\x6C\x6C\x6C\xEF\x00\xEF\x6C\x6C\x6C\x6C\x6C\x6C\x6C"
    "\x00\x00\x66\x3C\x66\x66\x66\x3C\x66\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3E\x66\x66\x66\x66\x66\xE6\x00\x00\x00"
    "\x00\x00\x1E\x36\x66\x66\x66\x66\x66\x66\x66\x66\xC6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xC6\xEE\xFE\xFE\xD6\xD6\xC6\x00\x00\x00"
    "\x00\x00\xC6\xEE\xEE\xFE\xD6\xD6\xC6\xC6\xC6\xC6\xC6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x7E\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x66\x66\x66\x66\x66\x7E\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x66\x66\x66\x66\x66\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7E\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x18\x18\x18\x18\x18\x18\x18\xF8\xF8\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x1F\x1F\x18\x18\x18\x18\x18\x18\x18"
    "\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"
    "\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"
    "\x00\x00\x7E\x66\x66\x66\x66\x66\x66\x66\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3E\x66\x66\x3E\x1E\x36\x66\x00\x00\x00"
    "\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x3E\x66\x66\x66\x66\x3E\x1E\x36\x66\x66\x66\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7C\x66\x66\x66\x66\x66\x7C\x60\x60\x60"
    "\x00\x00\x7C\x66\x66\x66\x66\x7C\x60\x60\x60\x60\x60\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x60\x60\x60\x66\x3C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x60\x60\x60\x60\x60\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7E\x18\x18\x18\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x7E\x18\x18\x18\x18\x18\x18\x18\x18\x18\x18\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x66\x66\x66\x3E\x06\x06\x3C"
    "\x00\x00\xC6\xC6\xC6\xC6\xC6\xC6\xC6\x7E\x06\x06\xFC\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x92\xD6\x7C\x38\x7C\xD6\x92\x00\x00\x00"
    "\x00\x00\xD6\xD6\xD6\xD6\x7C\x38\x7C\xD6\xD6\xD6\xD6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x7C\x66\x66\x7C\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x7C\x66\x66\x66\x6C\x78\x6C\x66\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x60\x60\x60\x7C\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\x60\x60\x60\x60\x60\x7C\x66\x66\x66\x66\x7C\x00\x00\x00"
    "\x00\x00\xCE\xCB\xEB\xEB\xFE\xFC\xDF\xDC\xDC\xCC\xCC\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\xFE\x00\x00\x00\x00\x00\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xC6\xC6\xC6\xF6\xDE\xDE\xF6\x00\x00\x00"
    "\x00\x00\xC6\xC6\xC6\xC6\xC6\xF6\xDE\xDE\xDE\xDE\xF6\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x3C\x66\x06\x1C\x06\x66\x3C\x00\x00\x00"
    "\x00\x00\x3C\x66\x66\x06\x06\x1C\x06\x06\x66\x66\x3C\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xD6\xD6\xD6\xD6\xD6\xD6\xFE\x00\x00\x00"
    "\x00\x00\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xFE\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x78\xCC\x06\x1E\x06\xCC\x78\x00\x00\x00"
    "\x00\x00\x78\xCC\x06\x06\x06\x3E\x06\x06\x06\xCC\x78\x00\x00\x00"
    "\x00\x00\x00\x00\x00\x00\xD6\xD6\xD6\xD6\xD6\xD6\xFE\x06\x00\x00"
    "\x00\x00\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xD6\xFF\x03\x03\x00"
    "\x00\x00\x00\x00\x00\x00\x66\x66\x66\x3E\x06\x06\x06\x00\x00\x00"
    "\x00\x00\xC6\xC6\xC6\xC6\xC6\x7E\x06\x06\x06\x06\x06\x00\x00\x00"
    "\x00\x3C\x66\x60\x30\x38\x6C\x66\x36\x1C\x0C\x06\x66\x3C\x00\x00"
    "\x00\x00\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x7E\x00\x00"
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";