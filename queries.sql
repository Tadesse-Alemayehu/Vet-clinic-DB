SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';


 CREATE INDEX animal_count_index on visits(animal_id ASC);
 CREATE INDEX visits_vet_id_index on visits(vet_id ASC);
 CREATE INDEX owner_email_index ON owners(email ASC);
