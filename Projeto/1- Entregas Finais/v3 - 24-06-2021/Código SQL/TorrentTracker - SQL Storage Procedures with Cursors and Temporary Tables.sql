/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Storage Procedures + Cursors + Temporary Tables

*/


USE p4g7;
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