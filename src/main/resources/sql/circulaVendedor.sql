DO @LISTA := :lista;

DO @HA := time_to_sec(current_time);
DO @DA := current_date;

DO @DS := DAYOFWEEK(@DA); /*date (1 = Sunday, 2 = Monday, …, 7 = Saturday)*/

DROP TEMPORARY TABLE IF EXISTS T_INTERVALO;
CREATE TEMPORARY TABLE T_INTERVALO (
  PRIMARY KEY (horario)
)
SELECT horario,
       CASE @DS
	 WHEN 1
	   THEN dom
	 WHEN 2
	   THEN seg
	 WHEN 3
	   THEN ter
	 WHEN 4
	   THEN qua
	 WHEN 5
	   THEN qui
	 WHEN 6
	   THEN sex
	 WHEN 7
	   THEN sab
	 ELSE '00:00-00:00'
       END AS intervalo
FROM horarios;

DROP TEMPORARY TABLE IF EXISTS T_INTERVALO_TIME;
CREATE TEMPORARY TABLE T_INTERVALO_TIME (
  PRIMARY KEY (horario)
)
SELECT horario,
       intervalo,
       time_to_sec(SUBSTRING_INDEX(intervalo, '-', 1))  AS hora_inicial,
       time_to_sec(SUBSTRING_INDEX(intervalo, '-', -1)) AS hora_final
FROM T_INTERVALO
HAVING @HA BETWEEN hora_inicial AND hora_final;

DO @ATEN := IFNULL((SELECT MAX(IF(@HA BETWEEN hora_inicial AND hora_final, 'S', 'N'))
	     FROM T_INTERVALO_TIME
	     WHERE horario = 'ATEN'), 'N');


DROP TEMPORARY TABLE IF EXISTS T_VENDEDORES_INTERVALO;
CREATE TEMPORARY TABLE T_VENDEDORES_INTERVALO (
  PRIMARY KEY (numero)
)
SELECT numero,
       lista,
       horario,
       vendedor,
       celular,
       ultimoAcesso,
       'S'   AS emHorarioComercial,
       @ATEN AS emHorarioAtendimento
FROM vendedores AS V
  INNER JOIN T_INTERVALO_TIME
	       USING (horario)
WHERE lista = @LISTA
UNION
SELECT 0                 AS numero,
       99                AS lista,
       ''                AS horario,
       'Atendimento'     AS vendedor,
       ''                AS celular,
       current_timestamp AS ultimoAcesso,
       'N'               AS emHorarioComercial,
       @ATEN             AS emHorarioAtendimento;

DO @DATATIME := (SELECT MIN(ultimoAcesso)
		 FROM T_VENDEDORES_INTERVALO);

DO @NUMERO := (SELECT MAX(numero)
	       FROM T_VENDEDORES_INTERVALO
	       WHERE ultimoAcesso = @DATATIME);

UPDATE vendedores
SET ultimoAcesso = current_timestamp
WHERE numero = @NUMERO;

DROP TABLE IF EXISTS T;
CREATE TEMPORARY TABLE T
SELECT numero,
       vendedor,
       celular,
       grupo,
       cast(CONCAT('https://api.whatsapp.com/send?phone=55',
		   replace(replace(replace(replace(celular, ' ', ''), '(', ''), ')', ''), '-',
			   '')) AS CHAR) AS link,
       emHorarioComercial,
       emHorarioAtendimento
FROM T_VENDEDORES_INTERVALO
  INNER JOIN grupos
	       USING (lista)
WHERE numero = @NUMERO;

INSERT INTO televenda_historico(numero, data_hora, vendedor, celular, grupo)
SELECT numero,
       current_timestamp AS data_hora,
       vendedor,
       celular,
       grupo
FROM T;


SELECT numero,
       vendedor,
       celular,
       grupo,
       link,
       emHorarioComercial,
       emHorarioAtendimento
FROM T

