@----------------
@ choi++20201105 lib for display 32bit decimal number 

    @ input: r0 = number to display

.extern _my_divmod
.global _my_disp_dec

msgSize = 10

_my_disp_dec:
@ r0 : number to display
@ r1 : remainder
@ r2 : (end of buff) + 1
@ r5 : pointer to buff

    push {r0-r5, r7, lr}
    sub  sp, sp, #12
    mov  r5, sp          @ =msg
    add  r5, r5, #msgSize
    mov  r2, r5

dd1:
    bl   _my_divmod
    add  r1, r1, #'0'
    strb r1, [r5, #-1]!
    cmp  r0, #0
    bne  dd1

    @ sys_write(stdout, &buff, len)
    mov  r1, r5
    mov  r0, #1
    sub  r2, r2, r5
    mov  r7, #4
    swi  0
    add  sp, sp, #12
    pop  {r0-r5, r7, pc} @ return
