/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Storage Procedures + Transactions

*/


USE p4g7;
GO




ALTER PROCEDURE TorrentTracker.ComprarPlano @user_nick VARCHAR(256), @plano_nome VARCHAR(256), @email_pagamento VARCHAR(500)
AS BEGIN
		BEGIN TRY
				DECLARE @lastseed_Compra INT = (SELECT COUNT(*) FROM TorrentTracker.Compra);
				DBCC CHECKIDENT('TorrentTracker.Compra', RESEED, @lastseed_Compra);

				DECLARE @id_user INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
				DECLARE @plano_id INT = (SELECT TorrentTracker.User_PlanoNomeToID(@plano_nome));
				DECLARE @dias INT = (SELECT LimiteTempoPlano FROM TorrentTracker.PlanosDoacaoSubscricoes WHERE ID=@plano_id);
				DECLARE @data_atual SMALLDATETIME = CAST(GETDATE() AS smalldatetime);
				
					BEGIN TRANSACTION
						INSERT INTO TorrentTracker.UtilizadorVip([ID_User],[ImunidadeHitRun],[FreeleechTotal],[EMailPagamento],[DataHoraPagamento]) 
						VALUES (@id_user, 1 ,1, @email_pagamento, @data_atual);
						
						INSERT INTO TorrentTracker.Compra ([ID_Comprador],[ID_plano],[DataHoraCompra],[DataHoraTermino]) 
						VALUES (@id_user, @plano_id, @data_atual, DATEADD(day, @dias, @data_atual));
					COMMIT TRAN

				SELECT 'return Value' = 'Compra realizada com Sucesso!'
		END TRY
		BEGIN CATCH
				SELECT 'return Value' = 'ERRO -> O utilizador e/ou o plano não existem!'
		END CATCH
	END
GO


-- Transação!!!
ALTER PROCEDURE TorrentTracker.Adicionar_Novo_Torrent @tamanho DECIMAL(38,3), @nome_torrent VARCHAR(256), @user_nick VARCHAR(256), 
@nome_game_program_serie_movie VARCHAR(256), @os VARCHAR(10), @imdb_link VARCHAR(4000),
@imdb_ano VARCHAR(5), @imdb_classificacao VARCHAR(20), @imdb_sinopse VARCHAR(MAX), @release VARCHAR(25), @temporada VARCHAR(20), 
@episodio VARCHAR(20), @categoria VARCHAR(20)
AS BEGIN
		BEGIN TRY
				-- Identificar e resetar seed para o ultimo, para usar IDENTITY()
				DECLARE @lastseed INT = (SELECT COUNT(*) FROM TorrentTracker.ContentTorrent);
				DBCC CHECKIDENT('TorrentTracker.ContentTorrent', RESEED, @lastseed );

				-- Converter Nickname_user em ID_user
				DECLARE @id_uploader INT = (SELECT TorrentTracker.User_NicknameToID(@user_nick));
				
				SET @imdb_classificacao = NULL;	--Variavel desativada
				DECLARE @id_tt_imdb INT = 0000; --Variavel desativada


				IF @categoria = 'Game'
					BEGIN
						BEGIN TRANSACTION
							INSERT INTO TorrentTracker.ContentTorrent ([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) 
									VALUES (@tamanho, CAST(GETDATE() AS smalldatetime), NULL, NULL, @nome_torrent, NULL, 1, @id_uploader);
						
							INSERT INTO TorrentTracker.ContentTorrentGame([ID_ContentTorrent],[NomeGame],[Capa],[OS]) 
									VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @nome_game_program_serie_movie, NULL, @os);
						COMMIT TRAN
					END
				ELSE IF @categoria = 'Program'
					BEGIN
						BEGIN TRANSACTION
							INSERT INTO TorrentTracker.ContentTorrent ([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) 
									VALUES (@tamanho, CAST(GETDATE() AS smalldatetime), NULL, NULL, @nome_torrent, NULL, 1, @id_uploader);

							INSERT INTO TorrentTracker.ContentTorrentProgram([ID_ContentTorrent],[NomeProgram],[Capa],[OS]) 
								VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @nome_game_program_serie_movie, NULL, @os);
						COMMIT TRANSACTION
					END
				ELSE IF @categoria = 'Serie'
					BEGIN
						BEGIN TRANSACTION
							INSERT INTO TorrentTracker.ContentTorrent ([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) 
									VALUES (@tamanho, CAST(GETDATE() AS smalldatetime), NULL, NULL, @nome_torrent, NULL, 1, @id_uploader);

							INSERT INTO TorrentTracker.CategoriasInfoAutoDownload ([ID_ContentTorrent], [ID_TT_IMDB], [IMDB_Link], [IMDB_Nome], [IMDB_Ano], [IMDB_Classificacao], [IMDB_Sinopse])
									VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @id_tt_imdb, @imdb_link, @nome_game_program_serie_movie, CAST(@imdb_ano AS DECIMAL(4,0)), CAST(@imdb_classificacao AS DECIMAL(3,1)), @imdb_sinopse);

							INSERT INTO TorrentTracker.ContentTorrentSeries ([ID_ContentTorrent], [ID_TT_IMDB], [ReleaseType], [Temporada], [Episodio])
									VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @id_tt_imdb, @release, CAST(@temporada AS INT), CAST(@episodio AS INT));

						COMMIT TRAN
					END
				ELSE IF @categoria = 'Movie'
					BEGIN
						BEGIN TRANSACTION
							INSERT INTO TorrentTracker.ContentTorrent ([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) 
									VALUES (@tamanho, CAST(GETDATE() AS smalldatetime), NULL, NULL, @nome_torrent, NULL, 1, @id_uploader);

							INSERT INTO TorrentTracker.CategoriasInfoAutoDownload ([ID_ContentTorrent], [ID_TT_IMDB], [IMDB_Link], [IMDB_Nome], [IMDB_Ano], [IMDB_Classificacao], [IMDB_Sinopse])
									VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @id_tt_imdb, @imdb_link, @nome_game_program_serie_movie, CAST(@imdb_ano AS DECIMAL(4,0)), CAST(@imdb_classificacao AS DECIMAL(3,1)), @imdb_sinopse);

							INSERT INTO TorrentTracker.ContentTorrentMovies ([ID_ContentTorrent], [ID_TT_IMDB], [ReleaseType])
									VALUES ( (SELECT ID_ContentTorrent FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent = @nome_torrent), @id_tt_imdb, @release);

						COMMIT TRAN
					END
		
				SELECT 'return Value' = 'Adicionado com Sucesso!'
				
			END TRY
			BEGIN CATCH
				SELECT 'return Value' = 'ERRO -> O nome desse Torrent já existe!'
			END CATCH
	END
GO

