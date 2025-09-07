-- Q1-1. The names of owners and their pet's name for all pets who are female.
SELECT name, owner FROM pet WHERE sex = 'f';

-- Q1-2. The names and birth dates of pets which are dogs.
SELECT name, birth FROM pet WHERE species = 'dog';

-- Q1-3. The names of the owners of birds.
SELECT owner FROM pet WHERE species = 'bird';

-- Q1-4. The species of pets who are female.
SELECT species FROM pet WHERE sex = 'f';

-- Q1-5. The names and birth dates of pets which are cats or birds.
SELECT name, birth FROM pet WHERE species = 'cat' OR species = 'bird';

-- Q1-6. The names and species of pets which are cats or birds and which are female.
SELECT name, species FROM pet WHERE (species = 'cat' OR species  = 'bird') AND sex = 'f';


-- Q2-1. The names of owners and their pets where the pet's name ends with “er” or “all”
SELECT name, owner FROM pet WHERE name LIKE '%er' OR name LIKE '%all'; 

-- Q2-2. The names of any pets whose owner's name contains an "e"
SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3. The names of all pets whose name does not end with "fy"
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4. All pet names whose owners name is only four characters long
SELECT name FROM pet WHERE LENGTH(owner) = 4;

-- Q2-5. All owners whose names begin and end with one of the first five letters of the alphabet
SELECT owner FROM pet WHERE UPPER(SUBSTRING(owner, 1, 1)) IN ('A','B','C','D','E') AND UPPER(SUBSTRING(owner, -1, 1)) IN ('A','B','C','D','E');

-- Q2-6. Repeat the previous query, but make the query sensitive to the case of letters of the alphabet the characters in the name
SELECT owner FROM pet WHERE SUBSTRING(owner, 1, 1) IN ('A','B','C','D','E') AND SUBSTRING(owner, -1, 1) IN ('A','B','C','D','E');


-- Q3-1. The average number of check-ups that each owner has made with their pets
SELECT owner, AVG(checkups) AS "average checkups" FROM pet GROUP BY owner;

-- Q3-2. The number of pets of each species in ascending order
SELECT species, COUNT(*) AS count FROM pet GROUP BY species ORDER BY count ASC;

-- Q3-3. The number of pets of each species that each owner has
SELECT species, owner, COUNT(*) AS count FROM pet GROUP BY species, owner;

-- Q3-4. The number of distinct species of pet each owner has
SELECT owner, COUNT(DISTINCT(species)) AS count FROM pet GROUP BY owner;

-- Q3-5. The number of pets of each gender there are in the database, where the gender is known
SELECT sex, COUNT(*) AS count FROM pet WHERE sex IN ('m', 'f') GROUP BY sex;

-- Q3-6. The number of birds each owner has
SELECT owner, COUNT(*) AS count FROM pet WHERE species = 'bird' GROUP BY owner;

-- Q3-7. The total number of check-ups each owner has made with all their pets
SELECT owner, SUM(checkups) AS "total checkups" FROM pet GROUP BY owner;
