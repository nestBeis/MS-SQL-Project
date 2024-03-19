--Display a list with the number of accidents per year and accident severity. The list should be sorted by year in descending order.
SELECT COUNT(accident_id) ACCIDENTS , severity_id SEVERITY, t_year YEAR
FROM accident, timeinfo
WHERE accident.time_key=timeinfo.time_key
GROUP BY t_year, severity_id
ORDER BY t_year DESC, severity_id ASC;

--Display a list with the number of fatal accidents and the total number of casualties by gender and age of the responsible driver.
SELECT COUNT(severity_id) Fatal_accidents, SUM(num_of_casualties) Casualties, sex_of_driver, age_of_driver
FROM accident, driver
WHERE accident.driver_class_id=driver.driver_class_id AND severity_id=1
GROUP BY sex_of_driver, age_of_driver
ORDER BY Casualties DESC

--Display a list with an analysis of the number of accidents based on the road surface conditions and the severity of the accident.
SELECT road_surface_conditions, COUNT(accident_id) Accidents, severity.severity
FROM surface, accident, severity
WHERE surface.road_surface_conditions_id= accident.road_surface_conditions_id AND accident.severity_id=severity.severity_id
GROUP BY road_surface_conditions, severity.severity
ORDER BY road_surface_conditions

--Display a list with the number of accidents and the number of casualties per year and vehicle type that caused the accident. The list should only calculate for accidents involving more than 2 vehicles.
SELECT COUNT(accident_id) Accidents, SUM(num_of_casualties) Casualties, vehicle_type, t_year
FROM accident, vehicle, timeinfo
WHERE accident.vehicle_type_id=vehicle.vehicle_type_id AND accident.time_key=timeinfo.time_key AND number_of_vehicles>2
GROUP BY t_year, vehicle_type
ORDER BY t_year, Accidents desc

--The ministry's management wants a report that will contain the following information:
--a. The total number of accidents, the total number of vehicles involved in any accident, and the total number of victims during the decade (2005 to 2015).
--b. The number of accidents, the number of vehicles involved in an accident, and the number of victims on an annual basis.
--c. The number of accidents, the number of vehicles involved in an accident, and the number of victims per quarter and month for each year.
--Write a SQL query that generates the above report.
SELECT COUNT(accident_id) Accidents, SUM(number_of_vehicles) Vehicles, SUM(num_of_casualties) Casualties, t_year, t_quarter,t_month
FROM accident, timeinfo
WHERE accident.time_key=timeInfo.time_key
GROUP BY ROLLUP(t_year, t_quarter, t_month)
