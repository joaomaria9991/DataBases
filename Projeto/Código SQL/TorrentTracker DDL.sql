/*Sistema de Gestão de Gestão de um Torrent Tracker*/
--P4G7 Álvaro Freixo 93116, João Machado 89132

USE p4g7;
GO

-- Criacao Schema:
CREATE SCHEMA TorrentTracker
GO



-- Novo tipo de dados:

CREATE TYPE TorrentTracker.ID FROM INT NOT NULL;
GO

CREATE TYPE TorrentTracker.ID_NULL FROM INT;
GO

CREATE TYPE TorrentTracker.OS FROM VARCHAR(10) NOT NULL;
GO

CREATE TYPE TorrentTracker.LINK FROM VARCHAR(4000) NOT NULL;
GO

CREATE TYPE TorrentTracker.NOME FROM VARCHAR(256) NOT NULL;
GO


-- Criacao das tabelas:
CREATE TABLE TorrentTracker.TrackerComunidade(
	ID								TorrentTracker.ID			IDENTITY(1,1),
	LinkTracker						TorrentTracker.LINK,
	NomeTracker						TorrentTracker.NOME,
		
	PRIMARY KEY (ID)
)
GO

CREATE TABLE TorrentTracker.ContentTorrent(
	ID_ContentTorrent				TorrentTracker.ID 				IDENTITY(1,1),
	Tamanho							DECIMAL(38,3) 					NOT NULL, -- Em MegaBytes.
	DataHoraAdicao					SMALLDATETIME					NOT NULL,
	NFO								NVARCHAR(MAX),
	Descricao						NVARCHAR(MAX),
	NomeContentTorrent				TorrentTracker.NOME, 
	FreeleeechDataHoraLimite		SMALLDATETIME,					-- Se for NUL, então não é da categoria Freeleech.						
	ID_TrackerComunidade			TorrentTracker.ID,
	ID_UserUploader 				TorrentTracker.ID,

	PRIMARY KEY (ID_ContentTorrent)
)
GO

CREATE TABLE TorrentTracker.Comentario(
	ID_Writer 						TorrentTracker.ID,
	ID_Comentario					TorrentTracker.ID 				IDENTITY(1,1),
	ConteudoComentario				VARCHAR(MAX)					NOT NULL,
	DataHoraCriacao					SMALLDATETIME					NOT NULL,
	ID_UserResponse					TorrentTracker.ID_NULL,	
	ID_ContentTorrent 				TorrentTracker.ID,

	PRIMARY KEY (ID_Comentario)

)
GO

CREATE TABLE TorrentTracker.ContentTorrentGame(
	ID_ContentTorrent				TorrentTracker.ID,
	NomeGame						TorrentTracker.NOME,		
	Capa 							VARCHAR(MAX),
	OS								VARCHAR(10) NOT NULL 				CHECK(OS IN ('MacOS' , 'Windows' , 'Linux')),
		
	UNIQUE (NomeGame),
	UNIQUE (ID_ContentTorrent),
	PRIMARY KEY (ID_ContentTorrent, NomeGame)
)
GO

CREATE TABLE TorrentTracker.ContentTorrentProgram(
	ID_ContentTorrent				TorrentTracker.ID,
	NomeProgram						TorrentTracker.NOME,
	Capa   							VARCHAR(MAX),
	OS								VARCHAR(10) NOT NULL 				CHECK(OS IN ('MacOS' , 'Windows' , 'Linux')),
	
	UNIQUE (NomeProgram),
	UNIQUE (ID_ContentTorrent),
	PRIMARY KEY (ID_ContentTorrent, NomeProgram)

)
GO

CREATE TABLE TorrentTracker.CategoriasInfoAutoDownload(
	ID_ContentTorrent				TorrentTracker.ID,
	ID_TT_IMDB						TorrentTracker.ID,
	IMDB_Link						TorrentTracker.LINK,
	IMDB_Nome						TorrentTracker.NOME,
	IMDB_Ano						DECIMAL(4,0),
	IMDB_Classificacao				DECIMAL(3,1)					CHECK(IMDB_Classificacao BETWEEN 0.0 AND 10.0),
	IMDB_Sinopse					VARCHAR(MAX),

	UNIQUE (ID_ContentTorrent),
	UNIQUE (ID_TT_IMDB),
	PRIMARY KEY (ID_ContentTorrent, ID_TT_IMDB)

)
GO


