@ choi++20201015
@ implement integer division by 10 not using div instruction
@   in:     r0 = n
@   out:    r0 = n / 10, r1 = n % 10

.text
_start: .global _start

    @ getchar
    mov r0, #0
    ldr r1, =buf
    mov r2, #1
    mov r7, #3
    swi 0

    ldrb r0, [r1]
    mov r3, r0
    ldr r4, =res
    bl  divmod
    add r1, r1, #'0'
    strb r1, [r4, #2]
    bl  divmod
    add r1, r1, #'0'
    strb r1, [r4, #1]
    bl  divmod
    add r1, r1, #'0'
    strb r1, [r4]

    @ puts
    mov r0, #1
    ldr r1, =res
    mov r2, #4
    mov r7, #4
    swi 0

    @ exit
    mov r0, #0
    mov r7, #1
    swi 0
    
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

.align
.data
buf:    .skip 4
res:    .asciz "000\n"

.end

