BITS 32

SEGMENT .data
   strName DB "The Dividing Program", 0xA, 0xD
   lenName EQU $-strName
   msg1 DB "Please enter a single digit number: "
   lenmsg1 EQU $-msg1
   msg2 DB "Please enter a second single digit number: "
   lenmsg2 EQU $-msg2
   msg3 DB "The quotient is: "
   lenmsg3 EQU $-msg3
   msg4 DB "The remainder is: "
   lenmsg4 EQU $-msg4

SEGMENT .bss
   num1 RESB 5
   num2 RESB 5
   remainder RESB 5
   quotient RESB 5

SECTION .text
   GLOBAL _start

_start:
   mov eax, 4             ;title
   mov ebx, 1
   mov ecx, strName
   mov edx, lenName
   int 0x80

   mov eax, 4             ;write first number
   mov ebx, 1
   mov ecx, msg1
   mov edx, lenmsg1
   int 0x80

   mov eax, 3           ;read first number
   mov ebx, 0
   mov ecx, num1
   mov edx, 5
   int 0x80

   mov eax, 4            ;write second number
   mov ebx, 1
   mov ecx, msg2
   mov edx, lenmsg2
   int 0x80

   mov eax, 3            ;read second number
   mov ebx, 0
   mov ecx, num2
   mov edx, 5
   int 0x80


   mov al, BYTE[num1]
   sub al, '0'

   mov bl, BYTE[num2]
   sub bl, '0'

   idiv bl

   mov[quotient], al
   add BYTE [quotient], '0'
   mov BYTE [quotient+1], 10

   mov [remainder], ah
   add BYTE [remainder], '0'
   mov BYTE [remainder+1], 10

   mov eax, 4
   mov ebx, 1
   mov ecx, msg3
   mov edx, lenmsg3
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, quotient
   mov edx, 5
   int 0x80


   mov eax, 4
   mov ebx, 1
   mov ecx, msg4
   mov edx, lenmsg4
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, remainder
   mov edx, 5
   int 0x80

   mov eax, 1
   xor ebx, ebx
   int 0x80
