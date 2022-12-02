
@ choi++20201019 test to display 32bit decimal numbers

msgSize = 10

.text
_start: .global _start

    mov r0, #0x23   @ immediate value 8bit
    bl  disp_dec
    bl  disp_nl     @ display newline

    ldr r0, =0x456789ab     @ 32bit value can be loaded indirectly .ltorg
    bl  disp_dec
    bl disp_nl      @ display newline

    mov r0, #0
    mov r7, #1      @ exit
    swi 0


@----- disp_dec
    @ display 32bit decimal number
    @ input: r0 = number to display
disp_dec:
@ r0 : number to display
@ r1 : remainder
@ r2 : (end of buff) + 1
@ r5 : pointer to buff

    push {r0-r5, r7, lr}
    ldr r5, =msg
    add r5, r5, #msgSize
    mov r2, r5

loop3:
    bl  divmod
    add r1, r1, #'0'
    strb r1, [r5, #-1]!
    cmp r0, #0
    bne loop3

print:
@    mov r3, #''         @ null
@    strb r3, [r5], #1
    @ sys_write(stdout, &hex[cnt], len)
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
    adr r1, buf
    mov r2, #1
    mov r7, #4
    swi 0
    pop {r0-r2, r7}
    mov pc, lr          @ return
buf:
    .byte '\n'

.align
.data
msg: .skip msgSize

.end

