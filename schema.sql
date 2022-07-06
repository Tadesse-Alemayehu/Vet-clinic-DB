/* Database schema to keep the structure of entire database. */
DROP DATABASE if exists vet_clinic;
CREATE DATABASE vet_clinic;
CREATE TABLE IF NOT EXISTS animals (
    id INT,
    name varchar,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
ALTER TABLE animals
ADD COLUMN species varchar;
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar,
    age INT,
    PRIMARY KEY(id)
);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar
);
