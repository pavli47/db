DROP TABLE IF EXISTS student;

CREATE TABLE student(
student_id SERIAL PRIMARY KEY,
meno TEXT  NOT NULL,
priezvisko TEXT NOT NULL,
pohlavie TEXT CHECK(pohlavie in ('Ž','M' , 'nebinárny','neuvedené' ) ),
trieda TEXT NOT NULL,
datum_nar DATE CHECK(datum_nar between '1990-01-01' and '2022-01-01')
);

DROP TABLE IF EXISTS ucitel;
CREATE TABLE ucitel (
ucitel_id SERIAL PRIMARY KEY,
meno TEXT NOT NULL,
priezvisko TEXT NOT NULL,
pohlavie TEXT CHECK(pohlavie in ('Ž','M' , 'nebinárny','neuvedené' ))) ;

DROP TABLE IF EXISTS predmety;
CREATE TABLE predmety(
predmet TEXT PRIMARY KEY NOT NULL,
cely_nazov TEXT);

DROP TABLE IF EXISTS znamky;
CREATE TABLE znamky(
id SERIAL PRIMARY KEY,
znamka TEXT NOT NULL, 
student_id INT NOT NULL,
ucitel_id INT NOT NULL,
predmet TEXT NOT NULL,
cas TIME,
datum DATE CHECK(datum between  '1990-01-01' and '2022-01-01'),
pozn TEXT,
vaha FLOAT NOT NULL, 
CONSTRAINT fk_student
	FOREIGN KEY(student_id)
		REFERENCES student(student_id)
			ON DELETE  CASCADE
			ON UPDATE CASCADE,
CONSTRAINT fk_ucitel
	FOREIGN KEY(ucitel_id)
		REFERENCES ucitel(ucitel_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
CONSTRAINT fk_predmet
	FOREIGN KEY(predmet)
		REFERENCES predmety(predmet)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

DROP TABLE IF EXISTS triedy;
CREATE TABLE triedy(
trieda TEXT NOT NULL,
predmet TEXT NOT NULL, 
UNIQUE(trieda,predmet),
PRIMARY KEY (trieda,predmet));


INSERT INTO student(meno,priezvisko,pohlavie,trieda,datum_nar) VALUES('Anna', 'Abová', 'Ž', '1.A', '2004-12-12');
INSERT INTO student(meno,priezvisko,pohlavie,trieda,datum_nar) VALUES('Bruno', 'Bell', 'M', '2.B', '2004-11-01');
INSERT INTO student(meno,priezvisko,pohlavie,trieda,datum_nar) VALUES('Cecil', 'Cinkota', 'M', '3.C', '2003-05-28');
INSERT INTO student(meno,priezvisko,pohlavie,trieda,datum_nar) VALUES('Diana', 'Držková', 'Ž', '1.A', '2004-08-20');

INSERT INTO ucitel(meno,priezvisko,pohlavie) VALUES('Žaneta', 'Žilková', 'Ž');
INSERT INTO ucitel(meno,priezvisko,pohlavie) VALUES('Xénia', 'Xindl', 'Ž');
INSERT INTO ucitel(meno,priezvisko,pohlavie) VALUES('William', 'Willis', 'M');
INSERT INTO ucitel(meno,priezvisko,pohlavie) VALUES('Viktor', 'Vanek', 'M');

INSERT INTO predmety VALUES('MAT','Matematika');
INSERT INTO predmety VALUES('ENG','Angličtina');
INSERT INTO predmety VALUES('SJL','Slovenčina');


INSERT INTO znamky(znamka,student_id,ucitel_id,predmet,cas,datum,pozn, vaha) VALUES ('1',1, 1, 'MAT',  '13:30', '2021-12-19', 'uloha', 1);
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet,cas,datum,pozn, vaha) VALUES('1',1, 2, 'SJL',  '12:30', '2021-12-18', 'pisomka', 2);
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet,cas,datum,pozn, vaha) VALUES('1',2, 1, 'MAT',  '12:00', '2021-12-17', 'test', 2);
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet,cas,datum,pozn, vaha) VALUES('4',3, 3, 'ENG',  '08:30', '2021-12-11', 'test', 2);
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet,cas,datum,pozn, vaha) VALUES('pochvala',3, 3, 'ENG',  '09:30', '2021-12-11', 'konverzácia', 0.5);

INSERT INTO triedy  VALUES('1.A', 'MAT');
INSERT INTO triedy  VALUES('1.A', 'SJL');

INSERT INTO triedy VALUES('2.B', 'ENG');
INSERT INTO triedy VALUES('2.B', 'MAT');
INSERT INTO triedy VALUES('2.B', 'SJL');

INSERT INTO triedy VALUES('3.C', 'ENG');
INSERT INTO triedy VALUES('3.C', 'MAT');
INSERT INTO triedy VALUES('3.C', 'SJL');

 /* 3 */
ALTER TABLE student ADD prihlasovacie_meno TEXT;
ALTER TABLE ucitel ADD prihlasovacie_meno TEXT;

CREATE  UNIQUE INDEX ind ON student(lower(student.prihlasovacie_meno));  
CREATE  UNIQUE INDEX ind2 ON  ucitel(lower(ucitel.prihlasovacie_meno));  

 /* 4 */
 
ALTER TABLE student ADD pozn jsonb;
update student set pozn = '{"porucha":"dyslexia"}'::jsonb where student_id =1;
SELECT meno, priezvisko from student where pozn ->>'porucha' = 'dyslexia';

UPDATE student SET prihlasovacie_meno = 'annaab' where student_id =1;
UPDATE student SET prihlasovacie_meno = 'brunob' where student_id =2;
UPDATE student SET prihlasovacie_meno = 'cecilc' where student_id =3;
UPDATE student SET prihlasovacie_meno = 'dianad' where student_id =4;


UPDATE ucitel SET prihlasovacie_meno = 'zanetaz' where ucitel_id =1;
UPDATE ucitel SET prihlasovacie_meno = 'xeniax' where ucitel_id =2;
UPDATE ucitel SET prihlasovacie_meno = 'wiliamw' where ucitel_id =3;
UPDATE ucitel SET prihlasovacie_meno = 'viktorv' where ucitel_id =4;


/*kontroly constraints*/
INsert INTO triedy values('1.A', 'MAT');
INSERT INTO student values(5,'Maria', 'Minariková', 'ano','4.S', '1900-01-01');
UPDATE  student  set pohlavie = 'lol' where meno = 'Anna';
INSERT INTO student values(5,NULL, 'Minariková', 'Ž','4.S', '1900-01-01');
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet, vaha) values('1',8,1,'ENG',1);
INSERT INTO znamky(znamka,student_id,ucitel_id,predmet, vaha) values('1',1,1,'DEJ',1);
delete from predmety where predmet = 'ENG';

UPDATE znamky set ucitel_id = 2 where ucitel_id = 1;
DELETE from ucitel where ucitel_id = 1;
DELETE from ucitel where ucitel_id = 2;







