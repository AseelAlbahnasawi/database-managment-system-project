SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE IF NOT EXISTS rta;
USE rta;

-- Create 'bus' table
CREATE TABLE IF NOT EXISTS bus (
    licence_plate_number VARCHAR(15) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    seat_capacity INT NOT NULL,
    model_year YEAR NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (licence_plate_number)
    
);

-- Create 'route' table
CREATE TABLE IF NOT EXISTS route (
    route_id INT AUTO_INCREMENT,
    route_name VARCHAR(100) NOT NULL,
   
    PRIMARY KEY (route_id),
    UNIQUE (route_name)
);

-- Create 'terminal' table
CREATE TABLE IF NOT EXISTS terminal (
    terminal_number INT AUTO_INCREMENT,
    terminal_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (terminal_number),
    UNIQUE (terminal_name)
);

-- Create 'bus_stop' table
CREATE TABLE IF NOT EXISTS bus_stop (
    stop_id INT AUTO_INCREMENT,
    stop_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (stop_id),
    UNIQUE (stop_name)
);

-- Create 'operates_on' table
CREATE TABLE IF NOT EXISTS operates_on (
    licence_plate_number VARCHAR(15),
    route_id INT,
    PRIMARY KEY (licence_plate_number, route_id),
    FOREIGN KEY (licence_plate_number) REFERENCES bus(licence_plate_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (route_id) REFERENCES route(route_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create 'stop_on_route' table
CREATE TABLE IF NOT EXISTS stop_on_route (
    stop_on_route_id INT AUTO_INCREMENT,
    route_id INT NOT NULL,
    stop_id INT NOT NULL,
    stop_order INT NOT NULL, -- To maintain the order of the stops on a particular route
    PRIMARY KEY (stop_on_route_id),
    UNIQUE (route_id, stop_order),
    FOREIGN KEY (route_id) REFERENCES route(route_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (stop_id) REFERENCES bus_stop(stop_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO bus VALUES( 'A2332', 'toyota', 'coaster', '22', '2023', 'diesel' );
INSERT INTO bus VALUES( 'A3562', 'toyota', 'coaster', '22', '2023', 'diesel' );
INSERT INTO bus VALUES( 'S4672', 'toyota', 'coaster', '22', '2019', 'diesel' );
INSERT INTO bus VALUES( 'B1409', 'toyota', 'coaster', '22', '2017', 'diesel' );
INSERT INTO bus VALUES( 'B4789', 'mercedes', 'citaro', '58', '2020', 'gasoline' );
INSERT INTO bus VALUES( 'B1234', 'mercedes', 'Sprinter', '18', '2022', 'diesel' );
INSERT INTO bus VALUES( 'X5780', 'higer', 'KLQ6138DF', '49', '2018', 'gasoline' );
INSERT INTO bus VALUES( 'J9643', 'higer', 'KLQ6138DF', '49', '2022', 'gasoline' );
INSERT INTO bus VALUES( 'S5702', 'kingLong', 'G50', '68', '2023', 'diesel' );
INSERT INTO bus VALUES( 'A1864', 'kingLong', 'G50', '68', '2023', 'diesel' );

INSERT INTO route VALUES ( '11701', 'ADCB Bank' );
INSERT INTO route VALUES ( '11702', 'BB' );
INSERT INTO route VALUES ( '11703', 'BK' );
INSERT INTO route VALUES ( '11704', 'MOE' );
INSERT INTO route VALUES ( '11705', 'IC' );
INSERT INTO route VALUES ( '11706', 'NL' );
INSERT INTO route VALUES ( '11707', 'Jumeirah Lake Towers' );
INSERT INTO route VALUES ( '11708', 'NT' );
INSERT INTO route VALUES ( '11709', 'EXPO City' );
INSERT INTO route VALUES ( '11710', 'Festival City' );


INSERT INTO terminal VALUES ( '1001', 'AbuDhabiBank' );
INSERT INTO terminal VALUES ( '1002', 'BusinessBay' );
INSERT INTO terminal VALUES ( '1003', 'BurjKhalifa' );
INSERT INTO terminal VALUES ( '1004', 'MOE' );
INSERT INTO terminal VALUES ( '1005', 'InternetCity' );
INSERT INTO terminal VALUES ( '1006', 'Nakheel' );
INSERT INTO terminal VALUES ( '1007', 'DMCC' );
INSERT INTO terminal VALUES ( '1008', 'NakheelTower' );
INSERT INTO terminal VALUES ( '1009', 'expo' );
INSERT INTO terminal VALUES ( '1010', 'JabelAli' );
INSERT INTO terminal VALUES ( '1011', 'Marina' );
INSERT INTO terminal VALUES ( '1012', 'PalmJumeirah' );
INSERT INTO terminal VALUES ( '1013', 'Downtown' );
INSERT INTO terminal VALUES ( '1014', 'GreenCommunity' );
INSERT INTO terminal VALUES ( '1015', 'SportsCity' );
INSERT INTO terminal VALUES ( '1016', 'SiliconOasis' );
INSERT INTO terminal VALUES ( '1017', 'AlBarsha' );
INSERT INTO terminal VALUES ( '1018', 'DiscoveryGardens' );
INSERT INTO terminal VALUES ( '1019', 'Mirdif' );
INSERT INTO terminal VALUES ( '1020', 'DeiraCityCentre' );


INSERT INTO bus_stop VALUES ( '1232', 'BANK' );
INSERT INTO bus_stop VALUES ( '1333', 'Business' );
INSERT INTO bus_stop VALUES ( '1444', 'Burj' );
INSERT INTO bus_stop VALUES ( '1661', 'EMall' );
INSERT INTO bus_stop VALUES ( '1881', 'City' );
INSERT INTO bus_stop VALUES ( '1965', 'Mall' );
INSERT INTO bus_stop VALUES ( '5141', 'Center' );
INSERT INTO bus_stop VALUES ( '1514', 'Tower' );
INSERT INTO bus_stop VALUES ( '2755', 'Expo' );
INSERT INTO bus_stop VALUES ( '8788', 'Jabel' );


INSERT INTO operates_on VALUES ( 'A2332', '11701' );
INSERT INTO operates_on VALUES ( 'A3562', '11702' );
INSERT INTO operates_on VALUES ( 'S4672', '11703' );
INSERT INTO operates_on VALUES ( 'B1409', '11704' );
INSERT INTO operates_on VALUES ( 'B4789', '11705' );
INSERT INTO operates_on VALUES ( 'B1234', '11706' );
INSERT INTO operates_on VALUES ( 'X5780', '11707' );
INSERT INTO operates_on VALUES ( 'J9643', '11708' );
INSERT INTO operates_on VALUES ( 'S5702', '11709' );
INSERT INTO operates_on VALUES ( 'A1864', '11710' );


INSERT INTO stop_on_route VALUES ( '1201', '11701','1232', '01' );
INSERT INTO stop_on_route VALUES ( '1302', '11702','1333', '02' );
INSERT INTO stop_on_route VALUES ( '1403', '11703','1444', '03' );
INSERT INTO stop_on_route VALUES ( '1604', '11704','1661', '04' );
INSERT INTO stop_on_route VALUES ( '1805', '11705','1881', '05' );
INSERT INTO stop_on_route VALUES ( '1906', '11706','1965', '06' );
INSERT INTO stop_on_route VALUES ( '5107', '11707','5141', '07' );
INSERT INTO stop_on_route VALUES ( '1508', '11708','1514', '08' );
INSERT INTO stop_on_route VALUES ( '2709', '11709','2755', '09' );
INSERT INTO stop_on_route VALUES ( '8710', '11710','8788', '10' );


-- Add column route_id to terminal
ALTER TABLE terminal ADD COLUMN route_id INT;
UPDATE terminal
SET route_id = 
    CASE
        WHEN terminal_number = '1001' THEN '11701'
        WHEN terminal_number = '1002' THEN '11702'
        WHEN terminal_number = '1003' THEN '11703'
        WHEN terminal_number = '1004' THEN '11704'
        WHEN terminal_number = '1005' THEN '11705'
        WHEN terminal_number = '1006' THEN '11706'
        WHEN terminal_number = '1007' THEN '11707'
        WHEN terminal_number = '1008' THEN '11708'
        WHEN terminal_number = '1009' THEN '11709'
        WHEN terminal_number = '1010' THEN '11710'
        WHEN terminal_number = '1011' THEN '11701'
        WHEN terminal_number = '1012' THEN '11702'
        WHEN terminal_number = '1013' THEN '11703'
        WHEN terminal_number = '1014' THEN '11704'
        WHEN terminal_number = '1015' THEN '11705'
        WHEN terminal_number = '1016' THEN '11706'
        WHEN terminal_number = '1017' THEN '11707'
        WHEN terminal_number = '1018' THEN '11708'
        WHEN terminal_number = '1019' THEN '11709'
        WHEN terminal_number = '1020' THEN '11710'
        ELSE NULL 
    END;
ALTER TABLE terminal MODIFY COLUMN route_id INT NOT NULL;
ALTER TABLE terminal ADD CONSTRAINT fk_route_terminal FOREIGN KEY (route_id) REFERENCES route(route_id) ON DELETE CASCADE ON UPDATE CASCADE;




-- list the name of the route(s) that have the greatest number of stops. 
SELECT route.route_name, COUNT(stop_on_route.route_id) AS stop_count
FROM route
JOIN stop_on_route ON route.route_id = stop_on_route.route_id
GROUP BY route.route_name
ORDER BY stop_count DESC
LIMIT 1;
-- List the name of the route(s) that only run the electric buses. To do so first create a view that only contains electric buses. And, then use this view to answer the query.

-- Create a view for electric buses
CREATE VIEW electric_buses_view AS
SELECT operates_on.route_id
FROM operates_on
JOIN bus ON operates_on.licence_plate_number = bus.licence_plate_number
WHERE bus.fuel_type = 'electric';

-- List the name of the route(s) that only run electric buses
SELECT DISTINCT route.route_name
FROM route
LEFT JOIN operates_on ON route.route_id = operates_on.route_id
WHERE operates_on.route_id IS NOT NULL
  AND NOT EXISTS (
    SELECT * 
    FROM operates_on
    LEFT JOIN bus ON operates_on.licence_plate_number = bus.licence_plate_number
    WHERE operates_on.route_id = route.route_id
      AND bus.fuel_type <> 'electric'
  );
  
  
-- List the names of bus stops that is shared by at least two distinct routes
SELECT DISTINCT bs.stop_name
FROM bus_stop bs
JOIN stop_on_route s1 ON bs.stop_id = s1.stop_id
JOIN stop_on_route s2 ON bs.stop_id = s2.stop_id
WHERE s1.route_id <> s2.route_id;

-- Report the total number of seat capacity of buses grouped by fuel type
SELECT fuel_type, SUM(seat_capacity) AS total_seat_capacity
FROM bus
GROUP BY fuel_type;

-- Report the stop names that is not used by any route
SELECT stop_name
FROM bus_stop
WHERE stop_id NOT IN (SELECT DISTINCT stop_id FROM stop_on_route);



