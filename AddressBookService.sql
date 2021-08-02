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