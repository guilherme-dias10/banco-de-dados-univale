create database Atividade_sql03;
use Atividade_sql03;

create table FORNECEDOR (
fornecedor_id int primary key auto_increment,
nome_fornecedor varchar(50) not null,
cnpj varchar(15) unique,
endereco varchar(150)
);

create table PRODUTO (
produto_id int primary key auto_increment,
nome_produto varchar(50) not null,
descricao varchar(158)
);

create table FORNECEDOR_PRODUTO (
fornecedor_produto_id int primary key auto_increment, 
fornecedor_id int not null,
produto_id int not null
);

alter table FORNECEDOR_PRODUTO
add constraint FK_FORNECEDOR_PRODUTO_FORNECEDOR
foreign key FORNECEDOR_PRODUTO (fornecedor_id)
references FORNECEDOR (fornecedor_id);

create table VENDA (
venda_id int primary key auto_increment,
empresa_id int,
cliente_id int,
numero_nota_fiscal varchar(50),
data_venda date not null,
valor_total decimal (10,2) not null 
);

create table ITENS_VENDA (
itens_venda_id int primary key auto_increment,
venda_id int,
produto_id int,
valor_unitario decimal(10,2),
quantidade decimal(10,3)
);

alter table ITENS_VENDA
add constraint FK_ITENS_VENDA_PRODUTO
foreign key ITENS_VENDA(produto_id)
references PRODUTO(produto_id);

alter table ITENS_VENDA
add constraint FK_ITENS_VENDA_VENDA
foreign key ITENS_VENDA(venda_id)
references VENDA(venda_id);

create table CLIENTE( 
cliente_id int primary key auto_increment,
nome_cliente varchar(50) not null,
endereco varchar(150) 
);

create table EMPRESA(
empresa_id int primary key auto_increment,
nome_empresa varchar(50) not null,
cnpj varchar(15) 
);

alter table VENDA
add constraint FK_VENDA_EMPRESA 
foreign key VENDA(empresa_id) references EMPRESA(empresa_id), 
add constraint FK_VENDA_CLIENTE 
foreign key VENDA(cliente_id) references CLIENTE(cliente_id);