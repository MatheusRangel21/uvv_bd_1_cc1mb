CREATE DATABASE cc1mb_banco
    WITH 
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default;

\c cc1mb_banco;

CREATE SCHEMA banco;


CREATE TABLE banco.horario_funcionamento (
                id INTEGER NOT NULL,
                horario_abre TIME NOT NULL,
                horario_fecha TIME NOT NULL,
                dia_semana_0 BIT NOT NULL,
                dia_semana_1 BIT NOT NULL,
                dia_semana_2 BIT NOT NULL,
                dia_semana_3 BIT NOT NULL,
                dia_semana_4 BIT NOT NULL,
                dia_semana_5 BIT NOT NULL,
                dia_semana_6 BIT NOT NULL,
                CONSTRAINT horario_funcionamento_pk PRIMARY KEY (id)
);
COMMENT ON COLUMN banco.horario_funcionamento.id IS 'PK da tabela horario_funcionamento.';
COMMENT ON COLUMN banco.horario_funcionamento.horario_abre IS 'Coluna que armazena o horário de abertura.';
COMMENT ON COLUMN banco.horario_funcionamento.horario_fecha IS 'Coluna que armazena o horário de fechamento.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_0 IS 'Coluna que armazena o dia da semana domingo.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_1 IS 'Coluna que armazena o dia da semana segunda.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_2 IS 'Coluna que armazena o dia da semana terça.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_3 IS 'Coluna que armazena o dia da semana quarta.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_4 IS 'Coluna que armazena o dia da semana quinta.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_5 IS 'Coluna que armazena o dia da semana quinta.';
COMMENT ON COLUMN banco.horario_funcionamento.dia_semana_6 IS 'Coluna que armazena o dia da semana sábado.';


CREATE TABLE banco.BAIRROS (
                codigo INTEGER NOT NULL,
                nome VARCHAR(100) NOT NULL,
                cod_cidade INTEGER NOT NULL,
                CONSTRAINT bairros_pk PRIMARY KEY (codigo)
);
COMMENT ON COLUMN banco.BAIRROS.codigo IS 'PK da tabela BAIRROS.';
COMMENT ON COLUMN banco.BAIRROS.nome IS 'Coluna que armazena os nomes dos bairros.';
COMMENT ON COLUMN banco.BAIRROS.cod_cidade IS 'Coluna que armazena a cidade.';


CREATE TABLE banco.CIDADES (
                codigo INTEGER NOT NULL,
                nome VARCHAR(100) NOT NULL,
                uf CHAR(2) NOT NULL,
                CONSTRAINT cidades_pk PRIMARY KEY (codigo)
);
COMMENT ON COLUMN banco.CIDADES.codigo IS 'PK da tabela CIDADES.';
COMMENT ON COLUMN banco.CIDADES.nome IS 'Coluna que armazena o nome da cidade.';
COMMENT ON COLUMN banco.CIDADES.uf IS 'Coluna que armazena o UF.';


CREATE TABLE banco.UF (
                sigla CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT uf_pk PRIMARY KEY (sigla)
);
COMMENT ON COLUMN banco.UF.sigla IS 'PK da tabela UF.';
COMMENT ON COLUMN banco.UF.nome IS 'Coluna que armazena o nome da UF.';


CREATE TABLE banco.AGENCIA_TELEFONE (
                tel_agencia INTEGER NOT NULL,
                numero1 CHAR NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                CONSTRAINT agencia_telefone_pk PRIMARY KEY (tel_agencia)
);
COMMENT ON COLUMN banco.AGENCIA_TELEFONE.tel_agencia IS 'PK da tabela AGENCIA_TELEFONE.';
COMMENT ON COLUMN banco.AGENCIA_TELEFONE.numero1 IS 'Coluna que armazena o número do telefone da agência.';
COMMENT ON COLUMN banco.AGENCIA_TELEFONE.tipo IS 'Coluna que armazena o tipo da operadora.';


CREATE TABLE banco.BANCO_TELEFONE (
                tel_banco INTEGER NOT NULL,
                numero VARCHAR(11) NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                CONSTRAINT banco_telefone_pk PRIMARY KEY (tel_banco)
);
COMMENT ON COLUMN banco.BANCO_TELEFONE.tel_banco IS 'PK da tabela BANCO_TELEFONE.';
COMMENT ON COLUMN banco.BANCO_TELEFONE.numero IS 'Coluna que armazena o número do telefone do banco.';
COMMENT ON COLUMN banco.BANCO_TELEFONE.tipo IS 'Coluna que armazena o tipo da operadora.';


