/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Index

*/


USE p4g7;
GO


-- Index de TorrentTracker.Utilizador(UserNickname, UserEMail, UserDataRegisto,UserIP, UserTorrentProgram, UserPermissaoDownload)
CREATE INDEX Index_Utilizadores_Geral ON TorrentTracker.Utilizador(UserNickname, UserEMail, UserDataRegisto,UserIP, UserTorrentProgram, UserPermissaoDownload);
GO

-- Diminuir Fragmentacao Index_Utilizadores_Geral
ALTER INDEX Index_Utilizadores_Geral ON TorrentTracker.Utilizador REORGANIZE;
GO

-- Index TorrentTracker.ContentTorrent(NomeContentTorrent)
--DROP INDEX Index_ContentTorrent_Nome ON TorrentTracker.ContentTorrent;

CREATE INDEX Index_ContentTorrent_Nome ON TorrentTracker.ContentTorrent(NomeContentTorrent);
GO

-- Verificar Indices da BD e fragmentacao
--USE YourDatabase
--GO
SELECT s.[name] +'.'+t.[name]  AS table_name
 ,i.NAME AS index_name
 ,index_type_desc
 ,ROUND(avg_fragmentation_in_percent,2) AS avg_fragmentation_in_percent
 ,record_count AS table_record_count
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'SAMPLED') ips
INNER JOIN sys.tables t on t.[object_id] = ips.[object_id]
INNER JOIN sys.schemas s on t.[schema_id] = s.[schema_id]
INNER JOIN sys.indexes i ON (ips.object_id = i.object_id) AND (ips.index_id = i.index_id)
ORDER BY avg_fragmentation_in_percent DESC
GO