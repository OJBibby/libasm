section .text
    global _ft_strlen
_ft_strlen:
    push rcx
    xor rcx, rcx

_ft_strlen_next:
    cmp [edi], byte 0
    jz _exit
    inc ecx
    inc edi
    jmp _ft_strlen_next

_exit:
    mov eax, ecx
    pop rcx
    ret