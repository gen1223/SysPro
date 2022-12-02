@ understanding sections
@ choi++20200918
@ x = ( a + b ) - c + 0x12345678
@ check the x value by using gdb
@ why x variable can't be in .text section
@ why 'adr' can't be used for x 
@ what is the difference between =0x12.. and =x

.text

.global _start
_start:
    adr r4, a
    ldr r0, [r4]
    adr r4, b
    ldr r1, [r4]
    add r3, r0, r1      @ a + b
    adr r4, c
    ldr r2, [r4]
    sub r3, r3, r2      @ ( a + b ) - c
    ldr r4, =0x12345678
    add r3, r3, r4      @ ( a + b ) - c + 0x12345678
    adr r4, x
    str r3, [r4]

@--- check the result by gdb at this point

    mov r7, #1          @ exit
    mov r0, #0
    swi 0

    .align
a:  .word 1234
b:  .word 5678
c:  .word 4567
x:  .word 0

.end
