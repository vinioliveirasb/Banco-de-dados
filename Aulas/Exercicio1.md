# Diagrama de Banco de Dados
USAR DBDIAGRAM.IO
O diagrama de banco de dados foi modelado utilizando DBML (Database Markup Language).

```dbml
// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table Vendedor {
  ID_Vendedor int [pk]
  Nome varchar
  CPF varchar [unique]
  Email varchar
  Telefone varchar
}

Table Cliente {
  ID_Cliente int [pk]
  Nome varchar
  CPF varchar [unique]
  Email varchar
  Telefone varchar
  Endereco varchar
}

Table Prateleira {
  ID_Prateleira int [pk]
  Nome varchar
  Localizacao varchar
}

Table Produto {
  ID_Produto int [pk]
  Nome varchar
  Descricao text
  Preco decimal
  Estoque_Atual int
  ID_Prateleira int
}

Table Venda {
  ID_Venda int [pk]
  Data datetime
  Valor_Total decimal
  ID_Vendedor int
  ID_Cliente int
}

Table Venda_Produto {
  ID_Venda int
  ID_Produto int
  Quantidade int
  Preco_Unidade decimal
  Total_Item decimal
  primary key(ID_Venda, ID_Produto)
}

// Relacionamentos (foreign keys)
Ref: Produto.ID_Prateleira > Prateleira.ID_Prateleira
Ref: Venda.ID_Vendedor > Vendedor.ID_Vendedor
Ref: Venda.ID_Cliente > Cliente.ID_Cliente
Ref: Venda_Produto.ID_Venda > Venda.ID_Venda
Ref: Venda_Produto.ID_Produto > Produto.ID_Produto
