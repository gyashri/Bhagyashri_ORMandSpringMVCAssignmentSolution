create database CustomerRelationshipManagementCRUD;
use CustomerRelationshipManagementCRUD;

 create table customer (CustId Int Primary Key AUTO_increment,
 FirstName varchar(100), LastName varchar(100), Email varchar(100));

insert into customers(FirstName, LastName, Email) values("MM","ss","ms@xyz.com");
select * from customers;