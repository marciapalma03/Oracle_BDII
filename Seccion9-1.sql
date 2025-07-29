--Funcion GROUP BY y AVG
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

--Funcion GROUP BY y MAX
SELECT MAX(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;

--Funcion GROUP BY y COUNT
SELECT COUNT(country_name), region_id
FROM wf_countries
GROUP BY region_id
ORDER BY region_id;

SELECT COUNT(*) AS total_countries, region_id
FROM wf_countries
GROUP BY region_id
ORDER BY region_id;

--Funcion GROUP BY y WHERE
SELECT department_id, MAX(salary)
FROM employees
WHERE last_name <> 'King'
GROUP BY department_id;

--Funcion GROUP BY y ROUND
SELECT region_id, ROUND(AVG(population)) AS population
FROM wf_countries
GROUP BY region_id
ORDER BY region_id;

CREATE TABLE wf_spoken_languages 
(
    country_id   INTEGER,
    language_id  INTEGER,
    official     VARCHAR(2),
    comments     VARCHAR(512),
    CONSTRAINT wf_spoken_lang_pk PRIMARY KEY (country_id, language_id)
);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(39,1810,'N','Slovene-speaking minority in the Trieste-Gorizia area');

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(225,560,'Y',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,80,'N',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,1000,'QY','official in Kurdish regions');

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,100,'N',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,90,'N',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(81,860,'Y',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(203,460,'Y',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(203,1580,'N',NULL);

INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(204,0,'N',NULL);

SELECT country_id, COUNT(language_id) AS "Number of languages"
FROM wf_spoken_languages
GROUP BY country_id;

--Grupos dentro de grupos
SELECT department_id, job_id, COUNT(*)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id;

--Anidamiento de funciones
SELECT MAX(avg_salary) AS highest_avg_salary
FROM 
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) dept_avg;

--Funcion HAVING
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1
ORDER BY department_id;

SELECT region_id, ROUND(AVG(population)) AS avg_population
FROM wf_countries
GROUP BY region_id
HAVING MIN(population) > 300000
ORDER BY region_id;