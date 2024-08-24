create database atividade_sql_ll;
use atividade_sql_ll;

create table CLIENTE(
cliente_id int primary key auto_increment,
nome_completo varchar(100) not null,
cpf varchar(15) unique not null,
endereco varchar(200) not null
);

create table VENDA(
venda_id int primary key auto_increment,
numero_nota_fiscal int not null,
data_venda date not null,
desconto decimal(10, 2),
endereco_entrega varchar(200) not null,
cliente_id int not null
);

create table PRODUTO_VENDA(
produto_venda_id int primary key auto_increment,
qtd_vendida int not null,
preco_venda decimal(10, 2) not null,
venda_id int not null,
produto_id int not null
);

create table PRODUTO(
produto_id int primary key auto_increment, preco_tabela decimal(10, 2) not null,
nome_produto varchar(100) not null,
descricao varchar(200) not null
);

alter table VENDA
add constraint FK_VENDA_CLIENTE
foreign key VENDA(cliente_id) references CLIENTE(cliente_id);

alter table PRODUTO_VENDA
add constraint FK_PVENDA_VENDA
foreign key PRODUTO_VENDA(venda_id) references VENDA(venda_id)
,
add constraint FK_PVENDA_PRODUTO
foreign key PRODUTO_VENDA(produto_id) references PRODUTO(produto_id);
;