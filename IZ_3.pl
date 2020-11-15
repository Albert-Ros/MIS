file2string(Str):-
  get_code(H), (
    code_type(H, end_of_file), !, Str = [];
    Str = [H|T], file2string(T)
  ).
  
is_space(Code):- 
    \+code_type(Code, alnum).

get_spaces([Head|Tail], [Head|TailSpaces], TailString):-
  is_space(Head), !, get_spaces(Tail, TailSpaces, TailString).
get_spaces(List, [], List).

get_word([Head|Tail], [Head|TailSpaces], TailString):-
  \+ is_space(Head), !, get_word(Tail, TailSpaces, TailString).
get_word(List, [], List).

read_word(String, Word, Tail):-
  get_spaces(String, _, StringWithoutSpaces),  
  get_word(StringWithoutSpaces, Word, Tail),
  Word \= [].
  
string_to_words(String, [Word|ListTail]):-
  read_word(String, Word, StringTail), !, 
  string_to_words(StringTail, ListTail).
string_to_words(_String, []).

solve:-
    see('input.txt'),
    file2string(StrCodes),
    seen,
    
    string_to_words(StrCodes, Words),
    
    write('enter word: '),
    read(Word),
    string_to_list(Word, WordCodes),
    
    include(permutation(WordCodes), Words, CodePermutations),
    maplist(string_to_list, Permutations, CodePermutations),
    length(Permutations, Count),
    
    write(Permutations), nl,
    write('Count: '), write(Count).
