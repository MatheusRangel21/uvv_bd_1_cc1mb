CREATE USER 'matheussr'@'localhost' IDENTIFIED BY '123456';

GRANT ALL PRIVILEGES ON * . * TO 'matheussr'@'localhost';

CREATE DATABASE uvv;

use uvv;

CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(50),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INT NOT NULL,
                PRIMARY KEY (cpf)
);

ALTER TABLE funcionario COMMENT 'Tabela que armazena as informações dos funcionários.';

ALTER TABLE funcionario MODIFY COLUMN cpf CHAR(11) COMMENT 'CPF do funcionário. Será a PK da tabela.';

ALTER TABLE funcionario MODIFY COLUMN primeiro_nome VARCHAR(15) COMMENT 'Primeiro nome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN nome_meio CHAR(1) COMMENT 'Inicial do nome do meio.';

ALTER TABLE funcionario MODIFY COLUMN ultimo_nome VARCHAR(15) COMMENT 'Sobrenome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(50) COMMENT 'Endereço do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN salario DECIMAL(10, 2) COMMENT 'Salário do funcionário.';


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);

ALTER TABLE dependente COMMENT 'Tabela que armazena as informações dos dependentes dos funcionários.';

ALTER TABLE dependente MODIFY COLUMN cpf_funcionario CHAR(11) COMMENT 'Faz parte da PK desta e é uma FK para a tabela funcionário.';

ALTER TABLE dependente MODIFY COLUMN nome_dependente VARCHAR(15) COMMENT 'Nome do dependente. Faz parte da PK desta tabela.';

ALTER TABLE dependente MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do dependente.';

ALTER TABLE dependente MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do dependente.';

ALTER TABLE dependente MODIFY COLUMN parentesco VARCHAR(15) COMMENT 'Descrição do parentesco do dependente com o funcionário.';


CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
);

ALTER TABLE departamento COMMENT 'Tabela que armazena as informações dos departamentos.';

ALTER TABLE departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É a PK desta tabela.';

ALTER TABLE departamento MODIFY COLUMN nome_departamento VARCHAR(15) COMMENT 'Nome do departamento. Deve ser único,';

ALTER TABLE departamento MODIFY COLUMN cpf_gerente CHAR(11) COMMENT 'É uma FK para a tabela funcionários.';


CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (numero_projeto)
);


CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);


CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                PRIMARY KEY (cpf_funcionario, numero_projeto)
);

ALTER TABLE trabalha_em COMMENT 'Tabela que armazena as informações dos departamentos.';


ALTER TABLE trabalha_em ADD CONSTRAINT new_table_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT new_table_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT new_table_new_table_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_1_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Jorge' , 'E', 'Brito', '88866555576', '10-11-1937', 'Rua das Horto, 35, São Paulo, SP', 'M', 55.000, '88866555576', 1);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('André' , 'V', 'Pereira', '98798798733', '03-29-1969', 'Rua Timbira, 35, São Paulo, SP', 'M', 25.000, '98798798733', 4);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Jennifer' , 'S', 'Souza', '98765432168', '06-20-1969', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43.000, '88866555576', 4);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Fernando' , 'T', 'Wong', '33344555587', '12-08-1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40.000, '88866555576', 5);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Alice' , 'J', 'Zelaya', '99988777767', '01-19-1968', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25.000, '98765432168', 4);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Joice' , 'A', 'Leite', '45345345376', '07-31-1972', 'Av.Lucas Obes, 74, São Pauçp, SP', 'F', 25.000, '33344555587', 5);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('Ronaldo' , 'K', 'Lima', '66688444476', '09-15-1962', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38.000, '33344555587', 5);

insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values ('João' , 'B', 'Silva', '12345678966', '09-01-1965', 'Rua das Flores, 751, São Paulo, SP', 'M', 30.000, '33344555587', 5);

insert into departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
values ('pesquisa', 5, '33344555587', '05-22-1988');

insert into departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
values ('administração', 4, '98765432168', '01-01-1995');

insert into departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
values ('matriz', 1, '88866555576', '06-19-1981');

insert into localizacoes_departamento (numero_departamento, local)
values (1, 'São Paulo');

insert into localizacoes_departamento (numero_departamento, local)
values (4, 'Mauá');

insert into localizacoes_departamento (numero_departamento, local)
values (5, 'Santo André');

insert into localizacoes_departamento (numero_departamento, local)
values (5, 'Itu');

insert into localizacoes_departamento (numero_departamento, local)
values (5, 'São Paulo');

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('ProdutoX', 1, 'Santo André', 5);

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('ProdutoY', 2, 'Itu', 5);

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('ProdutoZ', 3, 'São Paulo', 5);

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('Informatização', 10, 'Mauá', 4);

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('Reorganização', 20, 'São Pauo', 1);

insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
values ('Novosbenefícios', 30, 'Mauá', 4);

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('33344555587', 'Alicia', 'F', '04-05-1986', 'Filha');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('33344555587', 'Tiago', 'M', '10-25-1986', 'Filho');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('33344555587', 'Janaína', 'F', '05-03-1958', 'Esposa');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('98765432168', 'Antonio', 'M', '02-28-1942', 'Marido');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('12345678966', 'Michael', 'M', '04-01-1988', 'Filho');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('12345678966', 'Alicia', 'F', '12-30-1988', 'Filha');

insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values ('12345678966', 'Elizabeth', 'F', '05-05-1967', 'Esposa');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('12345678966', 1, '32.5');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('12345678966', 2, '7.5');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('66688444476', 3, '40.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('45345345376', 1, '20.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('45345345376', 2, '20.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('33344555587', 2, '10.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('33344555587', 3, '10.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('33344555587', 10, '10.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('33344555587', 20, '10.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('99988777767', 30, '30.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('99988777767', 10, '10.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('98798798733', 10, '35.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('98798798733', 30, '5.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('98765432168', 30, '20.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('98765432168', 20, '15.0');

insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
values ('88866555576', 20, '0.0');