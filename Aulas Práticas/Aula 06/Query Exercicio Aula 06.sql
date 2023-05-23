/* Aula 06 */
-- Alvaro Freixo 93116, Joao Machado 89132

USE pubs;  
GO  

-- Ex a
SELECT * FROM authors;

-- Ex b
SELECT au_fname, au_lname, phone FROM authors;

-- Ex c
SELECT au_fname, au_lname, phone 
FROM authors
ORDER BY au_fname ASC, au_lname DESC;

-- Ex d
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
ORDER BY au_fname ASC, au_lname DESC;

-- Ex  e
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
WHERE state='CA'AND au_lname<>'Ringer'
ORDER BY au_fname ASC, au_lname DESC;

-- EX f
SELECT * FROM publishers 
WHERE pub_name LIKE '%Bo%';

-- EX g
SELECT pub_name 
FROM (publishers INNER JOIN titles ON publishers.pub_id=titles.pub_id) 
WHERE type='business';

-- Ex h
SELECT publishers.pub_id, pub_name, SUM(qty) AS Num_Vendas
FROM ((sales JOIN titles ON sales.title_id=titles.title_id) JOIN publishers ON publishers.pub_id= titles.pub_id) 
GROUP BY publishers.pub_id, pub_name;

-- Ex i
SELECT title, SUM(qty) AS Num_Vendas
FROM ((sales JOIN titles ON sales.title_id=titles.title_id) JOIN publishers ON publishers.pub_id= titles.pub_id) 
GROUP BY title;

-- Ex j

SELECT title
FROM (titles JOIN (sales JOIN stores
				  ON sales.stor_id=stores.stor_id) 
	 ON sales.title_id=titles.title_id) 
WHERE stor_name='Bookbeat'


-- Ex k

SELECT  R1.au_fname,  R1.au_lname
FROM (SELECT au_fname,  au_lname, count(DISTINCT type) AS num_tipos_diferentes
	 FROM (titles JOIN (titleauthor JOIN authors
				  ON titleauthor.au_id = authors.au_id)
	       ON titles.title_id = titleauthor.title_id)
     GROUP BY au_fname, au_lname
     HAVING count(DISTINCT type)>1) AS R1;


-- Ex l
-- Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

SELECT type, pub_id, AVG(price) AS preco_medio, sum(qty) AS num_total_vendas
FROM (titles JOIN sales
			ON titles.title_id = sales.title_id)
GROUP BY type, pub_id;


-- Ex m
-- Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

SELECT T.type
FROM titles AS T
WHERE advance > 1.5 * (SELECT R1.media_grupo 
					   FROM (SELECT type, AVG(advance) AS media_grupo
							 FROM titles
						     GROUP BY type) AS R1
					   WHERE T.type=type);
/*					   
-- OU
SELECT type 
FROM titles 
GROUP BY type 
HAVING MAX(advance)>1.5*AVG(advance);
*/

-- Ex n
-- Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

SELECT R1.title, R1.au_fname, R1.au_lname, (((CAST(R1.royaltyper AS FLOAT)* royalty)/ 100.0) * R1.price)*R1.qty AS ganho_autor
FROM (SELECT title, au_fname, au_lname, royaltyper, price, qty, royalty
	  FROM (sales JOIN (titles JOIN (titleauthor JOIN authors
									 ON titleauthor.au_id = authors.au_id)
						ON titles.title_id = titleauthor.title_id)
			ON titles.title_id = sales.title_id)
      GROUP BY title, au_fname, au_lname, price, royaltyper, qty, royalty) AS R1 
WHERE price IS NOT NULL;

-- Ex o
SELECT title, ytd_sales, price*ytd_sales AS faturacao, price*ytd_sales * (CAST(royalty AS FLOAT)/100) AS auths_revenue, price*ytd_sales * (1 - CAST(royalty AS FLOAT)/100) AS publisher_revenue
FROM titles
WHERE ytd_sales IS NOT NULL
ORDER BY title;

-- EX p
SELECT title, ytd_sales, au_fname + ' ' + au_lname AS author, price*ytd_sales * (CAST(royalty AS FLOAT)/100) AS auths_revenue, price*ytd_sales * (1 - CAST(royalty AS FLOAT)/100) AS publisher_revenue
FROM titles JOIN (titleauthor JOIN authors
							  ON titleauthor.au_id = authors.au_id)
			ON titles.title_id=titleauthor.title_id
WHERE ytd_sales IS NOT NULL
ORDER BY title;

-- Ex q (EM DUVIDA)
-- Lista de lojas que venderam pelo menos um exemplar de todos os livros;
SELECT stores.stor_id, stores.stor_name, count(DISTINCT titles.title_id) AS conta
FROM (stores JOIN (sales JOIN titles
						            ON sales.title_id=titles.title_id)
			 ON stores.stor_id=sales.stor_id) 
GROUP BY stores.stor_id, stores.stor_name
HAVING count(DISTINCT titles.title_id) = (SELECT COUNT(*)
									      FROM titles
										  WHERE ytd_sales IS NOT NULL);

-- Ex r
-- Lista de lojas que venderam mais livros do que a média de todas as lojas.
SELECT stor_name, SUM(qty) AS soma
FROM sales JOIN stores ON sales.stor_id=stores.stor_id
GROUP BY stor_name
HAVING SUM(qty) > (SELECT CAST(SUM(qty) AS FLOAT) / COUNT(DISTINCT stor_id)
				   FROM sales);

-- Ex s
-- Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;
SELECT title
FROM titles
WHERE title_id NOT IN (SELECT title_id
					   FROM sales JOIN stores ON sales.stor_id=stores.stor_id
					   WHERE stor_name='Bookbeat')

-- Ex t	(VOLTAR A FAZER E PERCEBER!!!)
-- Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora;
SELECT publishers.pub_name, stores.stor_id
FROM stores, publishers
EXCEPT (SELECT publishers.pub_name, stores.stor_id
		FROM stores left join sales on stores.stor_id=sales.stor_id join titles on sales.title_id=titles.title_id right outer join publishers on titles.pub_id=publishers.pub_id
		GROUP BY publishers.pub_name, stores.stor_id);

-- Ex t (exemplo Inácio)
SELECT publishers.pub_name, stores.stor_name
	FROM stores, publishers, (SELECT publishers.pub_id, stores.stor_id
								FROM stores, publishers     
								EXCEPT (SELECT DISTINCT publishers.pub_id, stores.stor_id
											FROM publishers,stores,titles,sales
											WHERE  titles.pub_id=publishers.pub_id AND sales.stor_id=stores.stor_id AND titles.title_id=sales.title_id 
											GROUP BY publishers.pub_id, stores.stor_id)) AS pubs_stors_ids
	WHERE publishers.pub_id=pubs_stors_ids.pub_id AND stores.stor_id=pubs_stors_ids.stor_id
	ORDER BY publishers.pub_name;












