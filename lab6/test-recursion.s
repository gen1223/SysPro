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
	.file	"test-recursion.c"
	.text
	.align	2
	.global	print_dec
	.thumb
	.thumb_func
	.type	print_dec, %function
print_dec:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r1
	movw	r3, #51711
	movt	r3, 15258
	cmp	r1, r3
	it	gt
	movgt	r4, r0
	bgt	.L2
	add	r1, r1, r1, lsl #2
	lsl	r1, r1, #1
	cmp	r1, r0
	it	gt
	movgt	r4, r0
	bgt	.L2
	bl	print_dec
	mov	r4, r0
.L2:
	cmp	r4, r5
	it	lt
	movlt	r0, #0
	blt	.L3
	mov	r0, #0
	rsb	r3, r5, #0
.L4:
	adds	r4, r4, r3
	add	r0, r0, #1
	cmp	r5, r4
	ble	.L4
.L3:
	add	r0, r0, #48
	movw	r3, #:lower16:stdout
	movt	r3, #:upper16:stdout
	ldr	r1, [r3, #0]
	bl	_IO_putc
	mov	r0, r4
	pop	{r3, r4, r5, pc}
	.size	print_dec, .-print_dec
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	mov	r0, #254
	mov	r1, #1
	bl	print_dec
	movw	r3, #:lower16:stdout
	movt	r3, #:upper16:stdout
	ldr	r1, [r3, #0]
	mov	r0, #10
	bl	_IO_putc
	pop	{r3, pc}
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
