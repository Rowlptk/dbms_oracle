create table employee
(
    first_name varchar(15),
    mid_name char(2),
    last_name varchar(15),
    SSN_number char(9),
    birthday date,
    address varchar(50),
    sex char(1),
    salary number(7),
    supervisor_SSN char(9),
    department_number number(5)
);

create table department
(
    department_name varchar(15),
    department_number number(5),
    manager_SSN char(9),
    manager_start_date date
);

create table project
(
    project_name varchar(15),
    project_number number(5),
    project_location varchar(15),
    department_number number(5)
);

insert into Employee values 
('Doug', 'E', 'Gilbert', 123, '09-JUN-1968', 'Chennai', 'M', 80000, null, 1);
insert into Employee values 
('Joyce', '', 'PAN', 124, '07-FEB-1973', 'Vellore', 'F', 70000, null, 1);
insert into Employee values 
('Frankin', 'T', 'Wong', 125, '08-DEC-1972', 'Delhi', 'M', 40000, 123, 2);
insert into Employee values 
('Jennifer', 'S', 'Wallace', 564, '20-JUN-1983', 'Chennai', 'F', 43000, 123, 2);
insert into Employee values 
('John', 'B', 'Smith', 678, '09-JAN-1987', 'Madurai', 'M', 30000, 124, 1);
insert into Employee values 
('Ramesh', 'K', 'Narayan', 234, '15-SEP-1985', 'Bangalore', 'M', 38000, 124, 3);

insert into department values('Administration', 2, 564, '03-Jan-2012');
insert into department values('Headquarter', 1, 678, '16-Dec-2014');
insert into department values('Finance', 3, 234, '18-May-2013');
insert into department values('IT', 4, 123, '12-Jun-2015');

insert into project values('ProjectA', 3388, 'Delhi', 1);
insert into project values('ProjectB', 1945, 'Hyderabad', 1);
insert into project values('ProjectC', 6688, 'Chennai', 2);
insert into project values('ProjectD', 2423, 'Chennai', 2);
insert into project values('ProjectE', 7745, 'Bangalore', 3);

select * from employee;

select first_name, last_name, SSN_number, supervisor_SSN from employee;

select first_name, last_name from employee where birthday='20-JUN-1983';

select distinct salary from employee;

select Manager_SSN, Manager_start_date from department 
where department_name = 'Finance';

update employee
set department_number = 5
where first_name = 'Joyce';

select * from employee;

alter table department add DepartmentPhoneNum Number(10);

select * from department;

update department
set DepartmentPhoneNum = 1234567890;

select * from department;

alter table department modify DepartmentPhoneNum Number(12);

alter table department rename column DepartmentPhoneNum to PhNo

select * from department

rename department to DEPT

select * from dept

alter table DEPT drop column PhNo

select * from dept

create table copyOfDept as select * from dept

select * from copyOfDept

delete from copyOfDept

select * from copyOfDept

drop table copyOfDept

rename dept to department


select * from USER_CONSTRAINTS where TABLE_NAME = 'EMPLOYEE';

alter table employee modify (first_name varchar(15) constraint con_notnull not null);
alter table employee modify (last_name varchar(15) constraint con_notnull2 not null);
alter table employee add constraint con_pk1 primary key(SSN_number);
alter table employee add constraint con_in1 check(Sex in ('M', 'F', 'm', 'f'));
alter table employee modify (salary Number(7) constraint con_notnull3 not null);
alter table employee modify salary default (800);
alter table employee add constraint con_fk1 foreign key (SUPERVISOR_SSN) references employee(SSN_NUMBER) on delete set null;

select * from USER_CONSTRAINTS where TABLE_NAME = 'EMPLOYEE';

alter table employee add constraint con_fk2 foreign key (DEPARTMENT_NUMBER) references department(DEPARTMENT_NUMBER) on delete cascade;

alter table department add constraint con_pk2 primary key(DEPARTMENT_NUMBER);

