USE Pizzeria;

insert into Province (Name) values ('Tarragona');
insert into Province (Name) values ('Barcelona');

insert into Town (Name, PostalCode, Province_Province_id) values ('Calafell', 74164, 1);
insert into Town (Name, PostalCode, Province_Province_id) values ('Barcelona', 82551, 2);

insert into Client (Name, LastName, Address, PhoneNumber, Town_Town_id) values ('Bastien', 'Matusson', 'Arrowood', '450-671-0973', 1);
insert into Client (Name, LastName, Address, PhoneNumber, Town_Town_id) values ('Marguerite', 'Abelwhite', 'Warner', '241-115-4704', 2);

insert into Store (Address, Town_Town_id) values ('Calafell Poble', 1);
insert into Store (Address, Town_Town_id) values ('Calafell Patja', 1);
insert into Store (Address, Town_Town_id) values ('Barcelona', 2);

insert into Job (JobName) values ('Chef');
insert into Job (JobName) values ('Delivery Man');

insert into Employee (Name, LastName, NIF, PhoneNumber, Store_Store_id, Job_Job_id) values ('Mikey', 'Kuhnhardt', '59-005-6215', '632-915-0785', 1, 2);
insert into Employee (Name, LastName, NIF, PhoneNumber, Store_Store_id, Job_Job_id) values ('Dorelia', 'Goody', '19-189-0249', '520-309-0403', 2, 2);
insert into Employee (Name, LastName, NIF, PhoneNumber, Store_Store_id, Job_Job_id) values ('Aundrea', 'Llywarch', '71-427-1935', '334-680-7763', 3, 1);

insert into DeliveryMethod (MethodName) values ('Deliver to home');
insert into DeliveryMethod (MethodName) values ('Pick up');

insert into Product (Name, Description, Price) values ('Pizza Margherita', 'Supplement Descending Colon with Nonautologous Tissue Substitute, Open Approach', 23);
insert into Product (Name, Description, Price) values ('Pizza Marinara', 'Bypass Left Vertebral Vein to Upper Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach', 24);
insert into Product (Name, Description, Price) values ('Wine', 'Supplement Lumbosacral Joint with Autologous Tissue Substitute, Percutaneous Endoscopic Approach', 16);
insert into Product (Name, Description, Price) values ('Beer', 'Revision of Drainage Device in Lower Vein, Open Approach', 9);
insert into Product (Name, Description, Price) values ('Coke', 'Insertion of Infusion Device into Thoracic Vertebral Joint, Open Approach', 9);

insert into PizzaCategory (Description) values ('January');
insert into PizzaCategory (Description) values ('March');
insert into PizzaCategory (Description) values ('April');

insert into Pizza (Product_Product_id, PizzaCategory_PizzaCategory_id) values (1, 1);
insert into Pizza (Product_Product_id, PizzaCategory_PizzaCategory_id) values (2, 2);

insert into Beverage (Product_Product_id) values (3);
insert into Beverage (Product_Product_id) values (4);
insert into Beverage (Product_Product_id) values (5);

insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id) values ('87-756-4731', 2, 1, 1);
insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id) values ('77-493-2494', 2, 2, 2);
insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id) values ('20-349-6665', 2, 2, 3);
insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id, Employee_Employee_id) values ('15-349-6565', 1, 2, 3, 1);
insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id, Employee_Employee_id) values ('98-249-4685', 1, 2, 3, 2);
insert into SalesOrder (Invoice, DeliveryMethod_DeliveryMethod_id, Client_Client_id, Store_Store_id, Employee_Employee_id) values ('98-249-4685', 1, 1, 3, 1);

insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (6, 1, 1);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (8, 1, 2);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 1, 3);

insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (6, 2, 1);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 2, 4);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (9, 2, 5);

insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (6, 3, 2);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 3, 3);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (9, 3, 3);

insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 4, 1);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (1, 4, 3);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (5, 4, 4);

insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (3, 5, 5);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 5, 3);
insert into OrderDetail (Quantity, SalesOrder_SalesOrder_id, Product_Product_id) values (2, 5, 3);


