.section .text
.align 2
.global testMemoryIO

.include "memory_map.inc"
.include "gpio.inc"

testMemoryIO:
  addi sp, sp, -16
  sw ra, 12(sp)

  li t0, 0x01000000
  li t1, 0x01020304
  sw t1, 0x00(t0)
  lw t2, 0x00(t0)
  lh t2, 0x00(t0)
  lb t2, 0x00(t0)

  li t1, 0x05060708
  sh t1, 0x00(t0)
  lw t2, 0x00(t0)

  li t1, 0x090A0B0C
  sb t1, 0x00(t0)
  lw t2, 0x00(t0)

  lw ra, 12(sp)
  addi sp, sp, 16
  ret