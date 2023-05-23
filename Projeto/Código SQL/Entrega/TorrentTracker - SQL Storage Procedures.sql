/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Storage Procedures

*/


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



 ALTER PROCEDURE TorrentTracker.User_AllDataDown @id_user INT
 AS
	BEGIN
		SELECT 'Return value' = (SELECT TorrentTracker.User_AllDataDown_Function (@id_user));
	END
GO


Alter PROCEDURE TorrentTracker.User_AllDataUpload @id_user INT
 AS
	BEGIN
		SELECT 'Return value' = (SELECT TorrentTracker.User_AllDataUpload_Function (@id_user));
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


ALTER PROCEDURE TorrentTracker.User_CovitesNumDisponivel @user_nick VARCHAR(256)
 AS
	BEGIN
		SELECT 'Return Value' = (SELECT TorrentTracker.User_CovitesNumDisponivel_Function(@user_nick));
	END
GO


ALTER PROCEDURE TorrentTracker.UserRole @user_nick VARCHAR(256)
 AS
	BEGIN
		DECLARE @output VARCHAR(30) = (SELECT TorrentTracker.UserRole_Function (@user_nick));

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



CREATE PROCEDURE TorrentTracker.PlanosView 
AS
	BEGIN
		SELECT *
		FROM TorrentTracker.PLANOS_SUBSCRICAO_DISPONIVEIS
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