bits 64

extern fprintf
extern fopen
extern fclose
extern snprintf
global main

section .data
	source_name: db "Sully_%d.s", 0
	asm_cmd: db "nasm -f elf64 Sully_%d.s", 0
	compile_cmd: db "gcc -Wextra -Wall -Werror -no-pie Sully_%d.o -o Sully_%d", 0
	exec_cmd: db "./Sully_%d", 0
	x: equ 5

    write_mode: db "w", 0

section .text

main:
	
	; check x
	mov rax, x
	cmp rax, 0
	jle return ; jump if less or equal

return:
	mov rax, 60
	xor rdi, rdi
	syscall