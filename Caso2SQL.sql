1.- CREATE DATABASE caso2;

2.-
CREATE TABLE curso( 
id SERIAL,
nombre VARCHAR PRIMARY KEY
);

                                                                                                                                                                 
CREATE TABLE alumno (
id SERIAL, 
rut VARCHAR PRIMARY KEY,
nombre VARCHAR,
curso_nombre VARCHAR
FOREIGN KEY (curso_nombre) REFERENCES curso(nombre)
); 

CREATE TABLE pruebas( 
id SERIAL PRIMARY KEY,
nota VARCHAR
);

CREATE TABLE alumno_prueba( 
alumno_rut VARCHAR REFERENCES alumno (rut),
pruebas_id INT REFERENCES pruebas (id),
PRIMARY KEY (alumno_rut, pruebas_id)
);

CREATE TABLE profesor (
id SERIAL PRIMARY KEY, 
nombre VARCHAR,
departamento VARCHAR
); 

CREATE TABLE prueba_profesor( 
pruebas_id INT REFERENCES pruebas (id),
profesor_id INT REFERENCES profesor (id),
PRIMARY KEY (pruebas_id, profesor_id)
);


#.checking structure:

SELECT * FROM alumno
INNER JOIN alumno_prueba ON alumno_prueba.alumno_rut = alumno.rut
INNER JOIN pruebas ON pruebas.id = alumno_prueba.pruebas_id;



