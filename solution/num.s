@ convert 32bit-number to visible character (HEX)
@ choi++20200917
@ - Nibble -> Byte
@ - 0~9: +0x30
@ - A~F: +0x37

.data
res0:
    .byte '0', 'x'
res:
    .asciz "00000000\n"

.text
.global _start

_start:
    ldr r7, =0x1234

    ldr r4, =res
    mov r2, #8              @ index
    add r4, r4, r2
lp0:    
    sub r2, r2, #1
    sub r4, r4, #1
    mov r0, r7
    and r0, r0, #0xF
    mov r1, #0x30		@--
    cmp r0, #10		@ cmp r0, #10
    blt lp1			@ addlt r0, r0, #0x30   ('0')
    mov r1, #0x37		@ addge r0, r0, #0x37 ('A'-10)
lp1:				@--
    add r0, r0, r1		@--
    strb r0, [r4]
    mov r7, r7, LSR #4      @ next nibble
    cmp r2, #0
    bne lp0

    mov r7, #4          @ sys_write
    mov r0, #1
    ldr r1, =res0
    mov r2, #11
    swi 0

    mov r7, #1          @ sys_exit
    mov r0, #0
    swi 0

.end
