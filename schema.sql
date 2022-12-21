/* Database schema to keep the structure of entire database. */

-- CREATE TABLE animals (
--     name varchar(100)
-- );


-- -- Add an email column to your owners table
-- ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- CREATE INDEX animal_id ON visits(animal_id);
-- CREATE INDEX vet_id ON visits(vet_id);
-- CREATE INDEX email ON owners(email);

-- Schema for the vet_clinic Database

CREATE TABLE animals
(
    id integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
);

ALTER TABLE animals
ADD species VARCHAR(50);

----

CREATE TABLE owners(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name varchar(255) NOT NULL,
  age int NOT NULL
);

CREATE TABLE species(
  id bigsERIAL PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL
);

CREATE SEQUENCE temp;
ALTER TABLE animals ALTER COLUMN id SET NOT NULL;
ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('temp_id_seq');
ALTER SEQUENCE temp OWNED BY animals.id;

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals ADD species_id BIGINt REFERENCES species(id);

ALTER TABLE animals ADD owners_id BIGINT REFERENCES owners(id);


CREATE TABLE specialization (
    vets_id BIGINT REFERENCES vets (id),
    species_id BIGINT REFERENCES species (id)
);

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE visits (
    vets_id BIGINT REFERENCES vets (id),
    animals_id BIGINT REFERENCES animals (id),
    date_of_visit DATE NOT NULL
);