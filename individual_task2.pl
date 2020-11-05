domains.
int=integer.
list=int*
Predicates.
delete_wr(_,[],[]).
delete_wr(X,[X|L],L1):- delete_wr(X,L,L1).
delete_wr(X,[Y|L],[Y|L1]):- X<>Y,delete_wr(X,L,L1).
list_set([],[]).
list_set([H|T],[H|T1]) :- delete_wr(H,T,T2),list_set(T2,T1).
merge_lists([],[]).
merge_lists(L1,L2):-append(L1,L2,List),
                      list_set(List,X),write(X).