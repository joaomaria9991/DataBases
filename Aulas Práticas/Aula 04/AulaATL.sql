/* Sistema de Gestão de um ATL */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaATL
GO

CREATE TABLE AulaATL.Escolaridade(
		Classe 										VARCHAR(10)							NOT NULL					CHECK( Classe IN ('1º Ciclo','2º Ciclo')),
		
		PRIMARY KEY (Classe)
)
GO

CREATE TABLE AulaATL.Turma(
		ClasseEscolaridade 							VARCHAR(10)							NOT NULL,
		Designacao									VARCHAR(128),
		AnoLetivo									INT									CHECK( AnoLetivo IN (1,2,3,4,5,6,7)),
		NumMaxAlunos								INT									CHECK ( NumMaxAlunos > 0 ),
		ID											INT									NOT NULL					IDENTITY(1,1),

		PRIMARY KEY (ID)
)
GO

CREATE TABLE AulaATL.Lecionada(
		NumFuncionarioProfessor						INT									NOT NULL,
		NumCCProfessor								DECIMAL(9,0)						NOT NULL,
		ID_Turma									INT									NOT NULL,

		UNIQUE (NumFuncionarioProfessor),
		UNIQUE (NumCCProfessor),
		UNIQUE (ID_Turma),
		PRIMARY KEY (ID_Turma,NumFuncionarioProfessor,NumCCProfessor)
)
GO

CREATE TABLE AulaATL.Disponibilidade(
		ID_Atividade								INT									NOT NULL,
		ID_Turma									INT									NOT NULL,

		UNIQUE (ID_Atividade),
		UNIQUE (ID_Turma),
		PRIMARY KEY (ID_Turma,ID_Atividade)
)
GO

CREATE TABLE AulaATL.Atividade(
		ID											INT									NOT NULL					IDENTITY(1,1),
		Designacao									VARCHAR(128),
		Custo										INT									NOT NULL					CHECK ( Custo >= 0 ),

		PRIMARY KEY (ID)
)
GO

CREATE TABLE AulaATL.Frequenta(
		ID_Atividade								INT									NOT NULL,
		NumCCALuno									DECIMAL(9,0)						NOT NULL,

		UNIQUE (ID_Atividade),
		UNIQUE (NumCCALuno),
		PRIMARY KEY (ID_Atividade,NumCCALuno)
)
GO

CREATE TABLE AulaATL.Constituida(
		ID_Turma									INT									NOT NULL,
		NumCCALuno									DECIMAL(9,0)						NOT NULL,

		UNIQUE (ID_Turma),
		UNIQUE (NumCCALuno),
		PRIMARY KEY (ID_Turma,NumCCALuno)
)
GO

CREATE TABLE AulaATL.Pessoa(
		NumCC 										DECIMAL(9,0)						NOT NULL					CHECK( NumCC > 0 ),
		Nome										VARCHAR(100)						NOT NULL,
		Morada										VARCHAR(128),
		DataNascimento								DATE,

		PRIMARY KEY (NumCC)
)
GO

CREATE TABLE AulaATL.Aluno(
		NumCC 										DECIMAL(9,0)						NOT NULL,
		ClasseEscolaridade							VARCHAR(10)							NOT NULL,
		NumCCEncarregadoEducacao					DECIMAL(9,0)						NOT NULL,

		PRIMARY KEY (NumCC)
)
GO

CREATE TABLE AulaATL.Professor(
		NumCC 										DECIMAL(9,0)						NOT NULL,
		NumFuncionario								INT									NOT NULL,
		Email										VARCHAR(40),
		Telefone									INT									CHECK( Telefone BETWEEN 100000000 AND 999999999 ),

		UNIQUE (NumCC),
		UNIQUE (NumFuncionario),
		PRIMARY KEY (NumCC,NumFuncionario)
)
GO

CREATE TABLE AulaATL.PessoaComAutorizacao(
		NumCC 										DECIMAL(9,0)						NOT NULL,
		RelacaoComAluno								VARCHAR(25)							NOT NULL					CHECK( RelacaoComAluno IN ('Tio','Tia','Amigo de Familiar','Irmão','Irmã','Pai','Mãe','Avô','Avó')),
		Email										VARCHAR(40),
		Telefone									INT									CHECK( Telefone BETWEEN 100000000 AND 999999999 ),

		UNIQUE (NumCC),
		UNIQUE (Telefone),
		PRIMARY KEY (NumCC,Telefone)
)
GO

CREATE TABLE AulaATL.EncarregadoDeEducacao(
		NumCC 										DECIMAL(9,0)						NOT NULL,
		Telefone									INT 		 						NOT NULL,

		UNIQUE (NumCC),
		UNIQUE (Telefone),
		PRIMARY KEY (NumCC,Telefone)
)
GO

