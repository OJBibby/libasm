extern __errno_location

section .text
    global _ft_write
_ft_write:
    push rcx
    mov ecx, esi
    mov ebx, edi
    mov eax, 4
    int 80h
    jc _error

_error:
    neg eax
    push rax
    call __errno_location
    pop rdi
    mov [rax], edi
    pop rcx
    ret

_exit:
    pop rcx
    ret
