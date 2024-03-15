CREATE TABLE accdata
(accident_id VARCHAR(15),
severity_id INT,
severity VARCHAR(10),
road_surface_conditions_id INT,
road_surface_conditions VARCHAR(50),
accident_date DATE,
number_of_vehicles INT,
vehicle_type_id INT,
vehicle_type VARCHAR(50),
driver_class_id INT,
sex_of_driver VARCHAR(6),
age_of_driver INT,
sex_of_casualty VARCHAR(6),
age_of_casualty INT
);

BULK INSERT accdata
FROM 'C:\data\ACCDATA.TXT' 
WITH (FIRSTROW =2, FIELDTERMINATOR='|', ROWTERMINATOR = '\n');