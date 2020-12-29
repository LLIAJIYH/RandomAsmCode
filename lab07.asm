SECTION .bss
    buf1: RESB 80
    buf2: RESB 80
    
SECTION .data
    text: DB 'Введите строку', 10
    textLen: EQU $-text
    result: DB 'Результат', 10
    resultLen: EQU $-result
    
SECTION .text
    GLOBAL _start

bit:
    mov eax, 0
    mov esi, buf1
    add esi, -1
    
lp1:
    inc esi
    mov al, [esi]
    cmp al, 10
    je end
    sub al, '0'
    cmp al, 0
    JB lp1
    cmp al, 9
    JA lp1
    mov cl, al
    mov edx, 1
    shl edx, cl
    or [buf2], edx
    jmp lp1
    
end:
    ret
    
convert:
    xor ecx, ecx
    xor ebx, ebx
    mov bl, 2
    
divide:
    xor edx, edx
    div ebx
    add dl, '0'
    push dx
    inc ecx
    cmp eax, 0
    jnz divide
    
reverse:
    pop ax
    stosb
    loop reverse
    ret
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, text
    mov edx, textLen
    int 80h
    
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80
    int 80h
    
    call bit
    
    mov eax, [buf2]
    mov edi, buf2
    
    call convert
    
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, resultLen
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, buf2
    mov edx, 80
    int 80h
    
    mov eax, 1
    mov ebx, 0
    int 80h