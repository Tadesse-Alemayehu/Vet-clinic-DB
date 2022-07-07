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
INSERT INTO specialties(vet,species)
VALUES
((select vets.id from vets where name like 'William Tatcher'),
(SELECT species.id from species where species.name='Pokemon')),
((select vets.id from vets where name like 'Stephanie Mendez'),
(SELECT species.id from species where species.name='Digimon')),
((select vets.id from vets where name like 'Jack Harkness'),
(SELECT species.id from species where species.name='Digimon'));

/* Insert the following data for visits */
INSERT INTO visits(animal,vet,visit_date)
VALUES
((SELECT animals.id FROM animals WHERE animals.name like 'Agumon'),
(SELECT vets.id FROM vets WHERE vets.name like 'William Tatcher'),'2020/5/24'),
((SELECT animals.id FROM animals WHERE animals.name like 'Agumon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Stephanie Mendez'),'2020/6/22'),
((SELECT animals.id FROM animals WHERE animals.name like 'Gabumon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Jack Harkness'),'2021/2/2'),
((SELECT animals.id FROM animals WHERE animals.name like 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2020/1/5'),
((SELECT animals.id FROM animals WHERE animals.name like 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2020/3/8'),
((SELECT animals.id FROM animals WHERE animals.name like 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2020/5/14'),
((SELECT animals.id FROM animals WHERE animals.name like 'Devimon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Stephanie Mendez'),'2021/5/4'),
((SELECT animals.id FROM animals WHERE animals.name like 'Charmander'),
(SELECT vets.id FROM vets WHERE vets.name like 'Jack Harkness'),'2021/2/24'),
((SELECT animals.id FROM animals WHERE animals.name like 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2019/12/21'),
((SELECT animals.id FROM animals WHERE animals.name like 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'William Tatcher'),'2020/8/10'),
((SELECT animals.id FROM animals WHERE animals.name like 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2021/5/7'),
((SELECT animals.id FROM animals WHERE animals.name like 'Squirtle'),
(SELECT vets.id FROM vets WHERE vets.name like 'Stephanie Mendez'),'2019/4/29'),
((SELECT animals.id FROM animals WHERE animals.name like 'Angemon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Jack Harkness'),'2020/10/3'),
((SELECT animals.id FROM animals WHERE animals.name like 'Angemon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Jack Harkness'),'2020/11/4'),
((SELECT animals.id FROM animals WHERE animals.name like 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2019/1/2'),
((SELECT animals.id FROM animals WHERE animals.name like 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2019/5/15'),
((SELECT animals.id FROM animals WHERE animals.name like 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2020/2/27'),
((SELECT animals.id FROM animals WHERE animals.name like 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name like 'Maisy Smith'),'2020/8/3'),
((SELECT animals.id FROM animals WHERE animals.name like 'Blossom'),
(SELECT vets.id FROM vets WHERE vets.name like 'Stephanie Mendez'),'2020/5/24'),
((SELECT animals.id FROM animals WHERE animals.name like 'Blossom'),
(SELECT vets.id FROM vets WHERE vets.name like 'William Tatcher'),'2021/1/11');
