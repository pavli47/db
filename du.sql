drop table if exists students;
create table students(
id SERIAL PRIMARY KEY ,
name TEXT NOT NULL,
lastname TEXT NOT NULL);

drop table if exists professors;
create table professors(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
lastname TEXT NOT NULL);

drop table if exists tests;
create table tests(
id SERIAL PRIMARY KEY,
author INT NOT NULL,
name TEXT);

drop table  if exists questions;
create table questions(
testid INT,
questionnumber INT,
question TEXT NOT NULL,
correct TEXT NOT NULL,
A TEXT,
B TEXT,
C TEXT,
D TEXT,
PRIMARY KEY(testid, questionnumber),
);

drop table if exists assignments;
create table assignements(
from INT NOT NULL,
to INT NOT NULL,
date DATE NOT NULL,
test INT  NOT NULL,
PRIMARY KEY(test , to ));

drop table if exists tries; 
create table tries(
id SERIAL PRIMARY KEY,
assignmentid INT,
date DATE,
answers jsonb);

insert into students values("Anna", "Adams");
insert into students values("Bruno", "Bills");
insert into students values("Charlie", "Collins");

insert into professors values("Maria", "Moralez");
insert into students values("Nina", "Nixon");
insert into students values("Oliver", "Olsen");

insert into tests values(1, "Spanish Unit 1");
insert into tests values(2, "Slovak");
insert into tests values(3, "Math1");
insert into tests values(3, "Math2");
insert into tests values(10, "error");


insert into questions(1,1,"dog" , "A", "perro", "caro","pero","gato");
insert into questions(1,2,"but" , "B", "perro", "pero","lero","gato");
insert into questions(1,3,"hi" , "C", "perro", "pero","hola","gato");
insert into questions(2,1,"hi" , "C", "ale", "nie","ahoj","gate");
insert into questions(2,2,"yes" , "A", "ano", "pero","nie","gate");
insert into questions(3,1,"2+1" , "A", "3", "4","5","6");
insert into questions(3,2,"2*1" , "B", "3", "2","22","6");
insert into questions(3,3,"2/1" , "D", "3", "4","5","2");
insert into questions(14,1,"error");




