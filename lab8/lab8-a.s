@ choi++20201112 decode 

.text

.global _start
_start:
    adr r4, a
    ldr r0, [r4]
    ldr r4, =0x12345678
    add r0, r0, r4      @ ( a + b ) - c + 0x12345678
    ldr r4, =x
    str r3, [r4]

@--- check the result by gdb at this point

    mov r7, #1          @ exit
    mov r0, #0
    swi 0

    .align
a:  .word 1234

.data
x:  .word 0

.end
