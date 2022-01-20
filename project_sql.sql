create database project1


--login signup
create table login(id int not null primary key identity, emailid nvarchar(40),password nvarchar(20))


create table signup(id int not null primary key identity, name nvarchar(40), empid nvarchar(40),
 mobileno nvarchar(15),dob date,emailid nvarchar(40),password nvarchar(20),
 confirmpassword nvarchar(20),securityquestion nvarchar(100),securityanswer nvarchar(100))

update signup set dob='1999-03-28' where empid=1003

 create table forgot(id int not null primary key identity, emailid nvarchar(40),
 securityquestion nvarchar(100),securityanswer nvarchar(100),newpassword nvarchar(20),
 confirmpassword nvarchar(20))

 drop table signup
 drop table forgot

 select * from signup
 select * from login
 select * from forgot



 --registeration form
 create table department(
id int identity,
dept_id int primary key,
dept_name nvarchar(20)
)
insert into department values(101,'Advisory'),(102,'Audit'),(103,'Tax'),(104,'Consulting')
select * from department

create table basic(

empid int primary key,
empname nvarchar(20),
emptype nvarchar(20),
deptid int foreign key references department(dept_id),
dob date,
email nvarchar(20),
mobile nvarchar(20),
address nvarchar(20),
dateofjoin date,
gender varchar(20),
emp_photo_path varchar(max)
)


create table education(
id int primary key identity,
empid int foreign key references basic(empid),
Tenth_percentage nvarchar(20),
Tenth_yop int,
Twelfth_percentage nvarchar(20),
Twelfth_yop int,
UG_percentage nvarchar(20),
UG_yop int,
PG_percentage nvarchar(20),
PG_yop nvarchar(20)
)

create table work
(id int primary key identity,
empid int foreign key references basic(empid),
previous_emp_comp_name nvarchar(10),
year_exp nvarchar(20),
work_domain nvarchar(20),
)


create table skills
(id int primary key identity,
empid int foreign key references basic(empid),
primary_skills nvarchar(20),
other_skills nvarchar(20)
)


select * from department
select * from basic
select * from education
select * from work
select * from skills
update work set year_exp='NIL' where empid=1005
create table leave(
id int primary key identity(1,1),
empid int foreign key references basic(empid),
typeofleave varchar(250),
startdate date,
enddate date,
comments nvarchar(250),
ApplyforLeave nvarchar(50))

create table raise
(id int primary key identity(1,1),
empid int foreign key references basic(empid),
 curloc varchar(250),
 precontim varchar(250),
 shortdes nvarchar(500),
 des nvarchar(1000))

 select * from leave
 select * from raise



 -- Creating RoleMaster Table
CREATE TABLE RoleMaster
(
userid INT PRIMARY KEY IDENTITY(1,1),
RollName VARCHAR(50)
)
-- Creating User Roles Mapping table
CREATE TABLE UserRolesMapping
(
ID INT PRIMARY KEY,
UserID INT NOT NULL,
RoleID INT NOT NULL,
)
-- Adding Foreign KeyS
ALTER TABLE UserRolesMapping
ADD FOREIGN KEY (UserID) REFERENCES signup(id);
ALTER TABLE UserRolesMapping
ADD FOREIGN KEY (RoleID) REFERENCES RoleMaster(userid);




insert into RoleMaster values('Manager'),('Admin'),('Employee')
insert into UserRolesMapping values (1,1,1),(2,2,2),(3,3,3)

select * from signup
select * from RoleMaster
select * from UserRolesMapping



--Reimbursement table
create table reimburse
(id int primary key identity(1,1),
empid int foreign key references basic(empid),
ct varchar(250),
bno int,
bd date,
bamnt int,
gstamnt int,
baamnt int,
remarks varchar(100),
segstin int)

select * from reimburse
update reimburse set ct='Mobile Phone' where empid=1001