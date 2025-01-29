extern __errno_location

section .text
    global ft_write
ft_write:
    push rbx
    mov rcx, rsi
    mov rbx, rdi
    mov rax, 4
    syscall
    jc error

exit:
    pop rbx
    ret

error:
    neg rax
    push rax
    call __errno_location
    pop rdi
    mov [rax], rdi
    mov rax, -1
    jmp exit
