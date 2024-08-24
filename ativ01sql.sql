create database Atividade_sql01;
use Atividade_sql01;

create table EMPRESA (
empresa_id int auto_increment,
nome_empresa varchar(150) not null,
endereco varchar(200),
primary key (empresa_id)
);

create table PROJETO (
projeto_id int auto_increment,
empresa_id int,
data_inicio date,
data_final date,
valor decimal(10,2),
primary key(projeto_id),
foreign key(empresa_id) references EMPRESA(empresa_id)
);

create table CONSULTOR(
consultor_id int auto_increment,
nome varchar(100) not null,
rg varchar(20) not null,
especializacao varchar(20),
primary key (consultor_id)
);

create table PARTICIPOU(
participou_id int auto_increment,
consultor_id int,
projeto_id int,
horas_trabalhadas time,
funcao varchar(20),
primary key(participou_id),
foreign key(consultor_id) references CONSULTOR(consultor_id),
foreign key(projeto_id) references PROJETO(projeto_id)
);