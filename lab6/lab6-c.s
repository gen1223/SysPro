@ choi++20201028 lab6-c 
@       get num 0 ~ 9
@       display fibonacci num (lab6-a) using disp_dec 

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
    @ get char (sys_read)
    mov     r0, #0
    ldr     r1, =buf
    mov     r2, #1
    mov     r7, #3
    swi     0

@    mov     r0, #8
    ldr     r1, =buf
    ldr     r0, [r1]
    sub     r0, r0, #'0'
    bl      fibo
    bl      disp_dec
    bl      disp_nl

    @ sys_exit
    mov     r0, #0
    mov     r7, #1
    swi     0

@----------------
@ choi++20201019 display 32bit decimal number 

    @ input: r0 = number to display

msgSize = 10

disp_dec:
@ r0 : number to display
@ r1 : remainder
@ r2 : (end of buff) + 1
@ r5 : pointer to buff

    push {r0-r5, r7, lr}
    ldr r5, =msg
    add r5, r5, #msgSize
    mov r2, r5

dd1:
    bl  divmod
    add r1, r1, #'0'
    strb r1, [r5, #-1]!
    cmp r0, #0
    bne dd1

    @ sys_write(stdout, &buff, len)
    mov r1, r5
    mov r0, #1
    sub r2, r2, r5
    mov r7, #4
    swi 0
    pop {r0-r5, r7, pc} @ return

divmod:     @ get int-div by 10, reminder
@   in:     r0 = n
@   out:    r0 = n / 10, r1 = n % 10
    push    {r2-r4}
	mov	    r3, r0
	movw	r2, #0x6667 @#26215
	movt	r2, #0x6666 @26214
	smull	r1, r4, r2, r0
	mov	    r1, r0, asr #31
	rsb	    r2, r1, r4, asr #2
    mov     r0, r2                  @ r0 = n / 10
	add	    r4, r2, r2, asl #2
	sub	    r1, r3, r4, asl #1      @ r1 = n % 10
    pop     {r2-r4}
    mov     pc, lr

@ display newline
disp_nl:
    push {r0-r2,r7}
    mov r0, #1
    adr r1, lf
    mov r2, #1
    mov r7, #4
    swi 0
    pop {r0-r2, r7}
    mov pc, lr          @ return
lf:
    .byte '\n'

.align
.data
buf: .skip 4
msg: .skip msgSize

.end

