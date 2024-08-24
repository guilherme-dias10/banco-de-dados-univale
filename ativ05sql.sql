create database atividade_sql05;
use atividade_sql05;

create table CLIENTE( 
cliente_id int primary key auto_increment, 
nome_completo varchar(100) not null, 
rg varchar(15) not null unique, 
cpf varchar(15) not null unique, 
endereco varchar(200)
);

create table VEICULO( 
placa varchar(10) primary key not null,
cod_renavan varchar(20) not null unique,
fabricante varchar(50) not null,
modelo varchar(20) not null,
ano integer not null,
cliente_id int not null
);

create table OCORRENCIA(
numero_ocorrencia int primary key auto_increment,
data_ocorrencia date not null,
local_ocorrencia varchar(200),
descricao varchar(200),
placa varchar(10) not null unique
);

alter table VEICULO
add constraint FK_CLIENTE_VEICULO
foreign key (cliente_id) references CLIENTE(cliente_id);

alter table OCORRENCIA
add constraint FK_VEICULO_OCORRENCIA
foreign key (placa) references VEICULO(placa);