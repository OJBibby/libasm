section .text
    global ft_strcmp
ft_strcmp:
    cmp byte [rdi], 0
    jz second_str
    cmp byte [rsi], 0
    jz first_str
    inc rdi
    inc rsi
    jmp ft_strcmp

first_str:
    xor rax, rax
    mov byte al, [rdi]
    neg rax
    jmp exit

second_str:
    xor rax, rax
    mov byte al, [rsi]
    jmp exit

exit:
    ret
