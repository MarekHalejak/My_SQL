
USE northwind;

-- TOP 3 sprzedawcow w danym roku. KPI + premia

CREATE OR REPLACE VIEW top_1996 AS
SELECT 
CONCAT(e.LastName, ' ', e.FirstName) AS FullName,
SUM(od.Quantity) AS Quantity_total,
SUM(p.Price) AS Price_total, 
SUM(p.Price * od.Quantity) AS total_hajs,
DATE_FORMAT(o.OrderDate, '%Y' ) AS Order_date

FROM orders AS o
NATURAL JOIN orderdetails AS od
NATURAL JOIN employees AS e
NATURAL JOIN products AS p

GROUP BY  FullName, Order_date
HAVING Order_date = '1996'
ORDER BY total_hajs DESC
LIMIT 3
;

CREATE OR REPLACE VIEW top_1997 AS
SELECT 
CONCAT(e.LastName, ' ', e.FirstName) AS FullName,
SUM(od.Quantity) AS Quantity_total,
SUM(p.Price) AS Price_total,
SUM(p.Price * od.Quantity) AS total_hajs, 
DATE_FORMAT(o.OrderDate, '%Y' ) AS Order_date

FROM orders AS o
NATURAL JOIN orderdetails AS od
NATURAL JOIN employees AS e
NATURAL JOIN products AS p

GROUP BY FullName, Order_date
HAVING Order_date = '1997'
ORDER BY total_hajs DESC
LIMIT 3
;

SELECT Order_date AS "Order date", FullName AS "Name", Quantity_total AS "Quantity", total_hajs AS "Sales", total_hajs / ((SELECT AVG(total_hajs) FROM top_1996))-1 AS KPI, 
CASE 
	WHEN total_hajs / (SELECT AVG(total_hajs) FROM top_1996) > 1 THEN 'Yes'
    ELSE 'No'
END AS Bonus
FROM top_1996
UNION
SELECT Order_date AS "Order date", FullName AS "Name", Quantity_total AS "Quantity", total_hajs AS "Sales", total_hajs / ((SELECT AVG(total_hajs) FROM top_1997)) -1 AS KPI,
CASE 
	WHEN total_hajs / (SELECT AVG(total_hajs) FROM top_1997) > 1 THEN 'Yes'
    ELSE 'No'
END AS Bonus 
FROM top_1997
ORDER BY 'Order date' DESC;


-- Srednia total hajs i % sredniej
SELECT *, total_hajs / (SELECT AVG(total_hajs) FROM top_1996) AS srednia FROM top_1996;

-- Jesli nazwisko zaczyna sie na D to Yes, jesli imie na M to Yes_M, jesli imie zaczyna sie na S a naziwsko na B to combo, w innym wypadku NO

SELECT
  e.FirstName,
  e.LastName,
  CASE
    WHEN e.LastName LIKE 'D%' THEN 'YES'
    WHEN e.FirstName LIKE 'M%' THEN 'YES_M'
    WHEN e.FirstName LIKE 'S%' AND e.LastName LIKE 'B%' THEN 'Combo'
    ELSE 'NO'
  END AS LastName_D
FROM
  employees AS e;
  
-- Jesli zysk total jest wiekszy od sredniej to premia