CREATE TABLE TorrentTracker.ContentTorrentSeries(
	ID_ContentTorrent				TorrentTracker.ID,
	ID_TT_IMDB						TorrentTracker.ID,
	ReleaseType						VARCHAR(25)						CHECK(ReleaseType IN ('Cam' , 'Telesync' , 'Workprint','Telecine','Pay-Per-View','Screener','Direct Digital Content','R5','DVD-Rip','DVD-R','HDTV','WEB-DL','WEBRip','WEBCap','HD-Rip','Blu-ray')),				
	Temporada						INT,
	Episodio						INT,

	UNIQUE (ID_ContentTorrent),
	UNIQUE (ID_TT_IMDB),
	PRIMARY KEY (ID_ContentTorrent, ID_TT_IMDB)

)
GO

CREATE TABLE TorrentTracker.ContentTorrentMovies (
	ID_ContentTorrent				TorrentTracker.ID,
	ID_TT_IMDB						TorrentTracker.ID,
	ReleaseType						VARCHAR(25)						CHECK(ReleaseType IN ('Cam' , 'Telesync' , 'Workprint','Telecine','Pay-Per-View','Screener','Direct Digital Content','R5','DVD-Rip','DVD-R','HDTV','WEB-DL','WEBRip','WEBCap','HD-Rip','Blu-ray')),				

	UNIQUE (ID_ContentTorrent),
	UNIQUE (ID_TT_IMDB),
	PRIMARY KEY (ID_ContentTorrent, ID_TT_IMDB)
)
GO

CREATE TABLE TorrentTracker.TorrentAtivo(
	ID_UserTorrentAtivo 			TorrentTracker.ID,
	DadosEnviados 					DECIMAL(38,3), -- Em MegaBytes.
	DadosRecebidos 					DECIMAL(38,3), -- Em MegaBytes.
	TempoSeeding 					TIME,
	ID_TorrentAtivo 				TorrentTracker.ID 				IDENTITY(1,1),
	ID_ContentTorrent 				TorrentTracker.ID,

	PRIMARY KEY (ID_TorrentAtivo)
)
GO

CREATE TABLE TorrentTracker.Utilizador(
	ID_User 						TorrentTracker.ID 				IDENTITY(1,1),
	UserPassword 					VARCHAR(500)					NOT NULL,
	UserEMail						VARCHAR(500)					NOT NULL,
	UserDataRegisto					SMALLDATETIME					NOT NULL,
	UserNickName					VARCHAR(256) 					NOT NULL,
	UserIP							VARCHAR(20),
	UserTorrentProgram				VARCHAR(256),
	UserPermissaoDownload			BINARY(1)						NOT NULL,
	ID_TrackerComunidade			TorrentTracker.ID,

	PRIMARY KEY (ID_User)
)
GO

CREATE TABLE TorrentTracker.Convite(
	ID_RemetenteConvite 			TorrentTracker.ID,
	ID_Convite 						TorrentTracker.ID 				IDENTITY(1,1),
	DestinatarioEMail				VARCHAR(500),
	DataEnvio						DATE 							NOT NULL,
	ID_AdminRemetente				TorrentTracker.ID,
	ID_AdministrativoRemetente		TorrentTracker.ID,

	PRIMARY KEY (ID_Convite)
)
GO

CREATE TABLE TorrentTracker.PremioAtribuicao(
	ID_DestinatarioPremio 			TorrentTracker.ID,
	ID_Premio 						TorrentTracker.ID ,
	DataAtribuicao 					DATE,		
	ID_RemetentePremio				TorrentTracker.ID,
	ID_Atribuicao					TorrentTracker.ID 				IDENTITY(1,1),

	PRIMARY KEY (ID_Atribuicao)
)
GO

CREATE TABLE TorrentTracker.Premio(
	ID_Premio 						TorrentTracker.ID 				IDENTITY(1,1),
	Designacao						VARCHAR(MAX),
	Nome 							TorrentTracker.NOME,

	PRIMARY KEY (ID_Premio)
)
GO

