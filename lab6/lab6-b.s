@ choi++20201028 lab6-b proc with many parameters

.text
.global _start

func:
	push	{r4}
    add     r1, r1, r1          @ 2*r1
    add     r2, r2, r2, lsl #1  @ 3*r2
    mov     r3, r3, lsl #2      @ 4*r3
    ldr     r4, [sp, #4]
    add     r4, r4, r4, lsl #2  @ 5*r4
	add 	r0, r0, r1
	add	    r0, r0, r2
	add	    r0, r0, r3
	add	    r0, r0, r4
	pop	    {r4}
	bx	    lr

_start:
	push	{lr}
	sub	    sp, sp, #12
	mov	    r3, #5
	str	    r3, [sp, #0]
	mov	    r0, #1
	mov	    r1, #2
	mov	    r2, #3
	mov	    r3, #4
	bl	    func
	add	    sp, sp, #12
	pop	    {pc}

.end
