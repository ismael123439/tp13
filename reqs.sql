SELECT P.partido_id, 
       C1.nombre AS equipo_local, 
       C2.nombre AS equipo_visitante, 
       R.puntuacion_equipo_local, 
       R.puntuacion_equipo_visitante
FROM Partidos P
JOIN Equipos E1 ON P.equipo_local_id = E1.equipo_id
JOIN Colegios C1 ON E1.colegio_id = C1.colegio_id
JOIN Equipos E2 ON P.equipo_visitante_id = E2.equipo_id
JOIN Colegios C2 ON E2.colegio_id = C2.colegio_id
JOIN Resultados R ON P.partido_id = R.partido_id
WHERE C1.nombre = 'Monserrat' AND C2.nombre = 'San José';

-- Consulta 2: Partidos de un Deporte Específico
SELECT P.partido_id, 
       E1.nombre AS equipo_local, 
       E2.nombre AS equipo_visitante, 
       P.fecha, 
       P.hora
FROM Partidos P
JOIN Equipos E1 ON P.equipo_local_id = E1.equipo_id
JOIN Equipos E2 ON P.equipo_visitante_id = E2.equipo_id
JOIN Deportes D ON P.deporte_id = D.deporte_id
WHERE D.nombre = 'futbol';

-- Consulta 3: Estado Actual de un Colegio en Particular
SELECT D.nombre AS deporte, 
       E.nombre AS equipo, 
       E.clasificacion
FROM Equipos E
JOIN Colegios C ON E.colegio_id = C.colegio_id
JOIN Deportes D ON E.deporte_id = D.deporte_id
WHERE C.nombre = 'Nombre del Colegio';

-- Insertar datos de ejemplo en la tabla Cantina (si la tabla existe)
CREATE TABLE Cantina (
    producto_nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    cantidad_disponible INT
);

INSERT INTO Cantina (producto_nombre, precio, cantidad_disponible)
VALUES ('Pizza', 150, 10);

-- Consulta 4: Datos de las Compras en Cantina de un Producto Específico
SELECT *
FROM Cantina
WHERE producto_nombre = 'Pizza';

-- Consulta 5: Información de una Cancha en Particular
SELECT P.partido_id, 
       E1.nombre AS equipo_local, 
       E2.nombre AS equipo_visitante, 
       P.fecha, 
       P.hora
FROM Partidos P
JOIN Equipos E1 ON P.equipo_local_id = E1.equipo_id
JOIN Equipos E2 ON P.equipo_visitante_id = E2.equipo_id
WHERE P.lugar = 'Estadio Central';
