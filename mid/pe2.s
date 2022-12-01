.text
_start: .global _start

    adr r0, msg
    ldr r0, =msg
    ldr r0, =msg1
    ldr r0, =0x2001
    bx lr
msg:
    .skip 4
.data
msg1:
    .skip 4
.end
