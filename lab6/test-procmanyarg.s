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
	.file	"test-procmanyarg.c"
	.text
	.align	2
	.global	sum
	.thumb
	.thumb_func
	.type	sum, %function
sum:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	adds	r0, r0, r1
	adds	r0, r0, r2
	adds	r0, r0, r3
	ldr	r4, [sp, #4]
	adds	r0, r0, r4
	pop	{r4}
	bx	lr
	.size	sum, .-sum
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	mov	r3, #5
	str	r3, [sp, #0]
	mov	r0, #1
	mov	r1, #2
	mov	r2, #3
	mov	r3, #4
	bl	sum
	add	sp, sp, #12
	pop	{pc}
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
