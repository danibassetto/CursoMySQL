-- AULA 01 - CREATE, INSERT, UPDATE e SELECT

-- CRIANDO UM BANCO: CREATE DATABASE nomeDoBanco
CREATE DATABASE casa_do_suco;

-- UTILIZANDO-O: USE nomeDoBanco
USE casa_do_suco;

-- CRIANDO TABELA: CREATE TABLE nomeTabela ( nomeColuna tipoColuna )
CREATE TABLE cliente (
	cpf VARCHAR(11),
	nome VARCHAR(100),
    endereco1 VARCHAR(150),
    endereco2 VARCHAR(150),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(8),
    idade SMALLINT,
    sexo VARCHAR(1),
    limite_credito FLOAT,
    volume_minimo FLOAT,
    primeira_compra BIT(1)
);

CREATE TABLE vendedor (
	matricula VARCHAR(5),
    nome VARCHAR(100),
    percentual_comissao float
);

CREATE TABLE produto (
	codigo VARCHAR(20),
    nome VARCHAR(150),
    embalagem VARCHAR(50),
    tamanho VARCHAR(50),
    sabor VARCHAR(50),
    preco_lista FLOAT
);

-- INSERIR DADOS: INSERT INTO nomeTabela (colunas que vou usar) VALUES (valores de cada coluna em ordem)
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1040107', 'Light - 350 ml - Melância', 'Lata', 4.56);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1037797', 'Clean - 2 Litros - Laranja', 'PET', 16.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', 6.31);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melância', 'PET', 19.51);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1088126', 'Linha Citros - 1 Litro - Limão', 'PET', 7.00);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('544931', 'Frescor do Verão - 350 ml - Limão', 'Lata', 2.46);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1078680', 'Frescor do Verão - 470 ml - Manga', 'Garrafa', 5.18);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1042712', 'Linha Citros - 700 ml - Limão', 'Garrafa', 4.90);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('788975', 'Pedaços de Frutas - 1,5 Litros - Maça', 'PET', 18.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1002767', 'Videira do Campo - 700 ml - Cereja/Maça', 'Garrafa', 8.41);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('231776', 'Festival de Sabores - 700 ml - Açai', 'Garrafa', 13.31);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('479745', 'Clean - 470 ml - Laranja', 'Garrafa', 3.77);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1051518', 'Frescor do Verão - 470 ml - Limão', 'Garrafa', 3.30);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1101035', 'Linha Refrescante - 1 Litro - Morango/Limão', 'PET', 9.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('229900', 'Pedaços de Frutas - 350 ml - Maça', 'Lata', 4.21);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1086543', 'Linha Refrescante - 1 Litro - Manga', 'PET', 11.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('695594', 'Festival de Sabores - 1,5 Litros - Açai', 'PET', 28.51);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('838819', 'Clean - 1,5 Litros - Laranja', 'PET', 12.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('326779', 'Linha Refrescante - 1,5 Litros - Manga', 'PET', 16.51);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('520380', 'Pedaços de Frutas - 1 Litro - Maça', 'PET', 12.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1041119', 'Linha Citros - 700 ml - Lima/Limão', 'Garrafa', 4.90);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('243083', 'Festival de Sabores - 1,5 Litros - Maracujá', 'PET', 10.51);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('394479', 'Sabor da Montanha - 700 ml - Cereja', 'Garrafa', 8.41);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('746596', 'Light - 1,5 Litros - Melância', 'PET', 19.51);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('773912', 'Clean - 1 Litro - Laranja', 'PET', 8.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('826490', 'Linha Refrescante - 700 ml - Morango/Limão', 'Garrafa', 6.31);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('723457', 'Festival de Sabores - 700 ml - Maracujá', 'Garrafa', 4.91);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('812829', 'Clean - 350 ml - Laranja', 'Lata', 2.81);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('290478', 'Videira do Campo - 350 ml - Melância', 'Lata', 4.56);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('783663', 'Sabor da Montanha - 700 ml - Morango', 'Garrafa', 7.71);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('235653', 'Frescor do Verão - 350 ml - Manga', 'Lata', 3.86);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1002334', 'Linha Citros - 1 Litro - Lima/Limão', 'PET', 7.00);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1013793', 'Videira do Campo - 2 Litros - Cereja/Maça', 'PET', 24.01);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1096818', 'Linha Refrescante - 700 ml - Manga', 'Garrafa', 7.71);
INSERT INTO produto (codigo, nome, embalagem, preco_lista) VALUES ('1022450', 'Festival de Sabores - 2 Litros - Açai', 'PET', 38.01);

-- REALIZAR CONSULTA DE TODAS AS COLUNAS DA TABELA: SELECT * FROM nomeTabela
SELECT * FROM produto;

INSERT INTO vendedor VALUES ('00233', 'João Geraldo da Fonseca', 0.10);
INSERT INTO vendedor VALUES ('00235', 'Márcio Almeida Silva', 0.08);
INSERT INTO vendedor VALUES ('00236', 'Cláudia Morais ', 0.08);

SELECT * FROM vendedor;

USE sucos;

INSERT INTO produto VALUES ('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml','Limão',3.20);

INSERT INTO produto VALUES ('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18);

USE sucos;

-- ATUALIZAR DADO: UPDATE nomeTabela SET nomeColuna = novoValor WHERE condição
UPDATE produto SET embalagem = 'Lata', preco = 2.46 WHERE codigo = '544931';

UPDATE produto SET embalagem = 'Garrafa' WHERE codigo = '1078680';

UPDATE vendedores SET percentual_comissao = 0.11 WHERE matricula = '00236';