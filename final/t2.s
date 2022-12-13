@ Assemble code

.text
.global _start
_start:
loop:
    mov r2, r0
    mov r3, r1, LSL #1
    adds r0, r2, r3
    strge r0, [r4]
    ldrlt r0, [r5, r3]!
    beq loop
    swi  0
