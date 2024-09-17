BITS 32

SEGMENT .data
   strName DB "The Swapping Program", 0xA, 0xD
   lenName EQU $-strName
   msg1 DB "Please enter a two character string:   "
   lenmsg1 EQU $-msg1
   string DB "The answer is:  "
   lenString equ $-string

SEGMENT .bss
   input RESB 3

SECTION .text
   GLOBAL _start

_start:
   mov eax, 4             ;title
   mov ebx, 1
   mov ecx, strName
   mov edx, lenName
   int 0x80

   mov eax, 4             ;write input number
   mov ebx, 1
   mov ecx, msg1
   mov edx, lenmsg1
   int 0x80

   mov eax, 3           ;read input number
   mov ebx, 0
   mov ecx, input
   mov edx, 3
   int 0x80

   mov al, [input]
   mov bl, [input+1]
   mov [input], bl
   mov [input+1], al

   mov eax, 4
   mov ebx, 1
   mov ecx, string
   mov edx, lenString
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, input
   mov edx, 3
   int 0x80

   mov eax, 1
   xor ebx, ebx
   int 0x80
