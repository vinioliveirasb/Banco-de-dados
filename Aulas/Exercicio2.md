table Administradora {
  id int [primary key]
  nome varchar
}

table Condominio {
  id int [primary key]
  nome varchar
  administradora_id int [ref: > Administradora.id]
}

table Unidade {
  id int [primary key]
  condominio_id int [ref: > Condominio.id]
  proprietario_id int [ref: > Pessoa.id]
}

table Pessoa {
  id int [primary key]
  nome varchar
}

table Aluguel {
  id int [primary key]
  unidade_id int [ref: > Unidade.id]
  inquilino_id int [ref: > Pessoa.id]
}

// Regras do modelo:
// - Uma administradora gerencia vários condomínios.
// - Um condomínio possui várias unidades.
// - Cada unidade pertence a um ou mais proprietários.
// - Uma unidade pode estar alugada para no máximo uma pessoa.
// - Uma pessoa pode alugar várias unidades.
