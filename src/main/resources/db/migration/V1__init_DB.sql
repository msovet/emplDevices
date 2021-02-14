create sequence category_seq start 1 increment 1;
 
create sequence device_seq start 1 increment 1;
 
create sequence employee_seq start 1 increment 1;
 
create table category
(
    id   int8 not null,
    name varchar(255),
    primary key (id)
);
create table device
(
    id          int8 not null,
    given_date  varchar(255),
    name        varchar(255),
    price       int8 not null,
    category_id int8 not null,
    employee_id int8 not null,
    primary key (id)
);
create table employee
(
    id         int8 not null,
    email      varchar(255),
    first_name varchar(255),
    gender     varchar(255),
    last_name  varchar(255),
    primary key (id)
);
alter table if exists device add constraint CATEGORY_DEVICE_FK foreign key (category_id) references category;
     
alter table if exists device add constraint EMPLOYEE_DEVICE_FK foreign key (employee_id) references employee;