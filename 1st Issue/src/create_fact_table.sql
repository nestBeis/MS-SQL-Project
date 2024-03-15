CREATE TABLE accident
 (accident_id VARCHAR(15),
  severity_id INT,
  road_surface_conditions_id INT,
  number_of_vehicles INT,
  vehicle_type_id INT,
  driver_class_id INT,
  time_key DATETIME,
  num_of_casualties INT
  PRIMARY KEY(accident_id,severity_id,road_surface_conditions_id,vehicle_type_id,driver_class_id,time_key),
  FOREIGN KEY(severity_id) REFERENCES severity(severity_id),
  FOREIGN KEY(road_surface_conditions_id) REFERENCES surface(road_surface_conditions_id),
  FOREIGN KEY(vehicle_type_id) REFERENCES vehicle(vehicle_type_id),
  FOREIGN KEY(driver_class_id) REFERENCES driver(driver_class_id),
  FOREIGN KEY(time_key) REFERENCES timeinfo(time_key)
  );