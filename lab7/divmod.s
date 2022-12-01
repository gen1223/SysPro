@-------
@ choi++20201105 lib divmod

.text
.global _my_divmod

_my_divmod:     @ get int-div by 10, remainder
@   in:     r0 = n
@   out:    r0 = n / 10, r1 = n % 10
    push    {r2-r4,lr}
	mov	    r3, r0
	movw	r2, #0x6667 @#26215
	movt	r2, #0x6666 @26214
	smull	r1, r4, r2, r0
	mov	    r1, r0, asr #31
	rsb	    r2, r1, r4, asr #2
    mov     r0, r2                  @ r0 = n / 10
	add	    r4, r2, r2, asl #2
	sub	    r1, r3, r4, asl #1      @ r1 = n % 10
    pop     {r2-r4,pc}

.end
