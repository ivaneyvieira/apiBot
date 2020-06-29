DO @LISTA := :lista;

DO @DATATIME := (SELECT MIN(ultimoAcesso)
		 FROM bi.televenda
		 WHERE lista = @LISTA);

DO @NUMERO := (SELECT MAX(numero)
	       FROM bi.televenda
	       WHERE lista = @LISTA
		 AND ultimoAcesso = @DATATIME);

UPDATE bi.televenda
SET ultimoAcesso = current_timestamp
WHERE numero = @NUMERO;

SELECT numero,
       vendedor,
       celular,
       grupo
FROM bi.televenda
WHERE lista = @LISTA
  AND numero = @NUMERO;