asm: stack_smashing.c
	gcc stack_smashing.c -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector -Wa,-adhln=stack_smashing.s -masm=intel

clean:
	rm *.s