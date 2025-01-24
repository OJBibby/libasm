section .text
    global _ft_write
_ft_write:
    push rcx
    mov ecx, esi
    mov ebx, edi
    mov eax, 4
    int 80h

_exit:
    pop rcx
    ret