CREATE TABLE banco.CLIENTES (
                codigo_cliente INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                endereco_cliente VARCHAR NOT NULL,
                sexo CHAR(1) NOT NULL,
                data_nascimento DATE NOT NULL,
                estado_civil VARCHAR(30) NOT NULL,
                end_cod_bairro INTEGER NOT NULL,
                end_cod_cidade INTEGER NOT NULL,
                end_uf CHAR(2) NOT NULL,
                CONSTRAINT clientes_pk PRIMARY KEY (codigo_cliente)
);
COMMENT ON TABLE banco.CLIENTES IS 'Tabela que armazena as informações dos clientes.';
COMMENT ON COLUMN banco.CLIENTES.codigo_cliente IS 'PK da tabela CLIENTES.';
COMMENT ON COLUMN banco.CLIENTES.nome IS 'Coluna que armazena o nome do clientes.';
COMMENT ON COLUMN banco.CLIENTES.endereco_cliente IS 'Coluna que armazena o endereço do cliente.';
COMMENT ON COLUMN banco.CLIENTES.sexo IS 'Coluna que armazena o sexo do cliente.';
COMMENT ON COLUMN banco.CLIENTES.data_nascimento IS 'Coluna que armazena a data de nascimento.';
COMMENT ON COLUMN banco.CLIENTES.estado_civil IS 'Tabela que armazena estado civil do cliente.';
COMMENT ON COLUMN banco.CLIENTES.end_cod_bairro IS 'Coluna que armazena o bairro.';
COMMENT ON COLUMN banco.CLIENTES.end_cod_cidade IS 'Coluna que armazena a cidade.';
COMMENT ON COLUMN banco.CLIENTES.end_uf IS 'Coluna que armazena o UF.';


CREATE TABLE banco.EMPRESTIMOS (
                codigo_emprestimo INTEGER NOT NULL,
                data_aquisicao DATE NOT NULL,
                valor NUMERIC(10,2) NOT NULL,
                codigo_cliente INTEGER NOT NULL,
                CONSTRAINT emprestimos_pk PRIMARY KEY (codigo_emprestimo)
);
COMMENT ON TABLE banco.EMPRESTIMOS IS 'Tabela que armazena as informações dos empréstimos.';
COMMENT ON COLUMN banco.EMPRESTIMOS.codigo_emprestimo IS 'PK da tabela de EMPRESTIMOS.';
COMMENT ON COLUMN banco.EMPRESTIMOS.data_aquisicao IS 'Coluna que armazena a data de aquisição.';
COMMENT ON COLUMN banco.EMPRESTIMOS.valor IS 'Coluna que armazena o valor do emprestimos.';
COMMENT ON COLUMN banco.EMPRESTIMOS.codigo_cliente IS 'Coluna que armazena o código do cliente.';


CREATE TABLE banco.PARCELAS (
                codigo_emprestimo INTEGER NOT NULL,
                numero_parcela INTEGER NOT NULL,
                valor_parcela NUMERIC(10,2) NOT NULL,
                valor_dos_juros NUMERIC(10,2),
                valor_multa NUMERIC(10,2),
                data_vencimento DATE NOT NULL,
                data_pagamento DATE,
                CONSTRAINT parcelas_pk PRIMARY KEY (codigo_emprestimo, numero_parcela)
);
COMMENT ON TABLE banco.PARCELAS IS 'Tabela para armazenar as informações das parcelas de um empréstimo.';
COMMENT ON COLUMN banco.PARCELAS.codigo_emprestimo IS 'Coluna que armazena o código do emprestimo.';
COMMENT ON COLUMN banco.PARCELAS.numero_parcela IS 'PK da tabela PARCELAS.';
COMMENT ON COLUMN banco.PARCELAS.valor_parcela IS 'Coluna que armazena o valor da parcela.';
COMMENT ON COLUMN banco.PARCELAS.valor_dos_juros IS 'Coluna que armazena o valor dos juros.';
COMMENT ON COLUMN banco.PARCELAS.valor_multa IS 'Coluna que armazena o valor da multa.';
COMMENT ON COLUMN banco.PARCELAS.data_vencimento IS 'Coluna que armazena a data de vencimento.';
COMMENT ON COLUMN banco.PARCELAS.data_pagamento IS 'Tabela que armazena a data de pagamento.';


