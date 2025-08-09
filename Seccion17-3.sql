--Expresiones regulares
SELECT first_name, last_name
FROM employees
WHERE first_name ~ '^Ste(v|ph)en$';

SELECT last_name, regexp_replace(last_name, '^H(a|e|i|o|u)', '**') AS "Name changed"
FROM employees;

SELECT c.country_name, COUNT(m[1]) AS "Count of 'ab'"
FROM wf_countries c
JOIN LATERAL regexp_matches(c.country_name, '(ab)', 'gi') AS m ON true
GROUP BY c.country_name;

ALTER TABLE employees
ADD CONSTRAINT email_addr_chk
CHECK (email ~ '@') NOT VALID;

CREATE TABLE my_contacts 
(
    first_name VARCHAR(15),
    last_name  VARCHAR(15), 
    email      VARCHAR(30) CHECK (email ~ '.+@.+\..+')
);