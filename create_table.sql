/* Lógico_1: */

CREATE TABLE PESSOA (
    id_atendimento INTEGER PRIMARY KEY,
    cpf_cnpj VARCHAR(30) NOT NULL,
    nome_pessoa VARCHAR(50) NOT NULL,
    pj_pf BOOLEAN NOT NULL,
    rg VARCHAR(9),
    email VARCHAR(30) NOT NULL,
    telefone_alternativo INTEGER,
    usa_whats BOOLEAN NOT NULL,
    data_nasc DATE NOT NULL,
    nacionalidade VARCHAR(20) NOT NULL,
    naturalidade VARCHAR(20) NOT NULL,
    tem_filhos BOOLEAN NOT NULL,
    qtd_filhos_moram INTEGER NOT NULL,
    qtd_membros_familia INTEGER NOT NULL,
    estado_civil VARCHAR(10) NOT NULL,
    escolaridade VARCHAR(20) NOT NULL,
    situacao_emprego VARCHAR(30) NOT NULL,
    profissao VARCHAR(30) NOT NULL,
    renda FLOAT NOT NULL,
    renda_familiar FLOAT NOT NULL,
    genero VARCHAR(10),
    cor_raca VARCHAR(15),
    lgbt BOOLEAN,
    demanda_violencia_domestica BOOLEAN NOT NULL,
    materia_demanda VARCHAR(30) NOT NULL,
    perfil_aprovado BOOLEAN NOT NULL,
    como_soube VARCHAR(60)
);

CREATE TABLE BENEFICIO (
    id_beneficio INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    valor_beneficio FLOAT    
);

CREATE TABLE TELEFONES (
    id_telefones INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER
);

CREATE TABLE TRATAMENTO (
    id_tratamento INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    valor_tratamento FLOAT
);

CREATE TABLE INVESTIMENTOS (
    id_investimentos INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    valor_atributo FLOAT
);

CREATE TABLE IMOVEIS (
    id_imoveis INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    valor_imovel FLOAT,
    Tipo_imovel VARCHAR(20)
);

CREATE TABLE AUTOMOVEL (
    id_automovel INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    valor_atributo FLOAT
);

CREATE TABLE ENDERECO (
    id_endereco INTEGER PRIMARY KEY,
    FK_PESSOA_id_atendimento INTEGER,
    rua VARCHAR(30),
    numero VARCHAR(10),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado VARCHAR(20)    
);

CREATE TABLE ESTAGIARIO (
    cod_estagiario INTEGER PRIMARY KEY,
    FK_TIPO_ESTAGIARIO_id_tipo_estagiario VARCHAR(15),
    nome VARCHAR(50),
    celular INTEGER,
    email VARCHAR(30)
);

CREATE TABLE TIPO_ESTAGIARIO (
    id_tipo_estagiario VARCHAR(15) PRIMARY KEY,
    ds_estagio VARCHAR(30)
);

CREATE TABLE ATENDIMENTO_ESTAGIARIO_realiza (
    fk_ESTAGIARIO_cod_estagiario INTEGER,
    fk_PESSOA_id_atendimento INTEGER,
    data_hora_atribuicao VARCHAR(30),
    PRIMARY KEY (fk_ESTAGIARIO_cod_estagiario, fk_PESSOA_id_atendimento)
);

CREATE TABLE ADVOGADO (
    oab VARCHAR(30) PRIMARY KEY,
    nome_adv VARCHAR(50),
    especialidade VARCHAR(30),
    cpf VARCHAR(11),
    email_adv VARCHAR(30),
    celular_adv VARCHAR(30),
    ano_ingresso VARCHAR(30)
);

CREATE TABLE DISPONIBILIDADE_ADV (
    id_disponibilidade INTEGER PRIMARY KEY,
    FK_ADVOGADO_oab VARCHAR(30),
    dia_semana VARCHAR(20),
    hora_ini VARCHAR(20),
    hora_fim VARCHAR(20),
    formato VARCHAR(30)
);

CREATE TABLE AGENDA_ADV_inscreve (
    fk_DISPONIBILIDADE_ADV_id_disponibilidade INTEGER,
    fk_ESTAGIARIO_cod_estagiario INTEGER,
    dia_semana VARCHAR(20),
    hora_ini VARCHAR(20),
    hora_fim VARCHAR(20),
    data_inscricao DATE,
    area_direito VARCHAR(30),
    tipo_orientacao VARCHAR(30),
    prazo_judicial VARCHAR(30),
    num_auto VARCHAR(30),
    registro_adv VARCHAR(30),
    PRIMARY KEY(fk_DISPONIBILIDADE_ADV_id_disponibilidade,fk_ESTAGIARIO_cod_estagiario)
);

