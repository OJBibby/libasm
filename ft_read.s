extern __errno_location

section .text
    global ft_read
ft_read:
    mov rax, 0
    syscall
    jc error

exit:
    ret

error:
    neg rax
    push rax
    call __errno_location
    pop rbx
    mov [rax], rbx
    mov rax, -1
    jmp exit
