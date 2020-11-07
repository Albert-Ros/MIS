% Сумма элементов списка
sum([],0):-!.
sum([H|T],Sum):-sum(T,Sum1), Sum is Sum1 + H.

%читаем список A длины X
readList([],0):-!.
readList([H|List],N):-read(H), N1 is N-1, readList(List,N1).

%выводит список A длины X
writeList([]):-!.
writeList([H|T]):-
    writeln(H),
    writeList(T).

% Предикат, получающий элемент списка с заданным номером

index([],_,_):-!.
index([],N,_):-N<0, writeln("Список пустой!"),fail.
index([H|T],N,X):-index1([H|T],N,0,X).
index1([H|_],N,N,H):-!.
index1([_|T],N,I,X):- I1 is I+1, index1(T,N,I1,X).


minElem([],_):-!.
minElem([H|T],X):-minElem1([H|T],H,X).
minElem1([],Min,Min):-!.
minElem1([H|T],Min,X):-H<Min, minElem1(T,H,X),!.
minElem1([_|T],Min,X):-minElem1(T,Min,X).


getIndex([],_,_):-!.
getIndex([H|T],Elem,Index):-getIndex1([H|T],Elem,0,Index).
getIndex1([H|_],Elem,Ind,Index):-H=Elem,Index is Ind,!.
getIndex1([_|T],Elem,Ind,Index):-Ind1 is Ind+1,getIndex1(T,Elem,Ind1,Index).

% предикат P(Sublist,List), который возвращает true, если элементы
% sublist встречаются в list в том же порядке

p(_,[],_):-!.
p([],_,_):-!.
p([H1|T1],[H|T]):-p1([H1|T1],[H|T]).
p1([H1|T1],[H|T]):-H1=H,p1(T1,T).
p1([],[]):-!.
p1([H|_],[]):-writeln("false"),fail.


