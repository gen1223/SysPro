
@ choi++20201019 test to display 32bit binary number 

.text
_start: .global _start

    mov r0, #0x23   @ immediate value 8bit
    bl  disp_bin
    bl  disp_nl     @ display newline

    ldr r0, =0x456789ab     @ 32bit value can be loaded indirectly .ltorg
    bl  disp_bin
    bl disp_nl      @ display newline

    mov r0, #0
    mov r7, #1      @ exit
    swi 0


@----- disp_bin
    @ display 32bit binary number
    @ input: r0 = number to display
disp_bin:
@ r4 : number to display
@ r0 : counter
@ r2 : flag to escape skiping zeros
@ r3 : Temporary storage for binary number
@ r5 : pointer to add binary character

    push {r0-r5, r7}
    mov r4, r0
    mov r0, #32
    mov r2, #0
    ldr r5, =msg
    mov r1, r5

loop2: @ reduce counter when zero is in series
    subs r0, r0, #1     @ reduce counter when zeros
    addeq r2, #1        @ if end has reached r2 = 1

loop3:
    mov r4, r4, ror #31 @ rotate-left number once
    and r3, r4, #1      @ filter rotated number
    adds r2, r2, r3     @ if number is zero and not end 
    beq loop2           @ continue loop

    @ flow touches here if non-zero value once come out or end has reached
    add r3, r3, #'0'    @ convert binary to ascii
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
msg: .skip 32

.end

