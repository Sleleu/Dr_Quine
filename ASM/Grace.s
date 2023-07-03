bits 64

%define NAME "Grace_kid.s"
%define SRC "bits 64%1$c%1$c%%define NAME %2$cGrace_kid.s%2$c%1$c%%define SRC %2$c%3$s%2$c%1$c%%macro RUN 0%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$csection .data%1$c    name: db NAME, 0%1$c    src: db SRC, 0%1$c    write_mode: db %2$cw%2$c, 0%1$c%1$csection .text%1$cglobal main%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c%1$c    mov rdi, name%1$c    mov rsi, write_mode%1$c    call fopen%1$c    cmp rax, 0%1$c    je exit%1$c%1$c    mov rbx, rax%1$c    mov rdi, rbx%1$c    mov rsi, src%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, src%1$c    call fprintf%1$c%1$c    mov rdi, rbx%1$c    call fclose%1$c    pop rbp%1$c%1$cexit:%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%%endmacro%1$c%1$c; See my kid !%1$c%1$cRUN%1$c"
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

exit:
    mov rax, 60
    xor rdi, rdi
    pop rbp
    syscall
%endmacro

; See my kid !

RUN
