section .text
    global ft_strlen
ft_strlen:
    xor rcx, rcx

ft_strlen_next:
    cmp [rdi], byte 0
    jz exit
    inc rcx
    inc rdi
    jmp ft_strlen_next

exit:
    mov rax, rcx
    ret