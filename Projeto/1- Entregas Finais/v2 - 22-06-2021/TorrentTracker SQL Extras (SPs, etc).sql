
USE p4g7;
GO


-- Login Page
CREATE PROCEDURE TorrentTracker.LoginProcedure @utilizador VARCHAR(256), @password VARCHAR(MAX)  
  AS
  BEGIN  
  	SELECT * FROM TorrentTracker.Utilizador 
  	WHERE UserPassword=@password and UserNickName=@utilizador
  END
 GO

 -- All Torrents Page

CREATE FUNCTION TorrentTracker.User_AllDataDown_Function (@id_user INT) RETURNS INT
AS
	BEGIN
		DECLARE @output INT;

		IF EXISTS (SELECT ID_UserTorrentAtivo FROM TorrentTracker.TorrentAtivo WHERE ID_UserTorrentAtivo = @id_user)
		BEGIN
			DECLARE @datadown DECIMAL(38,3), @all DECIMAL(38,3);
			SET @all = 0;
			
			DECLARE C CURSOR FAST_FORWARD
			FOR SELECT DadosRecebidos
				FROM TorrentTracker.TorrentAtivo
				WHERE ID_UserTorrentAtivo = @id_user;

			OPEN C;
			FETCH C INTO @datadown;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @all = @all + @datadown
				FETCH C INTO @datadown;
			END;
			CLOSE C;
			DEALLOCATE C;

			SET @all = CAST(ROUND(@all,1) as varchar);
			
			SET @output = @all;

		END
		ELSE
			SET @output = 0;

		RETURN @output;
	END
GO


 ALTER PROCEDURE TorrentTracker.User_AllDataDown @id_user INT
 AS
	BEGIN
		SELECT 'Return value' = (SELECT TorrentTracker.User_AllDataDown_Function (@id_user));
	END
GO


CREATE FUNCTION TorrentTracker.User_AllDataUpload_Function (@id_user INT) RETURNS INT
AS
	BEGIN
		DECLARE @output INT;

		IF EXISTS (SELECT ID_UserTorrentAtivo FROM TorrentTracker.TorrentAtivo WHERE ID_UserTorrentAtivo = @id_user)
		BEGIN
			DECLARE @dataup DECIMAL(38,3), @all DECIMAL(38,3);
			SET @all = 0;
			
			DECLARE C CURSOR FAST_FORWARD
			FOR SELECT DadosEnviados
				FROM TorrentTracker.TorrentAtivo
				WHERE ID_UserTorrentAtivo = @id_user;

			OPEN C;
			FETCH C INTO @dataup;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @all = @all + @dataup
				FETCH C INTO @dataup;
			END;
			CLOSE C;
			DEALLOCATE C;

			SET @all = CAST(ROUND(@all,1) as varchar);
			
			SET @output = @all;
		END
		ELSE
			SET @output = 0;

		RETURN @output;
	END
GO



Alter PROCEDURE TorrentTracker.User_AllDataUpload @id_user INT
 AS
	BEGIN
		SELECT 'Return value' = (SELECT TorrentTracker.User_AllDataUpload_Function (@id_user));
	END
GO


ALTER PROCEDURE TorrentTracker.Torrent_Seeders @id_torrent INT
 AS
	BEGIN
	IF EXISTS (SELECT ID_TorrentAtivo FROM TorrentTracker.TorrentAtivo WHERE TorrentAtivo.ID_ContentTorrent = @id_torrent)
		BEGIN
			
			DECLARE @cont INT, @user INT;
			SET @cont = 0;
			
			DECLARE C CURSOR FAST_FORWARD
			FOR SELECT ID_UserTorrentAtivo
				FROM (TorrentTracker.TorrentAtivo JOIN TorrentTracker.ContentTorrent 
												 ON ContentTorrent.ID_ContentTorrent=TorrentAtivo.ID_ContentTorrent)
				WHERE TorrentAtivo.ID_ContentTorrent = @id_torrent AND DadosRecebidos >= Tamanho;

			OPEN C;
			FETCH C INTO @user;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @cont = @cont + 1;
				FETCH C INTO @user;
			END;
			CLOSE C;
			DEALLOCATE C;

			SET @cont = CAST(ROUND(@cont,1) as varchar);
			
			SELECT 'Return Value' = @cont;

			RETURN
		END
		ELSE
			SELECT 'Return Value' = '0';
END
GO