alter table employee add constraint con_fk2 foreign key (DEPARTMENT_NUMBER) references department(DEPARTMENT_NUMBER) on delete cascade;

select * from department
select * from employee

update employee
set department_number = null
where department_number > 4;

alter table employee add constraint con_fk2 foreign key (DEPARTMENT_NUMBER) references department(DEPARTMENT_NUMBER) on delete cascade;

select * from USER_CONSTRAINTS where TABLE_NAME = 'EMPLOYEE';

alter table department modify (DEPARTMENT_NAME varchar(15) constraint con_notnull4 not null);
alter table department add constraint con_fk3 foreign key (MANAGER_SSN) references employee(SSN_NUMBER) on delete set null;

select * from USER_CONSTRAINTS where TABLE_NAME = 'DEPARTMENT';

create table dept_locations
(
   dep_no Number(5),
   dep_loc varchar(15),
   constraint con_fk4 foreign key(dep_no)
   references department(DEPARTMENT_NUMBER)
   on delete cascade
)

select * from USER_CONSTRAINTS where TABLE_NAME = 'DEPT_LOCATIONS';

alter table project modify (PROJECT_NAME varchar2(15) constraint con_notnull5 not null);
alter table project add constraint con_pk3 primary key(PROJECT_NUMBER);
alter table project add constraint con_fk5 foreign key (DEPARTMENT_NUMBER) references department(DEPARTMENT_NUMBER) on delete set null;

select * from USER_CONSTRAINTS where TABLE_NAME = 'PROJECT';

create table works_on 
(
   employee_SSN char(9),
   project_no number(5),
   hours decimal(3,1) not null,
   primary key(employee_SSN, project_no),
   foreign key(employee_SSN) references employee(SSN_NUMBER)
   on delete cascade,
   foreign key(project_no) references project(PROJECT_NUMBER)
   on delete cascade
)

select * from USER_CONSTRAINTS where TABLE_NAME = 'WORKS_ON';

create table dependent
(
  employee_SSN char(9),
  depn_name varchar(15),
  sex char(1) check(sex in('M','F','m','f')),
  birthday date,
  relationship varchar(8),
  primary key(employee_SSN, depn_name),
  foreign key(employee_SSN) references employee(SSN_NUMBER)
  on delete cascade
)


select * from USER_CONSTRAINTS where TABLE_NAME = 'DEPENDENT';

insert into department values('Production', 5, 125, '29-SEP-21')  

select * from department

insert into dept_locations values(1, 'Houston')
insert into dept_locations values(1, 'Chicago')
insert into dept_locations values(2, 'New York')
insert into dept_locations values(2, 'San Francisco')
insert into dept_locations values(3, 'Salt Lake City')
insert into dept_locations values(4, 'Stafford')
insert into dept_locations values(4, 'Bellaire')
insert into dept_locations values(5, 'Sugarland')
insert into dept_locations values(5, 'Houston')

select * from dept_locations

insert into employee values('Robert', 'D', 'Junior', 123456789, '04-APR-65', 'West Burbank CA 91506, USA', 'M', 90000, 123, 5);
insert into employee values('Chris', '', 'Evans', 666884444, '13-JUN-81', 'Beverly Hills, CA 90212, USA', 'M', 91000, 123456789, 5);
insert into employee values('Chris', '', 'Hemsworth', 453453453, '11-AUG-83', '9255 W Sunset Blvd, USA', 'M', 92000, 666884444, 1);
insert into employee values('Elizabeth', '', 'Olsen', 333445555, '16-FEB-89', 'Sherman Oaks, California, USA.', 'F', 93000, 453453453, 1);
insert into employee values('Scarlett', '', 'Johansson', 999887777, '22-NOV-84', 'Manhattan, New York City, USA', 'F', 94000, 123456789, 1);
insert into employee values('Mark ', 'A', 'Ruffalo', 543216789, '22-NOV-67', 'Beverly Hills, USA', 'M', 89000, 453453453, 2);
insert into employee values('Tom', '', 'Hiddleston', 554433221, '09-FEB-81', 'Beverly Hills, USA', 'M', 88000, null, 2);

