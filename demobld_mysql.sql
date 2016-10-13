CREATE TABLE ORGANIZATIONS
  (
  organization_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  tax_code VARCHAR(15) )
  AUTO_INCREMENT = 100;

CREATE TABLE CUSTOMERS
   (	customer_id	INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	credit_rating	VARCHAR(10),
	last_name	VARCHAR(40)  NOT NULL,
	first_name	VARCHAR(40),
	title		VARCHAR(40),
	organization_id	INT(8),
	street		VARCHAR(40),
	city		VARCHAR(20),
	state		VARCHAR(2),
	zip		INT(5),
	comments	VARCHAR(80),
  FOREIGN key (organization_id) REFERENCES ORGANIZATIONS(organization_id) )
  AUTO_INCREMENT = 100;

CREATE TABLE INVOICES
   (	invoice_id	INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id	INT(8)  NOT NULL,
	invoice_date	DATE,
  FOREIGN key (customer_id) REFERENCES CUSTOMERS(customer_id) )
  AUTO_INCREMENT = 1;
		
CREATE table SHIPMENTS
   (	shipment_id	INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	invoice_id	INT(8),
	from_name	VARCHAR(80),
	from_street	VARCHAR(40),
	from_city	VARCHAR(20),
	from_state	VARCHAR(2),
	from_zip	INT(5),
	to_name		VARCHAR(80),
	to_street	VARCHAR(40),
	to_city		VARCHAR(20),
	to_state	VARCHAR(2),
	to_zip		INT(5),
	est_ship_date	DATE,
	shipper		VARCHAR(40),
	ship_cost	DECIMAL(7,2),
	tracking_number	VARCHAR(20),
	comments	VARCHAR(80),
  FOREIGN key (invoice_id) REFERENCES INVOICES(invoice_id) )
  AUTO_INCREMENT = 1;

CREATE TABLE SHIPMENT_ITEMS
   (	item_id		INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	shipment_id	INT(8)  NOT NULL,
	quantity	INT(4)  NOT NULL,
	description	VARCHAR(40),
	height		DECIMAL(6,2),
	width		DECIMAL(6,2),
	weight		DECIMAL(6,2),
	ship_cost	DECIMAL(7,2),
  FOREIGN key (shipment_id) REFERENCES SHIPMENTS(shipment_id) )
  AUTO_INCREMENT = 1;

CREATE TABLE COST_TABLE
   (	shipper	 VARCHAR(40) NOT NULL,
	min_size	DECIMAL(6,2)  NOT NULL,
	max_size	DECIMAL(6,2)  NOT NULL,
	max_weight	DECIMAL(6,2)  NOT NULL,
	time_frame	INT(3)  NOT NULL,
	cost_factor	DECIMAL(4,2)  NOT NULL  );


INSERT into ORGANIZATIONS values
(0,'E*Books','USG32-98654');
INSERT into ORGANIZATIONS values
(0,'Mail Order Media','USG03-23097');
INSERT into ORGANIZATIONS values
(0,'Rocky Mtn E*tainment','CO6-9346');
INSERT into ORGANIZATIONS values
(0,'Mobile Media','CO9-5454');
INSERT into ORGANIZATIONS values
(0,'Sam Auto body and Media sales','CO9-6973');

INSERT into CUSTOMERS values
(0,'good','Lewis','Steve','buyer',103,'1435 Halerson Way','Santa Clara','CA',10634,'');
INSERT into CUSTOMERS values
(0,'','Kramer','Kathleen','',100,'10634 Canyon Court','Cortez','CO',80634,'');
INSERT into CUSTOMERS values
(0,'good','Smith','Tom','salesman',100,'4653 Forest View','Salt Lake City','UT',84106,'');
INSERT into CUSTOMERS values
(0,'bad','Jones','Becky','owner',103,'1903 Centenial way','Denver','CO',84309,'');
INSERT into CUSTOMERS values
(0,'excellent','Taylor','Kathy','',100,'43 Baker St','Pueblo','CO',80234,'');
INSERT into CUSTOMERS values
(0,'','Obladd','David','owner',101,'930 Main','Colorado Springs','CO',80902,'');
INSERT into CUSTOMERS values
(0,'good','Dennis','Mike','sales rep',103,'6492 Sandy Circle','Miami','FL',63498,'');
INSERT into CUSTOMERS values
(0,'good','Peterson','Carole','',100,'4309 Oak','Bailey','CO',80103,'');
INSERT into CUSTOMERS values
(0,'poor','Cohn','Jackie','owner',102,'1433 Seedy Side','Moab','UT',84322,'');
INSERT into CUSTOMERS values
(0,'good','Sampson','Gerrie','clerk',104,'1999 Market','Silverton','CO',80333,'');
INSERT into CUSTOMERS values
(0,'good','Holbrook','Donna','president',100,'10783 Back Bay','Oakland','CA',60298,'');

