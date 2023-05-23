/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Storage Procedures + Cursors

*/







USE p4g7;
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