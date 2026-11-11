-- 1. Creación de la base de datos
DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE Biblioteca;

-- 2. Selección de la base de datos
USE Biblioteca;

-- 3. Tabla Autores
CREATE TABLE Autores (
    ID_Autor     INT          NOT NULL AUTO_INCREMENT,
    Nombre_Autor VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Autor)
);

-- 4. Tabla Editores
CREATE TABLE Editores (
    ID_Editor     INT          NOT NULL AUTO_INCREMENT,
    Nombre_Editor VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Editor)
);

-- 5. Tabla Libros (claves primaria y foráneas)
CREATE TABLE Libros (
    ID_Libro     INT          NOT NULL AUTO_INCREMENT,
    Titulo_Libro VARCHAR(150) NOT NULL,
    ID_Autor     INT          NOT NULL,
    ID_Editor    INT          NOT NULL,
    PRIMARY KEY (ID_Libro),
    FOREIGN KEY (ID_Autor)  REFERENCES Autores (ID_Autor),
    FOREIGN KEY (ID_Editor) REFERENCES Editores (ID_Editor)
);

-- 6. Inserción de datos
INSERT INTO Autores (Nombre_Autor) VALUES
    ('Alex Fidal'),
    ('Maria Antonieta De Las Nieves'),
    ('Camila Ortega Suárez');

INSERT INTO Editores (Nombre_Editor) VALUES
    ('Editorial Horizonte'),
    ('Ediciones Cordillera'),
    ('Editorial Río Claro');

INSERT INTO Libros (Titulo_Libro, ID_Autor, ID_Editor) VALUES
    ('How To Fly a F-14 Tomcat for duumies', 1, 1),
    ('El Libro Rojo',                        1, 2),
    ('El Tiempo: Misterios Del Mundo',       2, 1),
    ('Ferrari',                              3, 3),
    ('El Arte De La Guerra',                 2, 3);

-- 7. Consultas
SELECT * FROM Autores;

SELECT * FROM Editores;

SELECT * FROM Libros;

SELECT
    Libros.ID_Libro,
    Libros.Titulo_Libro,
    Autores.Nombre_Autor,
    Editores.Nombre_Editor
FROM Libros
INNER JOIN Autores  ON Libros.ID_Autor  = Autores.ID_Autor
INNER JOIN Editores ON Libros.ID_Editor = Editores.ID_Editor
ORDER BY Libros.ID_Libro;