ALTER PROCEDURE TorrentTracker.Torrent_leechers @id_torrent INT
 AS
	BEGIN
	IF EXISTS (SELECT ID_TorrentAtivo FROM TorrentTracker.TorrentAtivo WHERE TorrentAtivo.ID_ContentTorrent = @id_torrent)
		BEGIN
			
			DECLARE @cont INT, @user INT;
			SET @cont = 0;
			
			DECLARE C CURSOR FAST_FORWARD
			FOR SELECT ID_UserTorrentAtivo
				FROM (TorrentTracker.TorrentAtivo JOIN TorrentTracker.ContentTorrent 
												 ON ContentTorrent.ID_ContentTorrent=TorrentAtivo.ID_ContentTorrent)
				WHERE TorrentAtivo.ID_ContentTorrent = @id_torrent AND DadosRecebidos < Tamanho;

			OPEN C;
			FETCH C INTO @user;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @cont = @cont + 1;
				FETCH C INTO @user;
			END;
			CLOSE C;
			DEALLOCATE C;

			SET @cont = CAST(ROUND(@cont,1) as varchar);
			
			SELECT 'Return Value' = @cont;
		END
		ELSE
			SELECT 'Return Value' = '0';
END
GO

CREATE FUNCTION TorrentTracker.User_NicknameToID (@user_nick VARCHAR(256)) RETURNS INT
AS
	BEGIN
		DECLARE @id_user INT;

		SET @id_user = (SELECT ID_User
						FROM TorrentTracker.Utilizador
						WHERE UserNickName = @user_nick);
		
		RETURN @id_user;
	END
GO

CREATE FUNCTION TorrentTracker.User_PlanoNomeToID (@plano_nome VARCHAR(256)) RETURNS INT
AS
	BEGIN
		DECLARE @plano_id INT;

		SET @plano_id = (SELECT ID
						FROM TorrentTracker.PlanosDoacaoSubscricoes
						WHERE Nome = @plano_nome);
		
		RETURN @plano_id;
	END
GO

ALTER PROCEDURE TorrentTracker.User_Premios @user_nick VARCHAR(256)
 AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
		SELECT count(ID_Premio)
		FROM TorrentTracker.PremioAtribuicao 
		WHERE ID_DestinatarioPremio = @id_user;
	END
GO

CREATE FUNCTION TorrentTracker.User_N_ConvitesUsados (@user_nick VARCHAR(256)) RETURNS INT
AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));

		DECLARE @n_convites_usados INT = (SELECT count(ID_Convite)
									FROM TorrentTracker.Convite 
									WHERE ID_RemetenteConvite = @id_user AND DestinatarioEmail IS NOT NULL);
		
		RETURN @n_convites_usados;
	END
GO


CREATE FUNCTION TorrentTracker.User_CovitesNumDisponivel_Function (@user_nick VARCHAR(256)) RETURNS INT
AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
		DECLARE @output INT;
		DECLARE @n_convites INT = (SELECT count(ID_Convite)
									FROM TorrentTracker.Convite 
									WHERE ID_RemetenteConvite = @id_user);
		DECLARE @n_convites_usados INT = (SELECT TorrentTracker.User_N_ConvitesUsados (@user_nick));
		
		DECLARE @total INT =  @n_convites - @n_convites_usados;

		IF @total < 0
			SET @output = 0;
		ELSE
			SET @output = @total;

		RETURN @output;
	END
GO


ALTER PROCEDURE TorrentTracker.User_CovitesNumDisponivel @user_nick VARCHAR(256)
 AS
	BEGIN
		SELECT 'Return Value' = (SELECT TorrentTracker.User_CovitesNumDisponivel_Function(@user_nick));
	END
GO



