create database atividade_sql09;
use atividade_sql09;

create table PILOTO(
numero_registro int primary key,
data_validade date,
nome varchar(150) not null
);

create table VOO(
numero_voo int primary key,
hora_partida time,
hora_chegada time,
local_partida varchar(150),
local_destino varchar(150),
numero_registro int 
);

create table CLIENTE_VOO(
cliente_voo_id int primary key auto_increment,
numero_cadeira int not null,
qtd_bagagem decimal(10,3),
numero_voo int,
cliente_id int
);

create table CLIENTE(
cliente_id int primary key auto_increment,
nome varchar(150) not null,
telefone varchar(20),
endereco varchar(150),
rg varchar(15) unique
);

alter table VOO
add constraint FK_PILOTO_VOO
foreign key (numero_registro) references PILOTO(numero_registro);

alter table CLIENTE_VOO
add constraint FK_VOO_CLIENTE_VOO
foreign key (numero_voo) references voo (numero_voo);

alter table CLIENTE_VOO
add constraint FK_CLIENTE_CLIENTE_VOO
foreign key (cliente_id) references CLIENTE(cliente_id);