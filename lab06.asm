SECTION .bss
    buf1: RESB 2
    buf2: RESB 2
    
SECTION .text
    GLOBAL _start

convert:
    xor ecx, ecx
    xor edx, edx
    mov bl, 10

.divide:
    xor edx, edx
    div ebx
    
    add dl, '0'
    push dx
    inc ecx
    cmp eax, 0
    jnz .divide
    
.reverse:
    pop ax
    stosb
    
    loop .reverse
    mov byte[edi], 10
    ret

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 1
    int 80h
    
    mov eax, [buf1]
    mov edi, buf2
    
    call convert
    
    mov eax, 4
    mov ebx, 1
    mov ecx, buf2
    int 80h
    
    mov eax, 1
    mov ebx, 0
    int 80h