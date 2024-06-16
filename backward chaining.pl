/* Define the rules */
parent(bob, alice).
parent(alice, john).
parent(alice, mary).

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

/* Define the goal */
goal :- ancestor(bob, mary).

/* Define the backward chaining algorithm */
backward_chain(Goal) :-
    Goal,
    write('Goal achieved!').

backward_chain(Goal) :-
    not(Goal),
    writeln('Checking for supporting facts...'),
    clause(Goal, Body),
    backward_chain(Body).

/* Query the goal */
:- backward_chain(goal).
