	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"lab5-1.c"
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #24
	add	r4, sp, #4
	movw	r5, #:lower16:.LC0
	movt	r5, #:upper16:.LC0
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	strb	r3, [r4, #0]
	mov	r4, #0
	movw	r5, #:lower16:stdin
	movt	r5, #:upper16:stdin
.L3:
	ldr	r0, [r5, #0]
	bl	_IO_getc
	uxtb	r0, r0
	sub	r3, r0, #48
	uxtb	r3, r3
	cmp	r3, #9
	itt	ls
	subls	r3, r0, #48
	addls	r4, r4, r3
	cmp	r0, #10
	bne	.L3
	mov	r5, #8
	movw	r6, #:lower16:stdout
	movt	r6, #:upper16:stdout
.L4:
	asr	r3, r4, #28
	orr	r4, r3, r4, lsl #4
	and	r3, r4, #15
	add	r2, sp, #24
	adds	r3, r2, r3
	ldrb	r0, [r3, #-20]	@ zero_extendqisi2
	ldr	r1, [r6, #0]
	bl	_IO_putc
	subs	r5, r5, #1
	bne	.L4
	movw	r3, #:lower16:stdout
	movt	r3, #:upper16:stdout
	ldr	r1, [r3, #0]
	mov	r0, #10
	bl	_IO_putc
	add	sp, sp, #24
	pop	{r4, r5, r6, pc}
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"0123456789ABCDEF\000"
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
