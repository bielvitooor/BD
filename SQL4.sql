USE adrianob_grupo09;
CREATE TABLE Sexo (
  id_sexo INT NOT NULL,
  descricao_sexo VARCHAR(12) NOT NULL,
  PRIMARY KEY (id_sexo)
  );
CREATE TABLE Pessoas (
  id_pessoas INT NOT NULL AUTO_INCREMENT UNIQUE,
  nome VARCHAR(50) NOT NULL,
  matricula BIGINT NOT NULL UNIQUE,
  cpf BIGINT(11) NOT NULL UNIQUE,
  email VARCHAR(80) NULL,
  telefone VARCHAR(15) NULL,
  sexo_id_sexo INT NOT NULL,
  PRIMARY KEY (id_pessoas, sexo_id_sexo),
  CONSTRAINT fk_Pessoas_sexo1
    FOREIGN KEY (sexo_id_sexo)
    REFERENCES sexo (id_sexo)
    );
CREATE TABLE Registros (
  num_registro INT UNSIGNED NOT NULL AUTO_INCREMENT,
  dat_registro DATE NOT NULL,
  reg_entrada DATETIME NOT NULL,
  reg_saida DATETIME NOT NULL,
  PRIMARY KEY (num_registro)
  );
  
CREATE TABLE Cargo (
  id_cargo INT UNIQUE NOT NULL,
  nome_cargo VARCHAR(40) NOT NULL,
  PRIMARY KEY (id_cargo)
  );
CREATE TABLE Setor (
  id_setor INT UNIQUE NOT NULL,
  descricao_sala VARCHAR(45) NOT NULL,
  Cargo_id_cargo INT NOT NULL,
  PRIMARY KEY (id_setor, Cargo_id_cargo),
  CONSTRAINT fk_Setor_Cargo1
    FOREIGN KEY (Cargo_id_cargo)
    REFERENCES Cargo(id_cargo)
    );
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
  PRIMARY KEY (id_curso, turno_id_turno),
  CONSTRAINT fk_curso_turno1
    FOREIGN KEY (turno_id_turno)
    REFERENCES turno (id_turno)
    );
CREATE TABLE Usuario(
  id_usuario INT NOT NULL,
  Pessoas_id_pessoas INT NOT NULL,
  Pessoas_sexo_id_sexo INT NOT NULL,
  curso_id_curso INT NOT NULL,
  Cargo_id_cargo INT NOT NULL,
  Registros_num_registro INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, Pessoas_id_pessoas, Pessoas_sexo_id_sexo, curso_id_curso, Cargo_id_cargo, Registros_num_registro),
  CONSTRAINT fk_Usuario_Pessoas1
    FOREIGN KEY (Pessoas_id_pessoas , Pessoas_sexo_id_sexo)
    REFERENCES Pessoas (id_pessoas , sexo_id_sexo),
  CONSTRAINT fk_Usuario_curso1
    FOREIGN KEY (curso_id_curso)
    REFERENCES curso (id_curso),
  CONSTRAINT fk_Usuario_Cargo1
    FOREIGN KEY (Cargo_id_cargo)
    REFERENCES Cargo (id_cargo),
  CONSTRAINT fk_Usuario_Registros1
    FOREIGN KEY (Registros_num_registro)
    REFERENCES Registros(num_registro)
    );

CREATE TABLE Pessoas_has_Usuario (
  Pessoas_id_pessoas INT NOT NULL,
  Usuario_id_usuario INT NOT NULL,
  PRIMARY KEY (Pessoas_id_pessoas, Usuario_id_usuario),
  CONSTRAINT fk_Pessoas_has_Usuario_Pessoas1
    FOREIGN KEY (Pessoas_id_pessoas)
    REFERENCES Pessoas (id_pessoas),
  CONSTRAINT fk_Pessoas_has_Usuario_Usuario1
    FOREIGN KEY (Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    );
CREATE TABLE IF NOT EXISTS Setor_has_Registros(
  Setor_id_setor INT UNSIGNED NOT NULL,
  Setor_Cargo_id_cargo INT NOT NULL,
  Registros_num_registro INT UNSIGNED NOT NULL,
  PRIMARY KEY (Setor_id_setor, Setor_Cargo_id_cargo, Registros_num_registro),
  CONSTRAINT fk_Setor_has_Registros_Setor1
    FOREIGN KEY (Setor_id_setor , Setor_Cargo_id_cargo)
    REFERENCES Setor (id_setor , Cargo_id_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Setor_has_Registros_Registros1
    FOREIGN KEY (Registros_num_registro)
    REFERENCES Registros (num_registro)
    );