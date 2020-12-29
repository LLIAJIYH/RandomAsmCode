SECTION .bss
    buf1: RESB 80
    
SECTION .data
    name: DB 'Введите строку',10
    nameLen: EQU $-name
    
SECTION .text
    GLOBAL _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, nameLen
    int 80h
    
    mov eax, 3
    mov ebx,0
    mov ecx, buf1
    mov edx, 80
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, buf1
    mov edx, 80
    int 80h
    
    mov eax,1
    mov ebx, 0
    int 80h