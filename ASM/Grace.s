bits 64

%define NAME "Grace_kid.s"
%define SRC "bits 64%1$c%1$c%%define NAME %2$cGrace_kid.s%2$c%1$c%%define SRC %2$c%3$s%2$c%1$c%%macro RUN 0%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$csection .data%1$c    name: db NAME, 0%1$c    src: db SRC, 0%1$c    write_mode: db %2$cw%2$c, 0%1$c"
%macro RUN 0
extern fprintf
extern fopen
extern fclose
section .data
    name: db NAME, 0
    src: db SRC, 0
    write_mode: db "w", 0

section .text
global main

main:
	push rbp
	mov rbp, rsp

	mov rdi, name
	mov rsi, write_mode
	call fopen
	cmp rax, 0
	je exit

    mov rbx, rax
    mov rdi, rbx
	mov rsi, src
	mov rdx, 10
	mov rcx, 34
	mov r8, src
	call fprintf

	mov rdi, rbx
	call fclose
	pop rbp

exit:
	mov rax, 60
	xor rdi, rdi
	syscall
%endmacro

; See my kid !

RUN
