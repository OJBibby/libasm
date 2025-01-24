extern _ft_strlen
extern _ft_strcpy
extern malloc

section .text
    global _ft_strdup
_ft_strdup:
    push rcx
    push rdi
    call _ft_strlen
    add eax, 1
    mov edi, eax
    call malloc
    pop rdi
    push rax
    mov esi, edi
    mov edi, eax
    call _ft_strcpy
    pop rax

_exit:
    pop rcx
    ret
