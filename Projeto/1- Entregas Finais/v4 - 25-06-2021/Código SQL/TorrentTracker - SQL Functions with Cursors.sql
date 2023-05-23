/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Functions + Cursors

*/


USE p4g7;
GO



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