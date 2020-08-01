DO @LISTA := 1;

DO @DATATIME := (SELECT MIN(ultimoAcesso)
		 FROM televenda
		 WHERE lista = @LISTA);

DO @NUMERO := (SELECT MAX(numero)
	       FROM televenda
	       WHERE lista = @LISTA
		 AND ultimoAcesso = @DATATIME);

UPDATE televenda
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
			   '')) AS CHAR) AS link
FROM televenda
WHERE lista = @LISTA
  AND numero = @NUMERO;

INSERT INTO televenda_historico(numero, data_hora, vendedor, celular, grupo)
SELECT numero,
       current_timestamp AS data_hora,
       vendedor,
       celular,
       grupo
FROM T;


SELECT *
FROM T;

