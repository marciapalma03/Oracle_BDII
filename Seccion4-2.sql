CREATE TABLE wf_countries (
    country_id                NUMERIC(4,0),
    region_id                 NUMERIC(3,0) NOT NULL,
    country_name              VARCHAR(70) NOT NULL,
    country_translated_name   VARCHAR(40),
    location                  VARCHAR(90),
    capitol                   VARCHAR(50),
    area                      NUMERIC(15,0),
    coastline                 NUMERIC(8,0),
    lowest_elevation          NUMERIC(6,0),
    lowest_elev_name          VARCHAR(70),
    highest_elevation         NUMERIC(6,0),
    highest_elev_name         VARCHAR(50),
    date_of_independence      VARCHAR(30),
    national_holiday_name     VARCHAR(200),
    national_holiday_date     VARCHAR(30),
    population                NUMERIC(12,0),
    population_growth_rate    VARCHAR(10),
    life_expect_at_birth      NUMERIC(6,2),
    median_age                NUMERIC(6,2),
    airports                  NUMERIC(6,0),
    climate                   VARCHAR(1000),
    fips_id                   CHAR(2),
    internet_extension        VARCHAR(3),
    flag                      BYTEA,
    currency_code             VARCHAR(7) NOT NULL,
    CONSTRAINT wf_crty_pk PRIMARY KEY (country_id)
);

INSERT INTO wf_countries (
    country_id, region_id, country_name, country_translated_name, location, capitol,
    area, coastline, lowest_elevation, lowest_elev_name, highest_elevation, highest_elev_name,
    date_of_independence, national_holiday_name, national_holiday_date, population,
    population_growth_rate, life_expect_at_birth, median_age, airports, climate,
    fips_id, internet_extension, flag, currency_code
)
VALUES
(1001, 21, 'Exampleland', 'Ejemplolandia', 'Central Continent', 'Sample City',
 500000, 1200, -10, 'Sample Valley', 3500, 'Mount Sample',
 '01-Jan-1900', 'Example Day', '01-Jan', 2500000, '1.2', 75.50, 32.1, 5,
 'temperate climate with distinct seasons', 'EX', '.ex', NULL, 'EXD'),

(1002, 34, 'Demoland', 'País Demo', 'Eastern Hemisphere', 'Demo Capital',
 750000, 500, 0, 'Demo Basin', 4200, 'Demo Peak',
 '15-Aug-1950', 'Demo National Holiday', '15-Aug', 10000000, '0.8', 70.20, 29.8, 12,
 'tropical climate with high humidity', 'DM', '.dm', NULL, 'DMD');

--Funcion numerica MOD
SELECT country_name, MOD(airports, 2) AS "Mod Demo"
FROM wf_countries;
