@ choi++20201112 assembler

.text
.global _start

_start:
    mov r0, #2
    bl  fun
    add r1, r0, lsl #1
    subs r4, r1, #5
    bgt l1
    eor r4, r4
l1:
    mov r0, #0
    mov r7, #1
    swi 0
fun:
    and r0, r0, #0x3
    mov pc, lr

.end
