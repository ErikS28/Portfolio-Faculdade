create database unifecaf_faculdade;

use unifecaf_faculdade;

create table tbl_aluno (
	id int not null primary key auto_increment,
    nome_aluno varchar (100),
    cpf varchar (14),
    rg varchar (20)
);

create table tbl_professores (
	id int not null primary key auto_increment,
    nome_professor varchar (100),
    data_admissao date,
    formacao varchar (400),
    email varchar (400)
);

create table tbl_curso (
	id int not null primary key auto_increment,
    nome_curso varchar (200),
    carga_horaria int
);

create table tbl_email (
	email varchar (400),
    id_aluno int,
    
    constraint FK_aluno_email
    foreign key (id_aluno)
    references tbl_aluno (id)
    
);

create table tbl_telefone (
	numero varchar (100),
    id_aluno int,
    
    constraint FK_aluno_telefone
    foreign key (id_aluno)
    references tbl_aluno (id)
    
);

create table tbl_endereco (
	logradouro varchar (200),
    cep int,
    bairro varchar (100),
    numero varchar (45),
    id_aluno int,
    
    constraint FK_aluno_endereco
    foreign key (id_aluno)
    references tbl_aluno (id)
    
);

alter table tbl_endereco
add column id int auto_increment primary key;

alter table tbl_email
add column id int auto_increment primary key;

alter table tbl_telefone
add column id int auto_increment primary key;

alter table tbl_endereco
modify id int not null auto_increment;

alter table tbl_email
modify id int not null auto_increment;

alter table tbl_telefone
modify id int not null auto_increment;

select * from tbl_email;

create table tbl_disciplina (
	id int not null auto_increment primary key,
    nome_disciplina varchar (100),
    status_disciplina varchar (45),
    id_curso int,
    id_professores int,
    
    constraint FK_curso_disciplina
    foreign key (id_curso)
    references tbl_curso (id),
    
    constraint FK_professor_disciplina
    foreign key (id_professores)
    references tbl_professores (id)
    
);

create table tbl_matricula (
    tbl_disciplinas_id int,
    tbl_aluno_id int,
    nota decimal (5,2),
    frequencia decimal (5,2),
    status_conclusao varchar (45),
    primary key (tbl_disciplinas_id, tbl_aluno_id),
    foreign key (tbl_disciplinas_id) references tbl_disciplina(id),
    foreign key (tbl_aluno_id) references tbl_aluno(id)

);

show tables

INSERT INTO tbl_curso (nome_curso, carga_horaria) VALUES
('Analise e Desenvolvimento de Sistemas', 2000),
('Engenharia Civil', 3600),
('Administracao', 2400);

INSERT INTO tbl_professores (nome_professor, data_admissao, formacao, email) VALUES
('Carlos Silva', '2022-01-10', 'Mestre em Computacao', 'carlos@faculdade.com'),
('Ana Beatriz', '2023-03-05', 'Engenheira Civil', 'ana.b@faculdade.com'),
('Ricardo Nunes', '2021-08-20', 'Administrador', 'ricardo@faculdade.com');

INSERT INTO tbl_disciplina (nome_disciplina, status_disciplina, id_curso, id_professores) VALUES
('Banco de Dados', 'Ativa', 1, 1),
('Cálculo Estrutural', 'Ativa', 2, 2),
('Gestão de Pessoas', 'Ativa', 3, 3);

INSERT INTO tbl_aluno (nome_aluno, cpf, rg) VALUES
('Lucas Ferreira', '12345678901', 'MG123456'),
('Mariana Oliveira', '98765432100', 'SP987654'),
('João Pedro', '45678912322', 'RJ456789');

INSERT INTO tbl_endereco (logradouro, cep, bairro, numero, id_aluno) VALUES
('Rua das Flores', 12345678, 'Centro', '101', 1),
('Av. Brasil', 87654321, 'Jardim América', '202', 2),
('Rua do Sol', 11223344, 'Vila Nova', '303', 3);

INSERT INTO tbl_telefone (numero, id_aluno) VALUES
('(11) 99999-1111', 1),
('(11) 98888-2222', 2),
('(11) 97777-3333', 3);

INSERT INTO tbl_email (email, id_aluno) VALUES
('lucas@email.com', 1),
('mariana@email.com', 2),
('joao@email.com', 3);

INSERT INTO tbl_matricula (tbl_disciplinas_id, tbl_aluno_id, nota, frequencia, status_conclusao) VALUES
(1, 1, 9.5, 95.00, 'Concluído'),
(2, 2, 8.0, 90.00, 'Cursando'),
(3, 3, 7.5, 88.00, 'Concluído');

select * from tbl_curso;

select * from tbl_professores;

show tables;