-- Premios de recebidos de um User
ALTER PROCEDURE TorrentTracker.PremiosSpecificUser @user_nick VARCHAR(256)
 AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
		DECLARE @id_atribuicao INT;
		DECLARE @id_remetente INT;

		IF NOT EXISTS (SELECT * FROM TorrentTracker.##TempPremios)
			DELETE FROM TorrentTracker.##TempPremios; 


		DECLARE C CURSOR FAST_FORWARD
			FOR SELECT ID_Atribuicao, ID_RemetentePremio
				FROM TorrentTracker.PremioAtribuicao 
				WHERE ID_DestinatarioPremio = @id_user;

		OPEN C;
		FETCH C INTO @id_atribuicao, @id_remetente;

		WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT INTO ##TempPremios ([ID],[Nome],[Design],[Dataa],[NomeE]) SELECT PA.ID_Atribuicao, Nome, Designacao, DataAtribuicao, NULL
				FROM (TorrentTracker.Premio AS P JOIN (TorrentTracker.PremioAtribuicao AS PA JOIN (TorrentTracker.Utilizador AS U JOIN TorrentTracker.UserAdministrativo AS UA 
																				  ON U.ID_User = UA.ID_User)
											ON PA.ID_RemetentePremio=UA.ID_Administrativo)
								   ON P.ID_Premio=PA.ID_Premio)
				WHERE PA.ID_Atribuicao = @id_atribuicao;

				UPDATE ##TempPremios
				SET NomeE = (SELECT UserNickname
							FROM TorrentTracker.Utilizador
							WHERE ID_user=@id_remetente)
				WHERE ID = @id_atribuicao;

				FETCH C INTO @id_atribuicao, @id_remetente;
			END;
		CLOSE C;
		DEALLOCATE C;

		SELECT Nome,Design,Dataa,NomeE FROM ##TempPremios;
	END
GO


ALTER PROCEDURE TorrentTracker.UserRole @user_nick VARCHAR(256)
 AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
		DECLARE @output VARCHAR(30);

		IF EXISTS (SELECT ID_USER FROM TorrentTracker.UtilizadorVIP WHERE ID_USER = @id_user)
			SET @output = 'UserVip';
		ELSE IF EXISTS (SELECT ID_USER FROM TorrentTracker.Uploader WHERE ID_USER = @id_user)
				SET @output = 'Uploader';
		ELSE IF EXISTS (SELECT ID_USER FROM TorrentTracker.Staff WHERE ID_USER = @id_user)
				SET @output = 'Staff';
		ELSE IF EXISTS (SELECT ID_USER FROM TorrentTracker.Admin WHERE ID_USER = @id_user)
				SET @output = 'Admin';
		ELSE
			SET @output = 'UserNormal'

		SELECT 'Return Value' = @output;
	END
GO


CREATE PROCEDURE TorrentTracker.ConvitesEnviados @user_nick VARCHAR(256)
 AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
		
		SELECT DestinatarioEmail, DataEnvio
		FROM TorrentTracker.Convite
		WHERE ID_RemetenteConvite = @id_user AND DestinatarioEmail IS NOT NULL;
	END
GO


CREATE VIEW TorrentTracker.PLANOS_SUBSCRICAO_DISPONIVEIS AS
	SELECT Nome, DescricaoPlano, PrecoPlano
	FROM TorrentTracker.PlanosDoacaoSubscricoes
GO

CREATE PROCEDURE TorrentTracker.PlanosView 
AS
	BEGIN
		SELECT *
		FROM TorrentTracker.PLANOS_SUBSCRICAO_DISPONIVEIS
	END
GO

-- Trigger para Impedir que um convite seja enviado para um email que já foi convidado.
DROP TRIGGER TorrentTracker.Trigger_Convite_Email;
GO

CREATE TRIGGER TorrentTracker.Trigger_Convite_Email ON TorrentTracker.Convite AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @email_adicionado VARCHAR(500);

		SELECT @email_adicionado = DestinatarioEMail FROM inserted;

		PRINT '@email_adicionado = ' + @email_adicionado;

		IF (SELECT COUNT(*) FROM TorrentTracker.Convite WHERE DestinatarioEMail = @email_adicionado) > 1
			BEGIN
				RAISERROR('O convite não pode ser enviado para esse email, porque esse email já recebeu um.', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO




ALTER PROCEDURE TorrentTracker.EnviarConvite @user_nick VARCHAR(256), @email_envio VARCHAR(256)
AS BEGIN
		DECLARE @output INT = (SELECT TorrentTracker.User_CovitesNumDisponivel_Function(@user_nick));
		DECLARE @id_convite INT;

		IF @output = 0
			SELECT 'return Value' = 'ERRO -> Não Convites disponiveis!';
		ELSE
			BEGIN TRY
				DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));	
			
				SET @id_convite = (SELECT ID_Convite 
									FROM TorrentTracker.Convite 
									WHERE (ID_RemetenteConvite = @id_user AND DestinatarioEMail IS NULL)) ;

				UPDATE TorrentTracker.Convite
				SET  DestinatarioEMail = @email_envio, DataEnvio = GETDATE()
				WHERE ID_Convite = @id_convite;
		
				SELECT 'return Value' = 'Convite enviado com Sucesso'
				
			END TRY
			BEGIN CATCH
				SELECT 'return Value' = 'ERRO -> Esse email já foi convidado!'
			END CATCH
	END
GO



CREATE PROCEDURE TorrentTracker.HsitoricoCompras_User @user_nick VARCHAR(256)
AS
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));

		SELECT Nome, DataHoraCompra,  DataHoraTermino, DATEDIFF(DAY, GETDATE(), DataHoraTermino) AS 'Dias Restantes'
		FROM TorrentTracker.Compra AS C JOIN TorrentTracker.PlanosDoacaoSubscricoes AS PS ON C.ID_Plano=PS.ID
		WHERE ID_Comprador = @id_user;
	END