INSERT into INVOICES values
(0,103,'2001-01-01');
INSERT into INVOICES values
(0,102,'2001-01-01');
INSERT into INVOICES values
(0,101,'2001-01-04');
INSERT into INVOICES values
(0,100,'2001-01-10');
INSERT into INVOICES values
(0,109,'2001-01-10');
INSERT into INVOICES values
(0,108,'2001-01-10');
INSERT into INVOICES values
(0,107,'2001-01-15');
INSERT into INVOICES values
(0,106,'2001-01-15');
INSERT into INVOICES values
(0,105,'2001-01-22');
INSERT into INVOICES values
(0,104,'2001-01-22');
INSERT into INVOICES values
(0,105,'2001-01-22');
INSERT into INVOICES values
(0,103,'2001-01-22');
INSERT into INVOICES values
(0,107,'2001-01-25');
INSERT into INVOICES values
(0,108,'2001-01-25');
INSERT into INVOICES values
(0,107,'2001-01-26');
INSERT into INVOICES values
(0,101,'2001-01-30');
INSERT into INVOICES values
(0,102,'2001-01-30');
INSERT into INVOICES values
(0,110,'2001-01-30');
INSERT into INVOICES values
(0,102,'2001-01-30');
INSERT into INVOICES values
(0,110,'2001-01-30');

INSERT into SHIPMENTS values
(0,1,'Bobs Books','3593 So Commerces St','Commerce City','CO',80132,
     'Lewis,Steve','1435 Halerson Way','Santa Clara','CA',10634,
     '2001-01-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,2,'Books R Us','10324 W 19th Ave','Colorado Springs','CO',80932,
     'Kramer,Kathleen','10634 Canyon Court','Cortez','CO',80634,
     '2001-01-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,3,'Books R Us','10324 W 19th Ave','Colorado Springs','CO',80932,
     'Smith,Tom','4653 Forest View','Salt Lake City','UT',84106,
     '2001-01-05','UPS',5.30,'',''); 
INSERT into SHIPMENTS values
(0,4,'Direct Video Distributors','5435 Ocean Drive','San Diego','CA',40499,
     'Jones,Becky','1903 Centenial way','Denver','CO',84309,
     '2001-01-10','UPS',5.30,'','');       
INSERT into SHIPMENTS values
(0,5,'Media Wholesale','563 Pulp Drive','Portland','OR',98368,
     'Taylor,Kathy','43 Baker St','Pueblo','CO',80234,
     '2001-01-10','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,6,'Media Wholesale','563 Pulp Drive','Portland','OR',98368,
     'Obladd,David','930 Main','Colorado Springs','CO',80902,
     '2001-01-10','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,7,'Media Wholesale','563 Pulp Drive','Portland','OR',98368,
     'Dennis,Mike','6492 Sandy Circle','Miami','FL',63498,
     '2001-01-15','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,8,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
     'Peterson,Carole','4309 Oak','Bailey','CO',80103,
     '2001-01-16','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,9,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
     'Cohn,Jackie','1433 Seedy Side','Moab','UT',84322,
     '2001-01-16','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,10,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Sampson,Gerrie','1999 Market','Silverton','CO',80333,
     '2001-01-20','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,11,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Holbrook,Donna','10783 Back Bay','Oakland','CA',60298,
     '2001-01-20','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,12,'Direct Video Distributors','5435 Ocean Drive','San Diego','CA',40499,
      'Holbrook,Donna','10783 Back Bay','Oakland','CA',60298,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,13,'Direct Video Distributors','5435 Ocean Drive','San Diego','CA',40499,
      'Smith,Tom','4653 Forest View','Salt Lake City','UT',84106,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,14,'Bobs Books','3593 So Commerces St','Commerce City','CO',80132,
      'Smith,Tom','4653 Forest View','Salt Lake City','UT',84106,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,15,'Bobs Books','3593 So Commerces St','Commerce City','CO',80132,
      'Sampson,Gerrie','1999 Market','Silverton','CO',80333,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,16,'Bobs Books','3593 So Commerces St','Commerce City','CO',80132,
      'Holbrook,Donna','10783 Back Bay','Oakland','CA',60298,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,17,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Smith,Tom','4653 Forest View','Salt Lake City','UT',84106,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,18,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Holbrook,Donna','10783 Back Bay','Oakland','CA',60298,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,19,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Sampson,Gerrie','1999 Market','Silverton','CO',80333,
     '2001-02-05','UPS',5.30,'','');
INSERT into SHIPMENTS values
(0,20,'Turning a New Page','4069 Spring Court','Sand Creek','AZ',43310,
      'Smith,Tom','4653 Forest View','Salt Lake City','UT',84106,
      '2001-02-05','UPS',5.30,'','');


