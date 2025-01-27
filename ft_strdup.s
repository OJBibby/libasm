extern _ft_strlen
extern _ft_strcpy
extern malloc

section .text
    global _ft_strdup
_ft_strdup:
    push rdi
    call _ft_strlen
    add rax, 1
    mov rdi, rax
    push rdi
    call malloc
    cmp eax, dword (0)
    je _error
    pop rdi
    pop rdi
    push rax
    mov rsi, rdi
    mov rdi, rax
    call _ft_strcpy
    pop rax

_exit:
    ret

_error:
    pop rdi
    pop rdi
    jmp _exit