GO


-- Trigger para Impedir que um utilizador que não exista compre planos e/ou que seja compreado um plano que não exista
DROP TRIGGER TorrentTracker.Trigger_Compra_Planos;
GO

CREATE TRIGGER TorrentTracker.Trigger_Compra_Planos ON TorrentTracker.Compra AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id_plano INT, @id_user INT;

		SELECT @id_user = ID_Comprador FROM inserted;
		SELECT @id_plano = ID_Plano FROM inserted;

		IF NOT EXISTS (SELECT * FROM TorrentTracker.Utilizador WHERE ID_User = @id_user)
			BEGIN
				RAISERROR('ERRO -> Esse utilizador não existe!', 18, 1);
				ROLLBACK TRAN;
			END
		ElSE IF NOT EXISTS (SELECT * FROM TorrentTracker.PlanosDoacaoSubscricoes WHERE ID = @id_plano)
			BEGIN
				RAISERROR('ERRO -> Esse Plano não existe!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO

DROP TRIGGER TorrentTracker.Trigger_UtilizadorVIP_Plano;
GO

CREATE TRIGGER TorrentTracker.Trigger_UtilizadorVIP_Plano ON TorrentTracker.UtilizadorVIP AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id_user INT;

		SELECT @id_user = ID_User FROM inserted;

		IF NOT EXISTS (SELECT * FROM TorrentTracker.Utilizador WHERE ID_User = @id_user)
			BEGIN
				RAISERROR('ERRO -> Esse utilizador não existe!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO

-- Transação!!!
ALTER PROCEDURE TorrentTracker.ComprarPlano @user_nick VARCHAR(256), @plano_nome VARCHAR(256), @email_pagamento VARCHAR(500)
AS BEGIN
		BEGIN TRY
				DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
				DECLARE @plano_id INT = (SELECT TorrentTracker.User_PlanoNomeToID(@plano_nome));
				DECLARE @dias INT = (SELECT LimiteTempoPlano FROM TorrentTracker.PlanosDoacaoSubscricoes);
				DECLARE @data_atual SMALLDATETIME = CAST(GETDATE() AS smalldatetime);

				DECLARE @lastseed_Compra INT = (SELECT COUNT(*) FROM TorrentTracker.Compra);
				DBCC CHECKIDENT('TorrentTracker.Compra', RESEED, @lastseed_Compra);

				BEGIN TRANSACTION
					INSERT INTO TorrentTracker.Compra ([ID_Comprador],[ID_plano],[DataHoraCompra],[DataHoraTermino]) VALUES (@id_user, @plano_id, @data_atual, DATEADD(DAY, @dias, @data_atual));
					
					INSERT INTO TorrentTracker.UtilizadorVip([ID_User],[ImunidadeHitRun],[FreeleechTotal],[EMailPagamento],[DataHoraPagamento]) VALUES (@id_user, 1 ,1, @email_pagamento, @data_atual);
				COMMIT TRAN
		
				SELECT 'return Value' = 'COmpra realizada com Sucesso!'
				
			END TRY
			BEGIN CATCH
				SELECT 'return Value' = 'ERRO -> O utilizador e/ou o plano não existem!'
			END CATCH
	END
GO

--DELETE FROM TorrentTracker.Utilizador WHERE ID_User = 101;

--UPDATE TorrentTracker.Convite
--SET  DestinatarioEMail = NULL
--WHERE ID_Convite = 2;




ALTER PROCEDURE TorrentTracker.Make_Temp_Tables
AS	
	BEGIN
		CREATE TABLE TorrentTracker.##TempAvisos(
			Nome  VARCHAR(30) PRIMARY KEY,
			Dataa	SMALLDATETIME
		);
		
		CREATE TABLE TorrentTracker.##TempPremios(
			ID INT PRIMARY KEY,
			Nome	VARCHAR(256),
			Design	VARCHAR(MAX),
			Dataa	SMALLDATETIME,
			NomeE	VARCHAR(256)
		);

		

	END
GO



