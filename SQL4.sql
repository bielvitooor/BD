CREATE DATABASE adrianob_grupo09;
USE adrianob_grupo09;
CREATE TABLE Turno (
  id_turno INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_turno)
  );

CREATE TABLE Curso (
  id_curso INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cargo_horaria INT NOT NULL,
  turno_id_turno INT NOT NULL,
  PRIMARY KEY (id_curso),
  CONSTRAINT fk_curso_turno
    FOREIGN KEY (turno_id_turno)
    REFERENCES turno (id_turno)
    ON DELETE CASCADE
    );

CREATE TABLE Sexo (
  id_sexo INT NOT NULL,
  descricao_sexo VARCHAR(12) NOT NULL,
  PRIMARY KEY (id_sexo)
  );
CREATE TABLE Pessoa (
  id_pessoa INT NOT NULL AUTO_INCREMENT UNIQUE,
  nome VARCHAR(50) NOT NULL,
  matricula BIGINT NOT NULL UNIQUE,
  cpf BIGINT(11) NOT NULL UNIQUE,
  email VARCHAR(80) NULL,
  telefone VARCHAR(15) NULL,
  dt_nasc date NOT NULL,
  sexo_id_sexo INT NOT NULL,
  PRIMARY KEY (id_pessoa),
  CONSTRAINT fk_Pessoa_sexo
    FOREIGN KEY (sexo_id_sexo)
    REFERENCES sexo (id_sexo)
    ON DELETE CASCADE
    );
      CREATE TABLE Setor (
  id_setor INT UNIQUE NOT NULL,
  descricao_sala VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_setor)
    );
    CREATE TABLE Cargo (
  id_cargo INT UNIQUE NOT NULL,
  nome_cargo VARCHAR(40) NOT NULL,
  Setor_id_setor INT NOT NULL,
  PRIMARY KEY (id_cargo),
  CONSTRAINT fk_Setor_Cargo
	FOREIGN KEY(Setor_id_setor)
    REFERENCES Setor(id_setor)
    ON DELETE CASCADE
  );

CREATE TABLE Registro (
 num_registro INT UNIQUE NOT NULL AUTO_INCREMENT,
  registro_entrada TIMESTAMP NOT NULL,
  registro_saida TIMESTAMP NOT NULL,
  Usuario_id_usuario INT NOT NULL,
  Usuario_curso_id_curso INT NOT NULL,
  Usuario_Pessoa_id_pessoas INT NOT NULL,
  Usuario_Pessoa_sexo_id_sexo INT NOT NULL,
  Usuario_Cargo_id_cargo INT NOT NULL,
  Usuario_Cargo_Setor_id_setor INT UNSIGNED NOT NULL,
  PRIMARY KEY (num_registro,Usuario_id_usuario, Usuario_curso_id_curso, Usuario_Pessoa_id_pessoas, Usuario_Pessoa_sexo_id_sexo, Usuario_Cargo_id_cargo, Usuario_Cargo_Setor_id_setor),
  CONSTRAINT fk_Registro_Usuario
    FOREIGN KEY (Usuario_id_usuario , Usuario_curso_id_curso , Usuario_Pessoa_id_pessoas , Usuario_Pessoa_sexo_id_sexo, Usuario_Cargo_id_cargo , Usuario_Cargo_Setor_id_setor)
    REFERENCES Usuario (id_usuario , curso_id_curso , Pessoa_id_pessoas , Pessoa_sexo_id_sexo , Cargo_id_cargo1 ,Cargo_Setor_id_setor)
    ON DELETE CASCADE
  );
CREATE TABLE Usuario(
  id_usuario INT NOT NULL auto_increment,
  curso_id_curso INT NOT NULL,
  Pessoa_id_pessoas INT NOT NULL UNIQUE,
  Pessoa_sexo_id_sexo INT NOT NULL,
  Cargo_id_cargo INT NOT NULL,
  Cargo_Setor_id_setor INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, curso_id_curso, Pessoa_id_pessoas, Pessoa_sexo_id_sexo, Cargo_id_cargo, Cargo_Setor_id_setor),
  CONSTRAINT fk_Usuario_curso
    FOREIGN KEY (curso_id_curso)
    REFERENCES Curso (id_curso)
    ON DELETE CASCADE,
  CONSTRAINT fk_Usuario_Pessoa
    FOREIGN KEY (Pessoa_id_pessoas , Pessoa_sexo_id_sexo)
    REFERENCES Pessoa (id_pessoas , sexo_id_sexo)
    ON DELETE CASCADE,
  CONSTRAINT fk_Usuario_Cargo
    FOREIGN KEY (Cargo_id_cargo , Cargo_Setor_id_setor)
    REFERENCES Cargo (id_cargo , Setor_id_setor)
    ON DELETE CASCADE
    );  