select * from employee

insert into project values('ProjectF', 77, 'Mumbai', 5)
insert into project values('ProjectG', 22, 'Sikkim', 5)
insert into project values('ProjectH', 43, 'Pune', 4)
insert into project values('ProjectI', 1, 'Patna', 3)
insert into project values('ProjectG', 12, 'Chandigarh', 3)

select * from project

insert into works_on values(123456789, 3388, 32.5)
insert into works_on values(123456789, 1945, 7.5)
insert into works_on values(666884444, 3388, 40.0)
insert into works_on values(453453453, 77, 20.0)
insert into works_on values(453453453, 22, 20.0)
insert into works_on values(333445555, 77, 10.0)
insert into works_on values(333445555, 6688, 10.0)
insert into works_on values(333445555, 43, 35.0)
insert into works_on values(333445555, 22, 28.5)
insert into works_on values(999887777, 1, 11.5)
insert into works_on values(999887777, 12, 13.0)
insert into works_on values(543216789, 22, 17.0)
insert into works_on values(554433221, 1945, 21.5)


select * from works_on

insert into employee values('Tom', '', 'Holland', 987654321, '01-JUN-96', 'Beverly Hills, USA', 'M', 87000, 333445555, 3);

select * from employee

insert into dependent values(333445555, 'Alice', 'F', '05-Apr-76', 'Daughter')
insert into dependent values(333445555, 'Theodore', 'M', '25-Oct-73', 'Son')
insert into dependent values(333445555, 'Joy', 'F', '03-May-48', 'Spouse')
insert into dependent values(987654321, 'Abner', 'M', '29-Feb-32', 'Spouse')
insert into dependent values(123456789, 'Alice', 'F', '31-Dec-78', 'Daughter')
insert into dependent values(123456789, 'Elizabeth', 'F', '05-may-57', 'Spouse')

select * from dependent

insert into employee values('Robert', 'F', 'Scott', '943775543', '21-JUN-42', '2365 Newcastle Rd, Bellaire, TX', 'M', 58000, '888665555', 1)

select * from employee

select * from works_on

insert into works_on values(677678989, null, 40.0)

select * from USER_CONSTRAINTS where TABLE_NAME = 'WORKS_ON';

insert into dependent values(453453453, 'John', 'M', '12-DEC-60', 'SPOUSE')

select * from dependent

delete from works_on where EMPLOYEE_SSN = 333445555

select * from works_on

select * from department

update department
set MANAGER_SSN = 123456789,
MANAGER_START_DATE = '01-OCT-88'
where DEPARTMENT_NUMBER	= 5

select * from department

select * from USER_CONSTRAINTS where TABLE_NAME = 'EMPLOYEE';

select * from USER_CONS_COLUMNS where TABLE_NAME = 'EMPLOYEE' and COLUMN_NAME = 'SUPERVISOR_SSN'

alter table EMPLOYEE drop constraint CON_FK1;

alter table employee add constraint new_fk1 foreign key (SUPERVISOR_SSN) references employee(SSN_NUMBER) on delete set null;

select * from USER_CONS_COLUMNS where TABLE_NAME = 'EMPLOYEE' and COLUMN_NAME = 'SUPERVISOR_SSN'


select * from project

alter table project add constraint project_unique UNIQUE (PROJECT_NAME)

select * from USER_CONS_COLUMNS where TABLE_NAME = 'PROJECT' and COLUMN_NAME = 'PROJECT_NAME'

select * from employee

select * from USER_CONS_COLUMNS where TABLE_NAME = 'EMPLOYEE' and COLUMN_NAME = 'SEX'

alter table employee modify (sex constraint sex_notnull not null);

select * from USER_CONS_COLUMNS where TABLE_NAME = 'EMPLOYEE' and COLUMN_NAME = 'SEX'
