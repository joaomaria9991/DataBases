/* Sistema de Prescrição Eletrónica de Medicamentos */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaPrescricaoMedicamentos
GO

CREATE TABLE AulaPrescricaoMedicamentos.MedicoSNS(
		NIF 										DECIMAL(9,0)						NOT NULL,
		ID 											INT									NOT NULL,
		Especialidade								VARCHAR(15)							NOT NULL 					CHECK( Especialidade IN ('Otorrinolaringologia', 'Pediatria','Geral','Anestesiologia','Cardiologia')),
		
		UNIQUE (NIF),
		UNIQUE (ID),
		PRIMARY KEY (NIF,ID)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Pessoa(
		NIF 										DECIMAL(9,0)						NOT NULL					CHECK( NIF > 0 ),
		Nome 										VARCHAR(128),
		
		PRIMARY KEY (NIF)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Prescricao(
		ID 											INT									NOT NULL					IDENTITY(1,1),
		ID_Medico									INT									NOT NULL,
		NIF_Pessoa									DECIMAL(9,0)						NOT NULL,
		NIF_FarmaciaProcess							DECIMAL(9,0),
		DataProcess									DATE,
		DataPrescricao								DATE								NOT NULL,

		CHECK (DataProcess >= DataPrescricao),
		PRIMARY KEY (ID)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Paciente(
		NIF 										DECIMAL(9,0)						NOT NULL,
		ID_Utente									DECIMAL(9,0)						NOT NULL					CHECK( ID_Utente > 0 ),
		Endereco									VARCHAR(128),
		DataNascimento								DATE,
		
		UNIQUE (NIF),
		UNIQUE (ID_Utente),
		PRIMARY KEY (NIF,ID_Utente)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Farmacia(
		NIF 										DECIMAL(9,0)						NOT NULL					CHECK( NIF > 0 ),
		Endereco									VARCHAR(128),
		Nome										VARCHAR(128),
		Telefone									INT 								CHECK( Telefone BETWEEN 100000000 AND 999999999 ),

		PRIMARY KEY (NIF)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Vende(
		FormulaFarmaco 								VARCHAR(128)						NOT NULL,
		NIF_Farmacia 								DECIMAL(9,0) 						NOT NULL,
		NumRegistoFarmaceuticaFarmaco				INT 								NOT NULL,

		UNIQUE (FormulaFarmaco),
		UNIQUE (NIF_Farmacia), 
		UNIQUE (NumRegistoFarmaceuticaFarmaco),
		PRIMARY KEY (FormulaFarmaco, NIF_Farmacia, NumRegistoFarmaceuticaFarmaco)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.PrescricoesEnvolveFarmacos(
		ID_Prescicao 								INT									NOT NULL,
		FormulaFarmaco 								VARCHAR(128)						NOT NULL,
		NumRegistoFarmaceuticaFarmaco				INT 								NOT NULL,

		UNIQUE (ID_Prescicao),
		UNIQUE (FormulaFarmaco), 
		UNIQUE (NumRegistoFarmaceuticaFarmaco),
		PRIMARY KEY (ID_Prescicao, FormulaFarmaco, NumRegistoFarmaceuticaFarmaco)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Farmaco(
		Formula 	 								VARCHAR(128)						NOT NULL				UNIQUE,
		NomeComercial								VARCHAR(25),
		NumRegistoFarmaceutica 						INT 								NOT NULL				UNIQUE,

		PRIMARY KEY (Formula, NumRegistoFarmaceutica)
)
GO

CREATE TABLE AulaPrescricaoMedicamentos.Farmaceutica(
		Telefone 	 								INT									CHECK( Telefone BETWEEN 100000000 AND 999999999 ),
		NomeComercial								VARCHAR(40)							NOT NULL,
		NumRegistoNacional 							INT 								NOT NULL,
		Endereço									VARCHAR(128),

		PRIMARY KEY (NumRegistoNacional)
)
GO


-- Chaves estrangeiras:
ALTER TABLE AulaPrescricaoMedicamentos.MedicoSNS ADD
		CONSTRAINT FK_MedicoSNS_Pessoa_NIF_NIF FOREIGN KEY (NIF) REFERENCES AulaPrescricaoMedicamentos.Pessoa(NIF)
GO

ALTER TABLE AulaPrescricaoMedicamentos.Prescricao ADD
		CONSTRAINT FK_Prescicao_Pessoa_NIF_Pessoa_NIF FOREIGN KEY (NIF_Pessoa) REFERENCES AulaPrescricaoMedicamentos.Pessoa(NIF),
		CONSTRAINT FK_Prescicao_Farmacia_NIF_FarmaciaProcess_NIF FOREIGN KEY (NIF_FarmaciaProcess) REFERENCES AulaPrescricaoMedicamentos.Farmacia(NIF),
		CONSTRAINT FK_Prescicao_MedicoSNS_ID_Medico_ID FOREIGN KEY (ID_Medico) REFERENCES AulaPrescricaoMedicamentos.MedicoSNS(ID)
GO

ALTER TABLE AulaPrescricaoMedicamentos.Paciente ADD
		CONSTRAINT FK_Paciente_Pessoa_NIF_NIF FOREIGN KEY (NIF) REFERENCES AulaPrescricaoMedicamentos.Pessoa(NIF)
GO

ALTER TABLE AulaPrescricaoMedicamentos.Vende ADD
		CONSTRAINT FK_Vende_Farmaco_FormulaFarmaco_Formula FOREIGN KEY (FormulaFarmaco) REFERENCES AulaPrescricaoMedicamentos.Farmaco(Formula),
		CONSTRAINT FK_Vende_Farmaco_NumRegistoFarmaceuticaFarmaco_NumRegistoFarmaceutica FOREIGN KEY (NumRegistoFarmaceuticaFarmaco) REFERENCES AulaPrescricaoMedicamentos.Farmaco(NumRegistoFarmaceutica),
		CONSTRAINT FK_Vende_Farmacia_NIF_Farmacia_NIF FOREIGN KEY (NIF_Farmacia) REFERENCES AulaPrescricaoMedicamentos.Farmacia(NIF)
GO

ALTER TABLE AulaPrescricaoMedicamentos.PrescricoesEnvolveFarmacos ADD
		CONSTRAINT FK_PrescricoesEnvolveFarmacos_Prescricao_ID_Prescicao_ID FOREIGN KEY (ID_Prescicao) REFERENCES AulaPrescricaoMedicamentos.Prescricao(ID),
		CONSTRAINT FK_PrescricoesEnvolveFarmacos_Farmaco_FormulaFarmaco_Formula FOREIGN KEY (FormulaFarmaco) REFERENCES AulaPrescricaoMedicamentos.Farmaco(Formula),
		CONSTRAINT FK_PrescricoesEnvolveFarmacos_Farmaco_NumRegistoFarmaceuticaFarmaco_NumRegistoFarmaceutica FOREIGN KEY (NumRegistoFarmaceuticaFarmaco) REFERENCES AulaPrescricaoMedicamentos.Farmaco(NumRegistoFarmaceutica)
GO

ALTER TABLE AulaPrescricaoMedicamentos.Farmaco
		ADD CONSTRAINT FK_Farmaco_Farmaceutica_NumRegistoFarmaceutica_NumRegistoNacional FOREIGN KEY (NumRegistoFarmaceutica) REFERENCES AulaPrescricaoMedicamentos.Farmaceutica(NumRegistoNacional)
GO