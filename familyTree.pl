% Facts about relationships
male(john).
male(peter).
male(mark).
female(anna).
female(mary).
female(susan).

parent(john, peter).
parent(john, mary).
parent(anna, peter).
parent(anna, mary).
parent(peter, mark).
parent(susan, mark).

% Rules for defining specific relationships
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Rules for defining broader relationships
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Descendant).

% Rules for defining sibling relationships
sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Rules for defining cousin relationships
cousin(Cousin1, Cousin2) :-
    parent(Parent1, Cousin1),
    parent(Parent2, Cousin2),
    sibling(Parent1, Parent2),
    \+ sibling(Cousin1, Cousin2).

% Rules for defining aunt/uncle relationships
aunt_or_uncle(AuntUncle, NieceNephew) :-
    parent(Parent, NieceNephew),
    sibling(AuntUncle, Parent),
    \+ parent(AuntUncle, NieceNephew),
    female(AuntUncle).

% Rules for defining niece/nephew relationships
niece_or_nephew(NieceNephew, AuntUncle) :-
    aunt_or_uncle(AuntUncle, NieceNephew),
    \+ parent(NieceNephew, AuntUncle).

% Rules for defining cousin relationships based on parent's gender
male_cousin(Cousin1, Cousin2) :-
    cousin(Cousin1, Cousin2),
    male(Cousin1).
female_cousin(Cousin1, Cousin2) :-
    cousin(Cousin1, Cousin2),
    female(Cousin1).

% Rules for defining grandparent's gender
grandmother(Grandmother, Grandchild) :-
    grandparent(Grandmother, Grandchild),
    female(Grandmother).
grandfather(Grandfather, Grandchild) :-
    grandparent(Grandfather, Grandchild),
    male(Grandfather).
