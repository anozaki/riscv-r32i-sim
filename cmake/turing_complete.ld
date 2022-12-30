OUTPUT_ARCH(riscv)

MEMORY
{
    /*
    * We will place our code at address 0 to keep things easier
    */
    ROM (RX): org = 0x0, len = 256K

    /*
    * 4kb of read/write memory
    */
    RAM (RW): org = 0x1000000, len = 4K
}

ENTRY(_start)

SECTIONS
{
    /*
     * We will put the stack top at the end of the RAM
     */
    PROVIDE(__stack_top = ORIGIN(RAM) + LENGTH(RAM));

    .text :
    {
        /*
         * We are placing our runtime initialization at the very top.
         * This is very important because none of the register would be initialized properly.
         */
        *(.init)

        /* *(isr_vector) */
        *(.text)
        *(.rodata)
        . = ALIGN(8);
        _etext = .;
    } > ROM AT> ROM

    .data :
    {
        _sdata = .;
        *(.data .data.*)
        . = ALIGN (8);
        PROVIDE(__global_pointer$ = . + 0x800);
        _edata = .;
    }> RAM AT> ROM
    PROVIDE( _end = . );

    .bss :
    {
        _sbss = .;
        *(.bss)
        _ebss = .;
    }> RAM

}