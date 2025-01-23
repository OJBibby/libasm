section .text
    global _ft_strcpy
_ft_strcpy:
    push eax
    xor eax, eax

_ft_strcpy_next:
    mov byte al, [esi]
    mov byte [edi], al
    cmp [edi], byte 0
    jz _exit
    inc esi
    inc edi
    jmp _ft_strcpy_next

_exit:
    pop eax
    ret 
