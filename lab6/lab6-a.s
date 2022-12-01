@ choi++20201028 lab6-a get fibonacci number using recursion

.text
.global _start

fibo:
    push    {r1,r2,lr}
    cmp     r0, #1
    ble     f1          @ r0 <= 1
    mov     r2, r0
    sub     r0, r0, #2
    bl      fibo
    mov     r1, r0      @ r1 = fibo(x-2)
    mov     r0, r2
    sub     r0, r0, #1
    bl      fibo        @ r0 = fibo(x-1)
    add     r0, r0, r1
f1:
    pop     {r1,r2,pc}

_start:
    push    {lr}
    mov     r0, #8
    bl      fibo
    pop     {pc}

.end
