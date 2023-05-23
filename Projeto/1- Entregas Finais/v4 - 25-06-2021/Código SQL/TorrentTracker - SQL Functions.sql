/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Funtions

*/


USE p4g7;
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


CREATE FUNCTION TorrentTracker.UserRole_Function (@user_nick VARCHAR(256)) RETURNS VARCHAR(30)
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
			SET @output = 'UserNormal';

		RETURN @output;
	END
GO



CREATE FUNCTION TorrentTracker.UserRole_ID_Function (@id_user INT) RETURNS VARCHAR(30)
AS
	BEGIN
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
			SET @output = 'UserNormal';

		RETURN @output;
	END
GO