CREATE TABLE AulaATL.Boleia(
		NumCCAluno 									DECIMAL(9,0)						NOT NULL,
		TelefonePessoaComAutorizacao				INT									NOT NULL,
		NumCCPessoaComAutorizacao 					DECIMAL(9,0)						NOT NULL,

		UNIQUE (NumCCAluno),
		UNIQUE (TelefonePessoaComAutorizacao),
		UNIQUE (NumCCPessoaComAutorizacao),
		PRIMARY KEY (NumCCAluno,TelefonePessoaComAutorizacao,NumCCPessoaComAutorizacao)
)
GO



-- Chaves estrangeiras:
ALTER TABLE AulaATL.Turma ADD
		CONSTRAINT FK_Turma_Escolaridade_ClasseEscolaridade_Classe FOREIGN KEY (ClasseEscolaridade) REFERENCES AulaATL.Escolaridade(Classe)
GO

ALTER TABLE AulaATL.Lecionada ADD
		CONSTRAINT FK_Lecionada_Turma_ID_Turma_ID FOREIGN KEY (ID_Turma) REFERENCES AulaATL.Turma(ID),
		CONSTRAINT FK_Lecionada_Professor_NumCCProfessor_NumCC FOREIGN KEY (NumCCProfessor) REFERENCES AulaATL.Professor(NumCC),
		CONSTRAINT FK_Lecionada_Professor_NumFuncionarioProfessor_NumFuncionario FOREIGN KEY (NumFuncionarioProfessor) REFERENCES AulaATL.Professor(NumFuncionario)
GO

ALTER TABLE AulaATL.Disponibilidade ADD
		CONSTRAINT FK_Disponibilidade_Turma_ID_Turma_ID FOREIGN KEY (ID_Turma) REFERENCES AulaATL.Turma(ID),
		CONSTRAINT FK_Disponibilidade_Atividade_ID_Atividade_ID FOREIGN KEY (ID_Atividade) REFERENCES AulaATL.Atividade(ID)
GO

ALTER TABLE AulaATL.Frequenta ADD
		CONSTRAINT FK_Frequenta_Atividade_ID_Atividade_ID FOREIGN KEY (ID_Atividade) REFERENCES AulaATL.Atividade(ID),
		CONSTRAINT FK_Frequenta_Aluno_NumCCALuno_NumCC FOREIGN KEY (NumCCALuno) REFERENCES AulaATL.Aluno(NumCC)
GO

ALTER TABLE AulaATL.Constituida ADD
		CONSTRAINT FK_Constituida_Turma_ID_Turma_ID FOREIGN KEY (ID_Turma) REFERENCES AulaATL.Turma(ID),
		CONSTRAINT FK_Constituida_Aluno_NumCCALuno_NumCC FOREIGN KEY (NumCCALuno) REFERENCES AulaATL.Aluno(NumCC)
GO

ALTER TABLE AulaATL.Aluno ADD
		CONSTRAINT FK_Aluno_Escolaridade_ClasseEscolaridade_Classe FOREIGN KEY (ClasseEscolaridade) REFERENCES AulaATL.Escolaridade(Classe),
		CONSTRAINT FK_Aluno_EncarregadoEducacao_NumCCEncarregadoEducacao_NumCC FOREIGN KEY (NumCCEncarregadoEducacao) REFERENCES AulaATL.EncarregadoDeEducacao(NumCC),
		CONSTRAINT FK_Aluno_Pessoa_NumCC_NumCC FOREIGN KEY (NumCC) REFERENCES AulaATL.Pessoa(NumCC)
GO

ALTER TABLE AulaATL.Professor ADD
		CONSTRAINT FK_Professor_Pessoa_NumCC_NumCC FOREIGN KEY (NumCC) REFERENCES AulaATL.Pessoa(NumCC)
GO

ALTER TABLE AulaATL.PessoaComAutorizacao ADD
		CONSTRAINT FK_PessoaComAutorizacao_Pessoa_NumCC_NumCC FOREIGN KEY (NumCC) REFERENCES AulaATL.Pessoa(NumCC)
GO

ALTER TABLE AulaATL.EncarregadoDeEducacao ADD
		CONSTRAINT FK_EncarregadoDeEducacao_Pessoa_NumCC_NumCC FOREIGN KEY (NumCC) REFERENCES AulaATL.Pessoa(NumCC),
		CONSTRAINT FK_EncarregadoDeEducacao_PessoaComAutorizacao_Telefone_Telefone FOREIGN KEY (Telefone) REFERENCES AulaATL.PessoaComAutorizacao(Telefone)
GO

ALTER TABLE AulaATL.Boleia ADD
		CONSTRAINT FK_Boleia_Aluno_NumCCAluno_NumCC FOREIGN KEY (NumCCAluno) REFERENCES AulaATL.Aluno(NumCC),
		CONSTRAINT FK_Boleia_PessoaComAutorizacao_TelefonePessoaComAutorizacao_Telefone FOREIGN KEY (TelefonePessoaComAutorizacao) REFERENCES AulaATL.PessoaComAutorizacao(Telefone),
		CONSTRAINT FK_Boleia_PessoaComAutorizacao_NumCCPessoaComAutorizacao_NumCC FOREIGN KEY (NumCCPessoaComAutorizacao) REFERENCES AulaATL.PessoaComAutorizacao(NumCC)
GO
