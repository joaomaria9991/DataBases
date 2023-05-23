/* Sistema de Gestão de Conferências */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaConferencias;
GO

CREATE TABLE AulaConferencias.Artigo(
		Titulo 									VARCHAR(50) 						NOT NULL,
		N_Registo 								INT 								PRIMARY key 				NOT NULL
)
GO

CREATE TABLE AulaConferencias.EscritoPor(
		Email 									VARCHAR(64) 		 					NOT NULL,
		N_Registo 								INT 								NOT NULL,
		
		UNIQUE (Email),
		UNIQUE (N_Registo),
		PRIMARY KEY (Email,N_Registo)
)
GO

CREATE TABLE AulaConferencias.Pessoa(
		Email 									VARCHAR(64) 							PRIMARY KEY 				NOT NULL,
		Nome 									VARCHAR(MAX) 						NOT NULL
)
GO

CREATE TABLE AulaConferencias.Autor(
		EmailAutor 								VARCHAR(64) 							PRIMARY KEY 				NOT NULL
)
GO


CREATE TABLE AulaConferencias.Participante(
		EmailParticipante 							VARCHAR(64) 						PRIMARY KEY 				NOT NULL,
		DataInscricao 								DATE 							NOT NULL,
		Morada 										VARCHAR(MAX),
)
GO

CREATE TABLE AulaConferencias.Pertencer(
		EmailAutor 									VARCHAR(64) 						NOT NULL,
		EmailEstudante 								VARCHAR(64) 						NOT NULL,
		EmailInstituicao 							VARCHAR(64) 						NOT NULL,

		UNIQUE (EmailEstudante),
		UNIQUE (EmailInstituicao),
		UNIQUE (EmailAutor),
		PRIMARY KEY (EmailAutor,EmailEstudante,EmailInstituicao)
)
GO

CREATE TABLE AulaConferencias.Estudante(
		EmailParticipante 							VARCHAR(64) 						PRIMARY KEY 				NOT NULL,
		EmailInstituicao 							VARCHAR(64) 					NOT NULL,
		E_Local 									VARCHAR(MAX)
)
GO

CREATE TABLE AulaConferencias.Instituicao(
		Email 										VARCHAR(64) 						PRIMARY KEY 				NOT NULL,
		Nome 										VARCHAR(MAX) 					NOT NULL,
		Morada 										VARCHAR(MAX)
)
GO

CREATE TABLE AulaConferencias.NaoEstudante(
		RefBancaria 								VARCHAR(MAX) 					NOT NULL,
		Email 										VARCHAR(64) 						PRIMARY KEY 				NOT NULL
)
GO



ALTER TABLE AulaConferencias.EscritoPor ADD
		FOREIGN KEY (N_Registo) REFERENCES  AulaConferencias.Artigo(N_Registo),
		FOREIGN KEY (Email) REFERENCES AulaConferencias.Autor(EmailAutor)
GO

ALTER TABLE AulaConferencias.Autor ADD
		FOREIGN KEY (EmailAutor) REFERENCES  AulaConferencias.Pessoa(Email)
GO

ALTER TABLE AulaConferencias.Participante ADD
		FOREIGN KEY (EmailParticipante) REFERENCES  AulaConferencias.Pessoa(Email)
GO

ALTER TABLE AulaConferencias.Pertencer ADD
		FOREIGN KEY (EmailAutor) REFERENCES  AulaConferencias.Autor(EmailAutor),
		FOREIGN KEY (EmailEstudante) REFERENCES  AulaConferencias.Estudante(EmailParticipante),
		FOREIGN KEY (EmailInstituicao) REFERENCES AulaConferencias.Instituicao(Email)
GO

ALTER TABLE AulaConferencias.Estudante ADD
		FOREIGN KEY (EmailParticipante) REFERENCES  AulaConferencias.Participante(EmailParticipante),
		FOREIGN KEY (EmailInstituicao) REFERENCES AulaConferencias.Instituicao(Email)
GO

ALTER TABLE AulaConferencias.NaoEstudante ADD
		FOREIGN KEY (Email) REFERENCES  AulaConferencias.Pessoa(Email)
GO

