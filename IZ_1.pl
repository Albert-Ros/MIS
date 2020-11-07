generate_facts(CurrentIndex, CurrentFact, MaxIndex, List):-
    CurrentIndex > MaxIndex, !, List = [];
    NextIndex is CurrentIndex+1,
    NextFact is CurrentFact*NextIndex, 
    generate_facts(NextIndex, NextFact, MaxIndex, Tail),
    List = [CurrentFact|Tail].

digits_reversed(Number, [Number]):-
  Number >= 0, Number =< 9, !.
digits_reversed(Number, [HeadDigit|TailDigits]):-
  NumberWithoutDigit is Number div 10,
  HeadDigit is Number mod 10,
  digits_reversed(NumberWithoutDigit, TailDigits).

digits(Number, Digits):-
    digits_reversed(Number, ReversedDigits),
    reverse(ReversedDigits, Digits).

facts_sum([], _Facts, 0):-!.
facts_sum([Head|Tail], Facts, Sum):-
    nth0(Head, Facts, HeadFact),
    facts_sum(Tail, Facts, TailSum),
    Sum is TailSum + HeadFact.

find(From, To, Facts, X):-
    between(From, To, X),
    digits(X, Digits),
    facts_sum(Digits, Facts, Sum),
    X == Sum.

find(From, To):-
    generate_facts(0, 1, 9, Facts), !,
    find(From, To, Facts, X),
    write(X), nl, fail.
    

/** <examples>
?- find(1, 1000000).
?- generate_facts(0, 1, 9, X), !.
*/
