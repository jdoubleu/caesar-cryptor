   1              		.file	"uebung02.c"
   2              		.intel_syntax noprefix
   3              		.text
   4              		.globl	function
   6              	function:
   7 0000 55       		push	rbp
   8 0001 4889E5   		mov	rbp, rsp
   9 0004 C745D000 		mov	DWORD PTR [rbp-48], 0
   9      000000
  10 000b C745D802 		mov	DWORD PTR [rbp-40], 2
  10      000000
  11 0012 C745DC01 		mov	DWORD PTR [rbp-36], 1
  11      000000
  12 0019 C745E006 		mov	DWORD PTR [rbp-32], 6
  12      000000
  13 0020 C745E437 		mov	DWORD PTR [rbp-28], 55
  13      000000
  14 0027 C745E801 		mov	DWORD PTR [rbp-24], 1
  14      000000
  15 002e C745EC7D 		mov	DWORD PTR [rbp-20], 125
  15      000000
  16 0035 C745F001 		mov	DWORD PTR [rbp-16], 1
  16      000000
  17 003c C745F408 		mov	DWORD PTR [rbp-12], 8
  17      000000
  18 0043 90       		nop
  19 0044 5D       		pop	rbp
  20 0045 C3       		ret
  22              		.globl	main
  24              	main:
  25 0046 55       		push	rbp
  26 0047 4889E5   		mov	rbp, rsp
  27 004a B8000000 		mov	eax, 0
  27      00
  28 004f E8000000 		call	function
  28      00
  29 0054 90       		nop
  30 0055 5D       		pop	rbp
  31 0056 C3       		ret
  33              		.ident	"GCC: (GNU) 7.3.0"
  34              		.section	.note.GNU-stack,"",@progbits