CREATE TABLE banco.CONTAS (
                num_contas INTEGER NOT NULL,
                senha VARCHAR NOT NULL,
                data_abertura DATE NOT NULL,
                saldo INTEGER NOT NULL,
                limite_credito NUMERIC(10,2) NOT NULL,
                codigo_cliente INTEGER NOT NULL,
                CONSTRAINT contas_pk PRIMARY KEY (num_contas)
);
COMMENT ON TABLE banco.CONTAS IS 'Tabela que armazena as informações das contas dos clientes.';
COMMENT ON COLUMN banco.CONTAS.num_contas IS 'Coluna que armazena o número das contas.';
COMMENT ON COLUMN banco.CONTAS.senha IS 'Coluna que armazena a senha da conta.';
COMMENT ON COLUMN banco.CONTAS.data_abertura IS 'Coluna que armazena a data de abertura da conta.';
COMMENT ON COLUMN banco.CONTAS.saldo IS 'Coluna que armazena o saldo da conta.';
COMMENT ON COLUMN banco.CONTAS.limite_credito IS 'Coluna que armazena o limite de crédito.';
COMMENT ON COLUMN banco.CONTAS.codigo_cliente IS 'Coluna que armazena o codigo do cliente.';


CREATE TABLE banco.EMPREGADOS (
                matricula INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                cargo VARCHAR NOT NULL,
                endereco_empregado VARCHAR NOT NULL,
                salario NUMERIC(10,2) NOT NULL,
                Parent_matricula INTEGER NOT NULL,
                CONSTRAINT empregados_pk PRIMARY KEY (matricula)
);
COMMENT ON TABLE banco.EMPREGADOS IS 'Tabela que armazena as informações dos empregados.';
COMMENT ON COLUMN banco.EMPREGADOS.matricula IS 'PK da tabela agência.';
COMMENT ON COLUMN banco.EMPREGADOS.nome IS 'Coluna que armazena os nomes.';
COMMENT ON COLUMN banco.EMPREGADOS.cargo IS 'Coluna que armazena os cargos.';
COMMENT ON COLUMN banco.EMPREGADOS.endereco_empregado IS 'Coluna que armazena o endereço do empregado.';
COMMENT ON COLUMN banco.EMPREGADOS.salario IS 'Coluna que armazena o salário.';
COMMENT ON COLUMN banco.EMPREGADOS.Parent_matricula IS 'Coluna que armazena a matrícula do parente.';


CREATE TABLE banco.LOTACOES (
                matricula INTEGER NOT NULL,
                id_horario INTEGER NOT NULL,
                funcao_desempenhada VARCHAR NOT NULL,
                CONSTRAINT lotacoes_pk PRIMARY KEY (matricula)
);
COMMENT ON TABLE banco.LOTACOES IS 'Tabela que armazena as informações das lotações.';
COMMENT ON COLUMN banco.LOTACOES.matricula IS 'Coluna que armazena a matrícula.';
COMMENT ON COLUMN banco.LOTACOES.id_horario IS 'Coluna que armazena o ID do horário.';
COMMENT ON COLUMN banco.LOTACOES.funcao_desempenhada IS 'Coluna que armazena a função desempenhada.';


CREATE TABLE banco.BANCOS (
                tel_banco INTEGER NOT NULL,
                cnpj CHAR(14) NOT NULL,
                razao_social VARCHAR NOT NULL,
                endereco_banco VARCHAR NOT NULL,
                site VARCHAR NOT NULL,
                CONSTRAINT bancos_pk PRIMARY KEY (tel_banco, cnpj)
);
COMMENT ON TABLE banco.BANCOS IS 'Tabela que armazena informações do banco.';
COMMENT ON COLUMN banco.BANCOS.tel_banco IS 'Coluna que armazena o telefone do banco.';
COMMENT ON COLUMN banco.BANCOS.cnpj IS 'PK da tabela BANCOS.';
COMMENT ON COLUMN banco.BANCOS.razao_social IS 'Coluna que armazena a razão social.';
COMMENT ON COLUMN banco.BANCOS.endereco_banco IS 'Coluna que armazena o endereço do banco.';
COMMENT ON COLUMN banco.BANCOS.site IS 'Coluna que armazena o site do banco.';


