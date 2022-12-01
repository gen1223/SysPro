@-----
@ choi++20201105 lib _my_putchar
@   display one char
@   in: r0 = char to display
@   out: none

.text
.global _my_putchar

_my_putchar:
    push {r0-r2,r7,lr}
    sub  sp, sp, #4
    mov  r1, sp         @ =buf
    strb r0, [r1]
    mov  r0, #1         @ fd = stdout
    mov  r2, #1         @ len
    mov  r7, #4         @ sys_write
    swi  0
    add  sp, sp, #4
    pop  {r0-r2,r7,pc}

.end
