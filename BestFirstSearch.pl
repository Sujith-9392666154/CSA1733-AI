% Define graph edges and their costs
edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 5).
edge(c, d, 3).
edge(c, e, 2).
edge(d, f, 4).
edge(e, f, 1).

% Define heuristic values for each node
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 0).

% Best-First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search_aux([[(Start, 0)]], Goal, [], RevPath),
    reverse(RevPath, Path).

% Auxiliary predicate for Best-First Search
best_first_search_aux([[(Node, _)|Visited]|_], Node, Path, [Node|Path]) :-
    !.
best_first_search_aux([Path|Paths], Goal, Visited, FinalPath) :-
    extend(Path, NewPaths),
    append(Visited, [Path], NewVisited),
    merge(NewPaths, Paths, Merged),
    sort(Merged, Sorted),
    best_first_search_aux(Sorted, Goal, NewVisited, FinalPath).

% Predicate to extend a path with neighboring nodes
extend([(Node, _)|Path], NewPaths) :-
    findall([(NewNode, H)|NewPath], (edge(Node, NewNode, _), \+ member((NewNode, _), Path), heuristic(NewNode, H)), NewPaths).

% Predicate to merge and sort the list of paths
merge([], L, L).
merge(L, [], L).
merge([(N1, H1)|T1], [(N2, H2)|T2], [(N1, H1)|Merged]) :-
    H1 =< H2,
    merge(T1, [(N2, H2)|T2], Merged).
merge([(N1, H1)|T1], [(N2, H2)|T2], [(N2, H2)|Merged]) :-
    H1 > H2,
    merge([(N1, H1)|T1], T2, Merged).
