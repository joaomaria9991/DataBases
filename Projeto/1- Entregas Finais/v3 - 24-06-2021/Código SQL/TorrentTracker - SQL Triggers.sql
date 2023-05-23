/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Triggers

*/



USE p4g7;
GO



-- Trigger para Impedir que um convite seja enviado para um email que já foi convidado.
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


-- Trigger para Impedir que um utilizador que não exista compre planos e/ou que seja compreado um plano que não exista
CREATE TRIGGER TorrentTracker.Trigger_Compra_Planos ON TorrentTracker.Compra AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id_plano INT;

		SELECT @id_plano = ID_Plano FROM inserted;

		PRINT 'ID PLANO = '+ @id_plano;

		IF (SELECT COUNT(*) FROM TorrentTracker.PlanosDoacaoSubscricoes WHERE ID = @id_plano) = 0
			BEGIN
				RAISERROR('ERRO -> Esse Plano não existe!', 18, 1);
				ROLLBACK TRAN;
			END
		
	END
GO



CREATE TRIGGER TorrentTracker.Trigger_UtilizadorVIP_Plano ON TorrentTracker.UtilizadorVIP AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id_user INT;

		SELECT @id_user = ID_User FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.Utilizador WHERE ID_User = @id_user) = 0) OR ((SELECT TorrentTracker.UserRole_ID_Function(@id_user))='Staff') 
			OR ((SELECT TorrentTracker.UserRole_ID_Function(@id_user))='Admin') 
			OR ((SELECT TorrentTracker.UserRole_ID_Function(@id_user))='Uploader')
			BEGIN
				RAISERROR('ERRO -> Esse utilizador não existe!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO



-- Trigger para Impedir que se registe um User com o mesmo email que já outro user tem.
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




CREATE TRIGGER TorrentTracker.Trigger_ContentTorrent_Adicionar ON TorrentTracker.ContentTorrent AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @nome_torrent VARCHAR(256);

		SELECT @nome_torrent = NomeContentTorrent FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO



CREATE TRIGGER TorrentTracker.Trigger_ContentTorrentGame_Adicionar ON TorrentTracker.ContentTorrentGame AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @nome_torrent VARCHAR(256);

		SELECT @nome_torrent = NomeGame FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrentGame WHERE NomeGame = @nome_torrent ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents, do tipo Game, com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO




CREATE TRIGGER TorrentTracker.Trigger_ContentTorrentProgram_Adicionar ON TorrentTracker.ContentTorrentProgram AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @nome_torrent VARCHAR(256);

		SELECT @nome_torrent = NomeProgram FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrentProgram WHERE NomeProgram = @nome_torrent ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents, do tipo Program, com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO



CREATE TRIGGER TorrentTracker.Trigger_CategoriasInfoAutoDownload_Adicionar ON TorrentTracker.CategoriasInfoAutoDownload AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id INT;

		SELECT @id = ID_ContentTorrent FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.CategoriasInfoAutoDownload WHERE ID_ContentTorrent = @id ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO





CREATE TRIGGER TorrentTracker.Trigger_ContentTorrentSeries_Adicionar ON TorrentTracker.ContentTorrentSeries AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id INT;

		SELECT @id = ID_ContentTorrent FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrentSeries WHERE ID_ContentTorrent = @id ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO




CREATE TRIGGER TorrentTracker.Trigger_ContentTorrentMovies_Adicionar ON TorrentTracker.ContentTorrentMovies AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @id INT;

		SELECT @id = ID_ContentTorrent FROM inserted;

		IF ((SELECT COUNT(*) FROM TorrentTracker.ContentTorrentMovies WHERE ID_ContentTorrent = @id ) > 1)
			BEGIN
				
				RAISERROR('ERRO -> Outros Torrents com esse nome já exitem!', 18, 1);
				ROLLBACK TRAN;
			END
	END
GO