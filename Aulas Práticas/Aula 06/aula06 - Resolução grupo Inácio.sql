 --Aula 06 P4G6

USE PUBS;
GO

-- a)
 SELECT * FROM authors;

-- b)
 SELECT au_fname, au_lname,phone FROM authors;

-- c)
 SELECT au_fname, au_lname,phone FROM authors ORDER BY au_fname ASC;

 -- d)
 SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors ORDER BY au_fname ASC;

-- e)
 SELECT au_fname, au_lname, phone FROM authors WHERE state='CA' AND NOT au_lname='Ringer' ORDER BY au_fname ASC ;

-- f)
 SELECT * FROM publishers WHERE pub_name LIKE '%Bo%' ;

-- g)
 SELECT DISTINCT pub_name FROM publishers,titles WHERE titles.type='Business' AND titles.pub_id=publishers.pub_id;

-- h)
SELECT pub_name,sum(qty) AS total_qty 
	FROM publishers,sales,titles 
	WHERE titles.pub_id=publishers.pub_id AND titles.title_id=sales.title_id
	GROUP BY pub_name ;

-- i)
SELECT pub_name,title,sum(qty) AS total_qty 
	FROM publishers,sales,titles 
	WHERE titles.pub_id=publishers.pub_id AND titles.title_id=sales.title_id
	GROUP BY pub_name,title ORDER BY pub_name ASC ;

-- j)
SELECT stor_name,title 
	FROM sales,titles,stores
	WHERE titles.title_id=sales.title_id AND stores.stor_id=sales.stor_id AND stores.stor_name='Bookbeat'
	GROUP BY stor_name,title ORDER BY title ASC ;

 --k)
SELECT au_lname,au_fname
	FROM titles,titleauthor,authors
	WHERE titles.title_id=titleauthor.title_id AND titleauthor.au_id=authors.au_id 
	GROUP BY au_lname,au_fname 
	HAVING count(type)>1
	ORDER BY au_fname ASC;

-- l)
SELECT title, titles.pub_id, type, AVG(price) as avg_price, sum(qty) AS total_qty 
	FROM titles,publishers,sales
	WHERE titles.pub_id=publishers.pub_id AND price IS NOT NULL AND titles.title_id=sales.title_id
	GROUP BY type,titles.pub_id,titles.title
	ORDER BY title ASC;

-- m)
SELECT titles.title, titles.type,advance,types_adv.avg_adv
	FROM titles JOIN (SELECT type, AVG(advance) as avg_adv
						FROM titles
						GROUP BY type
						HAVING AVG(advance) IS NOT NULL) AS types_adv
		ON titles.type=types_adv.type
	WHERE advance>1.5*types_adv.avg_adv
	GROUP BY titles.title,titles.type,advance,types_adv.avg_adv;

-- n)
SELECT titles.title,au_lname,au_fname,royalty*royaltyper/100 as royals
	FROM titles,titleauthor,authors
	WHERE titles.title_id=titleauthor.title_id AND titleauthor.au_id=authors.au_id AND royalty IS NOT NULL
	GROUP BY title,au_lname,au_fname,royalty, royaltyper
	ORDER BY title ASC;

-- o)
SELECT title,ytd_sales,ytd_sales*price as facturacao, 
		ytd_sales*price*royalty/100 as auths_revenue, 
		ytd_sales*price-ytd_sales*price*royalty/100 as publisher_revenue
	FROM titles
	WHERE ytd_sales IS NOT NULL
	GROUP BY title,ytd_sales,price,royalty
	ORDER BY title ASC;

-- p)
SELECT title,ytd_sales,au_fname,au_lname,
		ytd_sales*price*royalty/100*royaltyper/100 as auth_revenue, 
		ytd_sales*price-ytd_sales*price*royalty/100 as publisher_revenue
	FROM titles,authors,titleauthor
	WHERE titles.title_id=titleauthor.title_id AND titleauthor.au_id=authors.au_id AND ytd_sales IS NOT NULL
	GROUP BY title,ytd_sales,price,royalty,royaltyper,au_lname,au_fname
	ORDER BY title ASC;

-- q)
SELECT DISTINCT stores.stor_id,stores.stor_name
	FROM titles, sales, stores
	WHERE titles.title_id=sales.title_id AND sales.stor_id=stores.stor_id 
	GROUP BY stores.stor_id,stores.stor_name
	HAVING count(stores.stor_id) > (SELECT count(title_id) FROM titles)
	ORDER BY stor_id;
	
-- r)
SELECT stores.stor_id,stores.stor_name
	FROM sales, stores
	WHERE sales.stor_id=stores.stor_id 
	GROUP BY stores.stor_id,stores.stor_name
	HAVING sum(sales.qty)>(SELECT avg(qty_store.total_qty) as x
								FROM (SELECT stor_id,sum(qty) as total_qty
										FROM sales
										GROUP BY sales.stor_id ) AS qty_store)
	ORDER BY stor_id;

--  s)
SELECT title
	FROM titles
	WHERE title_id NOT IN (SELECT titles.title_id
								FROM stores,sales,titles
								WHERE stor_name='Bookbeat' AND sales.stor_id=stores.stor_id AND titles.title_id=sales.title_id);

--  t)
SELECT publishers.pub_name, stores.stor_name
	FROM stores, publishers, (SELECT publishers.pub_id, stores.stor_id
								FROM stores, publishers     
								EXCEPT (SELECT DISTINCT publishers.pub_id, stores.stor_id
											FROM publishers,stores,titles,sales
											WHERE  titles.pub_id=publishers.pub_id AND sales.stor_id=stores.stor_id AND titles.title_id=sales.title_id 
											GROUP BY publishers.pub_id, stores.stor_id)) AS pubs_stors_ids
	WHERE publishers.pub_id=pubs_stors_ids.pub_id AND stores.stor_id=pubs_stors_ids.stor_id
	ORDER BY publishers.pub_name;





