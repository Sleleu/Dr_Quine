bits 64

extern fprintf
extern fopen
extern fclose
extern snprintf
extern system
global main

section .data
	name: db "Sully_%d.s", 0
	asm_cmd: db "nasm -f elf64 Sully_%d.s", 0
	compile_cmd: db "gcc -Wextra -Wall -Werror -no-pie Sully_%d.o -o Sully_%d", 0
	exec_cmd: db "./Sully_%d", 0
	x: equ 5

    write_mode: db "w", 0

section .bss
	buff_compile: resb 80
	buff_execute: resb 50
	buff_name: resb 50

section .text

main:
	push rbp
	
	; check x
	mov rax, x
	cmp rax, 0
	jle return


	;snprintf name
	mov rdi, buff_name
	mov rsi, 50
	mov rdx, name
	mov rcx, x - 1
	call snprintf

	; open
    mov rdi, buff_name
    mov rsi, write_mode
    call fopen
    cmp rax, 0 ; check error
    je ret_error

   	mov rbx, rax ; if no error while open

exec:
	mov rdi, compile_cmd
	call system
	mov rdi, exec_cmd
	call system

return:
	mov rax, 60
	xor rdi, rdi
    pop rbp
	syscall

ret_error:
	mov rax, 60
	mov rdi, 1
	pop rbp
	syscall