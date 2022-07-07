/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth BETWEEN '2016/1/1' and '2019/1/1';
select name from animals where neutered=true and escape_attempts<3;
select date_of_birth from animals where name like 'Agumon' or name like 'Pikachu';
select name, escape_attempts from animals where weight_kg>10.5;
select * from animals where neutered=true;
select * from animals where name not like 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 and 17.3;

/* Transaction queries */
BEGIN TRANSACTION;
update animals set species='unspecified';
select * from animals;
ROLLBACK TRANSACTION;
select * from animals;

BEGIN TRANSACTION;
update animals set species='digimon' where name like '%mon';
update animals set species='pokemon' where species=NULL;
select * from animals;
COMMIT TRANSACTION;
select * from animals;

BEGIN TRANSACTION;
delete from animals; 
ROLLBACK;
select * from animals;

BEGIN TRANSACTION;
delete from animals where date_of_birth = '2022/1/1';
select * from animals;
SAVEPOINT SAVEPOINT_NAME;
update animals set weight_kg=weight_kg*-1;
select * from animals;
ROLLBACK TO SAVEPOINT_NAME;
select * from animals;
update animals set weight_kg=weight_kg*-1 where weight_kg<0;
select * from animals;
COMMIT TRANSACTION;

/* agregate and groupby queriews */

select count(*) from animals;
select count(*) from animals where escape_attempts<1;
select avg(weight_kg) from animals;
select neutered,sum(escape_attempts) as sum from animals GROUP BY neutered;
select species,max(weight_kg),min(weight_kg) from animals GROUP BY species;
select species,avg(escape_attempts) from animals 
where date_of_birth between '1990/1/1' and '2000/1/1' 
GROUP BY species;


/* Vet clinic database: query multiple tables */

-- What animals belong to Melody Pond?
SELECT full_name,name 
FROM owners
join animals on animals.owner_id=owners.id
where owners.full_name='Melody Pond';

-- List of all animals that are pokemon
SELECT animals.*,species.name as animal_Type FROM animals 
JOIN species on animals.species_id=species.id
WHERE species.name like 'Pokemon';

-- List all owners and their animals
select * from owners
LEFT JOIN animals on animals.owner_id=owners.id;

-- How many animals are there per species
select species.name,count(*) as amount from species
JOIN animals on animals.species_id=species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
select species.name species_name,animals.name animal_name,owners.full_name
from species
join animals on species.id=animals.species_id
join owners on owners.id=animals.owner_id
where owners.full_name like 'Jennifer Orwell'
and species.name like 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
select * from animals
join owners on animals.owner_id=owners.id
where animals.escape_attempts<1 
and owners.full_name like 'Dean Winchester';

-- Who owns the most animals?
select owners.full_name as full_name,count(*) as count from animals
join owners on animals.owner_id=owners.id
group by owners.full_name
order by count DESC;


/* Vet clinic database: add "join table" for visits */

/* Who was the last animal seen by William Tatcher? */
SELECT animals.name as animal_name,
vets.name as vet_name, 
visits.visit_date 
FROM animals
JOIN visits on visits.animal=animals.id
JOIN vets on vets.id=visits.vet
where vets.name like 'William Tatcher'
ORDER BY visits.visit_date DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
select COUNT(DISTINCT animals.name) from animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
where vets.name like 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */
SELECT * from vets 
LEFT JOIN specialties ON vets.id=specialties.vet
LEFT JOIN species ON species.id=specialties.species

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name,visits.visit_date FROM animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
where vets.name like 'Stephanie Mendez'
AND visits.visit_date between '2020/4/1' AND '2020/8/30';

/* What animal has the most visits to vets? */
select animals.name, count(visits.animal) from animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
GROUP BY animals.name
ORDER BY COUNT DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
select animals.name, vets.name as vet_name, visits.visit_date FROM animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
WHERE vets.name like 'Maisy Smith' 
ORDER BY visits.visit_date LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
select animals.name as animal_name,
vets.name as vet_name, 
visits.visit_date 
FROM animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
ORDER BY visits.visit_date DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
select count(*) from animals
Join visits on animals.id=visits.animal
JOIN vets ON visits.vet=vets.id 
JOIN specialties ON vets.id=specialties.vet
JOIN species ON specialties.species=species.id
where animals.species_id!=species.id;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
select species.name, count(*) from animals
JOIN visits ON animals.id=visits.animal
JOIN vets ON visits.vet=vets.id
JOIN species ON animals.species_id=species.id
where vets.name like 'Maisy Smith'
GROUP BY species.name;