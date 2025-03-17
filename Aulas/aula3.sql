-- Criando as tabelas do diagrama ER para SQL Server (T-SQL)

CREATE TABLE EMPREGADO (
    id_empregado INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    CIC NVARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE DEPARTAMENTO (
    id_departamento INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL
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
    id_secretaria INT IDENTITY(1,1) PRIMARY KEY,
    id_empregado INT UNIQUE,
    FOREIGN KEY (id_empregado) REFERENCES EMPREGADO(id_empregado)
);

CREATE TABLE ENGENHEIRO (
    id_engenheiro INT IDENTITY(1,1) PRIMARY KEY,
    id_empregado INT UNIQUE,
    CREA NVARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_empregado) REFERENCES EMPREGADO(id_empregado)
);

CREATE TABLE PARTICIPACAO (
    id_engenheiro INT,
    id_projeto INT,
    PRIMARY KEY (id_engenheiro, id_projeto),
    FOREIGN KEY (id_engenheiro) REFERENCES ENGENHEIRO(id_engenheiro)
);

CREATE TABLE PROJETO (
    id_projeto INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL
);

CREATE TABLE DOMINIO (
    id_secretaria INT,
    id_processador INT,
    PRIMARY KEY (id_secretaria, id_processador),
    FOREIGN KEY (id_secretaria) REFERENCES SECRETARIA(id_secretaria)
);

CREATE TABLE PROCESSADOR_DE_TEXTOS (
    id_processador INT IDENTITY(1,1) PRIMARY KEY,
    modelo NVARCHAR(100) NOT NULL
);
