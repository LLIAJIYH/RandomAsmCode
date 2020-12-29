SECTION .bss
    buf: RESB 80
    output: RESB 80
    
SECTION .data
    enter: DB 'Введите строку', 10
    enterLen: EQU $-enter
    
SECTION .text
    GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, enter
    mov edx, enterLen
    int 80h
    
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, 80
    int 80h
    
    mov esi, buf
    mov ecx, 0
    
function1:
    mov al, byte [esi+ecx]
    cmp al, 10
    je function2
    push ax
    inc ecx
    jmp function1
    
function2:
    pop ax
    mov [esi], al
    inc esi
    loop function2
    
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, 80
    int 80h
    
    mov eax, 1
    mov ebx, 0
    int 80h