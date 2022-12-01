@ choi++20201105 test lib lab7-c
@    test _my_disp_dec

.text
.global _start
.extern _my_disp_dec
.extern _my_getchar
.extern _my_disp_nl
.extern _my_exit

_start:
    bl _my_getchar
    bl _my_disp_dec
    bl _my_disp_nl
    mov r0, #0
    b _my_exit

.end
