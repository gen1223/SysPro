@ choi++20201014
@ lab5-b get char from stdin (#0) and disp it to stdout (#1)
@        exit if '.' inputted

.text

_start: .global _start
    ldr r1, =buf            @ *buf
    mov r2, #1              @ len
loop:
    mov r0, #0              @ stdin
    mov r7, #3              @ sys_read
    swi 0
    ldr r3, [r1]
    cmp r3, #'.'            @ check char inputted
    beq end_loop
    bl  disp_char
    b   loop

end_loop:
    mov r7, #1      @ sys_exit
    mov r0, #0
    swi 0

disp_char:  
    @ r1 = ptr to char
    mov r7, #4      @ sys_write
    mov r0, #1      @ stdout
    mov r2, #1      @ one char
    swi 0
    mov pc, lr      @ return

    .align
.data
buf:
    .word 0 

.end
