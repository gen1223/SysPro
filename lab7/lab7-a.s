@ choi++20201105 lab7-a
@   test lib _my_getchar, _my_putchar

.text
.global _start
.extern _my_getchar
.extern _my_putchar
.extern _my_disp_nl
.extern _my_exit

_start:
    bl _my_getchar
    bl _my_putchar
    bl _my_disp_nl
    b  _my_exit

.end
