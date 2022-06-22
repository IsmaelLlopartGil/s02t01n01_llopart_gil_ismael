USE culdampolla;

INSERT INTO Client VALUES (NULL, NULL, 'Pere', '+34988754521', 'pere@pere.com', '2020-09-20');
INSERT INTO Client VALUES (NULL, NULL, 'Carla', '+34987654302', 'carla@carla.com', '2021-02-08');
INSERT INTO Client VALUES (NULL, 2, 'Diana', '+34987654321', 'diana@diana.com', '2022-01-03');
INSERT INTO Client VALUES (NULL, 1, 'Noa', '+34987047321', 'noa@noa.com', '2021-06-29');

INSERT INTO Employee VALUES (NULL, 'Tony');
INSERT INTO Employee VALUES (NULL, 'Nerea');

INSERT INTO Supplier VALUES (NULL, 'Ulleres i més', 'carrer sosa 15, bajo', '+3495684654', NULL, '78945612N');
INSERT INTO Supplier VALUES (NULL, 'Compres Petit', 'carrer aprop 89, bajo', '+3497004654', '+3497004655' , '56845612M');
INSERT INTO Supplier VALUES (NULL, 'Provee To', 'carrer finte 08, bajo', '+3499344654', NULL, '63845612X');
INSERT INTO Supplier VALUES (NULL, 'Novencres', 'Descampat antàrtic s/n', '+3468844603', NULL, '00000000N');

INSERT INTO Glasses VALUES (NULL, 'Ray-Ban', 'flotant', 'vermell', 'fosques', 125.50, 1);
INSERT INTO Glasses VALUES (NULL, 'Polaroid', 'pasta', 'verd', 'transparent', 85, 2);
INSERT INTO Glasses VALUES (NULL, 'Oakley', 'metàl·lica', 'negre', 'fosques', 212.80, 3);
INSERT INTO Glasses VALUES (NULL, 'Arnette', 'pasta·', 'marró', 'fosques', 200.00, 3);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_01', '2021-03-08', 1, 1);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 0, 1, 1, 1, 1, 1);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 0, 2, 1, 1, 1, 2);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_02', '2021-01-18', 2, 2);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (2, 1.1, 2, 2, 2, 2, 2);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_03', '2021-11-23', 3, 1);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 2.3, 3, 3, 3, 1, 3);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 2.3, 1, 3, 3, 1, 1);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (2, 2.3, 2, 3, 3, 1, 2);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_04', '2021-05-28', 4, 2);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 0, 3, 4, 4, 2, 3);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (2, 0, 2, 4, 4, 2, 2);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_05', '2021-07-06', 1, 1);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 0, 3, 5, 1, 1, 3);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (2, 0, 4, 5, 1, 1, 3);

INSERT INTO SalesOrder (Invoice, Data, Client_Client_id, Employee_Employee_id)  VALUES ('inv_06', '2022-02-12', 2, 2);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (3, 1.1, 4, 6, 2, 2, 3);
INSERT INTO OrderDetail (Quantity, Prescription, Glasses_Glasses_id, SalesOrder_SalesOrder_id, SalesOrder_Client_Client_id, SalesOrder_Employee_Employee_id, Glasses_Supplier_Supplier_id) VALUES (1, 1.1, 3, 6, 2, 2, 3);

UPDATE OrderDetail od, Glasses g SET od.SubTotal=g.Price*od.Quantity WHERE g.Glasses_id=od.Glasses_Glasses_id;
UPDATE SalesOrder so, OrderDetail od SET so.Total=(SELECT SUM(SubTotal) FROM OrderDetail od WHERE od.SalesOrder_SalesOrder_id=so.SalesOrder_id);