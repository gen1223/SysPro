@
@ lab5-c input chars from stdin and add all numbers
@        display the result on stdout in binary number
@   choi++20201014

.text
_start:
    .global _start

    sub r5, r5, r5  @ num = 0
    ldr r1, =ibuf   @ input buffer
    mov r2, #1      @ lenth=1
lp0:
    @ c = getchar()
    mov r0, #0      @ stdin
    mov r7, #3      @ syscall-read
    swi 0

    ldrb r0, [r1]   @ c
    mov r4, r0
    subs r0, r0, #'0'   @ c = c -'0'
    blt lp1         @ c >= 0?
    cmp r0, #9      @ c <= 9?
    bgt lp1
    add r5, r5, r0  @ num += c - '0'

lp1:
    cmp r4, #'\n'   @ while (c!='\n')
    bne lp0

    @ display num in binary number
    ldr r1, =obuf   @ output buffer
    mov r2, #1
    mov r0, #1      @ stdout
    mov r7, #4      @ syscall-write

    mov r4, #32     @ rotate counter
lp2:
    mov r5, r5, ror #31 @ ror 31 is same as rol 1
    tst r5, #1      @ check LSB (originally MSB)
    mov r3, #'1'
    bne lp3
    mov r3, #'0'
lp3:
    strb r3, [r1]
    swi 0
    subs r4, r4, #1
    bne lp2

    mov r3, #'\n'   @ display \n
    strb r3, [r1]
    swi 0

    @ exit
    mov r7, #1
    mov r0, #0
    swi 0

    .align
.data
ibuf:   .skip 4
obuf:   .skip 4

.end
