#include <stdio.h>
#include <string.h>

extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _etext;

extern void _init(void) __attribute__ ((noreturn));
extern int  main(void);
void _init(void) {
    uint32_t data_size = &_edata - &_sdata;
    uint8_t *dst = (uint8_t*)&_sdata;
    uint8_t *src = (uint8_t*)&_etext;

    // should really implement this in asm but lazy :P
    memcpy(dst, src, data_size);

    // call the main function
    int rc = main();

    // prevent it from exiting this function
    while(1) {}
}