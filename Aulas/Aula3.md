![image](https://github.com/user-attachments/assets/7118c7b3-f832-4c99-a889-127916903c7b)

-- Criando as tabelas do diagrama ER fornecido

CREATE TABLE EMPREGADO (
    id_empregado SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    CIC VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE DEPARTAMENTO (
    id_departamento SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE LOTACAO (
    id_empregado INT,
    id_departamento INT,
    PRIMARY KEY (id_empregado, id_departamento),
    FOREIGN KEY (id_empregado) REFERENCES EMPREGADO(id_empregado),
    FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO(id_departamento)
);

CREATE TABLE GERENCIA (
    id_gerente INT PRIMARY KEY,
    FOREIGN KEY (id_gerente) REFERENCES EMPREGADO(id_empregado)
);

CREATE TABLE SECRETARIA (
    id_secretaria SERIAL PRIMARY KEY,
    id_empregado INT UNIQUE,
    FOREIGN KEY (id_empregado) REFERENCES EMPREGADO(id_empregado)
);

CREATE TABLE ENGENHEIRO (
    id_engenheiro SERIAL PRIMARY KEY,
    id_empregado INT UNIQUE,
    CREA VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_empregado) REFERENCES EMPREGADO(id_empregado)
);

CREATE TABLE PARTICIPACAO (
    id_engenheiro INT,
    id_projeto INT,
    PRIMARY KEY (id_engenheiro, id_projeto),
    FOREIGN KEY (id_engenheiro) REFERENCES ENGENHEIRO(id_engenheiro)
);

CREATE TABLE PROJETO (
    id_projeto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE DOMINIO (
    id_secretaria INT,
    id_processador INT,
    PRIMARY KEY (id_secretaria, id_processador),
    FOREIGN KEY (id_secretaria) REFERENCES SECRETARIA(id_secretaria)
);

CREATE TABLE PROCESSADOR_DE_TEXTOS (
    id_processador SERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL
);
