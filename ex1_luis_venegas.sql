


host cls
PROMPT ======================
PROMPT Luis Venegas Ulloa 8pm
PROMPT ======================



PROMPT ====================
PROMPT DROPS TABLE
PROMPT ====================
DROP TABLE llamada;
DROP TABLE clientes;
DROP TABLE tecnico;


PROMPT ====================
PROMPT DROPS SEQUENCE
PROMPT ====================

DROP SEQUENCE cliente_sq;
DROP SEQUENCE llam_sq;
DROP SEQUENCE tec_sq;


PROMPT ====================
PROMPT CREACION TABLAS
PROMPT ====================

CREATE TABLE clientes (id_cliente NUMBER not null, nombre VARCHAR2(10) not null, Email varchar2(25) not null,telefono varchar2(10)not null);
CREATE TABLE tecnico (id_tecnico NUMBER not null, nombre VARCHAR2(10)not null, Email varchar2(25)not null);
CREATE TABLE llamada (id_llamada NUMBER not null, fecha_hora_inicio DATE not null, fecha_hora_final DATE not null,
                                    estado varchar2(12)not null,id_cliente number not null, id_tecnico number not null);



PROMPT ====================
PROMPT CREACION SEQUENCE
PROMPT ====================

									
CREATE SEQUENCE cliente_sq start with 1 increment by 1 cache 2;
CREATE SEQUENCE llam_sq start with 1 increment by 1 cache 2;
CREATE SEQUENCE tec_sq start with 1 increment by 1 cache 2;									
				


PROMPT ====================
PROMPT add check
PROMPT ====================				
alter table llamada add constraint estado_ck check  (estado in ('Resuelto', 'No Resuelto', 'Escalado'));
alter table llamada add constraint fecha_ck check  (fecha_hora_inicio < fecha_hora_final);
									
PROMPT ====================
PROMPT ADD PK
PROMPT ====================


ALTER TABLE clientes ADD CONSTRAINT clientes_pk primary key (id_cliente);
ALTER TABLE tecnico ADD CONSTRAINT tecnico_pk primary key (id_tecnico);
ALTER TABLE llamada ADD CONSTRAINT llamada_pk primary key (id_llamada);




PROMPT ====================
PROMPT ADD FK
PROMPT ====================


ALTER TABLE llamada ADD CONSTRAINT clientes_fk FOREIGN KEY (id_cliente) REFERENCES clientes;
ALTER TABLE llamada ADD CONSTRAINT tecnico_fk FOREIGN KEY (id_tecnico) REFERENCES tecnico;




PROMPT ====================
PROMPT INSERT
PROMPT ====================

INSERT INTO tecnico (id_tecnico, nombre,Email) VALUES (tec_sq.NEXTVAL,'luis','luis130891@gmail.com');
INSERT INTO tecnico (id_tecnico, nombre,Email) VALUES (tec_sq.NEXTVAL,'ariel','ariel1891@gmail.com');
INSERT INTO tecnico (id_tecnico, nombre,Email) VALUES (tec_sq.NEXTVAL,'felipe','felipe130@gmail.com');
INSERT INTO tecnico (id_tecnico, nombre,Email) VALUES (tec_sq.NEXTVAL,'maria','maria0891@gmail.com');
INSERT INTO tecnico (id_tecnico, nombre,Email) VALUES(tec_sq.NEXTVAL, 'adrian','adrian0891@gmail.com');


INSERT INTO clientes (id_cliente, nombre,Email,telefono) VALUES (cliente_sq.NEXTVAL,'rita','ria0891@gmail.com','83412288');
INSERT INTO clientes (id_cliente, nombre,Email,telefono) VALUES (cliente_sq.NEXTVAL,'michelle','michelle0891@gmail.com','73412288');
INSERT INTO clientes (id_cliente, nombre,Email,telefono) VALUES (cliente_sq.NEXTVAL,'angel','angel0891@gmail.com','22412288');
INSERT INTO clientes (id_cliente, nombre,Email,telefono) VALUES (cliente_sq.NEXTVAL,'esteban','angel1@gmail.com','58412288');
INSERT INTO clientes (id_cliente, nombre,Email,telefono) VALUES (cliente_sq.NEXTVAL,'rafael','rafa1@gmail.com','88413288');


INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('01-03-2020 08:00','dd-mm-yyyy HH24:MI'),
					              to_date('01-03-2020 09:00','dd-mm-yyyy HH24:MI'),'No Resuelto',1,1);

INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('02-03-2020 07:00','dd-mm-yyyy HH24:MI'),
					              to_date('02-03-2020 08:00','dd-mm-yyyy HH24:MI'),'Resuelto',1,1);


INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('06-03-2020 12:00','dd-mm-yyyy HH24:MI'),
		                          to_date('06-03-2020 13:00','dd-mm-yyyy HH24:MI'),'Escalado',1,1);
						  
						  
								  
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('01-01-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('01-01-2020 13:00','dd-mm-yyyy HH24:MI'),'Escalado',2,2);
					


					
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('02-01-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('02-01-2020 12:50','dd-mm-yyyy HH24:MI'),'Escalado',2,3);
								  
								  
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('08-01-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('08-01-2020 13:00','dd-mm-yyyy HH24:MI'),'Escalado',2,4);
								  
								  
								  
								  
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('03-02-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('03-02-2020 13:20','dd-mm-yyyy HH24:MI'),'Resuelto',2,2);
					


					
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('04-02-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('04-02-2020 12:50','dd-mm-yyyy HH24:MI'),'Resuelto',2,3);
								  
								  
INSERT INTO llamada(id_llamada,fecha_hora_inicio, fecha_hora_final ,estado ,id_cliente , id_tecnico )
                      VALUES(llam_sq.NEXTVAL,to_date('06-02-2020 12:00','dd-mm-yyyy HH24:MI'),
					              to_date('06-02-2020 13:10','dd-mm-yyyy HH24:MI'),'Resuelto',2,4);
								  
PROMPT ====================
PROMPT SELECT
PROMPT ====================

SELECT *from tecnico;
SELECT *from clientes;
SELECT *from llamada;

PROMPT ======================
PROMPT Luis Venegas Ulloa 8pm
PROMPT ======================

