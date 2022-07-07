/* Populate database with sample data. */

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Agumon', '2020/2/3', 0, TRUE, 10.23),
  ('Gabumon', '2018/11/15', 2, TRUE, 8),
  ('Pikachu', '2021/1/7', 1, FALSE, 15.04),
  ('Devimon', '2017/5/12', 5, TRUE, 11);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES 
  ('Charmander', '2020/2/8', 0, FALSE, -11),
  ('Plantmon', '20201/11/15', 2, TRUE, -5.7),
  ('Squirtle', '1993/4/2', 1, FALSE, -12.13),
  ('Angemon', '2005/6/12', 5, TRUE, -45),
  ('Boarmon', '2005/6/7', 2, TRUE, 20.4),
  ('Blossom', '1998/10/13', 1, TRUE, 17),
  ('Ditto', '2022/5/14', 5, TRUE, 22);


/* Vet clinic database: query multiple tables */

INSERT INTO owners (full_name,age)
VALUES 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob ',45),
('Melody Pond',44),
('Dean Winchester',14),
('Jodie Whittaker',38);

INSERT INTO species(name)
VALUES 
('Pokemon'),
('Digimon');

UPDATE animals 
SET species_id =2
WHERE  name  LIKE '%mon';

UPDATE animals 
SET species_id =1
WHERE  name NOT LIKE '%mon';

UPDATE animals 
SET owner_id = 1
WHERE name like 'Agumon';

UPDATE animals 
SET owner_id = 2
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals 
SET owner_id = 3
WHERE name IN ('Devimon','Plantmon');

UPDATE animals 
SET owner_id = 4
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals 
SET owner_id = 5
WHERE name IN ('Angemon','Boarmon');


/* Vet clinic database: add "join table" for visits */

/* Insert the following data for vets*/
INSERT INTO vets(name,age,date_of_graduation) 
VALUES 
  ('William Tatcher',45,'2000/4/23'),
  ('Maisy Smith',26,'2019/4/23'),
  ('Stephanie Mendez',64,'1981/4/23'),
  ('Jack Harkness',38,'2008/4/23');

/* Insert the following data for specialties: */
select id,name from vets where name like 'William Tatcher';
SELECT species.id from species where species.name='Pokemon';
INSERT INTO specialties(vet,species)
values
((select vets.id from vets where name like 'William Tatcher'),
(SELECT species.id from species where species.name='Pokemon')),
((select vets.id from vets where name like 'Stephanie Mendez'),
(SELECT species.id from species where species.name='Digimon')),
((select vets.id from vets where name like 'Jack Harkness'),
(SELECT species.id from species where species.name='Digimon'));

/* Insert the following data for visits */


