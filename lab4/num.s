@ convert 32bit-number to visible character (HEX)
@ choi++20200917
@ - Nibble -> Byte
@ - 0~9: +0x30
@ - A~F: +0x37
.data
res:
    .asciz "00000000"


.text
.global _start
_start:
    ldr r7, =0x1234

@    adr r4, res
    ldr r4, =res
    add r4, r4, #7
    mov r0, r7
    and r0, r0, #0xF
    mov r1, #0x30
    cmp r0, #10
    blt lp1
    mov r1, #0x37
lp1:
    add r0, r0, r1
    strb r0, [r4]

    mov r7, #4          @ sys_write
    mov r0, #1
    adr r1, res
    mov r2, #8
    swi 0

    mov r7, #1          @ sys_exit
    mov r0, #0
    swi 0

.end
