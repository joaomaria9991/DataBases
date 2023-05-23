/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Views

*/


USE p4g7;
GO




CREATE VIEW TorrentTracker.PLANOS_SUBSCRICAO_DISPONIVEIS AS
	SELECT Nome, DescricaoPlano, PrecoPlano
	FROM TorrentTracker.PlanosDoacaoSubscricoes
GO


CREATE VIEW TorrentTracker.HistoricoComprasGeral_View AS
	SELECT U.UserNickname, P.Nome, P.PrecoPlano, C.DataHoraCompra, C.DataHoraTermino
	FROM (((TorrentTracker.Compra AS C JOIN TorrentTracker.UtilizadorVIP AS UV ON C.ID_Comprador=UV.ID_User) JOIN TorrentTracker.Utilizador AS U ON U.ID_User=UV.ID_User) JOIN TorrentTracker.PlanosDoacaoSubscricoes AS P ON C.ID_Plano=P.ID);
GO