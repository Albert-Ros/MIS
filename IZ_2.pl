repeated_element(List, Value):-
nth0(I, List, Value),
nth0(J, List, Value),
I \= J.

filter_unique(A, B, Result):-
append(A, B, AB),
exclude(repeated_element(AB), AB, Result).
