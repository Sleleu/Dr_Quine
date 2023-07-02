bits 64

section .data
    code: db "bits 64%1$c%1$csection .data%1$c    code: db %2$c%3$s%2$c%1$c%1$csection .text%1$cglobal main%1$cextern printf%1$cextern fflush%1$c%1$c; Hey i'm outside !%1$c%1$cmain:%1$c    ; Hey i'm inside !%1$c    jmp display_code%1$c%1$cdisplay_code:%1$c    push rbp%1$c    mov rbp, rsp%1$c    mov rdi, code%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    mov rcx, code%1$c    call printf wrt ..plt%1$c    mov rdi, 0%1$c    call fflush wrt ..plt%1$c    pop rbp%1$c    mov rax, 60%1$c    mov rdi, 0%1$c    syscall%1$c"

section .text
global main
extern printf
extern fflush

; Hey i'm outside !

main:
    ; Hey i'm inside !
    jmp display_code

display_code:
    push rbp
    mov rbp, rsp
    mov rdi, code
    mov rsi, 10
    mov rdx, 34
    mov rcx, code
    call printf wrt ..plt
    mov rdi, 0
    call fflush wrt ..plt
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall
