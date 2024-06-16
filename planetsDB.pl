% Define the planets and their properties
planet(mercury).
planet(venus).
planet(earth).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).

% Planet properties: planet(Name, Diameter (km), Mass (10^24 kg), Distance from Sun (10^6 km))
planet_properties(mercury, 4879, 0.330, 57.9).
planet_properties(venus, 12104, 4.87, 108.2).
planet_properties(earth, 12756, 5.97, 149.6).
planet_properties(mars, 6792, 0.642, 227.9).
planet_properties(jupiter, 142984, 1898, 778.5).
planet_properties(saturn, 120536, 568, 1434).
planet_properties(uranus, 51118, 86.8, 2871).
planet_properties(neptune, 49528, 102, 4495).

% Relationship: planet_orbits(Planet, OrbitsAround)
planet_orbits(mercury, sun).
planet_orbits(venus, sun).
planet_orbits(earth, sun).
planet_orbits(mars, sun).
planet_orbits(jupiter, sun).
planet_orbits(saturn, sun).
planet_orbits(uranus, sun).
planet_orbits(neptune, sun).

% Rules for retrieving planet properties
diameter(Planet, Diameter) :-
    planet_properties(Planet, Diameter, _, _).

mass(Planet, Mass) :-
    planet_properties(Planet, _, Mass, _).

distance_from_sun(Planet, Distance) :-
    planet_properties(Planet, _, _, Distance).

% Example queries:
% 1. What is the diameter of Earth?
% ?- diameter(earth, Diameter).

% 2. What is the mass of Jupiter?
% ?- mass(jupiter, Mass).

% 3. What is the distance from the sun of Mars?
% ?- distance_from_sun(mars, Distance).

% 4. Which planets orbit the sun?
% ?- planet_orbits(Planet, sun).

% 5. List all planets and their properties
% ?- planet_properties(Planet, Diameter, Mass, Distance).