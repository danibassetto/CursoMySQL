USE casa_do_suco;
SET SQL_SAFE_UPDATES = 0;

-- DELETANDO REGISTROS: DELETE FROM nomeTabela WHERE condição
DELETE FROM produto WHERE codigo = '1078680';

SELECT * FROM produto;

DELETE FROM vendedor WHERE matricula = '00233';

-- ADICIONANDO PRIMARY KEY : ALTER TABLE nomeTabela ADD PRIMARY KEY(campoChaveDaTabela) 
ALTER TABLE produto ADD PRIMARY KEY(codigo);
ALTER TABLE cliente ADD PRIMARY KEY(cpf);

-- ADICIONANDO UMA COLUNA: ALTER TABLE nomeTabela ADD COLUMN nomeColuna tipoColuna
ALTER TABLE cliente ADD COLUMN data_nascimento DATE;

-- Note que o formato de DATE é ano-mes-dia
INSERT INTO cliente VALUES ('00388934505',  'João da Silva', 'Rua projetada A número 10', '', 'Vila Roman', 'CARATINGA', 
'AM', '2222222', 30, 'M', 10000.00, 2000, 0, '1989-10-05');

SELECT * FROM cliente;

ALTER TABLE vendedor ADD COLUMN data_emissao DATE;
ALTER TABLE vendedor ADD COLUMN ferias BIT;
ALTER TABLE vendedor ADD PRIMARY KEY (matricula);

INSERT INTO vendedor (matricula, nome, data_emissao, percentual_comissao, ferias) VALUES ('00235', 'Márcio Almeida Silva', '2014-08-15', 0.08, 0);
INSERT INTO vendedor (matricula, nome, data_emissao, percentual_comissao, ferias) VALUES ('00236', 'Cláudia Morais', '2013-09-17', 0.08, 1);
INSERT INTO vendedor (matricula, nome, data_emissao, percentual_comissao, ferias) VALUES ('00237', 'Roberta Martins', '2017-03-18', 0.11, 1);
INSERT INTO vendedor (matricula, nome, data_emissao, percentual_comissao, ferias) VALUES ('00238', 'Pericles Alves', '2016-08-21', 0.11, 0);
