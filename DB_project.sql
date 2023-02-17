CREATE database CO2_Emissions;
USE CO2_Emissions;
select * FROM electricity_heat_prod;
select * FROM advanced_economies;
select * FROM per_capita_by_region;
select * FROM emissions_1900_2022;
select * FROM temp_increase_1900_2022;
select * FROM t_increase_month;
DROP TABLE emissions_1900_2022;
DROP TABLE t_increase_month;
DROP TABLE temp_increase_1900_2022;

CREATE TABLE IF NOT EXISTS EMISSIONS_1900_2022(
Period_Time int (11),
GtCo2 double
);
CREATE TABLE IF NOT EXISTS temp_increase_month(
Period_Time varchar (20),
Celsius double
);
CREATE TABLE IF NOT EXISTS temp_increase_annual(
Period_Time int (11),
Celsius double
);

ALTER TABLE emissions_percapita_by_region
ADD PRIMARY KEY  (Period_time);

ALTER TABLE emissions_electricity_heat_prod
ADD FOREIGN KEY (Period_Time) REFERENCES emissions_percapita_by_region(Period_time);

ALTER TABLE emissions_advanced_econ
ADD PRIMARY KEY  (Period_time);

ALTER TABLE emissions_emerging_econ
ADD FOREIGN KEY (Period_Time) REFERENCES emissions_advanced_econ(Period_time);