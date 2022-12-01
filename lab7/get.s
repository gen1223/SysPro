@------
@ choi++20201105 lib _my_getchar
@   read one char from keyboard
@   in: none
@   out: r0 = inputted char

.text
.global _my_getchar

_my_getchar:
    push {r1,r2,r7,lr}
    sub  sp, sp, #4
    mov r0, #0  @ fd = stdin
    mov r1, sp  @ =buf
    mov r2, #1  @ len = 1
    mov r7, #3  @ sys_read
    swi 0
    ldrb r0, [r1]
    add  sp, sp, #4
    pop {r1,r2,r7,pc}

.end
