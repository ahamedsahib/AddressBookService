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