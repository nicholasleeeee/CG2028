#include "stdio.h"
#define N_MAX 10
#define X_SIZE 12


// CG2028 Assignment, Sem 2, AY 2018/19
// (c) CG2028 Teaching Team, ECE NUS, 2019

extern int fir(int N, int* b, int x_n); // asm implementation
int fir_c(int N, int* b, int x_n); // reference C implementation

int main(void)
{
	//variables
	int j;
	int N = 4;
	// think of the values below as numbers of the form y.yy (floating point with 2 digits precision)
	// which are scaled up to allow them to be used integers
	// within the fir function, we divide y by 10,000 (decimal) to scale it down
	int b[N_MAX+1] = {100, 300, 200, 400, 500}; //N+1 dimensional
	int x[X_SIZE] = {100, 200, 300, 400, 500, 600, 500, 400, 300, 200, 100, 500};

	// Call assembly language function fir for each element of x
	for (j=0; j<X_SIZE; j++)
	{
		printf( "asm: j = %d, y_n = %d, \n", j, fir(N, b, x[j]) ) ;
		printf( "C  : j = %d, y_n = %d, \n", j, fir_c(N, b, x[j]) ) ;
	}
	while (1); //halt
}

int fir_c(int N, int* b, int x_n)
{ 	// The implementation below is inefficient and meant only for verifying your results.
	// Note that the first N return values from C and assembly implementations might not be identical, and that is ok.
	static int x_store[N_MAX] = {0}; // to store the previous N values of x_n.
	int j;
	int y_n;

	y_n = x_n*b[0];
	for(j=0; j<N; j++)
	{
		y_n+=b[j+1]*x_store[j];
	}
	for(j=N-1; j>0; j--)   // Shifting x(n-i)'s. Note : inefficient implementation
	{
		x_store[j] = x_store[j-1];
	}
	x_store[0] = x_n;

	y_n /= 10000; // scaling down
	return y_n;
}

/*//Alternate implementation of fir_c
int fir_c(int N, int* b, int x_n)
{ 	// The implementation below is inefficient and meant only for verifying your results.
	// Note that the first N return values from C and assembly implementations might not be identical, and that is ok.
	static int x_store[N_MAX] = {0}; // to store the previous N values of x_n.
	int j;
	int y_n;

	y_n = x_n*b[0];
	for(j=0; j<N; j++)
	{
		y_n+=b[j+1]*x_store[N-1-j];
	}
	for(j=0; j<N-1; j++)   // Shifting x(n-i)'s. Note : inefficient implementation
	{
		x_store[j] = x_store[j+1];
	}
	x_store[N-1] = x_n;

	y_n /= 10000; // scaling down
	return y_n;
}
*/
