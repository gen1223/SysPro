
@ display hexnumber

@ r4 : hexnumber to display
@ r0 : counter
@ r2 : flag to escape skiping zeros
@ r3 : Temporary storage for hexadecimal number
@ r12 : pointer to add hexadecimal character

    mov r0, #8
    mov r2, #0
    ldr r12, =msg
    mov r1, r12

loop2: @ reduce counter when zero is in series
    subs r0, r0, #1     @ reduce counter when zeros
    addeq r2, #1        @ if end has reached r2 = 1

loop3:
    mov r4, r4, ror #28 @ rotate-left number by 4
    and r3, r4, #0xf    @ filter rotated number
    adds r2, r2, r3     @ if number is zero and not end 
    beq loop2           @ continue loop

    @ flow touches here if non-zero value once come out or end has reached
    cmp r3, #9          @ if number is 0~9,
    addle r3, r3, #'0'  @ then add '0' -> '0' ~ '9'
    addgt r3, r3, #'A'-10 @ if number is A-F, add 'A'-10
    strb r3, [r12], #1  @ store the number character !! post-indexed
    subs r0, r0, #1     @ reduce counter when non-ze
    bge loop3           @ until counter goes negative,

print:
    mov r3, #''         @ null
    strb r3, [r12], #1

    @ sys_write(stdout, &hex[cnt], len)
    mov r0, #1
    sub r2, r12, r1
    mov r7, #4
    swi 0

.data
msg: .skip 9
