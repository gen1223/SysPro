@ choi++20201118 lab9-a call assembly function from c

.text
.global readnum
.global printnum

@---------------------
@ read decimal number
@ int readnum()
@   in: none
@   out: r0 = decimal number

readnum:
    push    {r1-r4, r7, lr}
    sub     sp, sp, #4
    sub     r4, r4, r4      @ r4 = input number
rn0:
    mov     r0, #0          @ read one char
    mov     r1, sp
    mov     r2, #1
    mov     r7, #3
rn1:
    swi     0

    ldrb    r3, [r1]
    subs    r3, r3, #'0'
    blt     rn2
    cmp     r3, #9
    bgt     rn2
    
    @ calculate decimal sum
    @ r4 = r4 * 10 + r3
    add     r4, r4, r4, lsl #2  @ *5=*(1+4)
    add     r4, r3, r4, lsl #1  @ *2 + r3
    b       rn1
rn2:
    mov     r0, r4
    add     sp, sp, #4
    pop     {r1-r4, r7, pc}

@----------------------
msgSize = 10

@ print decimal number and '\n'
@ int printnum(num)
@   in: num to display (=r0)
@   out: r0 = no. of chars to display except '\n'

printnum:
@ r0 : number to display
@ r1 : remainder
@ r2 : (end of buff) + 1
@ r5 : pointer to buff

    push    {r1-r5, r7, lr}
    sub     sp, sp, #12
    mov     r5, sp              @ =msg
    add     r5, r5, #msgSize
    mov     r2, r5
    mov     r1, #'\n'           @ add newline
    strb    r1, [r5, #-1]!
dd1:
    bl      divmod
    add     r1, r1, #'0'
    strb    r1, [r5, #-1]!
    cmp     r0, #0
    bne     dd1

    @ sys_write(stdout, &buff, len)
    mov     r1, r5
    mov     r0, #1
    sub     r2, r2, r5
    mov     r7, #4
    swi     0

    sub     r0, r2, #1      @ num of chars disp except '\n'
    add     sp, sp, #12
    pop     {r1-r5, r7, pc}     @ return


@-----------------------
@ get int-div by 10, remainder
@   in:     r0 = n
@   out:    r0 = n / 10, r1 = n % 10

divmod:
    push    {r2-r4,lr}
	mov	    r3, r0
	movw	r2, #0x6667 @#26215
	movt	r2, #0x6666 @26214
	smull	r1, r4, r2, r0
	mov	    r1, r0, asr #31
	rsb	    r2, r1, r4, asr #2
    mov     r0, r2              @ r0 = n / 10
	add	    r4, r2, r2, asl #2
	sub	    r1, r3, r4, asl #1  @ r1 = n % 10
    pop     {r2-r4,pc}

.end
