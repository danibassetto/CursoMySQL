USE sucos_vendas;

-- Uso do HAVING (o where daria erro pois é executado antes de agrupar! por isso usamos o have quando queremos 
-- filtrar algo proveniente do agrupamento)
SELECT estado, SUM(limite_de_credito) AS soma_limite FROM tabela_de_clientes
-- WHERE soma_limite > 900000
GROUP BY estado
HAVING SUM(limite_de_credito) > 900000;

SELECT embalagem, MAX(preco_de_lista) AS MAIOR_PRECO, MIN(preco_de_lista) AS MENOR_PRECO
FROM tabela_de_produtos
GROUP BY embalagem
HAVING SUM(preco_de_lista) <= 80 AND MAX(preco_de_lista) >= 5;

SELECT SUM(preco_de_lista) FROM tabela_de_produtos GROUP BY embalagem;

-- Quais foram os clientes que fizeram mais de 2000 compras em 2016?

SELECT cpf, COUNT(*) FROM notas_fiscais
WHERE YEAR(data_venda) = 2016
GROUP BY cpf
HAVING COUNT(*) > 2000;
  
-- Uso do CASE: Fazemos um teste em um ou mais campos e dependendo do resultado, teremos um ou outro valor
  
SELECT nome_do_produto, preco_de_lista,
CASE WHEN preco_de_lista >= 12 THEN 'PRODUTO CARO'
	 WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
	 ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO FROM tabela_de_produtos;

SELECT embalagem,
CASE WHEN preco_de_lista >= 12 THEN 'PRODUTO CARO'
	 WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
	 ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO, AVG(preco_de_lista) AS PRECO_MEDIO 
FROM tabela_de_produtos WHERE sabor = 'Manga'
GROUP BY embalagem, 
CASE WHEN preco_de_lista >= 12 THEN 'PRODUTO CARO'
	 WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
	 ELSE 'PRODUTO BARATO'
END
ORDER BY embalagem; 

-- Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, 
-- nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e 
-- esta classificação.

SELECT NOME,
CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'
WHEN YEAR(data_de_nascimento) >= 1990 AND
YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
ELSE 'Crianças' 
END  AS "CLASSIFICAÇÃO POR IDADE"
FROM tabela_de_clientes;