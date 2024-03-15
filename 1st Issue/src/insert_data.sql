--Feeding Driver Table--
INSERT INTO driver
		SELECT DISTINCT driver_class_id,sex_of_driver,age_of_driver
				FROM accdata

--Feeding surface Table--
INSERT INTO surface
		SELECT DISTINCT road_surface_conditions_id,road_surface_conditions
				FROM accdata

--Feeding timeinfo Table--
INSERT INTO timeinfo
		SELECT DISTINCT accident_date, DATEPART(YEAR,accident_date), DATEPART(MONTH,accident_date),
										DATEPART(DAY,accident_date),
										DATEPART(QUARTER,accident_date), DATEPART(WEEK,accident_date),
										DATEPART(DAYOFYEAR,accident_date), DATEPART(DW,accident_date)
				FROM accdata

--Feeding severity Table--
INSERT INTO severity
		SELECT DISTINCT severity_id,severity
				FROM accdata

--Feeding vehicle Table--
INSERT INTO vehicle
		SELECT DISTINCT vehicle_type_id,vehicle_type
				FROM accdata

--Creating cas table so we can feed it with the number of casualties for each accident
CREATE TABLE cas
(accident_id VARCHAR(15) PRIMARY KEY,
num_of_casualty INT);
INSERT INTO cas
SELECT DISTINCT accident_id, count(age_of_casualty) FROM accdata GROUP BY accident_id


--Feeding accident Fact Table--
INSERT INTO accident
		SELECT DISTINCT accdata.accident_id,severity_id,road_surface_conditions_id,number_of_vehicles,vehicle_type_id,driver_class_id, accident_date, num_of_casualty
				FROM accdata inner join cas ON accdata.accident_id=cas.accident_id

DROP TABLE cas;