USE SISTEMAEVALUACION;


SELECT * FROM USUARIOS;
SELECT * FROM PERFILES;
SELECT * FROM MODULOS;

INSERT INTO PERFILES VALUES(1, 'DOCENTE', 'ACT');
INSERT INTO PERFILES VALUES(2, 'JEFEAREA', 'ACT');

INSERT INTO MODULOS VALUES(1, 'REDES', 'ACT');

INSERT INTO USUARIOS VALUES(1, 'pguerra', 'pguerra@kruger.com.ec','Pablo Guerra', 1,'ACT', 'password01',1);
INSERT INTO USUARIOS VALUES(2, 'jlopez', 'jlopez@ups.edu.ec','Jorge Lopez', 2,'ACT', 'password01',1);

INSERT INTO CRITERIOS VALUES (1, 'ENTREGA', 'ACT', 'ENTREGA', 'Entrega de la tarea');
INSERT INTO CRITERIOS VALUES (2, 'CALIFICACION', 'ACT', 'CALIFICACION','Valor de la tarea');
INSERT INTO CRITERIOS VALUES (3, 'FECHAENVIO', 'ACT', 'FECHA ENVIO', 'Fecha en la que se envió la tarea');

INSERT INTO TIPOSTAREAS VALUES(1,'TAREA','TAREA NORMAL','ACT');
INSERT INTO TIPOSTAREAS VALUES(2,'REUNION','REUNIONES','ACT');

SELECT * FROM TIPOSTAREAS;
SELECT * FROM CRITERIOS;
SELECT * FROM CRITERIOS left JOIN CATALOGOCRITERIO ON CRITERIOS.idCriterio = CATALOGOCRITERIO.idCriterio;
SELECT * FROM CATALOGOCRITERIO;

SELECT * FROM TAREAS;
SELECT * FROM TAREASUSUARIOS;
SELECT * FROM USUARIOS;



SELECT * FROM TAREASUSUARIOS LEFT JOIN TAREAS ON TAREAS.idTarea = TAREASuSUARIOS.idTarea WHERE TAREASuSUARIOS.IDuSUARIO = 1;

/*
DELETE FROM TAREAS;
DELETE FROM TAREASUSUARIOS;*/


UPDATE TAREASUSUARIOS SET FECHAENVIO = CURRENT TIMESTAMP WHERE IDTAREAUSUARIO = 11;




SELECT this_.idTareaUsuario AS idTareaU1_5_1_
	,this_.ArchivoEnviado AS ArchivoE2_5_1_
	,this_.FechaEnvio AS FechaEnv3_5_1_
	,this_.ObservacionesDocente AS Observac4_5_1_
	,this_.estado AS estado5_5_1_
	,this_.idTarea AS idTarea6_5_1_
	,this_.idUsuario AS idUsuari7_5_1_
	,tareasenti1_.idTarea AS idTarea1_4_0_
	,tareasenti1_.ARCHIVOADJUNTO AS ARCHIVOA2_4_0_
	,tareasenti1_.Criterios AS Criterio3_4_0_
	,tareasenti1_.descripcionTarea AS descripc4_4_0_
	,tareasenti1_.ESTADO AS ESTADO5_4_0_
	,tareasenti1_.FECHAFIN AS FECHAFIN6_4_0_
	,tareasenti1_.FECHAINICIO AS FECHAINI7_4_0_
	,tareasenti1_.idCreadorTarea AS idCreado8_4_0_
	,tareasenti1_.IDMODULO AS IDMODULO9_4_0_
	,tareasenti1_.nombreTarea AS nombreT10_4_0_
	,tareasenti1_.tipoTarea AS tipoTar11_4_0_
FROM TareasUsuarios this_
INNER JOIN TAREAS tareasenti1_ ON this_.idTarea = tareasenti1_.idTarea
WHERE this_.idUsuario = 1





