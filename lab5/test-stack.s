@ test stack command

.text
_start:
    .global _start

    push    r3, lr 

    push    {r1-r5}

    pop     {r5-r1}

    pop     r3, pc

    mov     r7, #1
    mov     r0, #0
    swi     0

.end
