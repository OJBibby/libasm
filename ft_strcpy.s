section .text
    global _ft_strcpy
_ft_strcpy:
    push rax
    xor rax, rax

_ft_strcpy_next:
    mov byte al, [esi]
    mov byte [edi], al
    cmp [edi], byte 0
    jz _exit
    inc esi
    inc edi
    jmp _ft_strcpy_next

_exit:
    pop rax
    ret 
