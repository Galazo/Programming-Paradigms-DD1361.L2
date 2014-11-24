spider(S):- person(S), isSpider(S).
 
isSpider(S):-
    setof(Y, amigos(S,Y), AmigosSpider),
    setof(X, person(X),Personas),
    todosConocenAlguien(Personas,[S|AmigosSpider]),
    conspira(AmigosSpider,[],Conspiradores),
    subtract(Personas,[S|Conspiradores],NoConspiradores),
    todosConocenAlguien(NoConspiradores,Conspiradores),!.
 
%friendship lateral and bilateral too 
amigos(X,Y):-knows(X,Y);knows(Y,X).     
 
%Posibles Conspiradores
conspira([X|Xs],Acc,Conspiradores):- \+conoceAlguien(X,Acc), conspira(Xs,[X|Acc],Conspiradores).
conspira([_|Xs],Acc,Conspiradores) :- conspira(Xs,Acc,Conspiradores).
conspira([],Conspiradores,Conspiradores).
 
 
%
todosConocenAlguien([H|Tail],Lista):-conoceAlguien(H,Lista),todosConocenAlguien(Tail,Lista).
todosConocenAlguien([],_).
 
%
conoceAlguien(X,Lista):- member(Y,Lista),knows(X,Y),!.
conoceAlguien(X,Lista):- member(Y,Lista),knows(Y,X),!.
conoceAlguien(X,Lista):- member(X,Lista).
 
