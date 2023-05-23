/* Aula 07 */
-- P4G7 - Alvaro Freixo 93116, Joao Machado 89132

USE p4g7;  
GO  

CREATE SCHEMA aula07
GO

-- Ex 7.5 a) i)
CREATE VIEW aula07.name_titles_authors AS 
			SELECT title, au_fname, au_lname
			FROM (pubs.dbo.titles JOIN (pubs.dbo.titleauthor JOIN pubs.dbo.authors
										   ON pubs.dbo.titleauthor.au_id=pubs.dbo.authors.au_id)
						 ON pubs.dbo.titles.title_id=pubs.dbo.titleauthor.title_id);
GO

-- Ex 7.5 a) ii)
CREATE VIEW aula07.name_pubishers_employee AS
			SELECT pub_name, fname, minit, lname
			FROM pubs.dbo.publishers AS Pub JOIN pubs.dbo.employee AS Emp ON Pub.pub_id=Emp.pub_id;
GO

-- Ex 7.5 a) iii)
CREATE VIEW aula07.name_stores_books AS
			SELECT stor_name, title
			FROM (pubs.dbo.titles AS Titles JOIN (pubs.dbo.sales AS Sales JOIN pubs.dbo.stores AS Stores
																 ON Sales.stor_id=Stores.stor_id)
								  ON Titles.title_id=Sales.title_id);
GO

-- Ex 7.5 a) iv)
CREATE VIEW aula07.books_type_business AS
			SELECT title
			FROM pubs.dbo.titles
			WHERE [type]='Business'
GO

-- Ex 7.5 b) i)
SELECT *
FROM aula07.name_titles_authors;
GO

-- Ex 7.5 b) ii)
SELECT *
FROM aula07.name_pubishers_employee;
GO

-- Ex 7.5 b) iii)
SELECT *
FROM aula07.name_stores_books;
GO

-- Ex 7.5 b) iv)
SELECT *
FROM aula07.books_type_business;
GO


-- Ex 7.5 c) 
 SELECT DISTINCT stor_name,au_fname+' '+au_lname AS author
     FROM aula07.name_titles_authors JOIN aula07.name_stores_books ON aula07.name_titles_authors.title=aula07.name_stores_books.title
     ORDER BY stor_name;
GO
     
-- Ex 7.5 d) i)
-- Teve sucesso, mas deveria dar erro pois o tipo do livro introduzido não é 'Business', pois tabela so aceita livros 'Business'.

-- Ex 7.5 d) ii)
ALTER VIEW aula07.books_type_business AS
    SELECT title,title_id, [type], pub_id, price, notes 
	FROM pubs.dbo.titles 
    WHERE [type]='Business'
    WITH CHECK OPTION; --  Acrescenta-se esta linha para que a condição seja verificada ao fazer insert
GO