ALTER PROCEDURE TorrentTracker.Historico_Avisos_User @user_nick VARCHAR(256)
AS	
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick)), @id_aviso INT;

		IF EXISTS (SELECT * FROM  TorrentTracker.##TempAvisos) 
			DELETE FROM TorrentTracker.##TempAvisos;
			

		DECLARE C CURSOR FAST_FORWARD
			FOR SELECT ID
				FROM TorrentTracker.Aviso
				WHERE ID_DestinatarioAviso = @id_user

		OPEN C;
		FETCH C INTO @id_aviso;

		WHILE @@FETCH_STATUS = 0
			BEGIN
				
				IF EXISTS (SELECT ID FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoPermanente ON ID=ID_Aviso WHERE ID = @id_aviso)
					INSERT INTO ##TempAvisos ([Nome],[Dataa]) SELECT 'Aviso Permanente', NULL FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoPermanente ON ID=ID_Aviso WHERE ID_DestinatarioAviso = @id_user;
				ELSE IF EXISTS (SELECT ID FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoTemporario ON ID=ID_Aviso WHERE  ID = @id_aviso)
					INSERT INTO ##TempAvisos ([Nome],[Dataa]) SELECT 'Aviso Temporario', DataHoraLimite FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoTemporario ON ID=ID_Aviso WHERE ID_DestinatarioAviso = @id_user;
				ELSE IF EXISTS (SELECT ID FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoHitAndRun ON ID=ID_Aviso WHERE  ID = @id_aviso)
					INSERT INTO ##TempAvisos ([Nome],[Dataa]) SELECT 'Aviso HitAndRun', NULL FROM TorrentTracker.Aviso JOIN TorrentTracker.AvisoHitAndRun ON ID=ID_Aviso WHERE ID_DestinatarioAviso = @id_user;
				ELSE IF EXISTS (SELECT ID FROM TorrentTracker.Aviso JOIN TorrentTracker.NukedTorrent ON ID=ID_Aviso WHERE  ID = @id_aviso)
					INSERT INTO ##TempAvisos ([Nome],[Dataa]) SELECT 'Avsio NukedTorrent', NULL FROM TorrentTracker.Aviso JOIN TorrentTracker.NukedTorrent ON ID=ID_Aviso WHERE ID_DestinatarioAviso = @id_user;

				FETCH C INTO @id_aviso;
			END
		CLOSE C;
		DEALLOCATE C;

		SELECT * FROM TorrentTracker.##TempAvisos;
	END
GO




ALTER PROCEDURE TorrentTracker.Historico_Uploads @user_nick VARCHAR(256)
AS	
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick)), @id_aviso INT;

		SELECT NomeContentTorrent, Tamanho, DataHoraAdicao, Grupo 
		FROM (TorrentTracker.ContentTorrent JOIN TorrentTracker.Uploader ON ID_UserUploader=ID_User) 
		WHERE ID_UserUploader = @id_user;
	END
GO

ALTER PROCEDURE TorrentTracker.Historico_Downloads @user_nick VARCHAR(256)
AS	
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick)), @id_aviso INT;

		SELECT NomeContentTorrent, Tamanho, DataHoraAdicao, Grupo 
		FROM (((TorrentTracker.Utilizador AS U JOIN TorrentTracker.TorrentAtivo AS TA ON TA.ID_UserTorrentAtivo=U.ID_User) JOIN TorrentTracker.ContentTorrent AS CT ON TA.ID_ContentTorrent = CT.ID_ContentTorrent) JOIN TorrentTracker.Uploader AS U2 ON CT.ID_UserUploader=U2.ID_User)
		WHERE ID_UserTorrentAtivo = @id_user;
	END
GO

ALTER PROCEDURE TorrentTracker.Racio_User @user_nick VARCHAR(256)
AS	
	BEGIN
		DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick)), @id_aviso INT;
		DECLARE @down INT, @up INT;

		SET @down = (SELECT TorrentTracker.User_AllDataDown_Function (@id_user));
		SET @up = (SELECT TorrentTracker.User_AllDataUpload_Function (@id_user));


		IF @down = 0
			SELECT 'return value' = 0;
		ELSE
			SELECT 'return value' = (@up / @down);
	END
GO