/*sexo*/
INSERT INTO adrianob_grupo09.Sexo(id_sexo,descricao_sexo) values(1,"Feminino");
INSERT INTO adrianob_grupo09.Sexo(id_sexo,descricao_sexo) values(2,"Masculino");
/*Sala*/
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(7,"direcao");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(13,"tesouraria");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(18,"secretaria");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(33,"coordenacao");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(78,"salaDosProfessores");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(5,"salaDeAula");
INSERT INTO adrianob_grupo09.Setor(id_setor,descricao_sala) values(21,"patio");

/*cargo*/
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(11,"diretor",7);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(22,"tesourero",13);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(33,"secretario",18);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(44,"coordenador",33);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(55,"professor",78);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(66,"aluno",5);
INSERT INTO adrianob_grupo09.Cargo(id_cargo,nome_cargo,Setor_id_setor) values(77,"visitante",21);
/*turno*/
INSERT INTO adrianob_grupo09.Turno(id_turno, descricao) values(1,"Matutino");
INSERT INTO adrianob_grupo09.Turno(id_turno, descricao) values(2,"Vespertino");
INSERT INTO adrianob_grupo09.Turno(id_turno, descricao) values(3,"Noturno");
INSERT INTO adrianob_grupo09.Turno(id_turno, descricao) values(4,"Integral");
INSERT INTO adrianob_grupo09.Turno(id_turno, descricao) values(5,"EAD");

