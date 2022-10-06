CREATE TABLE TICKET (
price NUMBER(10),
show_date DATE,
payment_date DATE,
ticket_no NUMBER (11),
hall_no NUMBER(15),
seat_no NUMBER(20),
customer_ssn NUMBER(10)  NOT NULL UNIQUE,
employee_ssn NUMBER(10),
CONSTRAINT emp_FK FOREIGN KEY (employee_ssn) REFERENCES EMPLOYEE(SSN) 
CONSTRAINT tic_PK PRIMARY KEY(ticket_no)
);
  
  
CREATE TABLE CUSTOMER(
first_name VARCHAR2(20),
last_name VARCHAR2(20),
email VARCHAR2(25),
phone_no NUMBER (11),
SSN NUMBER(10) PRIMARY KEY

);

 CREATE TABLE Hall (
 type VARCHAR2(25),
 hall_no NUMBER(10),
 no_ofseats Number(10),
 seat_no NUMBER(10),
 CONSTRAINT HALL_NO PRIMARY KEY (hall_no) );

CREATE TABLE EMPLOYEE (
 first_name VARCHAR2(25),
 last_name VARCHAR2(25),
 address VARCHAR2(25),
 email VARCHAR2(25),
 hall_num NUMBER(10),
 salary Number(10),
 SSN NUMBER(10),
 supervise_ssn Number(10),
 CONSTRAINT ssN PRIMARY KEY (SSN),
 CONSTRAINT HALL_NUM FOREIGN KEY (hall_num) REFERENCES HALL(hall_no)
);

CREATE TABLE EMP_PHONE (
 phone_no Number(10),
 ssn NUMBER(10),
 CONSTRAINT phone_num PRIMARY KEY (phone_no),
 CONSTRAINT SSn FOREIGN KEY (ssn) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE MOVIE (
 Rating NUMBER(30) ,
 Movie_Name VARCHAR2(45) ,
 Movie_ID NUMBER(30) ,
 Start_Time NUMBER(60) ,
 End_Time NUMBER(60) ,
 Duration NUMBER(30) ,
 Description VARCHAR2(100) ,
 Actors VARCHAR2(45) ,
 Directors VARCHAR2(45) ,
 Release_Date DATE,
 Hall_NO NUMBER(10) ,
 Customer_SSN NUMBER(20) NOT NULL UNIQUE ,
 CONSTRAINT MOVIE_ID PRIMARY KEY(Movie_ID) ,
 CONSTRAINT HALL_FK FOREIGN KEY (Hall_NO) REFERENCES Hall (hall_no) ,
 CONSTRAINT cust_FK FOREIGN KEY (Customer_SSN) REFERENCES CUSTOMER (SSN) 
);

CREATE TABLE MOVIE_LANGUAGE (
 Llanguage VARCHAR2(25) ,
 Movie_ID NUMBER(30) ,
 CONSTRAINT MOVIE_LAN PRIMARY KEY (Llanguage) ,
 CONSTRAINT MID_FK FOREIGN KEY (Movie_ID) REFERENCES MOVIE (Movie_Name) 
);

CREATE TABLE MOVIE_CATEGORY (
 Movie_ID NUMBER(30) ,
 Category VARCHAR2(25) ,
 CONSTRAINT MOVIE_CAT PRIMARY KEY (Category) ,
 CONSTRAINT MCID_FK FOREIGN KEY (Movie_ID) REFERENCES MOVIE (Movie_Name) 
);