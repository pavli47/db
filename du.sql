drop view if exists view1;
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
date timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'), 
test INT  NOT NULL,
  assignmentid SERIAL UNIQUE NOT NULL,
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
	scores float,
	scored text,
  time timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'), 
  
  constraint ids
  foreign key (assignmentid)
  references assignments(assignmentid)
     on delete cascade
  on update cascade,
  PRIMARY KEY(assignmentid, time)
 );


create table answears(
idtry INT NOT NULL,
id SERIAL PRIMARY KEY ,
  questionnumber INT NOT NULL,
  answer TEXT NOT NULL,

  constraint ids
  foreign key (idtry) 
  references tries(id)
     on delete cascade
  on update cascade
);




insert into students(name,lastname) values('Anna', 'Adams');
insert into students(name,lastname) values('Bruno', 'Bills');
insert into students(name,lastname) values('Charlie', 'Collins');
insert into students(name,lastname) values('Diana', 'Dean');

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
insert into assignments(fromprof,tostudent,date ,test) values(3,1,'2022-11-10', 4); 

insert into assignments(fromprof,tostudent,date ,test) values(1,3,'2022-12-12', 1);

insert into assignments(fromprof,tostudent,date ,test) values(1,4,'2022-12-12', 2);

insert into assignments(fromprof,tostudent,date ,test) values(1,1,'2022-11-10', 1); /*error*/
insert into assignments(fromprof,tostudent,date ,test) values(5,1,'2022-11-10', 2); /*error*/


insert into tries(assignmentid) values(1);
insert into tries(assignmentid) values(2);
insert into tries(assignmentid) values(3);
insert into tries(assignmentid) values(1);
insert into tries(assignmentid) values(5);
insert into tries(assignmentid) values(6);


insert into answears(idtry ,questionnumber ,answer) values(1,1,'A');
insert into answears(idtry ,questionnumber ,answer) values(1,2,'B');
insert into answears(idtry ,questionnumber ,answer) values(1,3,'C');

insert into answears(idtry ,questionnumber ,answer) values(2,1,'B');
insert into answears(idtry ,questionnumber ,answer) values(2,2,'A');
insert into answears(idtry ,questionnumber ,answer) values(3,1,'A');

insert into answears(idtry ,questionnumber ,answer) values(4,1,'A'); 
insert into answears(idtry ,questionnumber ,answer) values(4,1,'D'); /*error, nemoze menit odpoved*/
insert into answears(idtry ,questionnumber ,answer) values(4,2,'D');

insert into answears(idtry ,questionnumber ,answer) values(5,1,'A');
insert into answears(idtry ,questionnumber ,answer) values(5,2,'B');
insert into answears(idtry ,questionnumber ,answer) values(5,3,'B');


insert into answears(idtry ,questionnumber ,answer) values(6,1,'C');
insert into answears(idtry ,questionnumber ,answer) values(6,2,'A');



/*vymazat test 1   --- >vymaze sa aj z assignemnts aj tries aj answears */
/*delete from tests where id= 1;*/




 alter table assignments add column deadline TIMESTAMP check(deadline> current_timestamp AT TIME ZONE 'UTC');
 
 /*student moze test odovzdat aj neskor, pri hodnoteni bude treba skontrolovat di to bolo v deadline  */
 
 
 
 
 
 
 create view view1 as 

select name,lastname,test,date ,time, score, answeared from( select s.name, s.lastname,t.name as test, a.date, tr.time,tr.id from
	students s inner join  assignments a on a.tostudent = s.id
	inner join tests t on t.id = a.test 
	left join  tries tr on tr.assignmentid = a.assignmentid where not exists(select 1 from tries t2 where tr.assignmentid = t2.assignmentid and t2.time> tr.time) ) as tab
left join   /*pocet zodpovedanych*/
	(select idtry,  count(idtry) as answeared from answears  group by idtry) as  tab2 on tab.id = tab2.idtry 

left join    /*skore*/
(select idtry, cast(correct as float) / (cast(allq as float) /100) as score from

 (select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo  
right join 
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner  join assignments ass on ass.assignmentid  = t.assignmentid inner join  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber and correct = answer group by idtry , ass.test  

) as boo

 on foo.testid = boo.test) as tab3 on tab2.idtry = tab3.idtry  ; 
 
 


/*vytvorenie atributov scores a scored*/
update tries t2 set scores = (select  cast(correct as float) / (cast(allq as float) /100)  from

 (select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo  
right join 
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner  
  join assignments ass on ass.assignmentid  = t.assignmentid inner join 
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber 
  and correct = answer where t2.id = t.id group by idtry , ass.test  ) as boo on foo.testid = boo.test  );

update tries t2 set scored = (select  concat(cast(correct as text) ,'/', cast(allq as float))  from
(select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo
right join
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner
  join assignments ass on ass.assignmentid  = t.assignmentid inner join
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber 
  and correct = answer where t2.id = t.id group by idtry , ass.test  ) as boo on foo.testid = boo.test  );


/*pridanie a zmenenie odpovede*/

create or replace function put_score()
returns TRIGGER
language plpgsql
as
$$
begin update tries t set scores = (select  cast(correct as float) / (cast(allq as float) /100)  from

 (select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo  
right join 
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner  
  join assignments ass on ass.assignmentid  = t.assignmentid inner join 
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber 
  and correct = answer where an.idtry = NEW.idtry group by idtry , ass.test  ) as boo on foo.testid = boo.test  ) where t.id = NEW.idtry ; 
 
 update tries t set scored = (select  concat(cast(correct as text) ,'/', cast(allq as float))  from
(select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo
right join
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner
  join assignments ass on ass.assignmentid  = t.assignmentid inner join
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber
  and correct = answer where an.idtry = new.idtry group by idtry , ass.test
) as boo on foo.testid = boo.test  ) where t.id = new.idtry ;
RETURN NULL;
END;
$$;
drop trigger  if exists s_update on answears;
create trigger s_update after insert or update on answears for each row execute procedure put_score();



/*odstranenie odpovede*/
create or replace function del_score()
returns TRIGGER
language plpgsql
as
$$
begin 

update tries t set scores = (select  cast(correct as float) / (cast(allq as float) /100)  from

 (select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo
right join
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner
  join assignments ass on ass.assignmentid  = t.assignmentid inner join
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber
  and correct = answer where an.idtry = old.idtry group by idtry , ass.test
) as boo on foo.testid = boo.test  ) where t.id = old.idtry ;

update tries t set scored = (select  concat(cast(correct as text) ,'/', cast(allq as float))  from
(select count(testid) as allq, testid  from questions natural join tests where tests.id = testid group by  testid
) as foo
right join
 ( select an.idtry , count(*) as correct, ass.test  from  tries  t inner join answears an on an.idtry = t.id inner
  join assignments ass on ass.assignmentid  = t.assignmentid inner join
  questions q on q.testid = ass.test and q.questionnumber = an.questionnumber
  and correct = answer where an.idtry = old.idtry group by idtry , ass.test
) as boo on foo.testid = boo.test  ) where t.id = old.idtry ;

RETURN NULL;END;
$$;

drop trigger  if exists s_del on answears;
create trigger s_del after delete on answears for each row execute procedure del_score();







 
 
