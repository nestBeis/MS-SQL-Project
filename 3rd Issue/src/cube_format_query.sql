-- Cube format query
SELECT severity, road_surface_conditions, vehicle_type, Count(accident_id) Accidents
FROM severity, surface, vehicle, accident
WHERE severity.severity_id=accident.severity_id AND
	  surface.road_surface_conditions_id=accident.road_surface_conditions_id AND
	  vehicle.vehicle_type_id=accident.vehicle_type_id
GROUP BY CUBE (severity.severity, road_surface_conditions, vehicle_type)

