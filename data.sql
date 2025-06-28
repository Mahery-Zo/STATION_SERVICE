CREATE DATABASE stations_service;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE TABLE route (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(LINESTRING, 4326),
    name VARCHAR(100)
);
CREATE TABLE stations (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(POINT, 4326),
    name VARCHAR(100),
    fuel_type VARCHAR(50),
    hours VARCHAR(50),
    services TEXT
);

CREATE TABLE buffer_zone AS
SELECT ST_Buffer(geom, 0.005) AS geom
FROM route;


SELECT s.id, s.name, s.fuel_type, s.hours, s.services, ST_AsGeoJSON(s.geom) AS geometry
FROM stations s, buffer_zone b
WHERE ST_Within(s.geom, b.geom);


ALTERNATIVE AN ITO 

SELECT s.id, s.name, s.fuel_type, s.hours, s.services, ST_AsGeoJSON(s.geom) AS geometry
FROM stations s, buffer_zone b
WHERE ST_Within(s.geom, b.geom);