INSERT into SHIPMENT_ITEMS values
(0,1,3,'Boxes',6,6,10,2.50);
INSERT into SHIPMENT_ITEMS values
(0,1,1,'Boxes',12,6,10,3.50);
INSERT into SHIPMENT_ITEMS values
(0,2,1,'Boxes',12,12,20,4.50);
INSERT into SHIPMENT_ITEMS values
(0,3,2,'Boxes',12,12,20,5.50);
INSERT into SHIPMENT_ITEMS values
(0,3,1,'Boxes',6,12,30,6.50);
INSERT into SHIPMENT_ITEMS values
(0,3,3,'Boxes',12,6,5,7.50);
INSERT into SHIPMENT_ITEMS values
(0,4,2,'Boxes',12,12,5,8.50);
INSERT into SHIPMENT_ITEMS values
(0,5,2,'Boxes',24,6,10,9.50);
INSERT into SHIPMENT_ITEMS values
(0,5,1,'Boxes',24,6,5,14.50);
INSERT into SHIPMENT_ITEMS values
(0,6,1,'Boxes',12,24,20,4.50);
INSERT into SHIPMENT_ITEMS values
(0,6,1,'Boxes',6,24,10,3.50);
INSERT into SHIPMENT_ITEMS values
(0,6,1,'Boxes',6,6,10,2.50);
INSERT into SHIPMENT_ITEMS values
(0,7,1,'Boxes',12,24,20,5.50);
INSERT into SHIPMENT_ITEMS values
(0,8,2,'Boxes',12,12,5,4.50);
INSERT into SHIPMENT_ITEMS values
(0,9,2,'Boxes',6,12,40,14.50);
INSERT into SHIPMENT_ITEMS values
(0,10,1,'Boxes',12,6,10,24.50);
INSERT into SHIPMENT_ITEMS values
(0,10,1,'Boxes',24,24,5,4.50);
INSERT into SHIPMENT_ITEMS values
(0,11,1,'Boxes',24,6,20,14.50);
INSERT into SHIPMENT_ITEMS values
(0,12,1,'Boxes',24,12,10,5.50);
INSERT into SHIPMENT_ITEMS values
(0,12,3,'Boxes',12,6,10,9.50);
INSERT into SHIPMENT_ITEMS values
(0,12,1,'Boxes',12,12,10,6.50);
INSERT into SHIPMENT_ITEMS values
(0,13,1,'Boxes',6,12,10,4.50);
INSERT into SHIPMENT_ITEMS values
(0,14,1,'Boxes',12,24,20,14.50);
INSERT into SHIPMENT_ITEMS values
(0,15,2,'Boxes',6,6,20,6.50);
INSERT into SHIPMENT_ITEMS values
(0,16,2,'Boxes',6,12,5,2.50);
INSERT into SHIPMENT_ITEMS values
(0,17,1,'Boxes',6,6,5,3.50);
INSERT into SHIPMENT_ITEMS values
(0,18,1,'Boxes',12,12,10,14.50);
INSERT into SHIPMENT_ITEMS values
(0,19,1,'Boxes',6,12,15,24.50);
INSERT into SHIPMENT_ITEMS values
(0,20,1,'Boxes',24,24,15,4.50);
INSERT into SHIPMENT_ITEMS values
(0,20,1,'Boxes',36,6,10,24.50);


INSERT into COST_TABLE values
('UPS',0,6,1,100,0.50);
INSERT into COST_TABLE values
('UPS',0,6,1,3,1.50);
INSERT into COST_TABLE values
('UPS',0,6,1,1,2.50);

INSERT into COST_TABLE values
('UPS',6,12,5,100,3.50);
INSERT into COST_TABLE values
('UPS',6,12,5,3,4.50);
INSERT into COST_TABLE values
('UPS',6,12,5,1,5.50);

INSERT into COST_TABLE values
('UPS',12,36,50,100,4.50);
INSERT into COST_TABLE values
('UPS',12,36,50,3,5.50);
INSERT into COST_TABLE values
('UPS',12,36,50,1,6.50);

INSERT into COST_TABLE values
('FEDEX',0,6,1,100,1.50);
INSERT into COST_TABLE values
('FEDEX',0,6,1,3,1.50);
INSERT into COST_TABLE values
('FEDEX',0,6,1,1,1.50);

INSERT into COST_TABLE values
('FEDEX',6,12,5,100,3.50);
INSERT into COST_TABLE values
('FEDEX',6,12,5,3,3.50);
INSERT into COST_TABLE values
('FEDEX',6,12,5,1,3.50);

INSERT into COST_TABLE values
('FEDEX',12,36,50,100,5.50);
INSERT into COST_TABLE values
('FEDEX',12,36,50,3,5.50);
INSERT into COST_TABLE values
('FEDEX',12,36,50,1,5.50);

INSERT into COST_TABLE values
('SHIPIT',12,60,100,100,5.50);
INSERT into COST_TABLE values
('SHIPIT',12,60,100,3,10.50);
INSERT into COST_TABLE values
('SHIPIT',12,60,100,1,15.50);

INSERT into COST_TABLE values
('SHIPIT',60,120,2000,100,10.00);
INSERT into COST_TABLE values
('SHIPIT',60,120,2000,3,12.00);
INSERT into COST_TABLE values
('SHIPIT',60,120,2000,1,15.00);
