extern __errno_location

section .text
    global ft_write
ft_write:
    mov rax, 1
    syscall
    jc error

exit:
    ret

error:
    neg rax
    push rax
    call __errno_location
    pop rdi
    mov [rax], rdi
    mov rax, -1
    jmp exit
