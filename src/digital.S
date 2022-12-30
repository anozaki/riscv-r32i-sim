.section .text
.align 2
.global memoryMapGPIOTest

.include "memory_map.inc"
.include "gpio.inc"

memoryMapGPIOTest:
  addi sp, sp, -16
  sw ra, 12(sp)

  li t0, GPIO_CTRL_ADDR
  li t1, GPIO_RGB_PINS
  sw t1, GPIO_OUTPUT_EN(t0)
  sw t1, GPIO_OUTPUT_XOR(t0)
  sw x0, GPIO_OUTPUT_VAL(t0)
  lw ra, 12(sp)
  addi sp, sp, 16
  ret