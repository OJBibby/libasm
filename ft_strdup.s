extern ft_strlen
extern ft_strcpy
extern malloc

section .text
    global ft_strdup
ft_strdup:
    push rdi
    call ft_strlen
    add rax, 1
    mov rdi, rax
    push rdi
    call malloc
    cmp rax, qword (0)
    je error
    pop rdi
    pop rdi
    push rax
    mov rsi, rdi
    mov rdi, rax
    call ft_strcpy
    pop rax

exit:
    ret

error:
    pop rdi
    pop rdi
    jmp exit