CREATE TABLE TorrentTracker.Aviso(
	ID_DestinatarioAviso			TorrentTracker.ID,
	ID 								TorrentTracker.ID 				IDENTITY(1,1),
	
	PRIMARY KEY (ID)
)
GO

CREATE TABLE TorrentTracker.AvisoPermanente(
	ID_Aviso 						TorrentTracker.ID,
	
	PRIMARY KEY (ID_Aviso)
)
GO

CREATE TABLE TorrentTracker.AvisoTemporario(
	DataHoraLimite 					SMALLDATETIME					NOT NULL, 		
	ID_Aviso 						TorrentTracker.ID,
	
	PRIMARY KEY (ID_Aviso)
)
GO

CREATE TABLE TorrentTracker.AvisoHitAndRun(
	ID_Aviso 						TorrentTracker.ID,
	
	PRIMARY KEY (ID_Aviso),
)
GO

CREATE TABLE TorrentTracker.NukedTorrent(
	ID_Aviso 						TorrentTracker.ID,
	
	PRIMARY KEY (ID_Aviso),
)
GO

CREATE TABLE TorrentTracker.UtilizadorVip(
	ID_User 						TorrentTracker.ID,
	ImunidadeHitRun					BINARY(1)						NOT NULL,
	FreeleechTotal					BINARY(1)						NOT NULL,		
	EMailPagamento					VARCHAR(500),
	DataHoraPagamento				SMALLDATETIME,

	PRIMARY KEY (ID_User)
)
GO

CREATE TABLE TorrentTracker.Compra(
	ID_Comprador					TorrentTracker.ID,
	ID_Plano						TorrentTracker.ID,
	DataHoraCompra 					SMALLDATETIME					NOT NULL,
	DataHoraTermino					SMALLDATETIME,
	ID_Compra 						TorrentTracker.ID 				IDENTITY(1,1),

	PRIMARY KEY (ID_Compra)
)
GO


CREATE TABLE TorrentTracker.PlanosDoacaoSubscricoes(
	ID 								TorrentTracker.ID 				IDENTITY(1,1),
	LimiteTempoPlano				INT								NOT NULL,		-- Dias
	DescricaoPlano					VARCHAR(MAX)					NOT NULL,
	PrecoPlano						MONEY 							NOT NULL,    	-- EUROS.
	Nome 							TorrentTracker.NOME,
	GB_Upload						INT,

	PRIMARY KEY	(ID)
)
GO

CREATE TABLE TorrentTracker.Uploader(
	ID_User 						TorrentTracker.ID,
	ImunidadeHitRun					BINARY(1)						NOT NULL,
	FreeleechTotal					BINARY(1)						NOT NULL,
	Grupo							VARCHAR(256), 

	PRIMARY KEY (ID_User)
)
GO


CREATE TABLE TorrentTracker.UserAdministrativo(
	ID_User 						TorrentTracker.ID,
	ImunidadeHitRun					BINARY(1)						NOT NULL,
	FreeleechTotal					BINARY(1)						NOT NULL,
	ID_Administrativo				TorrentTracker.ID 				IDENTITY(1,1), 

	UNIQUE (ID_User),
	UNIQUE (ID_Administrativo),
	PRIMARY KEY (ID_User, ID_Administrativo)
)
GO

CREATE TABLE TorrentTracker.Staff (
	ID_User 						TorrentTracker.ID,
	ID_Administrativo   			TorrentTracker.ID,

	UNIQUE (ID_User),
	UNIQUE (ID_Administrativo),
	PRIMARY KEY (ID_User, ID_Administrativo)
)
GO


CREATE TABLE TorrentTracker.Admin (
	ID_User 						TorrentTracker.ID,
	ID_Administrativo   			TorrentTracker.ID,


	UNIQUE (ID_User),
	UNIQUE (ID_Administrativo),
	PRIMARY KEY (ID_User, ID_Administrativo)
)
GO


-- Chaves estrangeiras:

ALTER TABLE TorrentTracker.Comentario ADD
	CONSTRAINT FK_Comentario_ContentTorrent_ID_ContentTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.ContentTorrent(ID_ContentTorrent)
GO

