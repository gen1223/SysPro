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
	.file	"test-div.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	movw	r3, #:lower16:stdin
	movt	r3, #:upper16:stdin
	ldr	r0, [r3, #0]
	bl	_IO_getc
	mov	r3, r0
	movw	r2, #26215
	movt	r2, 26214
	smull	r1, r2, r2, r0
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #2
	add	ip, r2, r2, asl #2
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	mov	r1, r3
	sub	r3, r3, ip, asl #1
	bl	printf
	ldmfd	sp!, {r3, pc}
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"m: %d div: %d rem: %d\012\000"
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
