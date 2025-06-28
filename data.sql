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
    osm_id VARCHAR(20),
    addr_city VARCHAR(100),
    addr_postc VARCHAR(20),
    addr_stree VARCHAR(100),
    addr_unit VARCHAR(50),
    amenity VARCHAR(50),
    brand VARCHAR(100),
    brand_wiki VARCHAR(100),
    brand_wi_1 VARCHAR(100),
    bridge VARCHAR(10),
    created_by VARCHAR(100),
    highway VARCHAR(50),
    junction VARCHAR(50),
    lanes VARCHAR(10),
    layer VARCHAR(10),
    name VARCHAR(100),
    name_en VARCHAR(100),
    name_fr VARCHAR(100),
    old_name VARCHAR(100),
    oneway VARCHAR(10),
    operator VARCHAR(100),
    ref VARCHAR(20),
    shop VARCHAR(50),
    source VARCHAR(100),
    surface VARCHAR(50),
    tunnel VARCHAR(10)
);


CREATE INDEX stations_geom_idx ON stations USING GIST (geom);

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


ALTER TABLE route
ADD COLUMN addr_city VARCHAR(100),
ADD COLUMN addr_postc VARCHAR(20),
ADD COLUMN addr_stree VARCHAR(100),
ADD COLUMN addr_unit VARCHAR(50),
ADD COLUMN amenity VARCHAR(50),
ADD COLUMN brand VARCHAR(100),
ADD COLUMN brand_wiki VARCHAR(100),
ADD COLUMN brand_wi_1 VARCHAR(100),
ADD COLUMN bridge VARCHAR(10),
ADD COLUMN created_by VARCHAR(100),
ADD COLUMN junction VARCHAR(50),
ADD COLUMN lanes VARCHAR(10),
ADD COLUMN layer VARCHAR(10),
ADD COLUMN name_en VARCHAR(100),
ADD COLUMN name_fr VARCHAR(100),
ADD COLUMN old_name VARCHAR(100),
ADD COLUMN operator VARCHAR(100),
ADD COLUMN shop VARCHAR(50),
ADD COLUMN source VARCHAR(100),
ADD COLUMN surface VARCHAR(50),
ADD COLUMN tunnel VARCHAR(10),
ADD COLUMN osm_id VARCHAR(20);



