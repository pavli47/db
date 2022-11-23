DROP TABLE IF EXISTS student;
CREATE TABLE student(
id INT,
meno TEXT,
priezvisko TEXT,
pohlavie TEXT,
trieda TEXT,
datum_nar DATE
);

DROP TABLE IF EXISTS ucitel;
CREATE TABLE ucitel (
id INT,
meno TEXT,
priezvisko TEXT,
pohlavie TEXT);

DROP TABLE IF EXISTS predmet;
CREATE TABLE predmet(

nazov TEXT,
skratka TEXT);

DROP TABLE IF EXISTS znamka;
CREATE TABLE znamka(
znamka TEXT, 
student INT,
ucitel INT,
predmet TEXT,
cas TIMES,
datum DATE,
pozn TEXT,
vaha INT);

DROP TABLE IF EXISTS triedy;
CREATE TABLE triedy(
trieda TEXT,
predmet TEXT);


INSERT INTO student VALUES(1,'Anna', 'Abová', 'Ž', '1.A', '2004-12-12');
INSERT INTO student VALUES(2,'Bruno', 'Bell', 'M', '2.B', '2004-11-01');
INSERT INTO student VALUES(3,'Cecil', 'Cinkota', 'M', '3.C', '2003-05-28');
INSERT INTO student VALUES(4,'Diana', 'Držková', 'Ž', '1.A', '2004-08-20');

INSERT INTO ucitel VALUES(1,'Žaneta', 'Žilková', 'Ž');
INSERT INTO ucitel VALUES(2,'Xénia', 'Xindl', 'Ž');
INSERT INTO ucitel VALUES(3,'William', 'Willis', 'M');
INSERT INTO ucitel VALUES(4,'Viktor', 'Vanek', 'M');

INSERT INTO predmet VALUES('Matematika', 'MAT');
INSERT INTO predmet VALUES('Angličtina', 'ENG');
INSERT INTO predmet VALUES('Slovenčina', 'SJL');


INSERT INTO znamka VALUES("1",1, 1, 'MAT',  '13:30', '2021-12-19', 'uloha', 1);
INSERT INTO znamka VALUES("2",1, 2, 'SJL',  '12:30', '2021-12-18', 'pisomka', 2);
INSERT INTO znamka VALUES("1",2, 1, 'MAT',  '12:00', '2021-12-17', 'test', 2);
INSERT INTO znamka VALUES("4",3, 3, 'ENG',  '08:30', '2021-12-11', 'test', 2);

INSERT INTO triedy  VALUES('1.A', 'MAT');
INSERT INTO triedy  VALUES('1.A', 'SJL');

INSERT INTO triedy VALUES('2.B', 'ENG');
INSERT INTO triedy VALUES('2.B', 'MAT');
INSERT INTO triedy VALUES('2.B', 'SJL');

INSERT INTO triedy VALUES('3.C', 'ENG');
INSERT INTO triedy VALUES('3.C', 'MAT');
INSERT INTO triedy VALUES('3.C', 'SJL');

