--------UC1 Create Database---------
create database AddressBookService;

--------UC2 Create Table --------
create table Address_Book(
FirstName varchar(20) not null,
LastName varchar(20),
address varchar(100),
City varchar(20),
StateName varchar(25),
ZipCode int,
Phonenum bigint,
EmailId varchar(20)
);

----------UC3 Insert data-----
Insert into Address_Book values
('Ahamed','Sahib','broadway','chennai','TN',600001,9876543210,'asd@gmail.com'),
('ashfaq','mj','beruwala','Colombo','Srilanka',6001,98523210,'ashf@gmail.com'),
('Surya','S','Parrys','chennai','TN',603002,9876145210,'surya@gmail.com'),
('Mohideen','Abdul','Hossur','Banglore','karnataka',56872,983242210,'mohasd@gmail.com');

-----------UC4 Update Contact---------
update Address_Book set EmailId='suri@mail.com' where FirstName='Surya';

select * from Address_Book;

------------UC5 Delete Person -------------
delete from Address_Book  where FirstName='Surya';

--------UC6 Retrieve data by City or state------------
select * from Address_Book where City='chennai' or StateName='TN';

---------UC7 Count rows-------
select count(City) from Address_Book;

----------UC8 Sort Alphabetical--------
select * from Address_Book where City='chennai' order by FirstName asc ;

---------UC9 AddressBook type and Relation type------------
alter table Address_Book add 
AddressBookName varchar(50),RelationType varchar(20);

update  Address_Book set AddressBookName='MyFamily' , RelationType = 'Family' 
where City='Colombo';

update  Address_Book set AddressBookName='FriendsCircle' , RelationType = 'Friends' 
where FirstName ='george' or FirstName='mike';

update  Address_Book set AddressBookName='CompanyCos' , RelationType = 'Profession' 
where FirstName ='jhon' or FirstName='Mohideen';

--------UC10 Count by Type------------
Select  RelationType,count(*)as TotalCount  from Address_Book group by RelationType;

Select AddressBookName,count(*)as CountType from Address_Book group by AddressBookName;
 
 ---ER Diagram(Normalization)---------------
 
 ---create AddressBook Table
 CREATE TABLE AddressBook(
	AddressBookId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookName VARCHAR(30)
);
--Create Persons Table
CREATE TABLE PersonTypes(
	PersonTypeId INT IDENTITY(1,1) PRIMARY KEY,
	PersonType varchar(50)
);

--Create Table Persons
CREATE TABLE Person(
	PersonId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookId INT FOREIGN KEY REFERENCES AddressBook(AddressBookId),
	PersonTypeId INT  FOREIGN KEY REFERENCES PersonTypes(PersonTypeId),
	FirstName varchar(30),
	LastName varchar(30),
	Address varchar(30),
	City varchar(30),
	StateName varchar(30),
	ZipCode int,
	PhoneNumber bigint,
	EmailId varchar(30)
);


--------------------------------------------------------
--Insert Values into address books
INSERT INTO AddressBook VALUES ('Native'),('City');

SELECT * FROM AddressBook;

--Insert values in persons type
INSERT INTO PersonTypes VALUES ('Family'),('Friend'),('Profession');
SELECT * FROM PersonTypes;


---Insert Values into Persons
INSERT INTO Person VALUES 
(1,1,'dhoni','MS','Parrys','Chennai','TN',600062,9876543210,'dhoni@yahoo.com'),
(1,2,'Kholi','Virat','kottayam','Kochin','Kerala',602536,9985543210,'virat@yahoo.com'),
(2,3,'Ricky','Ponting','Adyar','Chennai','TN',674536,9985595210,'ricky@yahoo.com'),
(1,2,'Pollard','Kiren','kollam','thrivanduram','Kerala',602536,9985543210,'poll@yahoo.com');
SELECT * FROM Person;


-----------------------------------------------------------------------------
--Retrive All Data---
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = p.PersonTypeId;

-------------------------------------------------------------------
--Retrieve based on city and state--
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId AND (p.City='Chennai' OR p.StateName='TN')
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = p.PersonTypeId;

---------------------------------------------------------------------------
--Sort based on first name
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = p.PersonTypeId ORDER BY p.FirstName ;
------------------------------------------------------------------------------
--Retreive based on person types---
SELECT COUNT(p.PersonTypeId) as Count,pt.PersonType FROM
Person AS p 
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = p.PersonTypeId GROUP BY p.PersonTypeId,pt.PersonType;