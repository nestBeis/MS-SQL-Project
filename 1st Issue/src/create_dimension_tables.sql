CREATE TABLE driver
(driver_class_id INT PRIMARY KEY,
 sex_of_driver VARCHAR(6),
 age_of_driver INT
 );

CREATE TABLE surface
(road_surface_conditions_id INT PRIMARY KEY,
 road_surface_conditions VARCHAR(50)
 );

CREATE TABLE timeinfo
(time_key DATETIME PRIMARY KEY,
 t_year INT,
 t_month INT,
 t_dayofmonth INT,
 t_quarter INT,
 t_week INT,
 t_dayofyear INT,
 t_dayofweek INT
 );

CREATE TABLE vehicle
(vehicle_type_id INT PRIMARY KEY,
 vehicle_type VARCHAR(50)
 );

 CREATE TABLE severity
 (severity_id INT PRIMARY KEY,
  severity VARCHAR(10)
  );