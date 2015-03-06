#include <stdio.h>

int fib(int n) {
	if(n < 2)
		return 1;
	return fib(n-2) + fib(n-1);
}

int main()
{
	printf("%d\n", fib(45));
	return 0;
}
