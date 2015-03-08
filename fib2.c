#include <stdio.h>
 
int fib(int n)
{
	int k=n/2;
	if(n<2) return 1;
	int f0=fib(k);
	int f1=fib(k-1);
	if(n%2 == 0) 
		return f0*f0+f1*f1;
	else
		return f0*f0+2*f0*f1;
}

int main()
{
	printf("%d\n", fib(45));
	return 0;
}