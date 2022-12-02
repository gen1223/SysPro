.text
@ lab3-2 get char from stdin (#0) and disp it to stdout (#1)
@        exit if '.' inputted 
_start: .global _start
    adr r1, buf             @ *buf
    mov r2, #2              @ len
    ldr r4, =0x2e0a         @ ".\n"
loop:
    mov r0, #0              @ stdin
    mov r7, #3              @ sys_read
    swi 0
    ldr r3, [r1]
    cmp r3, r4              @ check char inputted ".\n"
dp1:
    beq end_loop
    bl  disp_char
    b   loop

end_loop:
    mov r7, #1      @ sys_exit
    mov r0, #0
    swi 0

disp_char:  
    @ r1 = ptr to chars
    mov r7, #4      @ sys_write
    mov r0, #1      @ stdout
    mov r2, #2      @ two char
    swi 0
    mov pc, lr      @ return

    .align
buf:
    .word 0 

.end
