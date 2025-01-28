section .text
    global ft_strcpy
ft_strcpy:
    xor rax, rax

ft_strcpy_next:
    mov byte al, [rsi]
    mov byte [rdi], al
    cmp byte [rdi], 0
    jz exit
    inc rsi
    inc rdi
    jmp ft_strcpy_next

exit:
    ret 
