drop table if exists answears ;
drop table if exists tries; 
drop table if exists assignments;
drop table if exists questions;
drop table if exists tests;
drop table if exists students;
drop table if exists professors;



create table students(
id SERIAL PRIMARY KEY ,
name TEXT NOT NULL,
lastname TEXT NOT NULL);


create table professors(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
lastname TEXT NOT NULL);

create table tests(
id SERIAL PRIMARY KEY,
author INT NOT NULL,
name TEXT,
    constraint prof
        FOREIGN KEY (author)
          REFERENCES professors(id) 
           ON DELETE cascade
           ON UPDATE cascade );


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

create table assignments(
fromprof INT NOT NULL,
tostudent INT NOT NULL,
date DATE NOT NULL,
test INT  NOT NULL,
  assignmnentid SERIAL UNIQUE NOT NULL,
  PRIMARY KEY(test , tostudent ),
  
  constraint pr
  foreign key (fromprof)
  references professors(id)
       on delete cascade
  on update cascade,
  
  constraint st
  foreign key (tostudent)
  references students(id)
       on delete cascade
  on update cascade,

   constraint tst
  foreign key (test)
  references tests(id)
   on delete cascade
  on update cascade);

create table tries(
id SERIAL  UNIQUE NOT NULL,
assignmentid integer NOT NULL,
  time timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'), 
  
  constraint ids
  foreign key (assignmentid)
  references assignments(assignmnentid)
     on delete cascade
  on update cascade,
  PRIMARY KEY(assignmentid, time)
 );


create table answears(
idtry INT NOT NULL,
  questionnumber INT NOT NULL,
  answer TEXT NOT NULL,
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
insert into professors(name,lastname) values('Nina', 'Nixon');
insert into professors(name,lastname) values('Oliver', 'Olsen');

insert into tests(author,name) values(1, 'Spanish Unit 1');
insert into tests(author,name) values(2, 'Slovak');
insert into tests(author,name) values(3, 'Math1');
insert into tests(author,name) values(3, 'Math2');
insert into tests(author,name) values(10, 'error');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,1,'dog' , 'A', 'perro', 'caro','pero','gato');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,2,'but' , 'B', 'perro', 'pero','lero','gato');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(1,3,'hi' , 'C', 'perro', 'pero','hola','gato');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(2,1,'hi' , 'C', 'ale', 'nie','ahoj','gate');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(2,2,'yes' , 'A', 'ano', 'pero','nie','gate');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,1,'2+1' , 'A', '3', '4','5','6');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,2,'2*1' , 'B', '3', '2','22','6');
insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(3,3,'2/1' , 'D', '3', '4','5','2');

insert into questions(testid,questionnumber,question,correct,A,B,C,D) values(14,1,'error','','','','','');



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
insert into answears(idtry ,questionnumber ,answer) values(4,1,'A'); /*error*/

/*vymazat test 1   --- >vymaze sa aj z assignemnts aj tries aj answears */
delete from tests where id= 1;
ere id= 1;

 alter table assignments add column deadline TIMESTAMP check(deadline> current_timestamp AT TIME ZONE 'UTC');
 
 /*student moze test odovzdat aj neskor, pri hodnoteni bude treba skontrolovat di to bolo v deadline  */

 alter table assignments add column deadline TIMESTAMP check(deadline> current_timestamp AT TIME ZONE 'UTC');
 
 /*student moze test odovzdat aj neskor, pri hodnoteni bude treba skontrolovat di to bolo v deadline  */
