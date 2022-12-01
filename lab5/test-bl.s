@
@ choi++20201023 test bl nesting

.text
_start: .global _start

    bl t1
    mov r0, #0
    mov r7, #1
    swi 0

t1:
    bl t2
    mov pc, lr

t2: 
@    bl t3
    mov pc, lr
t3: 
    bl t4
    mov pc, lr
t4: 
    bl t5
    mov pc, lr
t5: 
    bl t6
    mov pc, lr
t6: 
    mov pc, lr
.end
