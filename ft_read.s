extern __errno_location

section .text
    global ft_read
ft_read:
    push rbx
    xor rax, rax
    mov rbx, rdi
    mov rcx, rsi
    int 80h
    jc error

exit:
    pop rbx
    ret

error:
    neg rax
    push rax
    call __errno_location
    pop rbx
    mov [rax], rbx
    mov rax, -1
    jmp exit
