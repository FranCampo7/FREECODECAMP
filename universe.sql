CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(60),
    age_in_years INT,
    galaxy_type VARCHAR(30) NOT NULL,
    distance_from_earth NUMERIC
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(60),
    age_in_years INT,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    star_type VARCHAR(30) NOT NULL,
    mass_solar NUMERIC
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(60),
    has_life BOOLEAN,
    age_in_years INT,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_type VARCHAR(30) NOT NULL,
    orbital_period_years NUMERIC
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(60),
    distance_from_earth_in_km INT,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    moon_type VARCHAR(30) NOT NULL,
    orbital_period_days NUMERIC
);

CREATE TABLE earth (
    earth_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    species_in_num INT,
    has_live_species BOOLEAN NOT NULL,
    age_in_millions_of_years NUMERIC,
    more_info TEXT
);


INSERT INTO galaxy (name, description, age_in_years, galaxy_type, distance_from_earth) VALUES
('Milky Way', 'Nuestra galaxia natal', 13800, 'Spiral', 0),
('Andromeda', 'Galaxia más cercana', 10000, 'Spiral', 2537000),
('Triangulum', 'Galaxia del Grupo Local', 12000, 'Spiral', 3000000),
('Whirlpool', 'Galaxia con brazos definidos', 8000, 'Spiral', 23000000),
('Pinwheel', 'Galaxia espiral', 9500, 'Spiral', 21000000),
('Sombrero', 'Galaxia con bulbo central', 13000, 'Spiral', 29000000);

INSERT INTO star (name, description, age_in_years, galaxy_id, star_type, mass_solar) VALUES
('Sun', 'Estrella del sistema solar', 4600, 1, 'Main Sequence', 1.0),
('Sirius', 'Estrella más brillante', 242, 1, 'Main Sequence', 2.0),
('Betelgeuse', 'Supergigante roja', 8, 1, 'Red Supergiant', 12.0),
('Rigel', 'Supergigante azul', 8, 1, 'Blue Supergiant', 21.0),
('Proxima Centauri', 'Estrella más cercana', 4850, 1, 'Red Dwarf', 0.12),
('Vega', 'Estrella brillante', 455, 1, 'Main Sequence', 2.1),
('Alpha Centauri A', 'Parte del sistema triple', 5800, 1, 'Main Sequence', 1.1);

INSERT INTO planet (name, description, has_life, age_in_years, star_id, planet_type, orbital_period_years) VALUES
('Mercury', 'Planeta rocoso cercano', FALSE, 4500, 1, 'Terrestrial', 0.24),
('Venus', 'Planeta más caliente', FALSE, 4500, 1, 'Terrestrial', 0.62),
('Earth', 'Único con vida', TRUE, 4500, 1, 'Terrestrial', 1.0),
('Mars', 'Planeta rojo', FALSE, 4500, 1, 'Terrestrial', 1.88),
('Jupiter', 'Gigante gaseoso', FALSE, 4500, 1, 'Gas Giant', 12.0),
('Saturn', 'Planeta con anillos', FALSE, 4500, 1, 'Gas Giant', 29.0),
('Uranus', 'Gigante de hielo', FALSE, 4500, 1, 'Ice Giant', 84.0),
('Neptune', 'Gigante lejano', FALSE, 4500, 1, 'Ice Giant', 165.0),
('Kepler-452b', 'Exoplaneta habitable', TRUE, 6000, 2, 'Super Earth', 385.0),
('Proxima b', 'Exoplaneta cercano', FALSE, 4850, 5, 'Terrestrial', 0.03),
('TRAPPIST-1e', 'Exoplaneta rocoso', TRUE, 7500, 6, 'Terrestrial', 6.1),
('Gliese 581g', 'Posible planeta habitable', TRUE, 7000, 7, 'Super Earth', 37.0);

INSERT INTO moon (name, description, distance_from_earth_in_km, planet_id, moon_type, orbital_period_days) VALUES
('Moon', 'Luna de la Tierra', 384400, 3, 'Natural Satellite', 27.3),
('Phobos', 'Luna de Marte', 9376, 4, 'Natural Satellite', 0.3),
('Deimos', 'Luna pequeña de Marte', 23458, 4, 'Natural Satellite', 1.3),
('Io', 'Luna volcánica', 628300000, 5, 'Natural Satellite', 1.8),
('Europa', 'Luna con posible océano', 628300000, 5, 'Natural Satellite', 3.6),
('Ganymede', 'Luna más grande', 628300000, 5, 'Natural Satellite', 7.2),
('Callisto', 'Luna con cráteres', 628300000, 5, 'Natural Satellite', 16.7),
('Titan', 'Luna con atmósfera', 1220000000, 6, 'Natural Satellite', 16.0),
('Enceladus', 'Luna con géiseres', 1220000000, 6, 'Natural Satellite', 1.4),
('Mimas', 'Luna con gran cráter', 1220000000, 6, 'Natural Satellite', 0.9),
('Triton', 'Luna de Neptuno', 435000000, 8, 'Natural Satellite', 5.9),
('Oberon', 'Luna de Urano', 287000000, 7, 'Natural Satellite', 13.5),
('Titania', 'Luna grande de Urano', 287000000, 7, 'Natural Satellite', 8.7),
('Rhea', 'Luna de Saturno', 1220000000, 6, 'Natural Satellite', 4.5),
('Dione', 'Luna de Saturno', 1220000000, 6, 'Natural Satellite', 2.7),
('Tethys', 'Luna de Saturno', 1220000000, 6, 'Natural Satellite', 1.9),
('Iapetus', 'Luna bicolor', 1220000000, 6, 'Natural Satellite', 79.0),
('Hyperion', 'Luna irregular', 1220000000, 6, 'Natural Satellite', 21.0),
('Miranda', 'Luna caótica', 287000000, 7, 'Natural Satellite', 1.4),
('Charon', 'Luna de Plutón', 1950000000, 8, 'Natural Satellite', 6.4);

INSERT INTO earth (name, species_in_num, has_live_species, age_in_millions_of_years, more_info) VALUES
('Earth', 8700000, TRUE, 4500, 'Planeta azul, hogar de la humanidad.'),
('Terra Nova', 12500000, TRUE, 3800, 'Planeta terraformado con alta biodiversidad.'),
('Eden Prime', 6500000, TRUE, 5200, 'Mundo fértil considerado un paraíso ecológico.');
