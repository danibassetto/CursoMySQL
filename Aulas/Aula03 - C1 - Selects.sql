-- AULA 03: CONSULTAS
USE casa_do_suco;

SELECT nome, matricula FROM vendedor;
SELECT * FROM produto WHERE codigo = '544931';
SELECT * FROM cliente WHERE cidade = 'Rio de Janeiro';
SELECT * FROM produto WHERE sabor = 'Cítricos';

UPDATE produto SET sabor = 'Cítricos' WHERE sabor = 'Limão';
SELECT * FROM vendedor WHERE nome = 'Claudia Morais';

SELECT * FROM cliente;

SELECT * FROM cliente WHERE idade = 22;
SELECT * FROM cliente WHERE idade > 22;
SELECT * FROM cliente WHERE idade < 22;
SELECT * FROM cliente WHERE idade <= 22;
SELECT * FROM cliente WHERE idade <> 22;

/*quando realizamos a consulta SELECT * FROM tbcliente WHERE NOME > ‘Fernando Cavalcante’;, o MySQL analisa a primeira
 letra, no caso "F", a partir desse critério e se tiver outro nome que inicie com "F", como "Fátima" seria um candidato,
 já ao comparar a segunda letra de cada nome, perceberia que "E" é maior que "A", descartando "Fátima" da condição.*/

SELECT * FROM cliente WHERE nome >= 'Fernando Cavalcante';
SELECT * FROM cliente WHERE nome <> 'Fernando Cavalcante';

SELECT * FROM produto;
SELECT * FROM produto WHERE preco_lista > 16.008;
SELECT * FROM produto WHERE preco_lista < 16.008;
SELECT * FROM produto WHERE preco_lista <> 16.008;
SELECT * FROM produto WHERE preco_lista BETWEEN 16.007 AND 16.009;

SELECT * FROM vendedor WHERE percentual_comissao > 0.10;

SELECT * FROM cliente;
SELECT * FROM cliente WHERE data_nascimento = '1995-01-13';
SELECT * FROM cliente WHERE data_nascimento > '1995-01-13';
SELECT * FROM cliente WHERE data_nascimento <= '1995-01-13';

SELECT * FROM cliente WHERE YEAR(data_nascimento) = 1995;
SELECT * FROM cliente WHERE MONTH(data_nascimento) = 10;

SELECT * FROM vendedor WHERE YEAR(data_emissao) >= 2016;

SELECT * FROM cliente WHERE idade >= 18 AND idade <= 22 AND sexo = 'M';

SELECT * FROM cliente WHERE cidade = 'Rio de Janeiro' OR bairro = 'Jardins';

SELECT * FROM cliente WHERE (idade >= 18 AND idade <= 22 AND sexo = 'M')
 OR (cidade = 'Rio de Janeiro' OR bairro = 'Jardins');
 
 SELECT * FROM vendedor WHERE YEAR(data_emissao) < 2016 AND ferias = 1;
 
 SELECT * FROM produto WHERE sabor = 'Manga'; 
 SELECT * FROM produto WHERE sabor = 'Manga' OR tamanho = '470 ml'; 
 SELECT * FROM produto WHERE sabor = 'Manga' AND tamanho = '470 ml'; 
 SELECT * FROM produto WHERE NOT (sabor = 'Manga' AND tamanho = '470 ml'); 
 SELECT * FROM produto WHERE NOT (sabor = 'Manga' OR tamanho = '470 ml'); 
 SELECT * FROM produto WHERE sabor = 'Manga' AND NOT (tamanho = '470 ml'); 
 SELECT * FROM produto WHERE sabor IN ('Laranja', 'Manga'); 
 SELECT * FROM produto WHERE sabor = 'Laranja' OR sabor = 'Manga'; 
 SELECT * FROM produto WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND idade >= 20; 
 SELECT * FROM produto WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND (idade >= 20 AND idade <= 22); 
 
 -- COMANDO LIKE: SELECT * FROM tab WHERE campo LIKE '<condição>';
 SELECT * FROM produto WHERE sabor LIKE '%Maça%';
 SELECT * FROM produto WHERE sabor LIKE '%Maça%' AND embalagem = 'PET';
 
 SELECT * FROM cliente WHERE nome LIKE '%Mattos';
 
 -- COMANDO DISTINCT para retornar os dados diferentes: SELECT DISTINCT * FROM tabela;
 SELECT embalagem, tamanho FROM produto;
 -- Desse modo, o retorno será bem mais reduzido, porque mostrará apenas as combinações que não se repetem.
 SELECT DISTINCT embalagem, tamanho FROM produto;
 SELECT DISTINCT embalagem, tamanho FROM produto WHERE sabor = 'Laranja';
 SELECT DISTINCT embalagem, tamanho, SABOR FROM produto;
 
 SELECT DISTINCT bairro FROM cliente WHERE cidade = 'Rio de Janeiro';
 
 -- COMANDO LIMIT para limitar a saída: SELECT campos FROM tabela WHERE condicao LIMIT numeroDeLinhas;
 SELECT * FROM produto;
 SELECT * FROM produto LIMIT 5;
 SELECT * FROM produto LIMIT 2,3; 
 SELECT * FROM produto LIMIT 0, 2; -- Essa consulta retornará a linha 0 e a linha 1 (registros 1 e 2).
 
 -- COMANDO ORDER BY: 
SELECT * FROM produto;
SELECT * FROM produto ORDER BY preco_lista;
SELECT * FROM produto ORDER BY preco_lista DESC;
SELECT * FROM produto ORDER BY nome;
SELECT * FROM produto ORDER BY nome DESC;
SELECT * FROM produto ORDER BY embalagem DESC, nome ASC;

-- GROUP BY: agrupando

SELECT * FROM cliente;

SELECT estado, limite_credito FROM cliente;

SELECT estado, SUM(limite_credito) AS LIMITE_TOTAL FROM cliente GROUP BY estado;

SELECT embalagem, preco_lista FROM produto;

SELECT embalagem, MAX(preco_lista) AS MAIOR_PRECO FROM produto GROUP BY embalagem;

SELECT embalagem, COUNT(*) AS CONTADOR FROM produto GROUP BY embalagem;

SELECT bairro, SUM(limite_credito) AS LIMITE FROM cliente GROUP BY bairro;

SELECT bairro, SUM(limite_credito) AS LIMITE FROM cliente 
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

SELECT estado, bairro, SUM(limite_credito) AS LIMITE FROM cliente 
GROUP BY estado, bairro;

SELECT estado, bairro, SUM(limite_credito) AS LIMITE FROM cliente 
WHERE cidade = 'Rio de Janeiro' GROUP BY estado, bairro;

SELECT estado, bairro, SUM(limite_credito) AS LIMITE FROM cliente 
WHERE cidade = 'Rio de Janeiro' 
GROUP BY estado, bairro
ORDER BY bairro;


