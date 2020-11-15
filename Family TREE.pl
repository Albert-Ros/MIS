man(grandMan1).
man(grandMan2).
man(grandMan3).
man(grandMan4).

man(man1).
man(man2).
man(man3).
man(man4).

man(childMan1).
man(childMan2).
man(childMan3).
man(childMan4).

woman(grandWoman1).
woman(grandWoman2).
woman(grandWoman3).
woman(grandWoman4).

woman(woman1).
woman(woman2).
woman(woman3).
woman(woman4).

woman(childWoman1).
woman(childwomen2).
woman(childwomen3).
woman(childwomen4).

parent(man1,childMan1).
parent(women1,childMan1).

parent(man1,childWoman1).
parent(women1,childWoman1).

parent(grandMan1,man1).
parent(grandMan1,man2).

parent(man2,childMan2).
parent(women2,childMan2).

parent(man2,childWoman2).
parent(women2,childWoman2).

parent(grandMan2,man3).
parent(grandMan2,man4).
%кр
father(X,Y):-parent(X,Y),man(X),!.
mother(X,Y):-parent(X,Y),woman(X),!.
brother(X,Y):-parent(Z,X),parent(Z,Y),not(X=Y),man(X),!.
sister(X,Y):-parent(Z,X),parent(Z,Y),not(X=Y),woman(X),!.
uncle(X,Y):-parent(Z,Y),parent(W,Z),parent(W,X),not(X=Z),man(X),!.
aunt(X,Y):-parent(Z,Y),sister(X,Z),!.
%issue
%ВЫволит два раза одно и то же. Один раз через отца, один раз через мать
allBrothers(X):-parent(Y,X),parent(Y,Z),not(X=Y),man(Z),write(Z),fail.
allSisters(X):-parent(Y,X),parent(Y,Z),not(X=Z),woman(Z),write(Z),fail.
allFathers(X,Y):-parent(X,Y),man(X),write(X),fail.

uncleForbidden(X,Y):-parent(Z,Y),parent(W,Z),parent(W,X),man(X),write(X),fail.

allUncles(Y):-parent(Z,Y),parent(W,Z),parent(W,X),not(X=Z),man(X),write(X),fail.

allParents(Y):-parent(X,Y),write(X),fail.

allGrandParents(Y):-parent(X,Y),parent(Z,X),write(Z),fail.

familyBranch(Y):-parent(X,Y),write(Y),familyBranch(X).

maxForbidden(X,Y,Z):-X>Y,Z is X.
maxForbidden(X,Y,Z):-Z is Y.

maxTwo(X,Y,X):-X>Y,!.
maxTwo(_,Y,Y).

maxThree(X,Y,U,X):-X>Y,X>U,!.
maxThree(_,Y,U,Y):-Y>U,!.
maxThree(_,_,U,U).

%maxThreeForbidden(X,Y,U,Z):-