ALTER FUNCTION TorrentTracker.Torrents_Categoria_Function (@id_torrent INT) RETURNS VARCHAR(20)
AS
	BEGIN
		
		DECLARE @output VARCHAR(20);
		
		IF EXISTS (SELECT CT.ID_ContentTorrent 
					FROM (TorrentTracker.ContentTorrent AS CT JOIN TorrentTracker.ContentTorrentGame AS CTG ON CT.ID_ContentTorrent=CTG.ID_ContentTorrent)
					WHERE CT.ID_ContentTorrent = @id_torrent)
			SET @output = 'Game';
		ELSE IF EXISTS (SELECT CT.ID_ContentTorrent  
					FROM (TorrentTracker.ContentTorrent AS CT JOIN TorrentTracker.ContentTorrentProgram AS CTG ON CT.ID_ContentTorrent=CTG.ID_ContentTorrent)
					WHERE CT.ID_ContentTorrent = @id_torrent)
			SET @output = 'Program';
		ELSE IF EXISTS (SELECT CT.ID_ContentTorrent  
					FROM ((TorrentTracker.ContentTorrent AS CT JOIN TorrentTracker.CategoriasInfoAutoDownload AS CIAD 
															ON CT.ID_ContentTorrent=CIAD.ID_ContentTorrent) JOIN TorrentTracker.ContentTorrentSeries AS CTS ON CTS.ID_ContentTorrent=CIAD.ID_ContentTorrent)
					WHERE CT.ID_ContentTorrent = @id_torrent)
			SET @output = 'Serie';
		ELSE IF EXISTS (SELECT CT.ID_ContentTorrent  
					FROM ((TorrentTracker.ContentTorrent AS CT JOIN TorrentTracker.CategoriasInfoAutoDownload AS CIAD 
															ON CT.ID_ContentTorrent=CIAD.ID_ContentTorrent) JOIN TorrentTracker.ContentTorrentMovies AS CTM ON CTM.ID_ContentTorrent=CIAD.ID_ContentTorrent)
					WHERE CT.ID_ContentTorrent = @id_torrent)
			SET @output = 'Movie';

		RETURN @output;
	END
GO


ALTER PROCEDURE TorrentTracker.CategoriaTorrent @id_torrent INT
AS	
	BEGIN
		DECLARE @output VARCHAR(20) = (SELECT TorrentTracker.Torrents_Categoria_Function (@id_torrent));

		SELECT 'Return value' = @output
		
	END
GO

CREATE VIEW TorrentTracker.HistoricoComprasGeral_View AS
	SELECT U.UserNickname, P.Nome, P.PrecoPlano, C.DataHoraCompra, C.DataHoraTermino
	FROM (((TorrentTracker.Compra AS C JOIN TorrentTracker.UtilizadorVIP AS UV ON C.ID_Comprador=UV.ID_User) JOIN TorrentTracker.Utilizador AS U ON U.ID_User=UV.ID_User) JOIN TorrentTracker.PlanosDoacaoSubscricoes AS P ON C.ID_Plano=P.ID);
GO


ALTER PROCEDURE TorrentTracker.HistoricoCompras_Geral @ordenacao INT
AS
	BEGIN
		IF @ordenacao = 1
			BEGIN
				SELECT UserNickname, SUM(PrecoPlano) AS Sumatorio_Preco
				FROM TorrentTracker.HistoricoComprasGeral_View
				GROUP BY UserNickname
				ORDER BY 2 DESC;
			END
		ELSE
			BEGIN
				SELECT *
				FROM TorrentTracker.HistoricoComprasGeral_View;
			END
	END
GO

ALTER PROCEDURE TorrentTracker.Compras_ValorTotal_Geral
AS
	BEGIN
		DECLARE @ganho_total INT, @valor INT, @cont INT;
		SET @cont = 0;
		SET @ganho_total = 0;

		DECLARE C CURSOR FAST_FORWARD
			FOR SELECT  PrecoPlano
				FROM TorrentTracker.HistoricoComprasGeral_View;

		OPEN C;
		FETCH C INTO @valor;

		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @ganho_total = @ganho_total + @valor;
				SET @cont = @cont + 1;
				FETCH C INTO @valor;
			END;
		CLOSE C;
		DEALLOCATE C;

		SELECT 'Ganho Total (Euros)' = @ganho_total, 'Número Compras' = @cont;
	END
GO

--TorrentTracker.Compras_ValorTotal_Geral

ALTER PROCEDURE TorrentTracker.Historico_Utilizadores_Geral
AS
	BEGIN
		SELECT UserNickname, UserEMail, UserDataRegisto,UserIP, UserTorrentProgram, UserPermissaoDownload
		FROM TorrentTracker.Utilizador;
	END
GO


ALTER PROCEDURE TorrentTracker.IMDB @id_torrent INT
AS
	BEGIN
		DECLARE @output VARCHAR(20) = (SELECT TorrentTracker.Torrents_Categoria_Function (@id_torrent));

		IF @output = 'Movie'
			SELECT M.ID_TT_IMDB, IMDB_Nome, IMDB_Ano, IMDB_Classificacao, IMDB_Sinopse, ReleaseType, Temporada = NULL, Episodio = NULL
			FROM (TorrentTracker.CategoriasInfoAutoDownload AS CIAD JOIN TorrentTracker.ContentTorrentMovies AS M ON M.ID_TT_IMDB=CIAD.ID_TT_IMDB);

		ELSE IF @output = 'Serie'
			SELECT CTS.ID_TT_IMDB, IMDB_Nome, IMDB_Ano, IMDB_Classificacao, IMDB_Sinopse, ReleaseType, Temporada, Episodio
			FROM (TorrentTracker.CategoriasInfoAutoDownload AS CIAD JOIN TorrentTracker.ContentTorrentSeries AS CTS ON CIAD.ID_TT_IMDB=CTS.ID_TT_IMDB);
	END
