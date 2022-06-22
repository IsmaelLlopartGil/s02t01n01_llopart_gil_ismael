USE Pizzeria;

SELECT  t.Name, SUM(od.Quantity) 
FROM OrderDetail od
INNER JOIN SalesOrder so
ON so.SalesOrder_id=od.SalesOrder_SalesOrder_id
INNER JOIN Store s
ON s.Store_id=so.Store_Store_id
INNER JOIN Town t
ON t.Town_id=s.Town_Town_id
INNER JOIN Product p
ON p.Product_id=od.Product_Product_id
INNER JOIN Beverage b
ON p.Product_id=b.Product_Product_id
WHERE t.Name='Calafell';

SELECT e.Name, COUNT(*) FROM SalesOrder so
INNER JOIN Employee e
ON e.Employee_id=so.Employee_Employee_id
WHERE e.Name='Mikey';