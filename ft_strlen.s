section .text
    global _ft_strlen
_ft_strlen:
    push rcx
    xor rcx, rcx

_ft_strlen_next:
    cmp [rdi], byte 0
    jz _exit
    inc rcx
    inc rdi
    jmp _ft_strlen_next

_exit:
    mov rax, rcx
    pop rcx
    ret