   1              		.file	"uebung02.c"
   2              		.intel_syntax noprefix
   3              		.text
   4              		.globl	function
   6              	function:
   7 0000 55       		push	rbp
   8 0001 4889E5   		mov	rbp, rsp
   9 0004 4883EC30 		sub	rsp, 48
  10 0008 64488B04 		mov	rax, QWORD PTR fs:40
  10      25280000 
  10      00
  11 0011 488945F8 		mov	QWORD PTR [rbp-8], rax
  12 0015 31C0     		xor	eax, eax
  13 0017 C745D000 		mov	DWORD PTR [rbp-48], 0
  13      000000
  14 001e C745D802 		mov	DWORD PTR [rbp-40], 2
  14      000000
  15 0025 C745DC01 		mov	DWORD PTR [rbp-36], 1
  15      000000
  16 002c C745E006 		mov	DWORD PTR [rbp-32], 6
  16      000000
  17 0033 C745E437 		mov	DWORD PTR [rbp-28], 55
  17      000000
  18 003a C745E801 		mov	DWORD PTR [rbp-24], 1
  18      000000
  19 0041 C745EC7D 		mov	DWORD PTR [rbp-20], 125
  19      000000
  20 0048 C745F001 		mov	DWORD PTR [rbp-16], 1
  20      000000
  21 004f C745F408 		mov	DWORD PTR [rbp-12], 8
  21      000000
  22 0056 90       		nop
  23 0057 488B45F8 		mov	rax, QWORD PTR [rbp-8]
  24 005b 64483304 		xor	rax, QWORD PTR fs:40
  24      25280000 
  24      00
  25 0064 7405     		je	.L2
  26 0066 E8000000 		call	__stack_chk_fail
  26      00
  27              	.L2:
  28 006b C9       		leave
  29 006c C3       		ret
  31              		.globl	main
  33              	main:
  34 006d 55       		push	rbp
  35 006e 4889E5   		mov	rbp, rsp
  36 0071 B8000000 		mov	eax, 0
  36      00
  37 0076 E8000000 		call	function
  37      00
  38 007b 90       		nop
  39 007c 5D       		pop	rbp
  40 007d C3       		ret
  42              		.ident	"GCC: (GNU) 7.3.0"
  43              		.section	.note.GNU-stack,"",@progbits