CREATE TABLE banco.AGENCIAS (
                id_agencia INTEGER NOT NULL,
                tel_banco INTEGER NOT NULL,
                cnpj CHAR(14) NOT NULL,
                tel_agencia INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                endereco_agencia VARCHAR NOT NULL,
                matricula INTEGER NOT NULL,
                CONSTRAINT agencias_pk PRIMARY KEY (id_agencia, tel_banco, cnpj, tel_agencia)
);
COMMENT ON TABLE banco.AGENCIAS IS 'Tabela que armazena as informações das agências';
COMMENT ON COLUMN banco.AGENCIAS.id_agencia IS 'PK da tabela agências.';
COMMENT ON COLUMN banco.AGENCIAS.tel_banco IS 'Coluna que armazena o telefone do banco';
COMMENT ON COLUMN banco.AGENCIAS.cnpj IS 'Coluna que armazena o CNPJ.';
COMMENT ON COLUMN banco.AGENCIAS.tel_agencia IS 'Coluna que armazena o telefone da agência.';
COMMENT ON COLUMN banco.AGENCIAS.nome IS 'Coluna que aramzena o nome.';
COMMENT ON COLUMN banco.AGENCIAS.endereco_agencia IS 'Coluna que armazena o endereço da agência.';
COMMENT ON COLUMN banco.AGENCIAS.matricula IS 'Coluna que armazena a matrícula.';


CREATE TABLE banco.SERVICOS (
                codigo_servico_ INTEGER NOT NULL,
                descricao VARCHAR NOT NULL,
                valor_minimo NUMERIC(10,2),
                data_final_vigencia DATE,
                data_inicio_vigencia DATE,
                tel_banco INTEGER NOT NULL,
                cnpj CHAR(14) NOT NULL,
                tel_agencia INTEGER NOT NULL,
                codigo_cliente INTEGER NOT NULL,
                id_agencia INTEGER NOT NULL,
                CONSTRAINT servicos_pk PRIMARY KEY (codigo_servico_)
);
COMMENT ON TABLE banco.SERVICOS IS 'Tabela que armazena as informações dos serviços.';
COMMENT ON COLUMN banco.SERVICOS.codigo_servico_ IS 'PK da tabela SERVICOS.';
COMMENT ON COLUMN banco.SERVICOS.descricao IS 'Coluna que armazena a descrição dos serviços.';
COMMENT ON COLUMN banco.SERVICOS.valor_minimo IS 'Coluna que armazena o valor mínimo.';
COMMENT ON COLUMN banco.SERVICOS.data_final_vigencia IS 'Coluna que armazena a data final.';
COMMENT ON COLUMN banco.SERVICOS.data_inicio_vigencia IS 'Coluna que armazena a data de início.';
COMMENT ON COLUMN banco.SERVICOS.tel_banco IS 'Coluna que armazena o telefone do banco.';
COMMENT ON COLUMN banco.SERVICOS.cnpj IS 'Coluna que armazena o CNPJ.';
COMMENT ON COLUMN banco.SERVICOS.tel_agencia IS 'Coluna que armazena o telefone da agência.';
COMMENT ON COLUMN banco.SERVICOS.codigo_cliente IS 'Coluna que armazena o código do cliente.';
COMMENT ON COLUMN banco.SERVICOS.id_agencia IS 'Coluna que armazena o ID da agência.';


CREATE TABLE banco.HISTORICO (
                cod_contas INTEGER NOT NULL,
                codigo_servico_ INTEGER NOT NULL,
                historico_transacoes VARCHAR NOT NULL,
                CONSTRAINT historico_pk PRIMARY KEY (cod_contas, codigo_servico_)
);
COMMENT ON TABLE banco.HISTORICO IS 'Tabela que armazena o histórico.';
COMMENT ON COLUMN banco.HISTORICO.cod_contas IS 'Coluna que armazena o código das contas.';
COMMENT ON COLUMN banco.HISTORICO.codigo_servico_ IS 'Coluna que armazena o código do serviço.';
COMMENT ON COLUMN banco.HISTORICO.historico_transacoes IS 'Coluna que armazena o histórico de transações.';


