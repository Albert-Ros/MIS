sumList([],0):-!.
sumList([H|T],Sum):-sumList(T,Sum1),Sum is Sum1+H.

readList([],0):-!.
readList([H|Tail],Count):-read(H),Count1 is Count-1,readList(Tail,Count1).

writeList([]):-!.
writeList([H|T]):-writeln(H),writeList(T).

pr3_1:-writeln("����������: "),read(N),
    writeln("������: "),readList(A,N),
    sumList(A,Sum),writeln(Sum).

pr3_2:-writeln("����������: "),read(N),
    writeln("������: "),readList(List,N),
    writeln("�����: "),read(K),
    getElem(List,K,Elem),write(Elem).
getElem(List,K,Elem):-getElem(List,0,K,Elem).
getElem([H|_],K,K,H):-!.
getElem([_|T],Ind,K,Elem):-Ind1 is Ind+1,getElem(T,Ind1,K,Elem).

pr3_3:-writeln("����������: "),read(N),
    writeln("������: "),readList(A,N),
    minElem(A,Min),writeln(Min).
minElem([H],H):-!.
minElem([H|T],Min):-minElem(T,Min),Min<H,!.
minElem([H|_],H).

pr3_4:-writeln("����������: "),read(N),
    writeln("������: "),readList(A,N),
    writeln("�������: "),read(Elem),
    inList(A,Elem,Res),writeln(Res).
inList([H|_],H):-!.
inList([_|T],Elem):-inList(T,Elem).

pr3_5:-writeln("����������: "),read(N),
    writeln("������: "),readList(List,N),
    writeln("�������: "),read(Elem),
    whatNum(List,Elem,K),write(Elem).
whatNum(List,Elem,K):-whatNum(List,0,K,Elem).




