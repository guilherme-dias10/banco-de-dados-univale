create database DB_SGE;
use DB_SGE;

create table ALUNOS(
id_aluno int primary key auto_increment,
nome_aluno varchar(150)
);

create table CURSOS(
id_curso int primary key auto_increment,
curso varchar(150),
valor decimal(10,2)
);

insert into alunos (nome_aluno) values
("João"), ("José"), ("Isis"), ("Theo"), ("José"),
("Pedro"), ("Gil");

insert into cursos (curso, valor) values
("Design", 900),
("Sistema de Informação", 900),
("Odontologia", 1200),
("Medicina", 6500),
("Direito", 1300.00),
("Engenharia Civil", 1400.00);

create table MATRICULAS (
id_matricula int primary key auto_increment,
id_aluno int,
id_curso int,
constraint FK_MATRICULAS_ALUNOS
foreign key (id_aluno) references ALUNOS(id_aluno)
);
alter table MATRICULAS
add constraint FK_MATRICULAS_CURSOS
foreign key (id_curso) references CURSOS(id_curso);

insert into matriculas (id_aluno, id_curso) values
(1,5),(2,1),(3,4),(7,3),(4,2),(6,6);

insert into matriculas (id_aluno, id_curso) values
(4,6),(2,5),(3,3),(6,5),(6,1);

select nome_aluno, curso from matriculas
inner join alunos
on alunos.id_aluno = matriculas.id_aluno
inner join cursos
on cursos.id_curso = matriculas.id_curso
order by nome_aluno asc;

select nome_aluno, valor from matriculas
inner join alunos
on alunos.id_aluno = matriculas.id_aluno
inner join cursos
on cursos.id_curso = matriculas.id_curso
where valor >= 1300;

select nome_aluno, count(curso) as qtd_matricula_Pedro from matriculas
inner join alunos
on alunos.id_aluno = matriculas.id_aluno
inner join cursos
on cursos.id_curso = matriculas.id_curso
where nome_aluno = "Pedro";

select nome_aluno, count(curso) as qtd_matricula_Pedro from matriculas
inner join alunos
on alunos.id_aluno = matriculas.id_aluno
inner join cursos
on cursos.id_curso = matriculas.id_curso
where nome_aluno = "Isis" or nome_aluno = "Theo"
group by nome_aluno;


select * from alunos;
select * from cursos;
select * from matriculas;