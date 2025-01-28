extern __errno_location

section .text
    global ft_read
ft_read:
    xor rax, rax
    int 80h
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