/*insert cursos*/
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(1,"Sistemas",3600,3);
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(2,"Biologia",3600,5);
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(3,"Quimica",3600,1);
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(4,"Letras",3600,2);
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(5,"Matematica",3600,4);
INSERT INTO adrianob_grupo09.Curso(id_curso,nome,cargo_horaria, turno_id_turno) values(6,"Fisica",3600,4);
/*insert pessoas*/
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Gabriel",20221032020301,7110509776810,"Gabriel@gmail.com","(62)992574432","2004-03-17",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Isaque",20221032020302,711509776910,"Isaque@gmail.com","(62)992574433","2004-03-18",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Gean",20221032020303,71150977010,"Gean@gmail.com","(62)992574434","2004-03-19",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Geovanna",20221032020304,71150976811,"Geovanna@gmail.com","(62)992574435","2004-03-20",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Lívia",20221032020305,71150976911,"Lívia@gmail.com","(62)992574436","2004-03-21",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Marlon",20221032020306,71150977011,"Marlon@gmail.com","(62) 992574437","2004-03-22",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Mateus",20221032020307,71150976812,"Mateus@gmail.com","(62) 992574438","2004-03-23",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Carlos",20221032020308,71150976912,"Carlos@gmail.com","(62) 992574439","2004-03-24",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("José",20221032020309,71150977012,"José@gmail.com","(62) 992574440","2004-03-25",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("João",20221032020310,71150976813,"João@gmail.com","(62) 992574441","2004-03-26",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Maria",20221032020311,71150976913,"Maria@gmail.com","(62) 992574442","2004-03-27",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Stheffany",20221032020312,71150977013,"Stheffany@gmail.com","(62) 992574443","2004-03-28",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Thyfani",20221032020313,71150976814,"Thyfani@gmail.com","(62) 992574444","2004-03-29",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Laessa",20221032020314,71150976914,"Laessa@gmail.com","(62) 992574445","2004-03-30",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Marcos",20221032020315,71150977014,"Marcos@gmail.com","(62) 992574446","2004-03-31",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("André",20221032020316,71150976815,"André@gmail.com","(62) 992574447","2004-04-01",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Rodrigo",20221032020317,71150976915,"Rodrigo@gmail.com","(62) 992574448","2004-04-02",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Roberto",20221032020318,71150977015,"Roberto@gmail.com","(62) 992574449","2004-04-03",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Ana Clara",20221032020319,71150976816,"Ana Clara@gmail.com","(62) 992574450","2004-04-04",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Isaura",20221032020320,71150976916,"Isaura@gmail.com","(62) 992574451","2004-04-05",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Ivone",20221032020321,71150977016,"Ivone@gmail.com","(62) 992574452","2004-04-06",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Tonya",20221032020322,71150976817,"Tonya@gmail.com","(62) 992574453","2004-04-07",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Jornada",20221032020323,71150976917,"Jornada@gmail.com","(62) 992574454","2004-04-08",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Ingrid",20221032020324,71150977017,"Ingrid@gmail.com","(62) 992574455","2004-04-09",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Leonardo",20221032020325,71150976818,"Leonardo@gmail.com","(62) 992574456","2004-04-10",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Ediosn",20221032020326,71150976918,"Ediosn@gmail.com","(62) 992574457","2004-04-11",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Vanessa",20221032020327,71150977018,"Vanessa@gmail.com","(62) 992574458","2004-04-12",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Leticia",20221032020328,71150976819,"Leticia@gmail.com","(62) 992574459","2004-04-13",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Valmir",20221032020329,71150976919,"Valmir@gmail.com","(62) 992574460","2004-04-14",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Gueisa",20221032020330,71150977019,"Gueisa@gmail.com","(62) 992574461","2004-04-15",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Karina",20221032020331,71150976820,"Karina@gmail.com","(62) 992574462","2004-04-16",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Henrique",20221032020332,71150976920,"Henrique@gmail.com","(62) 992574463","2004-04-17",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Fabio",20221032020333,71150977020,"Fabio@gmail.com","(62) 992574464","2004-04-18",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Daniella",20221032020334,71150976821,"Daniella@gmail.com","(62) 992574465","2004-04-19",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Fabrine",20221032020335,71150976921,"Fabrine@gmail.com","(62) 992574466","2004-04-20",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Pamella",20221032020336,71150977021,"Pamella@gmail.com","(62) 992574467","2004-04-21",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Lorena",20221032020337,71150976822,"Lorena@gmail.com","(62) 992574468","2004-04-22",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Britanny",20221032020338,71150976922,"Britanny@gmail.com","(62) 992574469","2004-04-23",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Gloria",20221032020339,71150977022,"Gloria@gmail.com","(62) 992574470","2004-04-24",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Verilda",20221032020340,71150976823,"Verilda@gmail.com","(62) 992574471","2004-04-25",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Uesley",20221032020341,71150976923,"Uesley@gmail.com","(62) 992574472","2004-04-26",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Bruna",20221032020342,71150977023,"Bruna@gmail.com","(62) 992574473","2004-04-27",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Karoline",20221032020343,71150976824,"Karoline@gmail.com","(62) 992574474","2004-04-28",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Hortencia",20221032020344,71150976924,"Hortencia@gmail.com","(62) 992574475","2004-04-29",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Vani",20221032020345,71150977024,"Vani@gmail.com","(62) 992574476","2004-04-30",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Aparecida",20221032020346,71150976825,"Aparecida@gmail.com","(62) 992574477","2004-05-01",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Nilva",20221032020347,71150976925,"Nilva@gmail.com","(62) 992574478","2004-05-02",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Paulo",20221032020348,71150977025,"Paulo@gmail.com","(62) 992574479","2004-05-03",2);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Thalia",20221032020349,71150976826,"Thalia@gmail.com","(62) 992574480","2004-05-04",1);
INSERT INTO adrianob_grupo09.Pessoa(nome,matricula,cpf,email,telefone,dt_nasc,sexo_id_sexo) values("Adrino",20221032020350,71150976926,"Adrino@gmail.com","(62) 992574481","2004-05-05",2);
/*USUARIO*/
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(1,1,2,66,5);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(2,2,2,55,78);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(3,4,2,77,21);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(4,5,1,55,78);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(6,6,2,33,18);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(7,1,2,44,33);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(8,6,2,22,13);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(11,4,1,33,18);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(14,3,1,77,21);
INSERT INTO Usuario(Pessoa_id_pessoas,curso_id_curso,Pessoa_sexo_id_sexo,Cargo_id_cargo,Cargo_Setor_id_setor)VALUES(17,5,2,22,13);
/*Registro*/
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),1,1,1,2,66,5);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),2,2,2,2,55,78);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),3,4,3,2,77,21);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),4,5,4,1,55,78);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),5,6,6,2,33,18);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),6,1,7,2,44,33);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),7,6,8,2,22,13);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),8,4,11,1,33,18);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),9,3,14,1,77,21);
INSERT INTO Registro(registro_entrada,Usuario_id_usuario,Usuario_curso_id_curso,Usuario_Pessoa_id_pessoas,Usuario_Pessoa_sexo_id_sexo,Usuario_Cargo_id_cargo,Usuario_Cargo_Setor_id_setor)VALUES(now(),10,5,17,2,22,13);
UPDATE Registro SET registro_saida=now() WHERE num_registro=1;
UPDATE Registro SET registro_saida=now() WHERE num_registro=2;
UPDATE Registro SET registro_saida=now() WHERE num_registro=3;
UPDATE Registro SET registro_saida=now() WHERE num_registro=4;
UPDATE Registro SET registro_saida=now() WHERE num_registro=5;
UPDATE Registro SET registro_saida=now() WHERE num_registro=6;
UPDATE Registro SET registro_saida=now() WHERE num_registro=7;
UPDATE Registro SET registro_saida=now() WHERE num_registro=8;
UPDATE Registro SET registro_saida=now() WHERE num_registro=9;
UPDATE Registro SET registro_saida=now() WHERE num_registro=10;
SELECT * FROM Pessoa ORDER BY(nome)ASC;
SELECT id_pessoa,nome,matricula,dt_nasc FROM Pessoa WHERE dt_nasc="2004-03-19";
DELETE  FROM Pessoa WHERE id_pessoa=3;