-- Criação do banco de dados
CREATE DATABASE SistemaVendas;

-- Selecionar o banco de dados
USE SistemaVendas;

-- Tabela Vendedor
CREATE TABLE Vendedor (
    ID_Vendedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255)
);

-- Tabela Prateleira
CREATE TABLE Prateleira (
    ID_Prateleira INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Localizacao VARCHAR(100)
);

-- Tabela Produto
CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque_Atual INT NOT NULL,
    ID_Prateleira INT,
    FOREIGN KEY (ID_Prateleira) REFERENCES Prateleira(ID_Prateleira)
);

-- Tabela Venda
CREATE TABLE Venda (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    Data DATETIME NOT NULL,
    Valor_Total DECIMAL(10, 2) NOT NULL,
    ID_Vendedor INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabela Venda_Produto (entidade de relacionamento entre Venda e Produto)
CREATE TABLE Venda_Produto (
    ID_Venda INT,
    ID_Produto INT,
    Quantidade INT NOT NULL,
    Preco_Unidade DECIMAL(10, 2) NOT NULL,
    Total_Item DECIMAL(10, 2) AS (Quantidade * Preco_Unidade) STORED,
    PRIMARY KEY (ID_Venda, ID_Produto),
    FOREIGN KEY (ID_Venda) REFERENCES Venda(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

-- Inserção de exemplo de dados

-- Inserir dados de vendedor
INSERT INTO Vendedor (Nome, CPF, Email, Telefone) 
VALUES ('João Silva', '123.456.789-00', 'joao@empresa.com', '123456789');

-- Inserir dados de cliente
INSERT INTO Cliente (Nome, CPF, Email, Telefone, Endereco) 
VALUES ('Maria Oliveira', '987.654.321-00', 'maria@cliente.com', '987654321', 'Rua das Flores, 123');

-- Inserir dados de prateleira
INSERT INTO Prateleira (Nome, Localizacao) 
VALUES ('Prateleira A', 'Corredor 1, Estante 3');

-- Inserir dados de produto
INSERT INTO Produto (Nome, Descricao, Preco, Estoque_Atual, ID_Prateleira) 
VALUES ('Produto X', 'Descrição do Produto X', 25.00, 100, 1);

-- Inserir dados de venda
INSERT INTO Venda (Data, Valor_Total, ID_Vendedor, ID_Cliente) 
VALUES ('2025-02-24 10:30:00', 100.00, 1, 1);

-- Inserir dados de venda_produto
INSERT INTO Venda_Produto (ID_Venda, ID_Produto, Quantidade, Preco_Unidade) 
VALUES (1, 1, 4, 25.00);
