SECTION .data
writequest: DB 'Полдень настпуил?',10
writequestLen: EQU $-writequest

writeDay: DB 'Добрый день',10
writeDayLen: EQU $-writeDay

writeMorning: DB 'Доброе утро',10
writeMorningLen: EQU $-writeMorning

SECTION .bss
read:RESB 80

SECTION .text
GLOBAL _start

_start:
mov eax,4
mov ebx,1
mov ecx,writequest
mov edx,writequestLen
int 80h

mov eax,3
mov ebx,0
mov ecx,read
mov edx,80
int 80h

cmp byte[read],'y'
je day
cmp byte[read],
je morning
jmp _start

day:
mov eax,4
mov ebx,1
mov ecx,writeDay
mov edx,writeDayLen
int 80h
jmp end

morning:
mov eax,4
mov ebx,1
mov ecx,writeMorning
mov edx,writeMorningLen
int 80h
jmp end

end:
mov eax,1
mov ebx,0
int 80h