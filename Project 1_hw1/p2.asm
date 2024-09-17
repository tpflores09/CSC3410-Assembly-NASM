BITS 32

SEGMENT .data
   strName DB "The Multiplying Program", 0xA, 0xD
   lenName equ $-strName
   msg1 DB "Please enter a single digit number: "
   len1 equ $-msg1
   msg2 DB "Please enter a second single digit number: "
   len2 equ $-msg2
   msg3 DB "The result is:  "
   len3 equ $-msg3

SEGMENT .bss
   num1 RESB 5
   num2 RESB 5
   result RESB 5
   nl RESB 1

SECTION .text
   global _start

_start:
   mov eax, 4
   mov ebx, 1
   mov ecx, strName
   mov edx, lenName
   int 0x80

   mov eax, 4          ;write first number
   mov ebx, 1
   mov ecx, msg1
   mov edx, len1
   int 0x80

   mov eax, 3          ;read first number
   mov ebx, 0
   mov ecx, num1
   mov edx, 5
   int 0x80

   mov eax, 4         ;write second number
   mov ebx, 1
   mov ecx, msg2
   mov edx, len2
   int 0x80

   mov eax, 3          ;read second number
   mov ebx, 0
   mov ecx, num2
   mov edx, 5
   int 0x80
   
   mov eax, 4
   mov ebx, 1
   mov ecx, msg3
   mov edx, len3
   int 0x80

   xor ax, ax

   ;mov al, [num1]
   ;mov al, '0'
   ;mov BYTE [num1], al

   mov al, [num1]
   mov bl, [num2]
   sub al, '0'
   sub bl, '0'
   imul bl 
   add al, '0'
   mov [result], al
   mov BYTE [result+1], 10
   int 0x80

   mov BYTE [nl], 10
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 5
   int 0x80

   ;mov eax, 4
   ;mov ebx, 1
   ;mov ecx, result
   ;mov edx, 2
   ;int 0x80

   ;mov BYTE [nl], 10

   
   ;mov al, BYTE [num1]

   ;imul al, BYTE [num2]

   mov eax, 1
   xor ebx, ebx
   int 0x80
