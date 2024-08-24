-- 1. Criar o banco de dados DB_BORDADOS
create database DB_BORDADOS_GUILHERME;

-- 2. Usar o banco de dados DB_BORDADOS
use DB_BORDADOS_GUILHERME;

-- 3. Criar a tabela TB_BORDADOS
create table TB_BORDADOS (
    id_bordado int primary key,
    nome_bordado varchar(150) not null,
    largura_cm decimal(4,1),
    altura_cm decimal(4,1),
    numero_pontos int not null
);

-- 4. Inserir informações na tabela TB_BORDADOS
insert into TB_BORDADOS (id_bordado, nome_bordado, largura_cm, altura_cm, numero_pontos)
values 
(1, 'Univale - Construindo Conhecimento - 10,0 x 4,8', 10.0, 4.8, 9715),
(2, 'Administração - 7,5 x 7,7', 7.5, 7.7, 11249),
(3, 'Odontologia - 10,0 x 8,8', 10.0, 8.8, 20714),
(4, 'Psicologia - 7,5 x 7,5', 7.5, 7.5, 8164),
(5, 'Enfermagem - 9,0 x 7,5', 9.0, 7.5, 9204),
(6, 'Sistemas de Informação - 9,0 x 9,0', 9.0, 9.0, 14497),
(7, 'Medicina - UFJF GV - Turma V - 9,0 x 10,0 - 20', 9.0, 10.0, 20791),
(8, 'Pedagogia - 7,0 x 9,0', 7.0, 9.0, 13055);

-- 5. Alterar a estrutura da tabela
alter table TB_BORDADOS
change column numero_pontos n_ponto int not null,
add column n_cores varchar(1),
add column data_criacao date;

-- 6. Modificar registros de Odontologia e Sistemas de Informação
update TB_BORDADOS set n_cores = '5' where nome_bordado in ('Odontologia', 'Sistemas de Informação');

-- 7. Listar arquivos com número de cores vazio
select * from TB_BORDADOS where n_cores is null;

-- 8. Apagar o registro de Pedagogia
delete from TB_BORDADOS where nome_bordado = 'Pedagogia';

-- 9. Seleccionar e informar a quantidade de bordados cadastrados
select COUNT(*) as quantidade_de_bordados from TB_BORDADOS;

-- 10. Inserir o arquivo de Pedagogia novamente com n_cores igual a 5
insert into TB_BORDADOS (id_bordado, nome_bordado, largura_cm, altura_cm, n_ponto, n_cores)
values (8, 'Pedagogia - 7,0 x 9,0', 7.0, 9.0, 13055, '5');

-- 11. Listar todos os bordados abaixo de dez mil pontos
select * from TB_BORDADOS where n_ponto < 10000;

-- 12. Listar todos os bordados com largura entre 7,5 e 9,0
select * from TB_BORDADOS where largura_cm between 7.5 and 9.0;

-- 13. Alterar a estrutura da tabela
alter table TB_BORDADOS
drop column data_criacao,
change column n_cores n_cores INT;

-- 14. Selecionar o valor de cada bordado
select nome_bordado, (n_ponto * 2.50 / 1000) as valor from TB_BORDADOS;

-- 15. Selecionar nome_bordado e numero_pontos ordenando de forma crescente pelo nome_bordado
select nome_bordado, n_ponto from TB_BORDADOS order by nome_bordado asc;

-- 16. Selecionar todos os campos ordenando pelo que tem maior para menor largura_cm
select * from TB_BORDADOS order by largura_cm desc;

-- 17. Selecionar todos os bordados que contêm "gia" no nome_bordado
select * from TB_BORDADOS where nome_bordado like '%gia%';

-- 18. Adicionar 2000 mil pontos ao campo numero_pontos
update TB_BORDADOS set n_ponto = n_ponto + 2000;

-- 19. Adicionar 10 ao numero_cores dos bordados que não possuem quantidade de cores cadastrada
update TB_BORDADOS set n_cores = n_cores + 10 where n_cores is null;

-- 20. Renomear a tabela TB_BORDADOS para TABELA_BORDADOS
rename table TB_BORDADOS to TABELA_BORDADOS;