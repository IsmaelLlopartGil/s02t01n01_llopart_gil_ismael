USE culdampolla;

SELECT * FROM `SalesOrder` WHERE Client_Client_id=1 AND Data BETWEEN '2021-01-01' AND '2021-06-06';

SELECT g.Brand, e.Name
FROM Glasses g
INNER JOIN OrderDetail od 
ON  g.Glasses_id=od.Glasses_Glasses_id AND od.SalesORder_Employee_Employee_id=2
INNER JOIN Employee e
ON e.Employee_id=2
GROUP BY Brand;

SELECT s.Name 
FROM Supplier s
INNER JOIN OrderDetail od
ON od.Glasses_Supplier_Supplier_id = s.Supplier_id
GROUP BY Name;