INSERT INTO route (
    osm_id, addr_city, addr_postc, addr_stree, addr_unit, amenity, brand, brand_wiki, brand_wi_1, 
    bridge, created_by, highway, junction, lanes, layer, name, name_en, name_fr, old_name, 
    oneway, operator, ref, shop, source, surface, tunnel
) VALUES
('way/27362008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/27362040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/27362109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/27362118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/28823139', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28915120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28915127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '3', NULL, 'Làlana Ralaimongo', NULL, 'Rue Ralaimongo', NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28915149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '3', '-1', 'Tunnel d''Ambohidahy', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, 'yes'),
('way/28915150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28915257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28915271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/28930045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, 'Araben''ny 26 Jona 1960', 'Avenue du 26 Juin 1960', NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/30321431', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/30583704', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'Potlatch 0.10f', 'primary', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/30583899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Potlatch 0.10f', 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/31233797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'primary', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/45181094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/45181097', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/45181098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/45181100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/45478182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Làlana Mohamed V', 'Rue Mohamed V', NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/76833493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, 'yahoo', 'asphalt', NULL),
('way/76833494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'primary', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, 'yahoo', 'asphalt', NULL),
('way/77338147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/119369725', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/186254005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/186254012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/186255403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/186255410', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/186255413', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/186255416', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/267005638', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, 'yahoo', 'asphalt', NULL),
('way/301483807', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '4', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/311093540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Làlana Mohamed V', 'Rue Mohamed V', NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190372', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190376', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190377', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312190378', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312430381', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312430383', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/312430387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/316806322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/316806323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/400120300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/414000246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, 'yahoo', NULL, NULL),
('way/414005971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'no', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/527098803', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/531720057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/531720060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', 'roundabout', NULL, NULL, 'Place de l''OUA', NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/531720068', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/531720075', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, 'Araben''ny 26 Jona 1960', 'Avenue du 26 Juin 1960', NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/542604738', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/542604739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/544835748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Làlana Mohamed V', 'Rue Mohamed V', NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/563866207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/565439302', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/565439303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/566072482', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/566255283', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/566974050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, 'yahoo', 'asphalt', NULL),
('way/566974052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N 7', NULL, 'yahoo', 'asphalt', NULL),
('way/566991531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/567053247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/577818058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/580927389', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, '2', NULL, 'Araben''ny Fahaleovantena', 'Avenue de l''Indépendance', 'Avenue de la Libération', NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/591763195', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/591777236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL),
('way/605945681', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/605945682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/605945683', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, 'asphalt', NULL),
('way/1151215929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'primary', NULL, NULL, NULL, 'Araben''ny 26 Jona 1960', 'Avenue du 26 Juin 1960', NULL, NULL, 'yes', NULL, 'N 7', NULL, NULL, NULL, NULL);



INSERT INTO stations (
    osm_id, addr_city, addr_postc, addr_stree, addr_unit, amenity, brand, brand_wiki, brand_wi_1, 
    bridge, created_by, highway, junction, lanes, layer, name, name_en, name_fr, old_name, 
    oneway, operator, ref, shop, source, surface, tunnel
) VALUES
('node/614389229', NULL, NULL, NULL, NULL, 'fuel', 'Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Manja', 'Total MANJA', NULL, NULL, NULL, 'Total', NULL, 'kiosk', NULL, NULL, NULL),
('node/614403707', NULL, NULL, NULL, NULL, 'fuel', 'Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isoanifanaovana', NULL, NULL, NULL, NULL, 'Total', NULL, 'kiosk', NULL, NULL, NULL),
('node/614403710', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Valiha', NULL, NULL, NULL, NULL, 'Galana', NULL, 'kiosk', NULL, NULL, NULL),
('node/616734925', NULL, NULL, NULL, NULL, 'fuel', 'Jovena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Domoina', 'Jovena DOMOINA', NULL, NULL, NULL, 'Jovena', NULL, NULL, NULL, NULL, NULL),
('node/616734958', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fitiavana', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/616734976', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nirina', NULL, 'GALANA', NULL, NULL, 'Galana', NULL, 'kiosk', NULL, NULL, NULL),
('node/616757179', NULL, NULL, NULL, NULL, 'fuel', 'Shell', 'Q110716465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Voanio', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/620818083', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/620818084', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tsarafaritra', NULL, NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/620818092', NULL, NULL, NULL, NULL, 'fuel', 'Shell', 'Q110716465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Havozo', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/620818101', NULL, NULL, NULL, NULL, 'fuel', 'Total', 'Q154037', 'fr:TotalEnergies', NULL, NULL, NULL, NULL, NULL, NULL, 'Fierenana', NULL, NULL, NULL, NULL, 'Total', NULL, NULL, NULL, NULL, NULL),
('node/620818103', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GALAN Avana', 'Galana AVANA', NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/620818107', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ravinala', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/620824093', NULL, NULL, NULL, NULL, 'fuel', 'Jovena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ampasika', NULL, NULL, NULL, NULL, 'Jovena', NULL, NULL, NULL, NULL, NULL),
('node/620900962', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Anjoma', NULL, NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/620900986', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tselatra', NULL, 'SHELL TSELATRA', NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/667740294', 'Antananarivo', '101', NULL, 'Ambatoroka', 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Station d''Essence Ambatoroka', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/667889067', NULL, NULL, NULL, NULL, 'fuel', 'Jovena Premium', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JOVENA Antaninandro', NULL, NULL, NULL, NULL, 'Jovena', NULL, NULL, NULL, NULL, NULL),
('node/669223708', NULL, NULL, NULL, NULL, 'fuel', 'Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kininina', 'Total KINININA', NULL, NULL, NULL, 'Total', NULL, NULL, NULL, NULL, NULL),
('node/686271698', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Total', NULL, NULL, NULL, NULL, NULL),
('node/845724565', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tsarahonenana', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/845724577', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Miary-Tsoa', NULL, NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/845854257', NULL, NULL, NULL, NULL, 'fuel', 'Jovena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mevasoa', NULL, NULL, NULL, NULL, 'Jovena', NULL, NULL, NULL, NULL, NULL),
('node/845937324', NULL, NULL, NULL, NULL, 'fuel', 'Jovena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Imaitsoanala', NULL, NULL, NULL, NULL, 'Jovena', NULL, NULL, NULL, NULL, NULL),
('node/845947785', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Manakambahiny', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/1319959767', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Total', NULL, NULL, NULL, NULL, NULL),
('node/1497192447', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kintana', 'Galana KINTANA', NULL, NULL, NULL, 'Galana', NULL, NULL, NULL, NULL, NULL),
('node/1497192977', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tsiferana', NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/1497195528', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Station GALANA IARIVO', 'Galana IARIVO Soanierana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('node/3549643051', 'Antananarivo', '101', 'Rue Pasteur', NULL, 'fuel', 'Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Station Service TOTAL', NULL, NULL, NULL, NULL, 'Total', NULL, NULL, NULL, NULL, NULL),
('node/4292241290', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shell', NULL, NULL, NULL, NULL, NULL),
('node/8446375784', NULL, NULL, NULL, NULL, 'fuel', 'Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shell Ankoay', NULL, NULL, NULL, NULL, 'Shell', NULL, 'kiosk', NULL, NULL, NULL),
('node/8457444138', NULL, NULL, NULL, NULL, 'fuel', 'Galana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Galana Taratra Andrefanambohijanahary', NULL, NULL, NULL, NULL, 'Galana', NULL, 'yes', NULL, NULL, NULL),
('node/8527665840', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Galana Taratra', NULL, NULL, NULL, NULL, NULL, NULL, 'kiosk', NULL, NULL, NULL),
('node/9229767617', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JOVENA Tanikely', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('node/10946861903', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Total Ankadimbahoaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('node/11422760670', NULL, NULL, NULL, NULL, 'fuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shell Anosizato', 'Shell Anosizato', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
