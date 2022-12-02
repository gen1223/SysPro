
@ choi++20201019 test to display 32bit hexnumbers

.text
_start: .global _start

    mov r0, #0x23   @ immediate value 8bit
    bl  disp_hex
    bl  disp_nl     @ display newline

    ldr r0, =0x456789ab     @ 32bit value can be loaded indirectly .ltorg
    bl  disp_hex
    bl disp_nl      @ display newline

    mov r0, #0
    mov r7, #1      @ exit
    swi 0


@----- disp_hex
    @ display 32bit hexnumber
    @ input: r0 = number to display
disp_hex:
@ r4 : hexnumber to display
@ r0 : counter
@ r2 : flag to escape skiping zeros
@ r3 : Temporary storage for hexadecimal number
@ r5 : pointer to add hexadecimal character

    push {r0-r5, r7}
    mov r4, r0
    mov r0, #8
    mov r2, #0
    ldr r5, =msg
    mov r1, r5

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
    strb r3, [r5], #1   @ store the number character !! post-indexed
    subs r0, r0, #1     @ reduce counter when non-ze
    bge loop3           @ until counter goes negative,

print:
@    mov r3, #''         @ null
@    strb r3, [r5], #1

    @ sys_write(stdout, &hex[cnt], len)
    mov r0, #1
    sub r2, r5, r1
    mov r7, #4
    swi 0

    pop {r0-r5, r7}
    mov pc, lr          @ return

@ display newline
disp_nl:
    push {r0-r2,r7}
    mov r0, #1
    adr r1, buf
    mov r2, #1
    mov r7, #4
    swi 0
    pop {r0-r2, r7}
    mov pc, lr          @ return
buf:
    .byte '\n'

.data
msg: .skip 9

.end

