section .text
    global _ft_read
_ft_read:
    push rbx
    push rcx
    mov eax, 3
    mov ebx, edi
    mov ecx, esi
    int 80h

    pop rcx
    pop rbx
    ret
