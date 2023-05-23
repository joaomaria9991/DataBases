/* Sistema de Gestão de Rent-a-Car */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaRentCar;
GO

CREATE TABLE AulaRentCar.cliente(
		nome 					VARCHAR(50) 					NOT NULL,
		endereco 				VARCHAR(50),
		num_carta 				INT 							NOT NULL,
		nif 					DECIMAL(9,0) 					PRIMARY KEY 				NOT NULL 				CHECK(nif > 0)
)
GO

CREATE TABLE AulaRentCar.aluguer(
		numero 					INT 							PRIMARY KEY 				NOT NULL				IDENTITY(1,1),
		titular 				VARCHAR(MAX) 					NOT NULL,
		duracao 				INT,
		data_a 					DATE 							NOT NULL,
		local_a 				VARCHAR(MAX),
		objeto					VARCHAR(64),
		matricula_veiculo 		CHAR(8) 						NOT NULL,
		nif 					DECIMAL(9,0) 					NOT NULL,
		n_balcao 				INT 							NOT NULL,
)
GO

CREATE TABLE AulaRentCar.balcao(
		numero 					INT 							IDENTITY(1,1) 				PRIMARY KEY 			NOT NULL,
		nome 					VARCHAR(MAX),
		endereco 				VARCHAR(MAX) 					NOT NULL

)
GO

CREATE TABLE AulaRentCar.veiculo(
		matricula 				CHAR(8) 						PRIMARY KEY 				NOT NULL,
		tipo 					VARCHAR(50),
		ano 					INT 							CHECK(ano > 0),
		marca 					VARCHAR(50),
		codigo_veiculo 			INT 							NOT NULL
)
GO

CREATE TABLE AulaRentCar.tipo_de_veiculo(
		codigo 					INT 							PRIMARY KEY 				NOT NULL,
		ar_condicionado 		BIT 							NOT NULL,
		designacao 				VARCHAR(MAX),
)
GO

CREATE TABLE AulaRentCar.similaridade(
		codigo_a 				INT 							NOT NULL,
		codigo_b 				INT 							NOT NULL,
	
		UNIQUE (codigo_a),
		UNIQUE (codigo_b),
		PRIMARY KEY(codigo_a, codigo_b)	
)
GO

CREATE TABLE AulaRentCar.pesados(
		codigo_tipo_veiculo 	INT 							PRIMARY KEY 				NOT NULL,
		peso 					INT 							NOT NULL,
		passageiros 			INT,
)
GO

CREATE TABLE AulaRentCar.ligeiros(
		codigo_tipo_veiculo 	INT 							PRIMARY KEY 				NOT NULL,
		portas 					INT 							NOT NULL,
		combustivel 			VARCHAR(15)						CHECK( combustivel IN ('Gasolina','Diesel','Etanol','Eletrico','Hidrogénio','GPL')),
		num_lugares 			INT 							NOT NULL,

)
GO



ALTER TABLE AulaRentCar.aluguer ADD
	FOREIGN KEY (nif) REFERENCES AulaRentCar.cliente(nif),
	FOREIGN KEY (n_balcao) REFERENCES AulaRentCar.balcao(numero),
  	FOREIGN KEY (matricula_veiculo) REFERENCES AulaRentCar.veiculo(matricula)
 GO

ALTER TABLE AulaRentCar.veiculo ADD 
	FOREIGN KEY (codigo_veiculo) REFERENCES AulaRentCar.tipo_de_veiculo(codigo)
GO

ALTER TABLE AulaRentCar.similaridade ADD 
	FOREIGN KEY (codigo_a) REFERENCES  AulaRentCar.tipo_de_veiculo(codigo),
	FOREIGN KEY (codigo_b) REFERENCES  AulaRentCar.tipo_de_veiculo(codigo)
GO

ALTER TABLE AulaRentCar.ligeiros ADD
	FOREIGN KEY (codigo_tipo_veiculo) REFERENCES  AulaRentCar.tipo_de_veiculo(codigo)
GO

ALTER TABLE AulaRentCar.pesados ADD
	FOREIGN KEY (codigo_tipo_veiculo) REFERENCES  AulaRentCar.tipo_de_veiculo(codigo)
GO