GO


CREATE PROCEDURE TorrentTracker.Info_Programs_Game @id_torrent INT
AS
	BEGIN
		DECLARE @output VARCHAR(20) = (SELECT TorrentTracker.Torrents_Categoria_Function (@id_torrent));

		IF @output = 'Program'
			SELECT NomeProgram, OS
			FROM TorrentTracker.ContentTorrentProgram;

		ELSE IF @output = 'Game'
			SELECT NomeGame, OS
			FROM TorrentTracker.ContentTorrentGame;
	END
GO

--ALTER PROCEDURE TorrentTracker.Registar_User @user_pass VARCHAR(500), @user_mail VARCHAR(500), @user_nick VARCHAR(256), @user_ip VARCHAR(20), @user_program VARCHAR(256), @id_convite INT
--AS
--	BEGIN
--		IF (EXISTS (SELECT ID_Convite FROM TorrentTracker.Convite WHERE DestinatarioEMail=@user_mail) AND NOT EXISTS (SELECT ID_User FROM TorrentTracker.Utilizador WHERE UserEMail = @user_mail))
--			BEGIN
--				INSERT INTO TorrentTracker.Utilizador([UserPassword],[UserEMail],[UserDataRegisto],[UserNickName],[UserIP],[UserTorrentProgram],[UserPermissaoDownload],[ID_TrackerComunidade]) 
--						VALUES (@user_pass, @user_mail, CAST(GETDATE() AS smalldatetime), @user_nick,  @user_ip, @user_program, 1, 1)
			
--			SELECT 'return value' = 'Registado com Sucesso!'
--			END
--		ELSE
--			SELECT 
--	END
--GO


-- Trigger para Impedir que se registe um User com o mesmo email que já outro user tem.
DROP TRIGGER TorrentTracker.Trigger_Utilizador_Email;
GO

