DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS toys;


CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL /*NO TRAILING COMMAS!!*/
); /*REMEMBER THE SEMICOLON!!*/

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price FLOAT NOT NULL,
    color VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER NOT NULL,
    toy_id INTEGER NOT NULL,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cats(name, color, breed)
VALUES ('Fred', 'Blue', 'Korat'),
       ('Velma', 'Orange', 'Ragdoll'),
       ('Daphne', 'Purple', 'Sokoke'),
       ('Shaggy', 'Green', 'Cyprus'),
       ('Scooby', 'Brown', 'Doo');

INSERT INTO toys(price, color, name)
VALUES (0.57, 'Blue', 'Yarn'),
       (3.46, 'Orange', 'Laser'),
       (1.99, 'Purple', 'Yoyo'),
       (0.92, 'Green', 'Mouse'),
       (15.53, 'Brown', 'Cat Tree'),
       (3.50, 'Red', 'Ball')
      ;

INSERT INTO cattoys(cat_id, toy_id)
VALUES ((SELECT id 
        FROM cats
        WHERE name = 'Fred'),
        (SELECT id
        FROM toys
        WHERE name = 'Yarn'
        )),

        ((SELECT id 
        FROM cats
        WHERE name = 'Velma'), 
        (SELECT id
        FROM toys
        WHERE name = 'Laser'
        )), 

        ((SELECT id 
        FROM cats
        WHERE name = 'Daphne'),  
        (SELECT id
        FROM toys
        WHERE name = 'Yoyo'
        )), 
        
        ((SELECT id 
        FROM cats
        WHERE name = 'Shaggy'),  
        (SELECT id
        FROM toys
        WHERE name = 'Mouse'
        )), 
        
        ((SELECT id 
        FROM cats
        WHERE name = 'Scooby'),  
        (SELECT id
        FROM toys
        WHERE name = 'Cat Tree'
        ));
/* 

1. Finding cat name querey


EXPLAIN SELECT 
  cats.id
FROM
  cats
JOIN cattoys ON cattoys.cat_id = cats.id
JOIN toys ON cattoys.toy_id = toys.id
WHERE
  cats.name = 'Fred';


2. Finding toys that belong to a particular cat


EXPLAIN SELECT
  toys.name
FROM
  toys
JOIN cattoys ON cattoys.cat_id = toys.id
JOIN cats ON cattoys.toy_id = cats.id
WHERE
  cats.name = 'Velma';


3. Find all the toys and cats that are a particular color


EXPLAIN SELECT
  toys.name, cats.name
FROM
  cats
JOIN cattoys ON cattoys.cat_id = cats.id
JOIN toys ON cattoys.toy_id = toys.id
WHERE
  toys.color = 'Green' AND cats.color = 'Green';


EXPLAIN ANALYZE SELECT
  toys.name, cats.name
FROM
  cats
JOIN cattoys ON cattoys.cat_id = cats.id
JOIN toys ON cattoys.toy_id = toys.id
WHERE
  toys.color = 'Green' AND cats.color = 'Green';

----------------------

TOOK: 0.8ms ABOUT


4. Find all the toys that belong to a particular breed of cat


EXPLAIN SELECT
  toys.name
FROM
  toys
JOIN cattoys ON cattoys.cat_id = toys.id
JOIN cats ON cattoys.toy_id = cats.id
WHERE
  cats.breed = 'Ragdoll';


EXPLAIN ANALYZE SELECT
  toys.name
FROM
  toys
JOIN cattoys ON cattoys.cat_id = toys.id
JOIN cats ON cattoys.toy_id = cats.id
WHERE
  cats.breed = 'Ragdoll';

----------------------

TOOK: 3.6ms ABOUT

*/