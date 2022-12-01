@ self-check the eos
@ choi++20200918

.text

_start: .global _start
	@ r3 <= msg
	@ r4 <= idx
	adr r3, msg 	@ r3 = msg
	mov r4, #0 	    @ r4 = idx = 0

loop: 
@	cmp r4, #14 	@ while(idx < 14)
@   bge exit
    @ r3 <= msg
	@ r4 <= idx
	@ sys_write(fd, ptr, len);
	@ r7 = 4    r0   r1   r2
	mov r0, #1 	    @ fd = stdout
	add r1, r3, r4 	@ ptr = @msg[idx]
    
    ldrb r5, [r1]
    cmp r5, #0
    beq exit

	mov r2, #1 	    @ len = 1
	mov r7, #4 	    @ **can move above loop
	swi 0 		    @ sys_write(1, &msg[idx], 1)
	add r4, r4, #1 	@ idx ++;
	b loop 		    @ }

exit: 	@ sys_exit(0)
		@ r7 = 1 r0
	mov r0, #0      @ exit code = 0
	mov r7, #1
	swi 0           @ sys_exit(0)
	
    .align
msg: .asciz "Hello, World!\nHello, System Programming!!!\n"

.end
