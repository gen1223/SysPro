@ problems for final exam

.text
.global _start

_start:
    adr   r1, msg1
    ldr   r2, =msg2
    mov   r5, #6
lp:    
    ldrb  r0, [r1], #1
    tst   r0, #1
    moveq r0, r0, lsl #1
    strb  r0, [r2, #1]!
    subs  r5, r5, #1
    bgt   lp

    ldr   r2, =msg2
    ldr   r0, [r2]
    ldr   r3, =0x1020304
    add   r0, r0, r3
    str   r0, [r2]

    mov r0, #0
    mov r7, #1
    swi 0

msg1:
    .byte 11, 12, 13, 14, 15, 16

.data
msg2:
    .byte 0
    .skip 7

.end
