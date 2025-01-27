extern __errno_location

section .text
    global _ft_write
_ft_write:
    push rbx
    mov ecx, esi
    mov ebx, edi
    mov eax, 4
    int 80h
    jc _error

_exit:
    pop rbx
    ret

_error:
    neg rax
    push rax
    call __errno_location
    pop rdi
    mov [rax], edi
    jmp _exit
