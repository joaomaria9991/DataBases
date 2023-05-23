--p4g7 Aula 9 Exercício 9.2
--9.2

--drop table mytemp;

--CREATE TABLE mytemp (
--	rid BIGINT IDENTITY (1, 1) NOT NULL,
--	at1 INT NULL,
--	at2 INT NULL,
--	at3 INT NULL,
--	lixo varchar(100)NULL
--);	

--a)
--CREATE CLUSTERED INDEX ixRid on mytemp(rid) /*WITH (FILLFACTOR=65)*/

--Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time 
--Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;
SET nocount ON
WHILE @val <= @nelem
BEGIN
DBCC DROPCLEANBUFFERS;
	INSERT dbo.mytemp (rid, at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem*40000) as int), cast((RAND()*@nelem) as int),
		cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
		'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));

--b)
--SELECT * FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED') as S

--c)
--DELETE FROM mytemp;
--ALTER INDEX ALL on mytemp REBUILD WITH (FILLFACTOR=90)

--e)
--no index
--DROP INDEX ixRid on mytemp;

--with index
--CREATE INDEX ix1 on mytemp(rid)
--CREATE INDEX ix2 on mytemp(at1)
--CREATE INDEX ix3 on mytemp(at2)
--CREATE INDEX ix4 on mytemp(at3)
--CREATE INDEX ix5 on mytemp(lixo)

--DELETE FROM mytemp;


