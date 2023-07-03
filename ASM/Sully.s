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
    x: equ -1
    code: db "bits 64%1$c%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$cextern snprintf%1$cextern system%1$cglobal main%1$c%1$csection .data%1$c    name: db %2$cSully_%%d.s%2$c, 0%1$c    asm_cmd: db %2$cnasm -f elf64 Sully_%%d.s%2$c, 0%1$c    link_cmd: db %2$cgcc -Wextra -Wall -Werror -no-pie Sully_%%d.o -o Sully_%%d%2$c, 0%1$c    exec_cmd: db %2$c./Sully_%%d%2$c, 0%1$c    x: equ %4$d%1$c    code: db %2$c%3$s%2$c, 0%1$c%1$c    write_mode: db %2$cw%2$c, 0%1$c%1$csection .bss%1$c    buff_asm: resb 50%1$c    buff_link: resb 80%1$c    buff_execute: resb 50%1$c    buff_name: resb 50%1$c%1$csection .text%1$c%1$cmain:%1$c    push rbp%1$c%1$ccheck_x:%1$c    mov rax, x%1$c    cmp rax, 0%1$c    jl return%1$c%1$csnprintf_name:%1$c    mov rdi, buff_name%1$c    mov rsi, 50%1$c    mov rdx, name%1$c    mov rcx, x%1$c    call snprintf%1$c%1$csnprintf_assemble:%1$c    mov rdi, buff_asm%1$c    mov rsi, 50%1$c    mov rdx, asm_cmd%1$c    mov rcx, x%1$c    call snprintf%1$c%1$csnprintf_link:%1$c    mov rdi, buff_link%1$c    mov rsi, 80%1$c    mov rdx, link_cmd%1$c    mov rcx, x%1$c    mov r8, x%1$c    call snprintf%1$c%1$csnprintf_execute:%1$c    mov rdi, buff_execute%1$c    mov rsi, 50%1$c    mov rdx, exec_cmd%1$c    mov rcx, x%1$c    call snprintf%1$c%1$copen_fd:%1$c    mov rdi, buff_name%1$c    mov rsi, write_mode%1$c    call fopen%1$c    cmp rax, 0%1$c    je ret_error%1$c%1$cprint_file:%1$c    mov rbx, rax%1$c    mov rdi, rbx%1$c    mov rsi, code%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, code%1$c    mov r9, x - 1%1$c    call fprintf%1$c%1$cclose:%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$cexec:%1$c    mov rdi, buff_asm%1$c    call system%1$c    mov rdi, buff_link%1$c    call system%1$c    mov rdi, buff_execute%1$c    call system%1$c%1$creturn:%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    pop rbp%1$c    syscall%1$c%1$cret_error:%1$c    mov rax, 60%1$c    mov rdi, 1%1$c    pop rbp%1$c    syscall%1$c", 0

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
    jl return

snprintf_name:
    mov rdi, buff_name
    mov rsi, 50
    mov rdx, name
    mov rcx, x
    call snprintf

snprintf_assemble:
    mov rdi, buff_asm
    mov rsi, 50
    mov rdx, asm_cmd
    mov rcx, x
    call snprintf

snprintf_link:
    mov rdi, buff_link
    mov rsi, 80
    mov rdx, link_cmd
    mov rcx, x
    mov r8, x
    call snprintf

snprintf_execute:
    mov rdi, buff_execute
    mov rsi, 50
    mov rdx, exec_cmd
    mov rcx, x
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
    mov r9, x - 1
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
