max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max(X,Y,U,Z):-max(X,Y,A),max(A,U,Z).

fact(0,1).
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact1(N,X):-fact1(1,N,1,X).
fact1(N,N,X,X):-!.
fact1(I,N,S,X):-I1 is I+1,S is S*I1,fact1(I1,N,S1,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,fib(N1,X1),N2 is N-2,fib(N2,X2),X is X1+X2.

fib1(N,X):-fib1(1,1,X,2,N).
fib1(_,X,X,N,N):-!.
fib1(A,B,X,I,N):-C is A+B,I1 is I+1,fib1(B,C,X,I1,N).

pr(2):-!.
pr(X):-pr(2,X).
pr(X,X):-!.
pr(N,X):-O is X mod N,O>0,N1 is N+1, pr(N1,X).