ALTER TABLE TorrentTracker.ContentTorrent ADD
	CONSTRAINT FK_ContentTorrent_TrackerComunidade_ID_TrackerComunidade_ID FOREIGN KEY (ID_TrackerComunidade) REFERENCES TorrentTracker.TrackerComunidade(ID),
	CONSTRAINT FK_ContentTorrent_Uploader_ID_UserUploader_ID_User FOREIGN KEY (ID_UserUploader) REFERENCES TorrentTracker.Uploader(ID_User) 
GO

ALTER TABLE TorrentTracker.ContentTorrentGame ADD
	CONSTRAINT FK_ContentTorrentGame_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.ContentTorrent(ID_ContentTorrent) 
GO

ALTER TABLE TorrentTracker.ContentTorrentProgram ADD
	CONSTRAINT FK_ContentTorrentProgram_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.ContentTorrent(ID_ContentTorrent) 
GO

ALTER TABLE TorrentTracker.CategoriasInfoAutoDownload ADD
	CONSTRAINT FK_CategoriasInfoAutoDownload_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.ContentTorrent(ID_ContentTorrent) 
GO

ALTER TABLE TorrentTracker.ContentTorrentSeries ADD
	CONSTRAINT FK_ContentTorrentSeries_CategoriasInfoAutoDownload_ID_ContentTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.CategoriasInfoAutoDownload(ID_ContentTorrent),
	CONSTRAINT FK_ContentTorrentSeries_CategoriasInfoAutoDownload_ID_TT_IMDB_ID_TT_IMDB FOREIGN KEY (ID_TT_IMDB) REFERENCES TorrentTracker.CategoriasInfoAutoDownload(ID_TT_IMDB)
GO

ALTER TABLE TorrentTracker.ContentTorrentMovies ADD
	CONSTRAINT FK_ContentTorrentMovies_CategoriasInfoAutoDownload_ID_ContentTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.CategoriasInfoAutoDownload(ID_ContentTorrent),
	CONSTRAINT FK_ContentTorrentMovies_CategoriasInfoAutoDownload_ID_TT_IMDB_ID_TT_IMDB FOREIGN KEY (ID_TT_IMDB) REFERENCES TorrentTracker.CategoriasInfoAutoDownload(ID_TT_IMDB)
GO

ALTER TABLE TorrentTracker.Utilizador ADD
	CONSTRAINT FK_Utilizador_TrackerComunidade_ID_TrackerComunidade_ID FOREIGN KEY (ID_TrackerComunidade) REFERENCES TorrentTracker.TrackerComunidade(ID)
GO


ALTER TABLE TorrentTracker.TorrentAtivo ADD
	CONSTRAINT FK_TorrentAtivo_Utilizador_ID_TorrentAtivo_ID_User FOREIGN KEY (ID_TorrentAtivo) REFERENCES TorrentTracker.Utilizador(ID_User),
	CONSTRAINT FK_TorrentAtivo_ContentTorrent_ID_ContentTorrent_ID_ContentTorrent FOREIGN KEY (ID_ContentTorrent) REFERENCES TorrentTracker.ContentTorrent(ID_ContentTorrent)
GO

ALTER TABLE TorrentTracker.Convite ADD 
	CONSTRAINT FK_Convite_Utilizador_ID_RemetenteConvite_ID_User FOREIGN KEY (ID_RemetenteConvite) REFERENCES TorrentTracker.Utilizador(ID_User),
	CONSTRAINT FK_Convite_Admin_ID_AdminRemetente_ID_User FOREIGN KEY (ID_AdminRemetente) REFERENCES TorrentTracker.Admin(ID_User),
	CONSTRAINT FK_ConviteD_Admin_ID_AdministrativoRemetente_ID_Administrativo FOREIGN KEY (ID_AdministrativoRemetente) REFERENCES TorrentTracker.Admin(ID_Administrativo)
GO	

