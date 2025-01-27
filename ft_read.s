extern __errno_location

section .text
    global _ft_read
_ft_read:
    push rbx
    mov eax, 3
    mov ebx, edi
    mov ecx, esi
    int 80h
    jc _error

_exit:
    pop rbx
    ret

_error:
    neg rax
    push rax
    call __errno_location
    pop rbx
    mov [rax], ebx
    jmp _exit
