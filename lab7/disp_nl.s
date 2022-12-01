@------
@ choi++20201105 lib _my_disp_nl
@   display new line
@   in: none
@   out: none

.text
.global _my_disp_nl

@ display newline
_my_disp_nl:
    push {r0-r2,r7,lr}
    mov r0, #1
    adr r1, lf
    mov r2, #1
    mov r7, #4
    swi 0
    pop {r0-r2,r7,pc}   @ return
lf:
    .byte '\n'

.end
