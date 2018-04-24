no_stack_protection: uebung02.c
	gcc uebung02.c -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector -Wa,-adhln=no_stack_protection.s -masm=intel

stack_protection: uebung02.c
	gcc uebung02.c -fno-unwind-tables -fno-asynchronous-unwind-tables -fstack-protector-strong -Wa,-adhln=stack_protection.s -masm=intel

all:
	$(no_stack_protection)
	$(stack_protection)

clean:
	rm *.s