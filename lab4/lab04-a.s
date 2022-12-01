@ test for writing to data section
@  add 1 ~ 100, put the result into "result:"
@        check the result by using gdb

.text
.global _start

_start:
    mov r0, #0      @ r0 = sum
    mov r1, #0      @ r1 = index
loop:
    add r1, r1, #1
    add r0, r0, r1
    cmp r1, #100
    blt loop
    ldr r4, =result
    str r0, [r4]

    mov r7, #1      @ exit
    mov r0, #0
    swi 0
    
.data
    .align
result:
    .word 0

.end