CREATE TABLE banco.CONTRATOS (
                num_contrato INTEGER NOT NULL,
                codigo_servico INTEGER NOT NULL,
                data_assinatura DATE NOT NULL,
                descricao_contradada VARCHAR NOT NULL,
                descricao_contratante VARCHAR NOT NULL,
                CONSTRAINT contratos_pk PRIMARY KEY (num_contrato)
);
COMMENT ON TABLE banco.CONTRATOS IS 'Tabela que armazena as informações dos contratos.';
COMMENT ON COLUMN banco.CONTRATOS.num_contrato IS 'PK da tabela contratos.';
COMMENT ON COLUMN banco.CONTRATOS.codigo_servico IS 'Coluna que armazena o código de serviço do contrato.';
COMMENT ON COLUMN banco.CONTRATOS.data_assinatura IS 'Coluna que armazena a data de assinatura do contrato.';
COMMENT ON COLUMN banco.CONTRATOS.descricao_contradada IS 'Coluna que armazena a descrição da contratada.';
COMMENT ON COLUMN banco.CONTRATOS.descricao_contratante IS 'Coluna que armazena a descrição do contratante.';


ALTER TABLE banco.LOTACOES ADD CONSTRAINT horario_funcionamento_lotacoes_fk
FOREIGN KEY (id_horario)
REFERENCES banco.horario_funcionamento (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.CLIENTES ADD CONSTRAINT bairros_clientes_fk
FOREIGN KEY (end_cod_bairro)
REFERENCES banco.BAIRROS (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.CLIENTES ADD CONSTRAINT cidades_clientes_fk
FOREIGN KEY (end_cod_cidade)
REFERENCES banco.CIDADES (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.CLIENTES ADD CONSTRAINT uf_clientes_fk
FOREIGN KEY (end_uf)
REFERENCES banco.UF (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.AGENCIAS ADD CONSTRAINT agencia_telefone_agencias_fk
FOREIGN KEY (tel_agencia)
REFERENCES banco.AGENCIA_TELEFONE (tel_agencia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.BANCOS ADD CONSTRAINT banco_telefone_bancos_fk
FOREIGN KEY (tel_banco)
REFERENCES banco.BANCO_TELEFONE (tel_banco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.SERVICOS ADD CONSTRAINT clientes_servicos_fk
FOREIGN KEY (codigo_cliente)
REFERENCES banco.CLIENTES (codigo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.CONTAS ADD CONSTRAINT clientes_contas_fk
FOREIGN KEY (codigo_cliente)
REFERENCES banco.CLIENTES (codigo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.EMPRESTIMOS ADD CONSTRAINT clientes_emprestimos_fk
FOREIGN KEY (codigo_cliente)
REFERENCES banco.CLIENTES (codigo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.PARCELAS ADD CONSTRAINT emprestimos_parcelas_fk
FOREIGN KEY (codigo_emprestimo)
REFERENCES banco.EMPRESTIMOS (codigo_emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.HISTORICO ADD CONSTRAINT contas_historico_fk
FOREIGN KEY (cod_contas)
REFERENCES banco.CONTAS (num_contas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.EMPREGADOS ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (Parent_matricula)
REFERENCES banco.EMPREGADOS (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.LOTACOES ADD CONSTRAINT empregados_lotacoes_fk
FOREIGN KEY (matricula)
REFERENCES banco.EMPREGADOS (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.AGENCIAS ADD CONSTRAINT lotacoes_agencias_fk
FOREIGN KEY (matricula)
REFERENCES banco.LOTACOES (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.AGENCIAS ADD CONSTRAINT bancos_agencias_fk
FOREIGN KEY (tel_banco, cnpj)
REFERENCES banco.BANCOS (tel_banco, cnpj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.SERVICOS ADD CONSTRAINT agencias_servicos_fk
FOREIGN KEY (cnpj, tel_agencia, id_agencia, tel_banco)
REFERENCES banco.AGENCIAS (cnpj, tel_agencia, id_agencia, tel_banco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.CONTRATOS ADD CONSTRAINT servicos_contratos_fk
FOREIGN KEY (codigo_servico)
REFERENCES banco.SERVICOS (codigo_servico_)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE banco.HISTORICO ADD CONSTRAINT servicos_historico_fk
FOREIGN KEY (codigo_servico_)
REFERENCES banco.SERVICOS (codigo_servico_)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;