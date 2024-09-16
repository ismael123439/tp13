CREATE TABLE Jugadores (
jugador_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
apellido VARCHAR(100),
edad TINYINT,
equipo_id INT,
deporte_id INT,
FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id),
FOREIGN KEY (deporte_id) REFERENCES Deportes(deporte_id)
);
CREATE TABLE Partidos (
partido_id INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
hora TIME,
lugar VARCHAR(100),
equipo_local_id INT,
equipo_visitante_id INT,
deporte_id INT,
FOREIGN KEY (equipo_local_id) REFERENCES Equipos(equipo_id),
FOREIGN KEY (equipo_visitante_id) REFERENCES Equipos(equipo_id),
FOREIGN KEY (deporte_id) REFERENCES Deportes(deporte_id)
);
CREATE TABLE Resultados (
resultado_id INT AUTO_INCREMENT PRIMARY KEY,
partido_id INT,
puntuacion_equipo_local TINYINT,
puntuacion_equipo_visitante TINYINT,
FOREIGN KEY (partido_id) REFERENCES Partidos(partido_id)
);
CREATE TABLE Deportes (
deporte_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50)
);