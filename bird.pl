% Define facts about birds
bird(tweety).
bird(littlefoot).

% Define rule for flying birds
flies(tweety).

% Rule to check if a bird can fly
can_fly(Bird) :-
    flies(Bird).

% Rule to print whether a bird can fly or not
print_fly_status(Bird) :-
    can_fly(Bird),
    format('~w can fly.~n', [Bird]).
print_fly_status(Bird) :-
    \+ can_fly(Bird),
    format('~w cannot fly.~n', [Bird]).

% Example query
?- print_fly_status(tweety).
