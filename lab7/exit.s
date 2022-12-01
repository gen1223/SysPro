@ choi++20201105 lib _my_exit
@      exit
@   in: r0 = exit code

.text
.global _my_exit

_my_exit:
    mov r7, #1
    swi 0

.end
