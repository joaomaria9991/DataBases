/* Aula 10 
Álvaro Freico 93116, João Machado 89132
*/

USE Aula10_Company;
GO

--a)
DROP PROCEDURE aula10_a;
GO

CREATE PROCEDURE aula10_a @SSN INT
AS
	BEGIN
		BEGIN TRANSACTION
		UPDATE company.department 
			SET Mgr_ssn = NULL 
			WHERE Mgr_ssn = @SSN;
		DELETE FROM company.dependent WHERE Essn=@SSN;
		DELETE FROM company.works_on WHERE Essn=@SSN;
		DELETE FROM company.employee WHERE Ssn=@SSN;
		COMMIT
	END
GO

EXEC aula10_a 21312332;
GO

--b)
DROP PROCEDURE aula10_b;
GO

CREATE PROCEDURE aula10_b @ssn int
AS
	BEGIN
		SELECT Fname, Lname, Dname, Mgr_start_date
		FROM company.department INNER JOIN company.employee ON Mgr_ssn=Ssn
		ORDER BY Mgr_start_date
		
		SELECT TOP(1) @ssn=Ssn, DATEDIFF(year, GETDATE, Mgr_start_date) AS Anos
		FROM company.department INNER JOIN company.employee ON Mgr_ssn=Ssn
		ORDER BY Mgr_start_date
	END
GO

--c)
DROP PROCEDURE aula10_c;
GO

CREATE TRIGGER aula10_c ON company.department
AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @ssn AS INT;

		SELECT @ssn=Mgr_ssn FROM inserted;

		IF EXISTS(SELECT Mgr_ssn FROM company.department WHERE Mgr_ssn=@ssn)
		BEGIN
			ROLLBACK TRAN;
			RAISERROR('O Funcionário já está a gerir este departamento.', 20, 1);
		END
	END
GO

--d)
DROP PROCEDURE aula10_d;
GO

CREATE TRIGGER aula10_d ON company.employee AFTER INSERT, UPDATE 
AS
	BEGIN
		DECLARE @salary AS int;
		DECLARE @mgr_salary AS int;
		DECLARE @dno AS int;
	SELECT @salary=Salary FROM company.inserted;
	SELECT @dno=Dno FROM company.inserted;
	SELECT @mgr_salary=Salary FROM company.department JOIN company.employee ON Ssn=Mgr_ssn WHERE department.Dnumber=@dno;
	IF (@salary>=@mgr_salary)
	BEGIN
	INSERT INTO company.employee (Fname, Minit, Lname, Ssn, Bdate, [Address], Sex, Salary, Super_ssn, Dno)
	SELECT Fname, Minit, Lname, Ssn, Bdate, [Address], Sex, @ESalary-1, Super_ssn, Dno FROM inserted;
	END
	END
GO


--e)
DROP PROCEDURE aula10_e;
GO

CREATE FUNCTION company.aula10_e (@Ssn char(9)) RETURNS Table
AS
	RETURN(SELECT Pname, Plocation
	FROM company.employee
			JOIN company.works_on ON Ssn=Essn
			JOIN company.project ON Pno=Pnumber
	WHERE employee.Ssn=@Ssn);
GO

--f)
DROP PROCEDURE aula10_f;
GO

CREATE FUNCTION company.aula10_f(@dno int) RETURNS TABLE
AS
	RETURN(
		SELECT Ssn
		FROM company.employee
		WHERE DNO=@Dno AND Salary>(
			SELECT AVG(Salary)
			FROM company.employee
			WHERE Dno=@Dno
		));
GO

SELECT * FROM company.employee
SELECT * FROM company.aula10_f(3)

--g)
DROP PROCEDURE aula10_g;
GO

CREATE FUNCTION company.aula10_g(@dno int) RETURNS @table TABLE (pname varchar(15), number int, plocation varchar(15), dnum int, budget decimal(10,2), totalbudget decimal(10,2))
AS
BEGIN

	DECLARE @pname as varchar(15), @number as int, @plocation as varchar(15), @dnum as int, @budget as decimal(10,2), @totalbudget as decimal(10,2);

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT Pname, Pnumber, Plocation, Dnumber, Sum(Salary*[Hours]/40)
		FROM	company.department 
				JOIN company.project ON Dnumber=Dnum
				JOIN company.works_on ON Pnumber=Pno
				JOIN company.employee ON Essn=Ssn
		WHERE Dnumber=@dno
		GROUP BY Pname, Pnumber, Plocation, Dnumber;

	OPEN C;

	FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	SELECT @totalbudget = 0;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @table VALUES (@pname, @number, @plocation, @dnum, @budget, @totalbudget)
		FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	END

	CLOSE C;

	DEALLOCATE C;

	return;
END
GO

--h)

-- A vantagem de usar um trigger instead of é que podemos eliminar todas as dependências do departamento antes de o eliminar efetivamente.
CREATE TRIGGER COMPANY.t_DeleteDepartment ON company.department
INSTEAD OF DELETE
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'company' AND TABLE_NAME = 'department_deleted'))
		BEGIN
			CREATE TABLE company.department_deleted (Dname varchar(15) NOT NULL, Dnumber int PRIMARY KEY, Mgr_ssn char(9), Mgr_start_date date);
		END

	DELETE FROM company.project WHERE Dnum in (SELECT Dnumber FROM deleted);
	UPDATE company.employee SET Dno=NULL WHERE DNO IN (SELECT Dnumber FROM deleted);
	INSERT INTO company.department_deleted SELECT * FROM DELETED;
	DELETE FROM company.DEPARTMENT WHERE Dnumber IN (SELECT Dnumber FROM deleted);

END
GO

--i)
/*
	Um Stored Procedure é uma batch armazenada com um nome, que tem como vantagem não ser necessário recompilar
	o código sempre que o procedimento é invocado. Os procedimentos são guardados em cache na primeira vez
	que são executados, sendo que posteriormente não é necessário aceder à memória.

	Os Stored procedures podem ter argumentos de entrada e podem retornar valores escalares.

	As UDF's possuem os mesmos benefícios das store procedures. São igualmente compilados e otimizados, e podem aceitar argumentos de entrada.
	As UDF's obrigatoriamente retornam sempre um valor, que pode ser escalar ou uma tabela.

	Os stored procedures podem alterar o estado da base de dados com insert's, update's e delete's,
	o mesmo não acontece com as UDF's. Store Procedures também suportam o uso de blocos try... catch,
	enquanto que as UDF's também não suportam.

	No caso de ser necessário alterar tabelas da base de dados, o mais adequado seria usar um procedure.
	Se fosse necessário retornar uma tabela, o mais adequado seria usar UDF's.

*/



