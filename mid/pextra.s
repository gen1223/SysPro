.text
_start: .global _start

    ldr r4, =d1
    ldr r5, =a1
    ldr r1, [r4], #4
    ldr r2, [r4]
    add r0, r1, r2, lsl #3
    str r0, [r5], #4
    tst r0, #0x10
    streq r1, [r5], #4
    strne r2, [r5], #4
    tst r0, #0x20
    streq r2, [r5], #4
    strne r1, [r5], #4

    ldr r4, =d2
    sub r0, r0, r0
    mov r2, #5
l1:
    ldrb r3, [r4], #1
    add r0, r0, r3, lsl #2
    subs r2, r2, #1
    bne l1
    str r0, [r5], #4

    ldr r4, =d2
    sub r0, r0, r0
    mov r2, #4
    sub r1, r1, r1
l2:
    ldrb r3, [r4], #1
    add r0, r0, r3, lsl r1
    subs r2, r2, #1
    add r1, #4
    bne l2
    str r0, [r5]
    bx  lr

.data
d1: .word   0x1234, 0x4567
d2: .byte   1, 2, 3, 4, 5
    .align
a1: .skip   4
a2: .skip   4
a3: .skip   4
a4: .skip   4
a5: .skip   4
.end