CREATE TRIGGER TorrentTracker.Trigger_Utilizador_Email ON TorrentTracker.Utilizador AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @email_adicionado VARCHAR(500);

		SELECT @email_adicionado = UserEMail FROM inserted;

		IF (SELECT COUNT(*) FROM TorrentTracker.Utilizador WHERE UserEMail = @email_adicionado) > 1
			BEGIN
				RAISERROR('ERRO -> Outros utilizadores já tem esse email', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO


ALTER PROCEDURE TorrentTracker.Registar_User @user_pass VARCHAR(500), @user_mail VARCHAR(500), @user_nick VARCHAR(256), @user_ip VARCHAR(20), @user_program VARCHAR(256), @id_convite INT
AS BEGIN
			BEGIN TRY
				DECLARE @lastseed INT = (SELECT COUNT(*) FROM TorrentTracker.Utilizador);
				DBCC CHECKIDENT('TorrentTracker.Utilizador', RESEED, @lastseed );
				
				INSERT INTO TorrentTracker.Utilizador([UserPassword],[UserEMail],[UserDataRegisto],[UserNickName],[UserIP],[UserTorrentProgram],[UserPermissaoDownload],[ID_TrackerComunidade]) 
						VALUES (HASHBYTES('SHA2_256', @user_pass) , @user_mail, CAST(GETDATE() AS smalldatetime), @user_nick, @user_ip, @user_program, 1, 1)
			
				SELECT 'return value' = 'Registo com Sucesso!'
				
			END TRY
			BEGIN CATCH
				SELECT 'return value' = 'ERRO. Registo do Utilizador falhou!'
			END CATCH
	END
GO



DROP TRIGGER TorrentTracker.Trigger_ContentTorrent_Adicionar;
GO

CREATE TRIGGER TorrentTracker.Trigger_ContentTorrent_Adicionar ON TorrentTracker.ContentTorrent AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @nome_torrent VARCHAR(256);

		SELECT @nome_torrent = NomeContentTorrent FROM inserted;

		PRINT 'ADEUSSSS' + @nome_torrent;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO

-- Transação!!!
ALTER PROCEDURE TorrentTracker.Adicionar_Novo_Torrent @tamanho INT, @nome_torrent VARCHAR(256), @user_nick VARCHAR(256), 
@nome_game_program_serie_movie VARCHAR(256), @os VARCHAR(10), @imdb_link VARCHAR(4000),
@imdb_ano VARCHAR(5), @imdb_classificacao VARCHAR(20), @imdb_sinopse VARCHAR(MAX), @release VARCHAR(25), @temporada VARCHAR(20), @episodio VARCHAR(20), @categoria VARCHAR(20)
AS BEGIN
		BEGIN TRY
				DECLARE @lastseed INT = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrent);
				DBCC CHECKIDENT('TorrentTracker.ContentTorrent', RESEED, @lastseed );

				SET @imdb_classificacao = NULL;

				DECLARE @id_uploader INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));

				

				INSERT INTO TorrentTracker.ContentTorrent ([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) 
								VALUES (@tamanho, CAST(GETDATE() AS smalldatetime), NULL, NULL, @nome_torrent, NULL, 1, @id_uploader);

				
				
				DECLARE @id_torrent INT = (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent);


				IF @categoria = 'Game'
					BEGIN
						PRINT 'YEAHHHHH';
						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrentGame);
						DBCC CHECKIDENT('TorrentTracker.ContentTorrentGame', RESEED, @lastseed );

						INSERT INTO TorrentTracker.ContentTorrentGame([ID_ContentTorrent],[NomeGame],[Capa],[OS]) 
								VALUES ( @id_torrent, @nome_game_program_serie_movie, NULL, @os);
					END
				ELSE IF @categoria = 'Program'
					BEGIN
						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrentProgram);
						DBCC CHECKIDENT('TorrentTracker.ContentTorrentProgram', RESEED, @lastseed );

						INSERT INTO TorrentTracker.ContentTorrentProgram([ID_ContentTorrent],[NomeProgram],[Capa],[OS]) 
								VALUES ( @id_torrent, @nome_game_program_serie_movie, NULL, @os);

					END
				ELSE IF @categoria = 'Serie'
					BEGIN
						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.CategoriasInfoAutoDownload);
						DBCC CHECKIDENT('TorrentTracker.CategoriasInfoAutoDownload', RESEED, @lastseed );

						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrentSeries);
						DBCC CHECKIDENT('TorrentTracker.TorrentTracker.ContentTorrentSeries', RESEED, @lastseed );

						BEGIN TRANSACTION
						INSERT INTO TorrentTracker.CategoriasInfoAutoDownload ([ID_ContentTorrent], [ID_TT_IMDB], [IMDB_Link], [IMDB_Nome], [IMDB_Ano], [IMDB_Classificacao], [IMDB_Sinopse])
								VALUES ( @id_torrent, 000000, @imdb_link, @nome_game_program_serie_movie, CAST(@imdb_ano AS DECIMAL(4,0)), CAST(@imdb_classificacao AS DECIMAL(3,1)), @imdb_sinopse);

						INSERT INTO TorrentTracker.ContentTorrentSeries ([ID_ContentTorrent], [ID_TT_IMDB], [ReleaseType], [Temporada], [Episodio])
								VALUES ( @id_torrent, 000000, @release, CAST(@temporada AS INT), CAST(@episodio AS INT));

						COMMIT TRAN
					END
				ELSE IF @categoria = 'Movie'
					BEGIN
						
						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.CategoriasInfoAutoDownload);
						DBCC CHECKIDENT('TorrentTracker.CategoriasInfoAutoDownload', RESEED, @lastseed );

						SET @lastseed = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrentMovies);
						DBCC CHECKIDENT('TorrentTracker.ContentTorrentMovies', RESEED, @lastseed );

					BEGIN TRANSACTION
						INSERT INTO TorrentTracker.CategoriasInfoAutoDownload ([ID_ContentTorrent], [ID_TT_IMDB], [IMDB_Link], [IMDB_Nome], [IMDB_Ano], [IMDB_Classificacao], [IMDB_Sinopse])
								VALUES ( @id_torrent, 000000, @imdb_link, @nome_game_program_serie_movie, CAST(@imdb_ano AS DECIMAL(4,0)), CAST(@imdb_classificacao AS DECIMAL(3,1)), @imdb_sinopse);

						INSERT INTO TorrentTracker.ContentTorrentMovies ([ID_ContentTorrent], [ID_TT_IMDB], [ReleaseType])
								VALUES ( @id_torrent, 000000, @release);

					COMMIT TRAN
					END
		
				SELECT 'return Value' = 'Adicionado com Sucesso!'
				
			END TRY
			BEGIN CATCH
				SELECT 'return Value' = 'ERRO -> O nome desse Torrent já existe!'
			END CATCH
	END
GO

