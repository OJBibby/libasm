extern _ft_strlen
extern _ft_strcpy
extern _ft_strcmp
extern _ft_write
extern _ft_read
extern _ft_strdup
extern free

section .text
    global _start
_start:
    call _strlen_test
    call _strcpy_test
    call _strcmp_test
    call _write_test
    call _read_test
    call _strdup_test
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

    call _newline
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

    call _newline
    ret

_strcmp_test:
    mov edi, str3
    mov esi, str4
    call _ft_strcmp

    jz _equal
    jns _longer
    js _shorter

_equal:
    mov edx, 18
    mov ecx, equal_length
    mov ebx, 1
    mov eax, 4
    int 80h

    call _newline
    ret

_longer:
    mov edx, 23
    mov ecx, longer_length
    mov ebx, 1
    mov eax, 4
    int 80h

    call _newline
    ret

_shorter:
    mov edx, 24
    mov ecx, shorter_length
    mov ebx, 1
    mov eax, 4
    int 80h

    call _newline
    ret

_write_test:
    mov edi, 1
    mov esi, str5
    mov edx, str5_len
    call _ft_write
    call _newline
    ret

_read_test:
    mov eax, 5
    mov ebx, file_read
    mov ecx, 0
    mov edx, 0777
    int 80h 

    mov edi, eax
    mov esi, read_str
    mov edx, 10
    call _ft_read

    mov eax, 6
    mov ebx, edi
    int 80h

    mov edi, 1
    mov esi, read_str
    mov edx, 10
    call _ft_write
    call _newline
    ret

_strdup_test:
    mov edi, str_to_dupe
    call _ft_strdup
    add eax, '0'
    mov edx, 1
    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 80h

    call free
    call _newline
    ret

_newline:
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

    str3 db "The length of this string", 0
    str4 db "will be compared with this string", 0
    equal_length db "Strings are equal."
    longer_length db "First string is longer."
    shorter_length db "First string is shorter."

    str5 db "This string will be printed.", 0
    str5_len equ $ - str5

    file_read db "ft_strcmp.s"

    str_to_dupe db "This will be duplicated", 0

section .bss
    copied_str2: resb len2
    read_str: resb 10