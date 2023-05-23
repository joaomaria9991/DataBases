--USE Aula10_Company
--GO

CREATE SCHEMA company;
GO

DROP TABLE company.dependent;
GO

DROP TABLE company.works_on;
GO

DROP TABLE company.project;
GO

DROP TABLE company.dept_locations;
GO

DROP TABLE company.employee;
GO
DROP TABLE company.department;
GO

CREATE TABLE company.department(
Dname VARCHAR(25),
Dnumber INT,
Mgr_ssn INT,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber)
);

CREATE TABLE company.employee(
Fname VARCHAR(15),
Minit CHAR,
Lname VARCHAR(15),
SSN INT,
Bdate DATE,
Address VARCHAR(30),
Sex CHAR,
Salary DECIMAL(10,2),
Super_ssn INT,
Dno INT,
PRIMARY KEY (Ssn),
FOREIGN KEY (Super_ssn) REFERENCES company.employee(SSN),
FOREIGN KEY (Dno) REFERENCES company.department
);

CREATE TABLE company.dept_locations(
Dnumber INT NOT NULL,
DLocation VARCHAR(25) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY (Dnumber) REFERENCES company.department(Dnumber)
);

CREATE TABLE company.project(
Pname VARCHAR(25),
Pnumber INT NOT NULL,
Plocation VARCHAR(25),
Dnum INT,
PRIMARY KEY(Pnumber),
FOREIGN KEY (Dnum) REFERENCES company.department(Dnumber)
);

CREATE TABLE company.works_on(
Essn INT NOT NULL,
Pno INT NOT NULL,
Hours INT,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES company.employee(Ssn),
FOREIGN KEY (Pno) REFERENCES company.project(Pnumber)
);

CREATE TABLE company.dependent(
Essn INT NOT NULL,
Dependent_name VARCHAR(25),
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(25),
PRIMARY KEY (Essn, Dependent_name),
FOREIGN KEY (Essn) REFERENCES company.employee(Ssn)
);


INSERT INTO company.department VALUES('Investigacao',1,21312332 ,'2010-08-02');
INSERT INTO company.department VALUES('Comercial',2,321233765,'2013-05-16');
INSERT INTO company.department VALUES('Logistica',3,41124234 ,'2013-05-16');
INSERT INTO company.department VALUES('Recursos Humanos', 4,12652121,'2014-04-02');
INSERT INTO company. department VALUES ('Desporto',5,NULL,NULL);

INSERT INTO company.employee VALUES ('Paula','A','Sousa',183623612,'2001-08-11','Rua da FRENTE','F',1450.00,NULL,3);
INSERT INTO company.employee VALUES('Carlos','D','Gomes',21312332 ,'2000-01-01','Rua XPTO','M',1200.00,NULL,1);
INSERT INTO company.employee VALUES('Juliana','A','Amaral',321233765,'1980-08-11','Rua BZZZZ','F',1350.00,NULL,3);
INSERT INTO company.employee VALUES('Maria','I','Pereira',342343434,'2001-05-01','Rua JANOTA','F',1250.00,21312332,2)
INSERT INTO company.employee VALUES('Joao','G','Costa',41124234 ,'2001-01-01','Rua YGZ','M',1300.00,21312332,2);
INSERT INTO company.employee VALUES('Ana','L','Silva',12652121 ,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,2);

INSERT INTO company.dependent VALUES (21312332 ,'Maria Costa','F','1990-10-05','Neto');
INSERT INTO company.dependent VALUES (21312332 ,'Joana Costa','F','2008-04-01', 'Filho');
INSERT INTO company.dependent VALUES (21312332 ,'Rui Costa','M','2000-08-04','Neto');
INSERT INTO company.dependent VALUES (321233765,'Filho Lindo','M','2001-02-22','Filho');
INSERT INTO company.dependent VALUES (342343434,'Rosa Lima','F','2006-03-11','Filho');
INSERT INTO company.dependent VALUES (41124234 ,'Ana Sousa','F','2007-04-13','Neto');
INSERT INTO company.dependent VALUES (41124234 ,'Gaspar Pinto','M','2006-02-08','Sobrinho');

INSERT INTO company.dept_locations VALUES (2, 'Aveiro');
INSERT INTO company.dept_locations VALUES (3, 'Coimbra');

INSERT INTO company.project VALUES ('Aveiro Digital',1,'Aveiro',3);
INSERT INTO company.project VALUES ('BD Open Day',2,'Espinho',2);
INSERT INTO company.project VALUES ('Dicoogle',3,'Aveiro',3);
INSERT INTO company.project VALUES ('GOPACS',4,'Aveiro',3);


INSERT INTO company.works_on VALUES (183623612,1,20.0);
INSERT INTO company.works_on VALUES (183623612,3,10.0);
INSERT INTO company.works_on VALUES (21312332 ,1,20.0);
INSERT INTO company.works_on VALUES (321233765,1,25.0);
INSERT INTO company.works_on VALUES (342343434,1,20.0);
INSERT INTO company.works_on VALUES (342343434,4,25.0);
INSERT INTO company.works_on VALUES (41124234 ,2,20.0);
INSERT INTO company.works_on VALUES (41124234 ,3,30.0);
