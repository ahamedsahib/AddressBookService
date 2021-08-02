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
('Ahamed','Sahib','Dehiwala','Colombo','Srilanka',6062,9876543210,'asdf@gmail.com'),
('george','paul','Broadway','chennai','TN',600001,9852343210,'geor@gmail.com'),
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

