/*Sistema de Gestão de Gestão de um Torrent Tracker
P4G7 Álvaro Freixo 93116, João Machado 89132

Storage Procedures + Temporary Tables

*/


USE p4g7;
GO



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