#include <stdio.h>
#include <stdlib.h>

// Requires: <condition on pre-state>
// Provides: <condition on post-state>
// Input:
// Output:
int five_chars_to_int(char *a) {
	int number_array[6];
	int i = 0;
	//
	while(*a != '\0' && i < 5)
	{
		//
		number_array[i] = *a - '0';
		i++;
		a++;
	}
	//
	number_array[i] = -1;


	int number = 0;
	i = 0;
	//
	while(number_array[i] != -1)
	{
		//
    number = (number * 10) + number_array[i];
		i++;
	}
	return number;
}

// Requires: <condition on pre-state>
// Provides: <condition on post-state>
// Input:
// Output:
int main(int argc, char **argv)
{
	//
	char *number = (argv[1]);

	int number_to_int = five_chars_to_int(number);

	if(number_to_int < 1000)
	{
		printf("The number, %d, is < 1000.", number_to_int);
	} else if(number_to_int < 100000)
	{
		printf("The number, %d, is >= 1000.", number_to_int);
	} else
	{
		printf("Error\n");
	}

	return EXIT_SUCCESS;
}
