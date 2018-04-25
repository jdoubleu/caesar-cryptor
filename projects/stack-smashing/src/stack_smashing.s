   1              		.file	"stack_smashing.c"
   2              		.intel_syntax noprefix
   3              		.text
   4              		.globl	five_chars_to_int
   6              	five_chars_to_int:
   7 0000 55       		push	rbp
   8 0001 4889E5   		mov	rbp, rsp
   9 0004 48897DD8 		mov	QWORD PTR [rbp-40], rdi
  10 0008 C745FC00 		mov	DWORD PTR [rbp-4], 0
  10      000000
  11 000f EB1F     		jmp	.L2
  12              	.L3:
  13 0011 488B45D8 		mov	rax, QWORD PTR [rbp-40]
  14 0015 0FB600   		movzx	eax, BYTE PTR [rax]
  15 0018 0FBEC0   		movsx	eax, al
  16 001b 8D50D0   		lea	edx, [rax-48]
  17 001e 8B45FC   		mov	eax, DWORD PTR [rbp-4]
  18 0021 4898     		cdqe
  19 0023 895485E0 		mov	DWORD PTR [rbp-32+rax*4], edx
  20 0027 8345FC01 		add	DWORD PTR [rbp-4], 1
  21 002b 488345D8 		add	QWORD PTR [rbp-40], 1
  21      01
  22              	.L2:
  23 0030 488B45D8 		mov	rax, QWORD PTR [rbp-40]
  24 0034 0FB600   		movzx	eax, BYTE PTR [rax]
  25 0037 84C0     		test	al, al
  26 0039 75D6     		jne	.L3
  27 003b 8B45FC   		mov	eax, DWORD PTR [rbp-4]
  28 003e 4898     		cdqe
  29 0040 C74485E0 		mov	DWORD PTR [rbp-32+rax*4], -1
  29      FFFFFFFF 
  30 0048 C745F800 		mov	DWORD PTR [rbp-8], 0
  30      000000
  31 004f C745FC00 		mov	DWORD PTR [rbp-4], 0
  31      000000
  32 0056 EB20     		jmp	.L4
  33              	.L5:
  34 0058 8B55F8   		mov	edx, DWORD PTR [rbp-8]
  35 005b 89D0     		mov	eax, edx
  36 005d C1E002   		sal	eax, 2
  37 0060 01D0     		add	eax, edx
  38 0062 01C0     		add	eax, eax
  39 0064 89C2     		mov	edx, eax
  40 0066 8B45FC   		mov	eax, DWORD PTR [rbp-4]
  41 0069 4898     		cdqe
  42 006b 8B4485E0 		mov	eax, DWORD PTR [rbp-32+rax*4]
  43 006f 01D0     		add	eax, edx
  44 0071 8945F8   		mov	DWORD PTR [rbp-8], eax
  45 0074 8345FC01 		add	DWORD PTR [rbp-4], 1
  46              	.L4:
  47 0078 8B45FC   		mov	eax, DWORD PTR [rbp-4]
  48 007b 4898     		cdqe
  49 007d 8B4485E0 		mov	eax, DWORD PTR [rbp-32+rax*4]
  50 0081 83F8FF   		cmp	eax, -1
  51 0084 75D2     		jne	.L5
  52 0086 8B45F8   		mov	eax, DWORD PTR [rbp-8]
  53 0089 5D       		pop	rbp
  54 008a C3       		ret
  56              		.section	.rodata
  57              	.LC0:
  58 0000 54686520 		.string	"The number, %d, is < 1000."
  58      6E756D62 
  58      65722C20 
  58      25642C20 
  58      6973203C 
  59              	.LC1:
  60 001b 54686520 		.string	"The number, %d, is >= 1000."
  60      6E756D62 
  60      65722C20 
  60      25642C20 
  60      6973203E 
  61              	.LC2:
  62 0037 4572726F 		.string	"Error"
  62      7200
  63              		.text
  64              		.globl	main
  66              	main:
  67 008b 55       		push	rbp
  68 008c 4889E5   		mov	rbp, rsp
  69 008f 4883EC20 		sub	rsp, 32
  70 0093 897DEC   		mov	DWORD PTR [rbp-20], edi
  71 0096 488975E0 		mov	QWORD PTR [rbp-32], rsi
  72 009a 488B45E0 		mov	rax, QWORD PTR [rbp-32]
  73 009e 488B4008 		mov	rax, QWORD PTR [rax+8]
  74 00a2 488945F8 		mov	QWORD PTR [rbp-8], rax
  75 00a6 488B45F8 		mov	rax, QWORD PTR [rbp-8]
  76 00aa 4889C7   		mov	rdi, rax
  77 00ad E8000000 		call	five_chars_to_int
  77      00
  78 00b2 8945F4   		mov	DWORD PTR [rbp-12], eax
  79 00b5 817DF4E7 		cmp	DWORD PTR [rbp-12], 999
  79      030000
  80 00bc 7F16     		jg	.L8
  81 00be 8B45F4   		mov	eax, DWORD PTR [rbp-12]
  82 00c1 89C6     		mov	esi, eax
  83 00c3 BF000000 		mov	edi, OFFSET FLAT:.LC0
  83      00
  84 00c8 B8000000 		mov	eax, 0
  84      00
  85 00cd E8000000 		call	printf
  85      00
  86 00d2 EB29     		jmp	.L9
  87              	.L8:
  88 00d4 817DF49F 		cmp	DWORD PTR [rbp-12], 99999
  88      860100
  89 00db 7F16     		jg	.L10
  90 00dd 8B45F4   		mov	eax, DWORD PTR [rbp-12]
  91 00e0 89C6     		mov	esi, eax
  92 00e2 BF000000 		mov	edi, OFFSET FLAT:.LC1
  92      00
  93 00e7 B8000000 		mov	eax, 0
  93      00
  94 00ec E8000000 		call	printf
  94      00
  95 00f1 EB0A     		jmp	.L9
  96              	.L10:
  97 00f3 BF000000 		mov	edi, OFFSET FLAT:.LC2
  97      00
  98 00f8 E8000000 		call	puts
  98      00
  99              	.L9:
 100 00fd B8000000 		mov	eax, 0
 100      00
 101 0102 C9       		leave
 102 0103 C3       		ret
 104              		.ident	"GCC: (GNU) 7.3.0"
 105              		.section	.note.GNU-stack,"",@progbits
