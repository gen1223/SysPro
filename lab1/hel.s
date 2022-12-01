.text
_start: .global _start
    @ sys_write ( fd, pstr, len )
    @ r7=4        r0  r1    r2
    mov r0, #1  @ fd <- stdout
    adr r1, msg
    mov r2, #14
    mov r7, #4
    swi 0
    mov r0, #0
    mov r7, #1
    swi 0
msg:
    .asciz "Hello, world!\n"
.end
