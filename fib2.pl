fib(0, 1).
fib(1, 1).
fib(N, F) :-
	N > 1,
	K is N div 2,
	K1 is K-1,
	fib(K, F0),
	fib(K1, F1),
	(   N mod 2 =:= 0
	->  F is F0*F0+F1*F1
	;   F is F0*F0+2*F0*F1), !.

