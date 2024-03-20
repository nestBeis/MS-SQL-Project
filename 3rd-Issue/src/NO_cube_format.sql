-- DBMS not supporting cube format query
CREATE VIEW accidents_view AS
SELECT severity, road_surface_conditions, vehicle_type, Count(accident_id) Accidents
FROM severity, surface, vehicle, accident
WHERE severity.severity_id=accident.severity_id AND
	  surface.road_surface_conditions_id=accident.road_surface_conditions_id AND
	  vehicle.vehicle_type_id=accident.vehicle_type_id
GROUP BY severity.severity, road_surface_conditions, vehicle_type

SELECT severity,road_surface_conditions,vehicle_type
FROM accidents_view
GROUP BY severity, road_surface_conditions,vehicle_type
UNION
SELECT severity,road_surface_conditions,null
FROM accidents_view
GROUP BY severity, road_surface_conditions
UNION
SELECT severity, null, vehicle_type
FROM accidents_view
UNION
SELECT null, road_surface_conditions, vehicle_type
FROM accidents_view
GROUP BY road_surface_conditions, vehicle_type
UNION
SELECT severity, null, null
FROM accidents_view
GROUP BY severity
UNION
SELECT null, road_surface_conditions, null
FROM accidents_view
GROUP BY road_surface_conditions
UNION
SELECT null, null, vehicle_type
FROM accidents_view
GROUP BY vehicle_type
UNION
SELECT null, null, NULL
FROM accidents_view