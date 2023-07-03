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
	link_cmd: db "gcc -Wextra -Wall -Werror -no-pie Sully_%d.o -o Sully_%d", 0
	exec_cmd: db "./Sully_%d", 0
	x: equ 5
	code : db "bits 64%1$c%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$cextern snprintf%1$cextern system%1$cglobal main%1$c%1$csection .data%1$c", 0

    write_mode: db "w", 0

section .bss
	buff_asm: resb 50
	buff_link: resb 80
	buff_execute: resb 50
	buff_name: resb 50

section .text

main:
	push rbp
	
check_x:
	mov rax, x
	cmp rax, 0
	jle return

snprintf_name:
	mov rdi, buff_name
	mov rsi, 50
	mov rdx, name
	mov rcx, x - 1
	call snprintf

snprintf_assemble:
	mov rdi, buff_asm
	mov rsi, 50
	mov rdx, asm_cmd
	mov rcx, x - 1
	call snprintf

snprintf_link:
	mov rdi, buff_link
	mov rsi, 80
	mov rdx, link_cmd
	mov rcx, x - 1
	mov r8, x - 1
	call snprintf

open_fd:
    mov rdi, buff_name
    mov rsi, write_mode
    call fopen
    cmp rax, 0
    je ret_error

print_file:
	mov rbx, rax
   	mov rdi, rbx
	mov rsi, code
	mov rdx, 10
	mov rcx, 34
	mov r8, code
	call fprintf

close:
    mov rdi, rbx
    call fclose

exec:
	mov rdi, buff_asm
	call system
	mov rdi, buff_link
	call system
	mov rdi, buff_execute
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