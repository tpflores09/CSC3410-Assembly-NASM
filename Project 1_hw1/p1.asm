BITS 32


SEGMENT .data
   strProgName DB "The Adding Program", 0xA, 0xD
   lenName EQU $-strProgName
   userMsg1 DB "Please enter the first single digit number: "
   lenUserMsg1 EQU $-userMsg1
   userMsg2 DB "Please enter the second single digit number: "
   lenUserMsg2 EQU $-userMsg2
   result DB "The answer is: "
   lenResult EQU $-result
   

SEGMENT .bss
   num1 RESB 5
   num2 RESB 5
   sum RESB 5
   nl RESB 1

SECTION .text
  GLOBAL _start

_start:
   mov eax, 4
   mov ebx, 1
   mov ecx, strProgName
   mov edx, lenName
   int 0x80
                   ;first number
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg1
   mov edx, lenUserMsg1
   int 0x80

   mov eax, 3               ;read first number
   mov ebx, 0
   mov ecx, num1
   mov edx, 5
   int 0x80

   mov eax, 4             ;second number
   mov ebx, 1
   mov ecx, userMsg2
   mov edx, lenUserMsg2
   int 0x80

   mov eax, 3             ;read second number
   mov ebx, 0
   mov ecx, num2
   mov edx, 5
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, lenResult
   int 0x80

   ; convert first number
   mov eax, [num1]
   SUB eax, '0'

   ;convert second number
   mov ebx, [num2]
   SUB ebx, '0'

   ;add numbers
   add eax, ebx
   add eax, '0'

   ;store sum
   mov [sum], eax
   mov BYTE [nl], 10
   mov BYTE [sum+1], 10 
 
   mov eax, 4
   mov ebx, 1
   mov ecx, sum
   mov edx, 5
   int 0x80

   mov eax, 1
   xor ebx, ebx
   int 0x80
