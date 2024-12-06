#PROJECT:BANK DATABASE
#8SRS OF BANK DATABASE
#IN A CITY THERE ARE MULTIPLE BANKS AND EACH BANK HAS MANY BRANCHES EACH BRANCH HAS MULTIPLE CUSTOMERS, CUSTOMERS HAVE VARIOUS TYPE OF ACCOUNTS,
# SOME CUSTOMERS HAS ALSO TAKEN DIFFERENT TYPES OF LONES FROM THESE BANK BRANCHES ONE CUSTOMER HAVE MULTIPLE ACCOUNTS AND LOANS;
 #STEPS :HOW MANY TABLES , RELATION BETWEEN TABLES ,ATTRIBUTES ( BANK ID, ACCOUNT),WHAT TYPE OF ATTRIBURE().
 
 #ENTITIES
#BANK 
#BRANCH
#CUSTOMER
#ACCOUNT
#LOAN
create DATABASE BANK;
USE BANK;
create table bank(
Bid int primary key,
Bname varchar(20),
Bhq varchar(10));
create table Branch (
Br_id int primary key,
address varchar(30),
Bid int,foreign key(Bid) references Bank(Bid));
create table Customer(
C_id int primary key,
C_name varchar(20),
emailid varchar(30),
gender varchar(10),
dob date,
address varchar(30));
create table Account1 (
acc_no int primary key,
acc_type varchar(10),
Br_id int ,foreign key (Br_id) references Branch(Br_id));
create table Loan(
l_id int primary key,
l_type varchar(10) ,
l_interest decimal(5,2),
Br_id int ,foreign key (Br_id) references Branch(Br_id));
create table branch_phno(
Br_id int ,foreign key (Br_id) references Branch(Br_id),
ph_no bigint);
create  table cust_phno(
C_id int,foreign key(C_id) references  Customer(C_id),
phno int );
create table cust_acc_details(
acc_no int ,foreign key(acc_no) references Account1(acc_no),
C_id int,foreign key(C_id) references  Customer(C_id));
create table Loan_acc_details (
acc_no int ,foreign key(acc_no) references Account1(acc_no),
l_id int ,foreign key (l_id) references Loan(l_id));
 
 # inserting the data to the respective tables
 insert into bank values(1,"SBI","DELHI");
insert into bank values(2,"UNION","MUMBAI");

insert into BRANCH values(1,"TIRUPATI",1);
insert into BRANCH values(2,"PAKALA",1);
insert into BRANCH values(3,"CHITTOOR",1);
insert into BRANCH values(4,"BTM",1);
insert into BRANCH values(5,"HSR",2);
insert into BRANCH values(6,"rSR",2);


insert into CUSTOMER values(1,"RUPESH","rupesh@123.gmail.com","m","2002/09/11","tirupati");
insert into CUSTOMER values(2,"LOKESH M","LOKESH_M@123.gmail.com","m","2002/10/11","tirupati");
insert into CUSTOMER values(3,"LOKESH K","LOKESH_K@123.gmail.com","m","2002/03/02","tirupati");
insert into CUSTOMER values(4,"SUBHASH","SUBHASH@123.gmail.com","m","2001/02/02","tirupati");

INSERT INTO ACCOUNT1 VALUES (1001,"SAVINGS",1);
INSERT INTO ACCOUNT1 VALUES (1002,"CURRENT",1);
INSERT INTO ACCOUNT1 VALUES (1003,"JOINT",1);

INSERT INTO LOAN VALUES (1,"EDUCATION",5,1);
INSERT INTO LOAN VALUES (2,"HOUSE",10,2);
INSERT INTO LOAN VALUES (3,"BUSSINESS",25,3);

INSERT INTO BRANCH_PHNO VALUES (1,9123456789);
INSERT INTO BRANCH_PHNO VALUES (1,8123456789);
INSERT INTO BRANCH_PHNO VALUES (2,7123456789);
INSERT INTO BRANCH_PHNO VALUES (2,6123456789);
 
 INSERT INTO CUST_PHNO VALUES (1,923456789);
 INSERT INTO CUST_PHNO VALUES (2,823456789);
 INSERT INTO CUST_PHNO VALUES (3,723456789);
  INSERT INTO CUST_PHNO VALUES (4,623456789);
   
   INSERT INTO CUST_ACC_DETAILS VALUES (1001,1);
      INSERT INTO CUST_ACC_DETAILS VALUES (1002,1);
   INSERT INTO CUST_ACC_DETAILS VALUES (1003,1);
      INSERT INTO CUST_ACC_DETAILS VALUES (1001,2);
   INSERT INTO CUST_ACC_DETAILS VALUES (1002,2);
   INSERT INTO CUST_ACC_DETAILS VALUES (1003,3);
   INSERT INTO CUST_ACC_DETAILS VALUES (1003,1);

      INSERT INTO LOAN_ACC_DETAILS VALUES (1001,1);
      INSERT INTO LOAN_ACC_DETAILS VALUES (1002,1);
      INSERT INTO LOAN_ACC_DETAILS VALUES (1003,1);
      INSERT INTO LOAN_ACC_DETAILS VALUES (1001,2);
      INSERT INTO LOAN_ACC_DETAILS VALUES (1001,3);
	  INSERT INTO LOAN_ACC_DETAILS VALUES (1003,3);

# QUESTIONS
select bname,br_id from bank b inner join branch br on b.bid=br.bid group by  br_id;