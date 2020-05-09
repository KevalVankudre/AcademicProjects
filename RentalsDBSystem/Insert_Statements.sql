
-------------------------------------------------------------------------------
-- Product data 
INSERT INTO PRODUCT VALUES('1023456789', 'S', 'No');
INSERT INTO PRODUCT VALUES('1032456789', 'S', 'No');
INSERT INTO PRODUCT VALUES('2345678910', 'B', 'No');
INSERT INTO PRODUCT VALUES('2354678910', 'B', 'No');
INSERT INTO PRODUCT VALUES('2354888910', 'B', 'No');
INSERT INTO PRODUCT VALUES('2354998910', 'B', 'No');
INSERT INTO PRODUCT VALUES('4567891023', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('4576891023', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('6789102345', 'F', 'No');
INSERT INTO PRODUCT VALUES('6798102345', 'F', 'No');
INSERT INTO PRODUCT VALUES('8910234567', 'E', 'No');
INSERT INTO PRODUCT VALUES('8901234567', 'E', 'No');
​
--Sports Equipment New Data
INSERT INTO PRODUCT VALUES('3814084711', 'S', 'No');
INSERT INTO PRODUCT VALUES('6562523336', 'S', 'No');
INSERT INTO PRODUCT VALUES('1660303002', 'S', 'No');
INSERT INTO PRODUCT VALUES('3011864359', 'S', 'No');
INSERT INTO PRODUCT VALUES('5744222793', 'S', 'No');
​
--Books New Data
INSERT INTO PRODUCT VALUES('6511239247', 'B', 'No');
INSERT INTO PRODUCT VALUES('1003131372', 'B', 'No');
INSERT INTO PRODUCT VALUES('1888587082', 'B', 'No');
INSERT INTO PRODUCT VALUES('2304077284', 'B', 'No');
INSERT INTO PRODUCT VALUES('6707231185', 'B', 'No');

​
-- Vehicles New Data
INSERT INTO PRODUCT VALUES('3169695533', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('2348066896', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('4893710400', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('4369509716', 'V', 'Yes');
INSERT INTO PRODUCT VALUES('6401348680', 'V', 'Yes');
​
-- Fitness Equiment New Data
INSERT INTO PRODUCT VALUES('2846514862', 'F', 'No');
INSERT INTO PRODUCT VALUES('5764835135', 'F', 'No');
INSERT INTO PRODUCT VALUES('4745834424', 'F', 'No');
INSERT INTO PRODUCT VALUES('4668826904', 'F', 'No');
INSERT INTO PRODUCT VALUES('1172449448', 'F', 'No');
​
-- Electronics New Data
INSERT INTO PRODUCT VALUES('3425168188', 'E', 'No');
INSERT INTO PRODUCT VALUES('5384486516', 'E', 'No');
INSERT INTO PRODUCT VALUES('5358395278', 'E', 'No');
INSERT INTO PRODUCT VALUES('5570170487', 'E', 'No');
INSERT INTO PRODUCT VALUES('6301236273', 'E', 'No');

------------------------------------------------------------------------------------
-- Sports_eqiments
INSERT INTO Sports_Equiment VALUES('1023456789', 'Golf Kit', 'G0120015', 'Golf');
INSERT INTO Sports_Equiment VALUES('1032456789', 'Badminton Rackets', 'B1122561', 'Badminton');
INSERT INTO Sports_Equiment VALUES('3814084711', 'Cricket Bat', 'C7564382', 'Cricket');
INSERT INTO Sports_Equiment VALUES('6562523336', 'Swimming Board', 'S7643251', 'Swimming');
INSERT INTO Sports_Equiment VALUES('1660303002', 'Biking Helmet', 'BB564732', 'Biking');
INSERT INTO Sports_Equiment VALUES('3011864359', 'Hockey Stick', 'H3524164', 'Hockey');
INSERT INTO Sports_Equiment VALUES('5744222793', 'Soccer Shoes', 'SC452987', 'Soccer');
​

------------------------------------------------------------------------------------
-- Books
INSERT INTO Books VALUES('2345678910', 'J0152300', 'Java for Beginners', 2009);
INSERT INTO Books VALUES('2354678910', 'WD5679225', 'Web Development', 2015);
​
INSERT INTO Books VALUES('6511239247', 'SC567478', 'Supply Chain Fundamentals', 2001);
INSERT INTO Books VALUES('1003131372', 'EN986675', 'Resilient Enterprise', 2008);
INSERT INTO Books VALUES('1888587082', 'SC125364', 'The Goal', 2012);
INSERT INTO Books VALUES('2304077284', 'IO532789', 'The Second Machine', 2011);
INSERT INTO Books VALUES('6707231185', 'DL253617', 'Deep Learning', 2015);
INSERT INTO Books VALUES('2354888910', 'ML532789', 'Machine Learning', 2016);
INSERT INTO Books VALUES('2354998910', 'AD253617', 'Application Developement', 2017);

------------------------------------------------------------------------------------
-- Vehicles
INSERT INTO Vehicles VALUES('4567891023', 'Suzuki Bike', 'Suzuki', 2009, 2, 'AB15245614');
INSERT INTO Vehicles VALUES('4576891023', 'Dzire', 'Suzuki', 2010, 4,'NH5564521');
​
INSERT INTO Vehicles VALUES('3169695533', 'MagonR', 'Maruti', 2010, 4,'SU3284951');
INSERT INTO Vehicles VALUES('2348066896', 'Land Cruiser', 'Toyota', 2015, 7,'TY7563920');
INSERT INTO Vehicles VALUES('4893710400', 'Micra', 'Nissan', 2005, 4,'NI1263748');
INSERT INTO Vehicles VALUES('4369509716', 'Corola', 'Toyota', 2009, 5,'TY6327498');
INSERT INTO Vehicles VALUES('6401348680', 'A4', 'Audi', 2010, 4,'AU2736494');

------------------------------------------------------------------------------------
-- Fitness_Equipments
INSERT INTO Fitness_Equipments VALUES('6789102345', 'Dumbbells', 'D4151');
INSERT INTO Fitness_Equipments VALUES('6798102345', 'Treadmill', 'TM458');

INSERT INTO Fitness_Equipments VALUES('2846514862', 'Dip Bar', 'DB754');
INSERT INTO Fitness_Equipments VALUES('5764835135', 'Exercise Ball', 'Ex987');
INSERT INTO Fitness_Equipments VALUES('4745834424', 'Dumb bell', 'DM287');
INSERT INTO Fitness_Equipments VALUES('4668826904', 'Jumping Rope', 'JP123');
INSERT INTO Fitness_Equipments VALUES('1172449448', 'Yoga Mat', 'YG546');


------------------------------------------------------------------------------------
-- Electronics
INSERT INTO Electronics VALUES('8901234567', 'Computer', 'DELL0145', 2017);
INSERT INTO Electronics VALUES('8910234567', 'Camera', 'SN14552', 2016);
​
INSERT INTO Electronics VALUES('3425168188', 'Headphones', 'HD', 2017);
INSERT INTO Electronics VALUES('5384486516', 'Router', 'RT87213', 2014);
INSERT INTO Electronics VALUES('5358395278', 'Table Fan', 'TF14342', 2018);
INSERT INTO Electronics VALUES('5570170487', 'Scientific Calculator', 'SC18294', 2014);
INSERT INTO Electronics VALUES('6301236273', 'Tablet', 'TB27184', 2015);

------------------------------------------------------------------------------------
-- Insurance
INSERT INTO Insurance VALUES('IV0152462', '4567891023', 'Bajaj', '05/01/2019','04/30/2021', 50000);
INSERT INTO Insurance VALUES('IV8588999', '4576891023', 'ICICI', '08/01/2018', '01/01/2022', 450000);
​
INSERT INTO Insurance VALUES('IV8588678', '2846514862', 'Bajaj', '08/01/2010', '08/01/2023', 270000);
INSERT INTO Insurance VALUES('IV1627384', '5764835135', 'Allianz', '09/01/2015', '09/01/2021', 620000);
INSERT INTO Insurance VALUES('IV9273648', '4745834424', 'HDFC', '11/01/2009', '11/01/2020', 350000);
INSERT INTO Insurance VALUES('IV1267582', '4668826904', 'ICICI', '08/01/2010', '08/01/2021', 550000);
INSERT INTO Insurance VALUES('IV8746352', '1172449448', 'ICICI', '03/15/2011', '03/01/2020', 1500000);

------------------------------------------------------------------------------------
-- Bank_Details
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (654789541 , 'PRIYA' , 021000021, 02120 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (723691558 , 'RAHUL' , 021365400, 02101 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (536214789 , 'JOHN' , 021203251, 02111 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (668974235 , 'NICK' , 023201212, 02115 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (666875319 , 'SAM' , 032145601, 02119 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (569874123 , 'TOKYO' , 021321031, 02131 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (632145987 , 'RIO' , 021065432, 02135 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (698695764 , 'IBIZA' , 021362047, 02163 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (635265412 , 'ROHAN' , 023698520, 02201 );
INSERT INTO BANK_DETAILS (ACCOUNT_NO , ACCOUNT_USER_NAME , ROUTING_NO , ZIP_CODE) VALUES (698745698 , 'LISBON' , 021201257, 02141 );


--------------------------------------------------------------------------------------------------------
-- Users Data
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('PS001',654789541,'Priya','Shah','1600 ave,MA,02112','p.shah@neu.edu', 'Abcd@123' ,' ' ,'Female', '1995-03-27' , 6177086666 , 1236547896541235, 'Yes'); 
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('RP002',723691558,'Rahul','Patel','121 MassAve, MA , 02111','r.patel@neu.edu', 'Des@1234' ,null ,'Male', '1996-10-27' , 6179656666 , 123654778449965, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('JW003',536214789 , 'John','Wik','141 C Ave, MA , 02110','j.wik@neu.edu', 'Qwer@123' ,null,'Male', '1980-06-18' , 6262654789 , 123659874645897, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('NJ004',668974235 , 'Nick','Jonas','1236 P Ave, MA , 02120','n.jonas@neu.edu', 'Pou@1885' ,null ,'Male', '1997-03-15' , 6147895423 , 1236547896541236, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('SO005',666875319 , 'Sam','Oslo','1600 net Ave , MA , 02141','s.oslo@neu.edu', 'Rew@1995' ,null ,'Male', '1990-09-23' , 6159863245 , 3625968574569874, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('TT006',569874123 , 'Tokyo','Turner','16 CAve , MA , 02135','t.turn@neu.edu', 'Ased@123' ,null ,'Female', '1993-10-02' , 8520145697 , 3265987845123625, 'Yes');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('RP007',632145987 , 'Rio','Prek','1220 Ave,MA , 02145','r.prek@neu.edu', 'Sdfr@189' ,null,'Male', '1994-08-07' , 8585641239 , 1245789636251474, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('IM008',698695764 , 'Ibiza','Montero','341 Penns Ave , MA, 02112','i.mont@neu.edu', 'Wder@122' ,null ,'Female', '1993-05-16' , 9587456985 , 2365451298786545, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('RP009',635265412 , 'Rohan','Patil','965 Penns Ave NW, MA , 02112','r.patil@neu.edu', 'Wond@193' ,null,'Male', '1985-01-30' , 9658741236 , 3562245168955784, 'No');
INSERT INTO [USER] (USER_ID,ACCOUNT_NO,FNAME,LNAME,[ADDRESS],EMAIL,[PASSWORD],PROFILE_PICTURE,GENDER,DATE_OF_BIRTH,CONTACT_NO,CARD_NUMBER,IS_ADMIN ) VALUES ('LW010',698745698 , 'Lisbon','Willington','84 Vict Ave NW, MA , 02131','l.wil@neu.edu', 'REWQ@123' ,null ,'Female', '1995-02-28' , 8596741425 , 1524263568947569, 'No');


------------------------------------------------
--Post Data

insert into [Post] values ('X001','PS001','1023456789','2020-03-27', '2020-04-01', '2020-04-25', '2020-03-28',null,'Photos_Videos','Three wood 1 hybrid',120,'Yes','1600 ave,MA,02112','Yes');
insert into [Post] values ('X002','PS001','1032456789','2020-02-22', '2020-03-01', '2020-03-10', '2020-02-23',null,'Photos_Videos','Light, long-handle, battledore type',20,'Yes','1600 ave,MA,02112','No');
insert into [Post] values ('X003','RP002','2345678910','2020-04-02', '2020-04-05', '2020-04-30', '2020-04-03',null,'Photos_Videos','Useful for interview prep',220,'Yes','121 MassAve, MA , 02111','Yes');
insert into [Post] values ('X004','JW003','2354678910','2020-01-20', '2020-03-15', '2020-03-31', '2020-01-21',null,'Photos_Videos','Great book for revision',23,'Yes','141 C Ave, MA , 02110','No');
insert into [Post] values ('X005','NJ004','4567891023','2020-03-05', '2020-04-01', '2020-04-10', '2020-03-10',null,'Photos_Videos','In good condition',12,'Yes','1236 P Ave, MA , 02120','Yes');
insert into [Post] values ('X006','SO005','4576891023','2020-02-13', '2020-03-13', '2020-05-20', '2020-03-01',null,'Photos_Videos','Used- like new',125,'Yes','1600 net Ave , MA , 02141','Yes');
insert into [Post] values ('X007','TT006','6789102345','2020-01-21', '2020-03-05', '2020-03-30', '2020-02-01',null,'Photos_Videos','No rust, high quality',180,'Yes','16 CAve , MA , 02135','No');
insert into [Post] values ('X008','TT006','6798102345','2020-02-28', '2020-03-31', '2020-04-10', '2020-03-05',null,'Photos_Videos','Smooth running, 5 modes',155,'Yes','16 CAve , MA , 02135','No');
insert into [Post] values ('X009','IM008','8910234567','2020-01-27', '2020-02-15', '2020-05-25', '2020-01-28',null,'Photos_Videos','21 MP, DSLR, Automode',170,'Yes','341 Penns Ave , MA, 02112','Yes');
insert into [Post] values ('X0010','IM008','8901234567','2020-03-31', '2020-04-10', '2020-04-20', '2020-04-02',null,'Photos_Videos','Dell, High RAM, High Storage',129,'Yes','341 Penns Ave , MA, 02112','Yes');
insert into [Post] values ('X021','TT006','8901234567','2020-03-31', '2020-04-10', '2020-04-20', '2020-04-05','TT006','Photos_Videos','Smooth running, 5 modes',130,'Yes','341 Penns Ave , MA, 02112','Yes');
insert into [Post] values ('X022','SO005','2354888910','2020-04-15', '2020-04-30', '2020-05-10', '2020-04-06',null,'Photos_Videos','Good Condition',200,'Yes','16 CAve, MA,02135','No');
insert into [Post] values ('X023','NJ004','2354998910','2020-04-01', '2020-05-01', '2020-05-17', '2020-04-06',null,'Photos_Videos','Helpful for interviews',70,'Yes','341 Ave,MA, 02112','No');



update [post] set approved_by = 'TT006' where is_available like 'yes';
update [post] set approved_by = 'PS001' where is_available like 'no';
update [post] set approval_date = null where is_available like 'no';

Select * from post;​
delete from Post;

------------------------------------------------
--Order Data
insert into [Order] values ('OR001','PS001','X004','1600 ave,MA,02112','1600 ave,MA,02112', '2020-04-20', '2020-04-25', 'Placed' );
insert into [Order] values ('OR002','PS001','X009','1600 ave,MA,02112','1600 ave,MA,02112', '2020-03-01', '2020-03-10', 'Completed' );
insert into [Order] values ('OR002','PS001','X005','1600 ave,MA,02112','1600 ave,MA,02112', '2020-02-23', '2020-02-27', 'Completed' );
insert into [Order] values ('OR003','RP002','X0010','121 MassAve, MA , 02111','121 MassAve, MA , 02111', '2020-04-1','2020-04-15', 'InProgress' );
insert into [Order] values ('OR004','JW003','X002','141 C Ave, MA , 02110','141 C Ave, MA , 02110', '2020-04-1','2020-04-02', 'Completed' );
insert into [Order] values ('OR005','NJ004','X001','1236 P Ave, MA , 02120','1236 P Ave, MA , 02120', '2020-04-1','2020-04-05', 'InProgress' );
insert into [Order] values ('OR006','SO005','X008','1600 net Ave , MA , 02141','1600 net Ave , MA , 02141', '2020-03-1','2020-03-20', 'Completed' );
insert into [Order] values ('OR007','TT006','X0010','16 CAve , MA , 02135','16 CAve , MA , 02135', '2020-04-1','2020-04-15', 'InProgress' );
insert into [Order] values ('OR008','TT006','X006','16 CAve , MA , 02135','16 CAve , MA , 02135', '2020-04-1','2020-04-03', 'Completed' );
insert into [Order] values ('OR009','IM008','X003','341 Penns Ave , MA, 02112','341 Penns Ave , MA, 02112', '2020-04-11','2020-04-15', 'Placed' );
insert into [Order] values ('OR010','IM008','X007','341 Penns Ave , MA, 02112','341 Penns Ave , MA, 02112', '2020-05-1','2020-05-05', 'Placed' );
Insert into [Order] values ('OR021','JW003','X021','341 Penns Ave , MA, 02112','341 Penns Ave , MA, 02112', '2020-04-1','2020-04-15', 'InProgress');

select * from [order];
select * from [order] where Order_Status like 'completed';
delete from [order];

------------------------------------------------------------------------------------------
-- Invoice Table
Insert into invoice values('INV0120056', 'OR004', '2020-04-02', 0);
Insert into invoice values('INV0177556', 'OR006', '2020-04-02', 0);
Insert into invoice values('INV0055056', 'OR008', '2020-04-02', 0);

Select * from invoice;