CREATE DATABASE spacex_db;
USE spacex_db;

CREATE TABLE spacex (
    Date DATE,
    Time_UTC TIME,
    Booster_Version VARCHAR(100),
    Launch_Site VARCHAR(100),
    Payload VARCHAR(255),
    PAYLOAD_MASS_KG DOUBLE,
    Orbit VARCHAR(50),
    Customer VARCHAR(255),
    Mission_Outcome VARCHAR(255),
    Landing_Outcome VARCHAR(255)
);

LOAD DATA LOCAL INFILE 'C:/Users/ugurp/Documents/00_Learn/Coursera/IBM Data Science/10 Angewandte Datenwissenschaft Capstone/009 Spacex.csv'
INTO TABLE spacex
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Date,
    Time_UTC,
    Booster_Version,
    Launch_Site,
    Payload,
    PAYLOAD_MASS_KG,
    Orbit,
    Customer,
    Mission_Outcome,
    Landing_Outcome
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

SELECT @@local_infile;

SELECT * FROM spacex_db.spacex;

SELECT COUNT(*) AS anzahl_zeilen
FROM spacex;

SELECT Date, Time_UTC, Payload, COUNT(*) AS anzahl
FROM spacex
GROUP BY Date, Time_UTC, Payload
HAVING COUNT(*) > 1;

TRUNCATE TABLE spacex;