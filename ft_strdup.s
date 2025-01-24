extern _ft_strlen
extern _ft_strcpy
extern malloc

section .text
    global _ft_strdup
_ft_strdup:
    push rcx
    call _ft_strlen
    add eax, 1
    mov edi, eax
    call malloc

_ft_strdup_next:
    mov esi, edi
    mov edi, eax
    call _ft_strcpy
    mov eax, edi

_exit:
    pop rcx
    ret
