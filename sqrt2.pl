even(0).
even(s(s(X))) :- even(X).

odd(s(0)).
odd(s(s(X))) :- odd(X).

sqrt_two_is_rational :- 
	nat(S),
	plus(P,Q,S),
	gcd(P,Q,s(0)),
	times(P,P,P2),
	times(Q,Q,Q2),
	plus(Q2,Q2,P2).

