sum(0, 0). % Base case: Sum of integers from 1 to 0 is 0.

% Recursive rule to calculate sum of integers from 1 to N.
sum(N, Sum) :-
    N > 0,           % Ensure N is a positive integer.
    N1 is N - 1,     % Decrement N by 1.
    sum(N1, Sum1),   % Recursively calculate sum of integers from 1 to N-1.
    Sum is Sum1 + N. % Sum is the sum of previous sum and N.