CREATE TABLE CONTROLE_CASO (
    num_processo VARCHAR(30) PRIMARY KEY,
    tipo_acao VARCHAR(30),
    cpf_cnpj VARCHAR(30),
    polo VARCHAR(30),
    dt_controle DATE,
    prox_tarefa VARCHAR(200),
    tem_prazo_dobro BOOLEAN,
    obs_prazo VARCHAR(1500),
    audiencia VARCHAR(30),
    prazo_simples VARCHAR(30),
    prazo_dobrado VARCHAR(30),
    movientacao VARCHAR(30),
    dias_prox_controle INTEGER,
    dt_proposicao DATE
);


CREATE TABLE ESTAGIARIO_CONTROLE_CASO_possui (
    fk_CONTROLE_CASO_num_processo VARCHAR(30),
    fk_ESTAGIARIO_cod_estagiario INTEGER,
    PRIMARY KEY (fk_CONTROLE_CASO_num_processo, fk_ESTAGIARIO_cod_estagiario) 
);


ALTER TABLE BENEFICIO ADD CONSTRAINT FK_BENEFICIO_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE TELEFONES CONSTRAINT FK_TELEFONES_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE TRATAMENTO ADD CONSTRAINT FK_TRATAMENTO_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE INVESTIMENTOS ADD CONSTRAINT FK_INVESTIMENTOS_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE IMOVEIS ADD CONSTRAINT FK_IMOVEIS_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE AUTOMOVEL ADD CONSTRAINT FK_AUTOMOVEL_1 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_2 
    FOREIGN KEY (FK_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento)
    ON DELETE CASCADE;

ALTER TABLE DISPONIBILIDADE_ADV ADD CONSTRAINT FK_DISPONIBILIDADE_ADV_1
    FOREIGN KEY (FK_ADVOGADO_oab)
    REFERENCES ADVOGADO (oab)
    ON DELETE RESTRICT;

ALTER TABLE ESTAGIARIO ADD CONSTRAINT FK_ESTAGIARIO_2 
    FOREIGN KEY (FK_TIPO_ESTAGIARIO_id_tipo_estagiario)
    REFERENCES TIPO_ESTAGIARIO (id_tipo_estagiario)
    ON DELETE RESTRICT;

ALTER TABLE AGENDA_ADV_inscreve ADD CONSTRAINT FK_AGENDA_ADV_inscreve 
    FOREIGN KEY (FK_DISPONIBILIDADE_ADV_id_disponibilidade)
    REFERENCES DISPONIBILIDADE_ADV (id_disponibilidade);

ALTER TABLE AGENDA_ADV_inscreve ADD CONSTRAINT FK_ESTAGIARIO_CONTROLE_CASO_possui_2 
    FOREIGN KEY (fk_ESTAGIARIO_cod_estagiario)
    REFERENCES ESTAGIARIO (cod_estagiario);

ALTER TABLE ESTAGIARIO_CONTROLE_CASO_possui ADD CONSTRAINT FK_ESTAGIARIO_CONTROLE_CASO_possui_1 
    FOREIGN KEY (fk_CONTROLE_CASO_num_processo)
    REFERENCES CONTROLE_CASO (num_processo);

ALTER TABLE ESTAGIARIO_CONTROLE_CASO_possui ADD CONSTRAINT FK_ESTAGIARIO_CONTROLE_CASO_possui_2 
    FOREIGN KEY (fk_ESTAGIARIO_cod_estagiario)
    REFERENCES ESTAGIARIO (cod_estagiario);

ALTER TABLE ATENDIMENTO_ESTAGIARIO_realiza ADD CONSTRAINT FK_ATENDIMENTO_ESTAGIARIO_realiza_1 
    FOREIGN KEY (fk_ESTAGIARIO_cod_estagiario)
    REFERENCES ESTAGIARIO (cod_estagiario);

ALTER TABLE ATENDIMENTO_ESTAGIARIO_realiza ADD CONSTRAINT FK_ATENDIMENTO_ESTAGIARIO_realiza_2 
    FOREIGN KEY (fk_PESSOA_id_atendimento)
    REFERENCES PESSOA (id_atendimento);