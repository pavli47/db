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
name TEXT,
    constraint prof
        FOREIGN KEY (author)
          REFERENCES professors(id) 
           ON DELETE cascade
           ON UPDATE cascade );

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
  CONSTRAINT test_x
  FOREIGN KEY (testid)
  REFERENCES tests(id)
   ON DELETE cascade
   ON UPDATE cascade
);

drop table if exists assignments;
create table assignements(
fromprof INT NOT NULL,
tostudent INT NOT NULL,
date DATE NOT NULL,
test INT  NOT NULL,
  assignemntid SERIAL,
  PRIMARY KEY(test , tostudent ),
  
  constraint pr
  foreign key (fromprof)
  references professors(id)
  
  foreign key (tostudent)
  references students(id)


  foreign key (test)
  referebces tests(id)
   on delete cascade
  on update cascade
  

)
  ;

drop table if exists tries; 
create table tries(
id SERIAL,
assignmentid INT,
  time timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'), 
  PRIMARY KEY(assignmentid, time),
  constraint ids
  foreign key (assignmentid)
  references assignments(assignemntid)
     on delete cascade
  on update cascade
  
  
  
  
);


drop table if exists answears ;
create table answears(
idtry INT,
  questionnumber INT,
  answer TEXT,
  PRIMARY KEY(idtry, questionnumber),
   constraint ids
  foreign key (idtry) 
  references tries(id)
     on delete cascade
  on update cascade
);


insert into students(name,lastname) values('Anna', 'Adams');
insert into students(name,lastname) values('Bruno', 'Bills');
insert into students(name,lastname) values('Charlie', 'Collins');

insert into professors(name,lastname) values('Maria', 'Moralez');
insert into students(name,lastname) values('Nina', 'Nixon');
insert into students(name,lastname) values('Oliver', 'Olsen');

insert into tests(author,name) values(1, 'Spanish Unit 1');
insert into tests(author,name) values(2, 'Slovak');
insert into tests(author,name) values(3, 'Math1');
insert into tests(author,name) values(3, 'Math2');
insert into tests(author,name) values(10, 'error');

'
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,1,'dog' , 'A', 'perro', 'caro','pero','gato');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,2,'but' , 'B', 'perro', 'pero','lero','gato');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,3,'hi' , 'C', 'perro', 'pero','hola','gato');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(2,1,'hi' , 'C', 'ale', 'nie','ahoj','gate');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(2,2,'yes' , 'A', 'ano', 'pero','nie','gate');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,1,'2+1' , 'A', '3', '4','5','6');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,2,'2*1' , 'B', '3', '2','22','6');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,3,'2/1' , 'D', '3', '4','5','2');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(14,1,'error');



insert into assignments(fromprof,tostudent,date ,test) values(1,1,'2022-12-12', 1);
insert into assignments(fromprof,tostudent,date ,test) values(1,2,'2022-12-10', 2);
insert into assignments(fromprof,tostudent,date ,test) values(2,3,'2022-11-10', 3);
insert into assignments(fromprof,tostudent,date ,test) values(3,1,'2022-11-10', 4); /*error*/
insert into assignments(fromprof,tostudent,date ,test) values(1,1,'2022-11-10', 1); /*error*/
insert into assignments(fromprof,tostudent,date ,test) values(5,1,'2022-11-10', 2); /*error*/


insert into tries(assignmentid) values(1);
insert into tries(assignmentid) values(2);
insert into tries(assignmentid) values(3);

insert into answears(idtry ,questionnumber ,answer) values(1,1,'A');
insert into answears(idtry ,questionnumber ,answer) values(1,2,'B');
insert into answears(idtry ,questionnumber ,answer) values(1,3,'C');
insert into answears(idtry ,questionnumber ,answer) values(2,1,'B');
insert into answears(idtry ,questionnumber ,answer) values(2,2,'A');
insert into answears(idtry ,questionnumber ,answer) values(3,1,'A');
insert into answears(idtry ,questionnumber ,answer) values(4); /*error*/

