/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals VALUES 
(1, 'Agumon', '03-02-2020', 0, true, 10.23),
(2, 'Gabumon', '11-15-2018', 2, true, 8), 
(3, 'Pikachu', '01-07-2021', 1, false, 15.04), 
(4, 'Devimon', '05-12-2017', 5, true, 11)

INSERT INTO animals VALUES 
(8, 'Charmander', '02-08-2020', 0, false, -11), 
(9, 'Plantmon', '11-15-2021', 2, true, -5.7), 
(10, 'Squirtle', '04-02-1993', 3, false,-12.13), 
(11, 'Angemon', '06-07-2005', 1, true, -45), 
(12, 'Boarmon', '06-07-2005', 7, true, 20.4), 
(13, 'Blossom', '10-13-1998', 3, true, 17),
(14, 'Ditto', '04-14-2022', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES
	('Sam Smith', '34'),
	('Jennifer Orwell', '19'),
	('Bob', '45'),
	('Melody Pond', '77'),
	('Dean Winchester', '14'),
	('Jodie Whittaker', '38');

INSERT INTO species (name)
VALUES
	('Pokemon'),
	('Digimon');

BEGIN;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon'); 
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom'); 
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon'); 
