% Define initial state
at(monkey, door).
at(chair, middle).
at(banana, ceiling).

% Define actions
move(monkey, door, middle) :-
    at(monkey, door),
    at(chair, middle).
move(monkey, middle, door) :-
    at(monkey, middle),
    at(chair, middle).
climb(chair) :-
    at(monkey, middle),
    at(chair, middle),
    not(at(monkey, ceiling)),
    not(at(banana, ceiling)).
grasp(banana) :-
    at(monkey, ceiling),
    at(banana, ceiling).

% Define goal state
goal_state :-
    at(monkey, ceiling),
    at(banana, ceiling).

% Define action sequence
action_sequence([]).
action_sequence([Action|Rest]) :-
    call(Action),
    action_sequence(Rest).

% Solve the problem
solve :-
    goal_state,
    write('Monkey has the banana!').
solve :-
    action_sequence(Actions),
    solve.

% Entry point
start :-
    solve.
