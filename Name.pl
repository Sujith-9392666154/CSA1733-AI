% Define the database with facts
person('Alice', date(1990, 5, 21)).
person('Bob', date(1985, 8, 14)).
person('Charlie', date(1992, 12, 1)).
person('Diana', date(1988, 3, 7)).
person('Eve', date(1995, 6, 30)).

% Rule to find a person's date of birth by name
date_of_birth(Name, DateOfBirth) :-
    person(Name, DateOfBirth).

% Rule to find a person's name by date of birth
name_by_dob(DateOfBirth, Name) :-
    person(Name, DateOfBirth).

% Rule to check if a person is born in a specific year
born_in_year(Name, Year) :-
    person(Name, date(Year, _, _)).

% Rule to find all persons born in a specific month
born_in_month(Name, Month) :-
    person(Name, date(_, Month, _)).

% Rule to find all persons born in a specific year and month
born_in_year_month(Name, Year, Month) :-
    person(Name, date(Year, Month, _)).