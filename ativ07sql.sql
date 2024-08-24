create database atividade_sql_07;
use atividade_sql_07;

create table MEDICO(
crm varchar(15) primary key not null,
nome varchar(100) not null,
data_admissao date,
salario decimal(10,2)
);

create table CONSULTA(
consulta_id int primary key auto_increment,
crm varchar(15) not null unique,
paciente_id int,
data_hora_visita datetime
);

create table PACIENTE(
paciente_id int primary key auto_increment,
nome varchar(100) not null,
rg varchar(15) not null unique,
cpf varchar(15) not null unique,
telefone varchar(15),
endereco varchar(200)
);

create table QUARTO(
numero_quarto int primary key auto_increment,
andar int not null,
paciente_id int
);

alter table CONSULTA
add constraint FK_MEDICO_CONSULTA
foreign key (crm) references MEDICO(crm);

alter table CONSULTA
add constraint FK_PACIENTE_CONSULTA
foreign key (paciente_id) references  PASCIENTE(paciente_id);

alter table QUARTO
add constraint FK_PACIENTE_QUARTO
foreign key (paciente_id) references  PACIENTE(paciente_id);