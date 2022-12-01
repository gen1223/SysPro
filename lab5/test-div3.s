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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	add	r1, sp, #4
	bl	__isoc99_scanf
	ldr	r1, [sp, #4]
	movw	r2, #26215
	movt	r2, 26214
	smull	r3, r2, r2, r1
	mov	r3, r1, asr #31
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	rsb	r2, r3, r2, asr #2
	bl	printf
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.space	1
.LC1:
	.ascii	"m: %d div: %d\012\000"
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
