@ choi++20201105 using libchoi.a

.text
.global _start
.extern _my_disp_nl
.extern _my_exit

_start:
    bl _my_disp_nl
    bl _my_disp_nl
    bl _my_disp_nl
    mov r0, #0
    b  _my_exit

.end
