nat(0).
nat(s(X)) :- nat(X).

0 @< s(Y).
s(X) @< s(Y) :- X @< Y.

0 @=< Y.
s(X) @=< s(Y) :- X @=< Y.

plus(0,Y,Y).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

times(0,Y,0).
times(s(X),Y,Z) :- times(X,Y,A), plus(Y,A,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
gcd(X,Y,D) :-
	(	X @=< Y ->
		gcd_leq(X,Y,D)
	;	gcd_leq(Y,X,D)
	).

gcd_leq(X,Y,D) :-
	(	X = 0 ->
		D = Y
	;	plus(X,Z,Y),
		gcd(X,Z,D)
	).
*/

gcd(X,Y,D) :- X @=< Y, gcd_leq(X,Y,D).
gcd(X,Y,D) :- Y @< X, gcd_leq(Y,X,D).

gcd_leq(0,Y,Y).
gcd_leq(X,Y,D) :- 0 @< X, plus(X,Z,Y), gcd(X,Z,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

even(0).
even(s(s(X))) :- even(X).

odd(s(0)).
odd(s(s(X))) :- odd(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sqrt_two_is_rational :- 
	nat(S),
	plus(P,Q,S),
	gcd(P,Q,s(0)),
	times(P,P,P2),
	times(Q,Q,Q2),
	plus(Q2,Q2,P2).