ALTER TABLE TorrentTracker.PremioAtribuicao ADD
	CONSTRAINT FK_PremioAtribuicao_Utilizador_ID_DestinatarioPremio_ID_User FOREIGN KEY (ID_DestinatarioPremio) REFERENCES TorrentTracker.Utilizador(ID_User),
	CONSTRAINT FK_PremioAtribuicao_UserAdministrativo_ID_RemetentePremio_ID_User FOREIGN KEY (ID_RemetentePremio) REFERENCES TorrentTracker.UserAdministrativo(ID_Administrativo),
	CONSTRAINT FK_PremioAtribuicao_Premio_ID_Premio_ID_Premio FOREIGN KEY (ID_Premio) REFERENCES TorrentTracker.Premio(ID_Premio)
GO

ALTER TABLE TorrentTracker.Aviso ADD
	CONSTRAINT FK_Aviso_Utilizador_ID_DestinatarioAviso_ID_User FOREIGN KEY (ID_DestinatarioAviso) REFERENCES TorrentTracker.Utilizador(ID_User)
GO	

ALTER TABLE TorrentTracker.AvisoPermanente ADD
	CONSTRAINT FK_AvisoPermanente_Aviso_ID_Aviso_ID FOREIGN KEY (ID_Aviso)	REFERENCES TorrentTracker.Aviso(ID)
GO

ALTER TABLE TorrentTracker.AvisoTemporario ADD
	CONSTRAINT FK_AvisoTemporario_Aviso_ID_Aviso_ID FOREIGN KEY (ID_Aviso)	REFERENCES TorrentTracker.Aviso(ID)
GO

ALTER TABLE TorrentTracker.AvisoHitAndRun ADD
	CONSTRAINT FK_AvisoHitAndRun_Aviso_ID_Aviso_ID FOREIGN KEY (ID_Aviso)	REFERENCES TorrentTracker.Aviso(ID)
GO

ALTER TABLE TorrentTracker.NukedTorrent ADD
	CONSTRAINT FK_AvisoNukedTorrent_Aviso_ID_Aviso_ID FOREIGN KEY (ID_Aviso)	REFERENCES TorrentTracker.Aviso(ID)
GO

ALTER TABLE TorrentTracker.UtilizadorVip ADD
	CONSTRAINT FK_UtilizadoVIP_Utilizador_ID_User_ID_User FOREIGN KEY (ID_User) REFERENCES TorrentTracker.Utilizador(ID_User)
GO

ALTER TABLE TorrentTracker.Compra ADD
	CONSTRAINT FK_Compra_UtilizadorVIP_ID_Comprador_ID_User FOREIGN KEY (ID_Comprador) REFERENCES TorrentTracker.UtilizadorVIP(ID_User),
	CONSTRAINT FK_Compra_PlanosDoacaoSubscricoes_ID_Plano_ID FOREIGN KEY (ID_Plano) REFERENCES TorrentTracker.PlanosDoacaoSubscricoes(ID)
GO

ALTER TABLE TorrentTracker.Uploader ADD
	CONSTRAINT FK_Uploader_Utilizador_ID_User_ID_User FOREIGN KEY (ID_User) REFERENCES TorrentTracker.Utilizador(ID_User)
GO

ALTER TABLE TorrentTracker.UserAdministrativo ADD
	CONSTRAINT FK_UserAdministrativo_Utilizador_ID_User_ID_User FOREIGN KEY (ID_User) REFERENCES TorrentTracker.Utilizador(ID_User)
GO


ALTER TABLE TorrentTracker.Staff ADD
	CONSTRAINT FK_Staff_UserAdministrativo_ID_User_ID_User FOREIGN KEY (ID_User) REFERENCES TorrentTracker.UserAdministrativo(ID_User),
	CONSTRAINT FK_Staff_UserAdministrativo_ID_Adminstrativo_ID_Administrativo FOREIGN KEY (ID_Administrativo) REFERENCES TorrentTracker.UserAdministrativo(ID_Administrativo)
GO

ALTER TABLE TorrentTracker.Admin ADD
	CONSTRAINT FK_Admin_UserAdministrativo_ID_User_ID_User FOREIGN KEY (ID_User) REFERENCES TorrentTracker.UserAdministrativo(ID_User),
	CONSTRAINT FK_Admin_UserAdministrativo_ID_Adminstrativo_ID_Administrativo FOREIGN KEY (ID_Administrativo) REFERENCES TorrentTracker.UserAdministrativo(ID_Administrativo)
GO
