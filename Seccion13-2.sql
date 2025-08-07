--Creacion de tablas con diferentes tipos de dato de fecha
CREATE TABLE time_ex1 
(
    exact_time TIMESTAMP
);

INSERT INTO time_ex1
VALUES ('2017-06-10 10:52:29.123456');

INSERT INTO time_ex1
VALUES (CURRENT_TIMESTAMP);

SELECT * 
FROM time_ex1;

CREATE TABLE time_ex2 
(
    time_with_offset TIMESTAMP WITH TIME ZONE
);

INSERT INTO time_ex2
VALUES (CURRENT_TIMESTAMP);

INSERT INTO time_ex2
VALUES ('2017-06-10 10:52:29.123456+02:00');

SELECT * 
FROM time_ex2;

CREATE TABLE time_ex3 
(
    first_column TIMESTAMP WITH TIME ZONE,
    second_column TIMESTAMP
);

INSERT INTO time_ex3
(first_column, second_column)
VALUES        
('2017-07-15 08:00:00-07:00', '2007-11-15 08:00:00');

SELECT * 
FROM time_ex3;

CREATE TABLE time_ex4 
(
    loan_duration1 INTERVAL YEAR TO MONTH,
    loan_duration2 INTERVAL YEAR TO MONTH
);

INSERT INTO time_ex4 (loan_duration1, loan_duration2)
VALUES (INTERVAL '120 months', INTERVAL '3 years 6 months');

SELECT 
CURRENT_DATE + loan_duration1 AS "120 months from now",
CURRENT_DATE + loan_duration2 AS "3 years 6 months from now"
FROM time_ex4;

CREATE TABLE time_ex5 
(
    day_duration1 INTERVAL DAY TO SECOND,
    day_duration2 INTERVAL DAY TO SECOND
);

INSERT INTO time_ex5 (day_duration1, day_duration2)
VALUES (INTERVAL '25 days', INTERVAL '10 days 4 hours 30 minutes 15 seconds');

SELECT 
CURRENT_TIMESTAMP + day_duration1 AS "25 Days from now",
TO_CHAR(CURRENT_TIMESTAMP + day_duration2, 'DD-Mon-YYYYHH12:MI:SS') AS "precise days and time from now"
FROM time_ex5;