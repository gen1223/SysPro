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
	.file	"sum.c"
	.text
	.align	2
	.global	sum
	.thumb
	.thumb_func
	.type	sum, %function
sum:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r0, r0, r1
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
	push	{r3, lr}
	mov	r0, #2
	mov	r1, #3
	bl	sum
	pop	{r3, pc}
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
