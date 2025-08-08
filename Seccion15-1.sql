--Comando VIEW
CREATE VIEW view_employees AS
SELECT employee_id, first_name, last_name, email
FROM employees
WHERE employee_id BETWEEN 100 AND 124;

SELECT * 
FROM view_employees;

CREATE OR REPLACE VIEW view_euro_countries AS
SELECT country_id, region_id, country_name, capitol
FROM wf_countries
WHERE location LIKE '%Europe';

SELECT * 
FROM view_euro_countries
ORDER BY country_name;

CREATE TABLE wf_world_regions 
(
    region_id NUMERIC(3,0) PRIMARY KEY,
    region_name VARCHAR(35) NOT NULL
);

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (14, 'Eastern Africa');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (17, 'Middle Africa');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (15, 'Northern Africa');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (18, 'Southern Africa');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (11, 'Western Africa');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (29, 'Caribbean');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (13, 'Central America');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (5, 'South America');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (21, 'Northern America');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (143, 'Central Asia');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (30, 'Eastern Asia');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (34, 'Southern Asia');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (35, 'South-Eastern Asia');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (145, 'Western Asia');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (151, 'Eastern Europe');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (154, 'Northern Europe');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (39, 'Southern Europe');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (155, 'Western Europe');

INSERT INTO wf_world_regions (region_id, region_name) 
VALUES (9, 'Oceania');

CREATE OR REPLACE VIEW view_euro_countries2
("ID", "Country", "Capitol City", "Region") AS
SELECT c.country_id, c.country_name, c.capitol, r.region_name
FROM wf_countries c
JOIN wf_world_regions r USING (region_id)
WHERE c.location LIKE '%Europe';

SELECT * 
FROM view_euro_countries;

CREATE OR REPLACE VIEW view_high_pop
("Region ID", "Highest population") AS
SELECT region_id, MAX(population)
FROM wf_countries
GROUP BY region_id;

SELECT * 
FROM view_high_pop;

CREATE OR REPLACE VIEW view_euro_countries AS
SELECT country_id, region_id, country_name, capitol
FROM wf_countries
WHERE location LIKE '%Europe';