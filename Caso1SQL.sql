1.- CREATE DATABASE caso1;

2.-
CREATE TABLE departamento( 
id SERIAL,
nombre VARCHAR PRIMARY KEY
);

                                                                                                                                                                 
CREATE TABLE trabajador (
id SERIAL, 
rut VARCHAR PRIMARY KEY,
nombre VARCHAR,
direccion VARCHAR,
departamento_nombre VARCHAR
FOREIGN KEY (departamento_nombre) REFERENCES departamento (nombre)
); 

CREATE TABLE liquidacion( 
id SERIAL PRIMARY KEY,
drive VARCHAR
);

CREATE TABLE trabajador_liquidacion( 
trabajador_rut VARCHAR REFERENCES tranbajador (rut),
liquidacion_id INT REFERENCES liquidacion (id),
PRIMARY KEY (trabajador_rut, liquidacion_id)
);

3.- Testing Tables and Keys
INSERT INTO departamento(nombre) VALUES ('finanzas');
INSERT INTO departamento(nombre) VALUES ('compras');
INSERT INTO departamento(nombre) VALUES ('IT');

INSERT INTO trabajador (rut, nombre,direccion, departamento_nombre) VALUES ('1','nombre1','direccion1','finanzas');
INSERT INTO trabajador (rut, nombre,direccion, departamento_nombre) VALUES ('2','nombre2','direccion2','compras');

INSERT INTO liquidacion(drive) VALUES ('drive1');
INSERT INTO liquidacion(drive) VALUES ('drive2');
INSERT INTO liquidacion(drive) VALUES ('drive3');
INSERT INTO liquidacion(drive) VALUES ('drive4');

INSERT INTO trabajador_liquidacion(trabajador_rut,liquidacion_id) VALUES ('1',1);
INSERT INTO trabajador_liquidacion(trabajador_rut,liquidacion_id) VALUES ('2',2);
INSERT INTO trabajador_liquidacion(trabajador_rut,liquidacion_id) VALUES ('1',3);
INSERT INTO trabajador_liquidacion(trabajador_rut,liquidacion_id) VALUES ('2',4);
INSERT INTO trabajador_liquidacion(trabajador_rut,liquidacion_id) VALUES ('5',5); # testing wrong combination #

4.-

SELECT * FROM trabajador
INNER JOIN trabajador_liquidacion ON trabajador_liquidacion.trabajador_rut = trabajador.rut
INNER JOIN liquidacion ON liquidacion.id = trabajador_liquidacion.liquidacion_id;



