section .text
    global _ft_strcmp
_ft_strcmp:
    cmp byte [edi], 0
    jz _exit
    cmp byte [esi], 0
    jz _exit
    inc edi
    inc esi
    jmp _ft_strcmp

_exit:
    xor eax, eax
    mov byte al, [edi]
    sub byte al, [esi]
    ret
