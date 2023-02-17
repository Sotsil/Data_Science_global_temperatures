USE CO2_emissions;
SELECT * FROM emissions_electricity_heat_prod WHERE Period_Time >= 2017 AND Period_Time <= 2021;
SELECT * FROM emissions_electricity_heat_prod 
JOIN emissions_percapita_by_region 
ON emissions_electricity_heat_prod.Period_time = emissions_percapita_by_region.Period_Time;




SELECT * fROM emissions_advanced_econ 
join emissions_emerging_econ
ON emissions_advanced_econ.Period_time = emissions_emerging_econ.Period_Time
WHERE emissions_advanced_econ.Period_time > 2016;

CREATE VIEW CO2_major_econ AS(
SELECT EAE.*, EEE.China, EEE.India 
FROM emissions_advanced_econ AS EAE
JOIN emissions_emerging_econ AS EEE
ON EAE.Period_time = EEE.Period_Time);

SELECT * FROM co2_major_econ;


SELECT * FROM temp_increase_annual 
WHERE Celsius < 0
Order by Period_Time desc;














