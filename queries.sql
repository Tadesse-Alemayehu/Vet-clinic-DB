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