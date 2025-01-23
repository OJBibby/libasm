extern _ft_strlen
extern _ft_strcpy

section .text
    global _start
_start:
    call _strlen_test
    call _strcpy_test
    mov eax, 1
    mov ebx, 0
    int 80h

_strlen_test:
    mov edi, str1
    call _ft_strlen
    
    mov edx, eax
    mov ecx, str1
    mov ebx, 1
    mov eax, 4
    int 80h

    mov edx, 1
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 80h

    ret

_strcpy_test:
    mov esi, str2
    mov edi, copied_str2
    call _ft_strcpy
    
    mov edx, len2
    mov ecx, copied_str2
    mov ebx, 1
    mov eax, 4
    int 80h

    mov edx, 1
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 80h

    ret

section .data
    newline db 10
    str1 db "This is a string", 0
    str2 db "This string will be copied", 0
    len2 equ $ - str2

section .bss
    copied_str2: resb len2