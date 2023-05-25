USE sucos_vendas;

-- JOINs: possibilidade de unir uma ou mais tabelas através de campos em comum
-- Existem vários tipos de JOINs
-- OBS: só é necessário colocar o nome do alias ou da tabela.nome da propriedade caso tenha outro nome igual na outra tabela

-- INNER JOIN: Retorna somente quando temos chaves correspondentes
-- NENHUM LADO TEM NULL

SELECT * FROM tabela_de_vendedores a
INNER JOIN notas_fiscais b
ON a.matricula = b.matricula;

SELECT a.matricula, a.nome, COUNT(*) AS NOTAS_EMITIDAS
FROM tabela_de_vendedores a
INNER JOIN notas_fiscais b
ON a.matricula = b.matricula
GROUP BY a.matricula, a.nome;

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

/*
NÃO RECOMENDADO PORÉM EXISTENTE: 

SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

*/

-- LEFT JOIN: Retorna todos da tabela da esquerda e somente os correspondentes na da direita
-- DIREITA PODE TER CAMPOS NULLS

SELECT COUNT(*) FROM tabela_de_clientes;
SELECT cpf, COUNT(*) FROM notas_fiscais GROUP BY cpf;

-- Note que tenho clientes e apenas 14 notas, ou seja, um cliente não comprou! Podemos descobrir quem foi:

SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
LEFT JOIN notas_fiscais b ON a.cpf = b.cpf
WHERE b.cpf IS NULL;

SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
LEFT JOIN notas_fiscais b ON a.cpf = b.cpf
WHERE b.cpf IS NULL AND YEAR(data_venda) = 2015;

-- RIGHT JOIN: Retorna todos da tabela da direita e somente os correspondentes na da esquerda
-- ESQUERDA PODE TER CAMPOS NULLS

SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM notas_fiscais b 
RIGHT JOIN tabela_de_clientes a ON b.cpf = a.cpf
WHERE b.cpf IS NULL;

-- FULL JOIN: retorna todos registros de todas as tabelas
-- AMBOS OS LADOS PODEM TER NULL

SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

SELECT * FROM tabela_de_vendedores 
INNER JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

SELECT * FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

SELECT tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.nome, tabela_de_clientes.bairro
FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

SELECT tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.nome, tabela_de_clientes.bairro
FROM tabela_de_vendedores
LEFT JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

SELECT tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.nome, tabela_de_clientes.bairro
FROM tabela_de_vendedores
RIGHT JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

/* 
O FULL JOIN não existe no MYSQL!!! Mas posso fazer outra consulta unindo o left e o right

SELECT tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.nome, tabela_de_clientes.bairro
FROM tabela_de_vendedores
FULL JOIN tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;
*/

-- CROSS JOIN: Retorna o produto cartesiano das duas tabelas
-- COMBINA TODOS, SE TENHO 4 DE UM LADO E 4 DO OUTRO ELE ME TRAZ 16 COMBINAÇÕES
-- NÃO TEM CONDIÇÃO DE UNIÃO (ON): FROM TABELA_A, TABELA_B

SELECT tabela_de_vendedores.bairro, tabela_de_vendedores.nome, de_ferias,
tabela_de_clientes.nome, tabela_de_clientes.bairro
FROM tabela_de_vendedores, tabela_de_clientes;

-- UNION: É importante que as tabelas que serão unidas tenham o mesmo número e tipo de campo. 
-- Junta e faz o distinct (agrupa se todos os campos forem iguais)
-- Deve ter o mesmo número de colunas

SELECT DISTINCT bairro FROM tabela_de_clientes
UNION
SELECT DISTINCT bairro FROM tabela_de_vendedores;

-- UNION ALL: Não aplica o DISTINCT sobre o resultado final da consulta
SELECT DISTINCT bairro FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT bairro FROM tabela_de_vendedores;

SELECT DISTINCT bairro, nome, 'CLIENTE' as TIPO FROM tabela_de_clientes
UNION
SELECT DISTINCT bairro, nome, 'VENDEDOR' as TIPO FROM tabela_de_vendedores;

SELECT DISTINCT bairro, nome, 'CLIENTE' as TIPO_CLIENTE FROM tabela_de_clientes
UNION
SELECT DISTINCT bairro, nome, 'VENDEDOR' as TIPO_VENDEDOR FROM tabela_de_vendedores;

SELECT DISTINCT bairro, nome, 'CLIENTE' as TIPO_CLIENTE, cpf FROM tabela_de_clientes
UNION
SELECT DISTINCT bairro, nome, 'VENDEDOR' as TIPO_VENDEDOR, matricula FROM tabela_de_vendedores;

-- FULL JOIN com union
SELECT tabela_de_vendedores.bairro,
tabela_de_vendedores.nome, DE_FERIAS,
tabela_de_clientes.bairro,
tabela_de_clientes.nome  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.nome, DE_FERIAS,
tabela_de_clientes.bairro,
tabela_de_clientes.nome  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;