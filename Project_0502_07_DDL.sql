USE BUDT703_Project_0502_07;

--Drop Statements
IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TIP_T' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TIP_T]
		DROP CONSTRAINT IF EXISTS fk_TIP_busId;
IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TIP_T' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TIP_T]
		DROP CONSTRAINT IF EXISTS fk_TIP_userId;
IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'REVIEW_T' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [REVIEW_T]
		DROP CONSTRAINT IF EXISTS fk_REVIEW_busId;
IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'REVIEW_T' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [REVIEW_T]
		DROP CONSTRAINT IF EXISTS fk_REVIEW_userId;

DROP TABLE IF EXISTS [TIP_T];
DROP TABLE IF EXISTS [REVIEW_T];
DROP TABLE IF EXISTS [BUSINESS_T];
DROP TABLE IF EXISTS [USER_T];

--Create Tables

CREATE TABLE USER_T
 (userId VARCHAR(255) NOT NULL,
 userName VARCHAR(255),
 userElite VARCHAR(255),
 userYelpSince CHAR(100),
 userReviewCnt INTEGER,
 userReviewUse INTEGER,
 userReviewCool INTEGER,
 userReviewFunny INTEGER,
 CONSTRAINT pk_USER_userId PRIMARY KEY (userId));

CREATE TABLE BUSINESS_T
(busId VARCHAR(255) NOT NULL,
 busName VARCHAR(255),
 busStreet VARCHAR(255),
 busCity VARCHAR(255),
 busState VARCHAR(255),
 busZip VARCHAR(255),
 busReviewCnt INTEGER,
 busIsOpen INTEGER,
 busCategories VARCHAR(3000),
 busStars FLOAT,
 CONSTRAINT pk_BUSINESS_busId PRIMARY KEY (busId));

CREATE TABLE REVIEW_T
 (revId VARCHAR(255) NOT NULL,
 userId VARCHAR(255),
 busId VARCHAR(255),
 revStars FLOAT,
 revDate CHAR(100),
 revText VARCHAR(3000),
 revUseful INTEGER,
 revFunny INTEGER,
 revCool INTEGER,
 CONSTRAINT pk_REVIEW_revId PRIMARY KEY (revId),
 CONSTRAINT fk_REVIEW_busId FOREIGN KEY (busId)
REFERENCES [BUSINESS_T] (busId)
ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_REVIEW_userId FOREIGN KEY (userId)
REFERENCES [USER_T] (userId)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TIP_T
(tipId VARCHAR(255) NOT NULL,
 userId VARCHAR(255),
 busId VARCHAR(255),
 tipText VARCHAR(255),
 tipDate DATE,
 tipComplimentCount INTEGER,
 CONSTRAINT pk_TIP_tipId PRIMARY KEY (tipId),
 CONSTRAINT fk_TIP_userId FOREIGN KEY (userId)
REFERENCES [USER_T] (userId)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_TIP_busId FOREIGN KEY (busId)
REFERENCES [BUSINESS_T] (busId)
ON DELETE CASCADE ON UPDATE CASCADE);

--INSERT Queries

INSERT INTO USER_T (userId,userName, userYelpSince, userReviewCnt,
userReviewUse,userReviewCool,userReviewFunny, userElite)
VALUES
('2uZ8uULKN38ZiM-Iakr5TA','Chris','16-02-2013',41,14,2,1,'None'),
('fuPPAG34u2RVTdyySzpiew','Henry',NULL,1,0,0,0,'None'),
('2uZ8uULKN38AiM-Iakr5TA','Arnav','27-07-2008',10,6,0,0,'None'),
('JSpc7_x2X3SvapoMBbk15Q','Katie','25-09-2013',3,6,0,0,'None'),
('XBMFEOxsul_HALa34wEY8w','John',NULL,12,1,0,1,'None'),
('c-swGSvUjRVmLSLChsXEFA','Terry',NULL,13,3,0,0,'None'),
('2PMqgo9c88_xeLDWcGgLeQ','Nina',NULL,12,115,65,44,'None'),
('bE0uE7z3ByEZnXU5YvjLBA','Kimberly','30-03-2017',1,0,0,0,'None'),
('Gy_wyyvjLQxAFDyBD_N1pQ','Kim','23-11-2017',1,0,0,0,'None'),
('a-0mMaTKiYTuw9c61dPz_Q','May',NULL,89,18,7,6,'2017'),
('oNIaAW9_L7R3IyRrtpU86g','Nichole',NULL,26,26,2,5,'None'),
('lmJy4OwP_TyHIg8a8Q0RsA','Alan','14-06-2013',646,460,415,316,'2016, 2017, 2013,
2015, 2014'),
('_OsNTyJs89IFYRs7Il5o2g','Tina','29-09-2016',2,1,1,0,'None'),
('mqzisCyZ_tlpQt6HkNnhOw','Karen',NULL,388,412,277,203,'2017, 2015, 2014, 2016,
2013'),
('6ZR7HuUpHk_NQNs0dT0oLg','Chris','24-09-2013',10,0,0,0,'None'),
('FBr8Vy7SqjW4ti78UL4ypQ','Cris',NULL,1,0,0,0,'None'),
('r7NNIC0r75-efLav9IGGnw','Sue','17-08-2013',10,4,0,1,'None'),
('nfDHlVGIa6BknPDVxTtf1A','Nancy',NULL,74,2,1,0,'None'),
('RU2_7FmKvRwFJonNOvx-wQ','Ty',NULL,2,0,0,1,'None'),
('UX34R48PkLhjHmI35Vf7hQ','Paige',NULL,13,8,2,1,'None'),
('ew3jyvHXilIk289K1jx5-Q','Fred','15-02-2011',49,4,0,0,'None'),
('6n_lnQK_QInP66EHsymxSQ','Julie','19-05-2013',26,0,1,0,'None'),
('yL60onlTh1BmJKVLli_K3g','Danielle',NULL,264,77,6,12,'2014, 2013, 2016, 2017,
2015'),
('uxD3lAM3Jsm1kAxGpLxdBg','AnnMarie','19-03-2011',5,0,0,0,'None'),
('xLdhpGaj_6Xvx2oYovc4gQ','Linda','14-12-2015',3,2,0,0,'None'),
('xyTgJUyW9nPV1wbnr9u-_A','Ben','27-10-2015',5,0,0,0,'None'),
('A1Ulhz9qe3hjH_yhFro9qg','Fabian','14-09-2016',1,0,0,0,'None'),
('TPv60vdM4fxGGSzScoK_NQ','Charlie',NULL,2,0,0,0,'None'),
('wd_VNRXXGyoEUs-bMW5pGA','Shauna',NULL,155,5,0,0,'2010'),
('4D4JwxN07FFDIFswH8E4Ow','Kerry',NULL,51,74,32,8,'None'),
('yyYK8k2Ikga72nZ4cSBf-A','Daniel',NULL,139,48,21,20,'None'),
('9Enf4pFyK0JgfhwXuNftuQ','Rose','16-11-2011',3,0,0,0,'None'),
('3xPmB495dIPMRSHt5T3drg','Schantel','15-06-2016',1,0,0,0,'None'),
('Cnn-0yo4zVAEwMxEwhuF9Q','Nina',NULL,377,99,489,23,'2015, 2017, 2016'),
('dShjr_XsbmSAL6br1bqY7A','Martha','24-03-2014',16,1,0,0,'None'),
('MgAHuFGzScMAuLpDmHK7iQ','Emily','22-08-2012',77,6,1,2,'None'),
('wqmyI0jPBAhcUcdNKr-09A','Brittany','17-09-2015',2,1,0,0,'None'),
('KhyS1QlSQYXSkq_5hthasQ','Amos',NULL,2,2,0,0,'None'),
('7xwLiQx0-lCOXBUDAcazZA','Rhonda','25-06-2010',24,37,2,3,'None'),
('1UfSyGJOCGitwgXY7Gl6ew','Ava','31-12-2016',1,0,0,0,'None'),
('rr8lzo9fJWDrFZb-qcDcvw','Tim',NULL,14,14,0,0,'None');

INSERT INTO BUSINESS_T(busId, busName, busStreet, busCity, busState, busZip,
busReviewCnt, busIsOpen, busCategories, busStars)
VALUES
('TGWhGNusxyMaA4kQVBNeew', 'London Chop House', 'Thomas Street', 'Hyattsville',
'MD', '20783' , 90, 1,'Restaurant', 4.5),
('NmZtoE3v8RdSJEczYbMT9g', 'Republic', 'Kenilworth Ave', 'Greenbelt', 'MD', '20770'
, 50, 1,'Restaurant', 4),
('0FMKDOU8TJT1x87OKYGDTg', 'Ottava via', 'Smith Street', 'Hyattsville', 'MD',
'20782' , 34, 1, 'Restaurant', 4.5),
('nbhBRhZtdaZmMMeb2i02pg', 'Brooklyn Housing', 'Old Town Road', 'Adelphi', 'MD',
'20784' , 22, 1, 'Apartment', 3.5),
('Dj0S-Oe4ytRJzMGUPgYUkw', 'Brooklyn Housing', 'New County Road', 'Adelphi', 'MD',
'20784' , 45, 1, 'Apartment', 3.5),
('PMH4oUa-bWELKogdtkWewg', 'Seoul Spice', 'Guilford Drive', 'College Park', 'MD',
'20782' , 67, 1, 'Restaurant', 4.5),
('1K4qrnfyzKzGgJPBEcJaNQ', 'Taqueria Habanero', 'Ste A', 'College Park', 'MD',
'20740' , 209, 1, 'Restaurant', 4.5),
('8y56fOiKhtCnqaiYB2S2Qg', 'Busboys and Poets', 'Ste 104', 'Hyattsville', 'MD',
'20781' , 1401, 1, 'Restaurant', 4),
('A_Ij4SwFmlRbVtRnsdSzWA', 'The Hall CP', 'Hotel Drive', 'College Park', 'MD',
'20742' , 131, 1, 'Restaurant', 4.5),
('2uZ8uULKN38Zis-Iakr5TA', 'Blaze Pizza', 'Baltimore Avenue', 'College Park', 'MD',
'20742' , 109, 1, 'Restaurant', 4),
('c6Shr51XcbvAeXp6hb_Exg', 'Hibachi-San', 'Campus Drive', 'College Park', 'MD',
'20742' , 4, 1, 'Restaurant', 3.5),
('e3rNvRnupvSMu6BABlDUuQ', 'TGI Fridays', 'Capitol Drive', 'Greenbelt', 'MD',
'20770' , 34, 1, 'Restaurant', 4),
('Wpt0sFHcPtV5MO9He7yMKQ', 'Five Guys', 'W Tech Road', 'Silver Spring', 'MD',
'20904' , 72, 1, 'Restaurant', 4.5),
('OcUVZniPo7CnIG-Tv83XcQ', 'The Veridian Apartments', 'East West Highway', 'Silver
Spring', 'MD', '20910' , 53, 1, 'Apartment', 3.4),
('EXsmUB2mJyJsCpCV-56Ujw', 'Brookland Press', 'Channing Pl', 'Washington D.C.',
'D.C', '20018' , 60, 1, 'Apartment', 3.5),
('o8cX77mJ1nHMMo0URPS5bg', 'The Bennington', 'East West Highway', 'Silver Spring', 
'MD', '20910' , 23, 1, 'Apartment', 4.0),
('z0BQG6LJOmd8E7cNuMtH0A', 'Camden NoMa Apartments', 'Old Town Road', 'Adelphi',
'MD', '20784' , 96, 1, 'Apartment', 4.3),
('NC03ZDFpIYpEi2aiFTmGPg', 'The Bartlett', 'Pentagon City', 'Arlington',
'Virginia', '22202' , 71, 1, 'Apartment', 3.6),
('fNMVV_ZX7CJSDWQGdOM8Nw','"Showmars Government Center"','"600 E 4th
St"','Charlotte','NC','28202',7,1,'Restaurants;American (Traditional)',3.5),
('gAy4LYpsScrj8POnCW6btQ','"Toast Cafe"','"2429 Hwy 160 W"','Fort
Mill','SC','29708',6,0,'Food;American (Traditional);Coffee & Tea;Restaurants',3.5),
('7gquCdaFoHZCcLYDttpHtw','"Bubbly Nails"','"8439 Charlotte Hwy"','Fort
Mill','SC','29707',17,1,'Nail Salons;Beauty & Spas',4),
('S4a42azhoOmr0fpeNkggHg','"By Design"','"11812 Carolina Place Pkwy, Ste
C"','Pineville','NC','28134',3,0,'Home & Garden;Furniture Stores;Shopping',2.5),
('zjySmTfL9WiMDVgp8-Jp3w','"TCBY"','"610 Jetton St, Ste
130"','Davidson','NC','28036',3,1,'Desserts;Ice Cream & Frozen Yogurt;Food',3.5),
('ykJM7EuGziATZ5u2qIT08g','"My Fitness World"','"1225 S Church St, Ste
B"','Charlotte','NC','28203',4,1,'Active Life;Fitness & Instruction;Gyms',5),
('6aFAEeJ3nS-iWGt7Tn7S0Q','"KS Audio Video"','"19925 Jetton Rd, Ste
100"','Cornelius','NC','28031',5,1,'Home Services;Television Service Providers;Home
Automation;Home Theatre Installation;Professional Services',5),
('NFTh6mj3X2AnHJCKIFUk5Q','"Fairfield Inn & Suites"','"8540 E Independence
Blvd"','Charlotte','NC','28105',17,1,'Hotels;Event Planning & Services;Hotels &
Travel',4),
('WUiDaFQRZ8wKYGLvmjFjAw','"China Buffet"','"8630 University Executive Park
Dr"','Charlotte','NC','28262',76,1,'Buffets;Restaurants;Sushi Bars;Chinese',3.5),
('5q6Xh-UcJa78bp6dzyaE7w','"Duck Donuts"','"1710 Kenilworth Ave, Ste
220"','Charlotte','NC','28203',373,1,'Breakfast & Brunch;Food;Coffee &
Tea;Donuts;Restaurants',4.5),
('mtTxLi9CZNOsDqOTJH3pQw','"Felicitea"','"516 E 15th St, Ste
11D"','Charlotte','NC','28206',4,0,'Food;Coffee & Tea;Massage;Beauty & Spas',3),
('bA21m-qbgN_GNR6g-AlfYw','"Dynasty Buffett"','"2932 E Franklin
Blvd"','Gastonia','NC','28056',30,1,'Restaurants;Chinese',3.5),
('xMP2oDrKFqyUrN0Uww85EQ','"Dockside Seafood Market"','"3017 Kilborne
Dr"','Charlotte','NC','28205',3,1,'Seafood Markets;Food;Specialty Food',4.5),
('aLM-0HupwCE5r7bMIcQ2TQ','"Septic Pumping
Service"','""','Matthews','NC','28104',3,1,'Septic Services;Home
Services;Plumbing;Local Services',5),
('nSD-uxCMb745bH3dxoko9Q','"Taco Bell"','"2453 HWY 160"','Tega
Cay','SC','29708',13,1,'Tex-Mex;Mexican;Restaurants;Fast Food',4),
('mhpeV-UzQL2LT5pQnyjquQ','"Birkdale Golf Club"','"16500 Birkdale Cmns
Pkwy"','Huntersville','NC','28078',12,1,'Active Life;Golf',3),
('M1AvDkm6oi0wAy4-l_xiJQ','"Frazier Park"','"1201 W 4th St
Ext"','Charlotte','NC','28202',36,1,'Active Life;Parks;Dog Parks',3.5),
('6zmP8-m2xhN2jzOBb01KFQ','"Pandora"','"4400 Sharon
Rd"','Charlotte','NC','28211',7,1,'Shopping;Jewelry',3),
('0v984vlPQfb4VZWvBJSsfg','"Cosmos Cafe"','"300 N College
St"','Charlotte','NC','28202',59,0,'Sushi
Bars;Restaurants;Nightlife;Lounges;American (New);Bars',3),
('uDxrdpVzU3QAWYkwR-X5EA','"Quik Shoppe"','"201 East
Blvd"','Charlotte','NC','28203',23,1,'Convenience Stores;Food',3),
('O_UiTH7YjqTS1UTk-shFnA','"Real Food Charlotte"','"2102 South Blvd,
#150"','Charlotte','NC','28203',4,0,'Restaurants;Vegetarian;Live/Raw Food',4),
('Jf6C_6IkLBCpSZTjQiC-Mg','"AT&T"','"5940 Fairview Rd, Ste
100"','Charlotte','NC','28210',21,1,'Mobile Phones;Professional Services;Internet
Service Providers;Home Services;Mobile Phone Accessories;Shopping',2.5),
('WtqzJcXEt5lc0hSeJ-bAJg','"Bob Evans"','"16706 Northcross
Dr"','Huntersville','NC','28078',24,1,'Bed & Breakfast;Breakfast &
Brunch;Salad;American (Traditional);Hotels & Travel;Restaurants;Comfort Food',3),
('om4t1hDJRQqTRS9VT7ADhA','"Q Tavern"','"201 S McDowell 
St"','Charlotte','NC','28204',27,1,'Nightlife;Restaurants;Southern;Gastropubs;Bars;
Pubs',3),
('UQA25zKrqI-eQjxvDskFjQ','"Perfect Fit Industries"','"8501 Tower Point
Dr"','Charlotte','NC','28227',4,1,'Home & Garden;Shopping;Home Decor',1),
('HkmT3UNSG8_xhdbT548PYg','"7-Eleven"','"240 Carowinds Blvd"','Fort
Mill','SC','29708',3,1,'Food;Gas Stations;Automotive;Convenience Stores',2.5),
('qesPXWJdHlRnB4Zz8iBNeQ','"Novant Health Huntersville Medical Center"','"10030
Gilead Rd"','Huntersville','NC','28078',21,1,'Hospitals;Health & Medical',2),
('33rUbyxBRbWeOsDv_PA1LQ','"ASG Security"','"3421 St Vardell Ln, Ste
H"','Charlotte','NC','28217',3,1,'Professional Services',1.5),
('Ka3z0iudeviL2nEKZ4BeYg','"Tijuana Flats"','"1608 E
Blvd"','Charlotte','NC','28203',50,0,'Mexican;Food;Restaurants;Tex-Mex',4),
('5-4mAJZyjC7rZz_hEBT5Cg','"Zenith Gymnastics"','"8617 Monroe
Rd"','Charlotte','NC','28212',3,1,'Gymnastics;Active Life',4),
('3GGmY_QhqHnIEqk62p7cVA','"Hwy 55 Burgers Shakes & Fries"','"4435 Hwy 49
S"','Harrisburg','NC','28075',42,1,'Food;Fast Food;American
(Traditional);Restaurants;Cheesesteaks;Ice Cream & Frozen Yogurt;Burgers',3.5);

INSERT INTO REVIEW_T (revId, userId, busId, revStars, revDate, revText, revUseful,
revFunny, revCool)
VALUES
('6672451307','yL60onlTh1BmJKVLli_K3g','Dj0S-Oe4ytRJzMGUPgYUkw',4, '07-23-
2020','Loved the food!',3,0,1),
('6544759671','6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA',4.5,'11-11-
2020','Great food and music',1,0,2),
('6544759672','MgAHuFGzScMAuLpDmHK7iQ','nbhBRhZtdaZmMMeb2i02pg',2.5,'10-10-
2021','Rude owner',5,0,0),
('6544759673','rr8lzo9fJWDrFZb-qcDcvw','EXsmUB2mJyJsCpCV-56Ujw',4.5,'01-25-
2019','Safe community',2,0,1),
('6544759674','rr8lzo9fJWDrFZb-qcDcvw','OcUVZniPo7CnIG-Tv83XcQ',1,'03-03-
2019','Rats infestation. I do not recommend living here', 10,0,0),
('6672451308','yL60onlTh1BmJKVLli_K3g','Dj0S-Oe4ytRJzMGUPgYUkw',4, '07-23-
2020','Loved the food!',3,0,1),
('6544759675','6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA',4.5,'11-11-
2020','Great food and music',1,0,2),
('6544759677','MgAHuFGzScMAuLpDmHK7iQ','nbhBRhZtdaZmMMeb2i02pg',2.5,'10-10-
2021','Rude owner',5,0,0),
('6544759679','rr8lzo9fJWDrFZb-qcDcvw','EXsmUB2mJyJsCpCV-56Ujw',4.5,'01-25-
2019','Safe community',2,0,1),
('6544759680','rr8lzo9fJWDrFZb-qcDcvw','OcUVZniPo7CnIG-Tv83XcQ',1,'03-03-
2019','Rats infestation. I do not recommend living here', 10,0,0),
('6544129673','MgAHuFGzScMAuLpDmHK7iQ','2uZ8uULKN38Zis-Iakr5TA',2.5,'10-10-
2021','Amazing Pizza!',5,0,0),
('6544229673','MgAHuFGzScMAuLpDmHK7iQ','2uZ8uULKN38Zis-Iakr5TA',3,'11-12-
2020','Loved the thin crust',1,2,3),
('6544329673','MgAHuFGzScMAuLpDmHK7iQ','2uZ8uULKN38Zis-Iakr5TA',4,'09-01-
2020','good',7,2,2),
('6544429673','MgAHuFGzScMAuLpDmHK7iQ','2uZ8uULKN38Zis-Iakr5TA',2,'03-21-
2021','they dont have good seating',0,0,0),
('6544459671','6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA',4,'01-01-
2020','nachos are very good',0,0,0),
('6544259671','6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA',5,'12-21-
2020','they have great indoor games like table tennis',2,0,2),
('6544159671','6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA',0,'03-23-
2021','nice',0,2,2),
('6541759671','1UfSyGJOCGitwgXY7Gl6ew','A_Ij4SwFmlRbVtRnsdSzWA',0,'07-12-
2021','LOL',0,0,0),
('6443759680','XBMFEOxsul_HALa34wEY8w','Dj0S-Oe4ytRJzMGUPgYUkw',5,'28-05-
2016','Super simple place but amazing nonetheless. Its been around since the 30s 
and they still serve the same thing they started with: a bologna and salami
sandwich with mustard.
Staff was very helpful and friendly.',0,0,0),
('6443759692','3xPmB495dIPMRSHt5T3drg','Dj0S-Oe4ytRJzMGUPgYUkw',5,'28-05-
2016','Small unassuming place that changes their menu every so often. Cool decor
and vibe inside their 30 seat restaurant. Call for a reservation.
We had their beef tartar and pork belly to start and a salmon dish and lamb meal
for mains. Everything was incredible! I could go on at length about how all the
listed ingredients really make their dishes amazing but honestly you just need to
go.
A bit outside of downtown montreal but take the metro out and its less than a 10
minute walk from the station.',0,0,0),
('6443759704','4D4JwxN07FFDIFswH8E4Ow','Dj0S-Oe4ytRJzMGUPgYUkw',5,'28-05-2016','it
is located in a beautiful neighborhood and has been there since 1951. They are
known for smoked meat which most delis have but their brisket sandwich is what I
come to montreal for. Theyve got about 12 seats outside to go along with the
inside.
The smoked meat is up there in quality and taste with Schwartzs and you will find
less tourists at Lesters as well.',0,0,0),
('6443759716','yL60onlTh1BmJKVLli_K3g','Dj0S-Oe4ytRJzMGUPgYUkw',4,'28-05-
2016','Love coming here. Yes the place always needs the floor swept but when you
give out peanuts in the shell how wont it always be a bit dirty.
The food speaks for itself, so good. Burgers are made to order and the meat is put
on the grill when you order your sandwich. Getting the small burger just means 1
patty, the regular is a 2 patty burger which is twice the deliciousness.
Getting the Cajun fries adds a bit of spice to them and whatever size you order
they always throw more fries (a lot more fries) into the bag.',0,0,0),
('6443759728','TPv60vdM4fxGGSzScoK_NQ','Dj0S-Oe4ytRJzMGUPgYUkw',4,'28-05-2016','Had
their chocolate almond croissant and it was amazing! So light and buttery and oh my
how chocolaty.
If youre looking for a light breakfast then head out here. Perfect spot for a
coffee\/latt√© before heading out to the old port',0,0,0),
('6443759740','XBMFEOxsul_HALa34wEY8w','c6Shr51XcbvAeXp6hb_Exg',4,'41218','Who
would have guess that you would be able to get fairly decent Vietnamese restaurant
in East York?
Not quite the same as Chinatown in terms of pricing (slightly higher) but
definitely one of the better Vietnamese restaurants outside of the neighbourhood.
When I dont have time to go to Chinatown, this is the next best thing as it is down
the street from me.
So far the only items I have tried are the phos (beef, chicken & vegetarian) - and
they have not disappointed me! Especially the chicken pho.
Next time I go back, Im going to try the banh cuon (steamed rice noodle) and the
vermicelli!',0,0,2),
('6443759752','3xPmB495dIPMRSHt5T3drg','c6Shr51XcbvAeXp6hb_Exg',4,'27-10-
2015','Always drove past this coffee house and wondered about it. BF and I finally
made the stop to try this place out.
Cute, quaint coffee shop with nice muskoka chairs outside. 
BF ordered an ice coffee and really enjoyed it! Guess we will be back
again!',1,0,0),
('6443759764','4D4JwxN07FFDIFswH8E4Ow','c6Shr51XcbvAeXp6hb_Exg',3,'41519','Not
bad!! Love that there is a gluten-free, vegan version of the cheese curds and
gravy!!
Havent done the poutine taste test yet with smokes but Im excited to see which is
better. However poutinis might win as they are vegan and gluten-free',1,0,0),
('6443759776','yL60onlTh1BmJKVLli_K3g','c6Shr51XcbvAeXp6hb_Exg',5,'42525','Love
this place!
Peggy is great with dogs and does a great job! She is very patience with him and
will make any adjustments you need before you leave the store. My little guy has no
problems coming here.
They also have very good bully sticks (the non-smelly ones) that my little guy and
his friends love!',3,0,0),
('6443759788','XBMFEOxsul_HALa34wEY8w','c6Shr51XcbvAeXp6hb_Exg',4,'41279','This is
currently my parents new favourite restaurant.
We come here in the morning for dim sum. They are not the cart pushing type of dim
sum, it is order off of the sheet. Dim sum is not bad and not expensive either.
We also frequent the dinner scene. Their set dinner menu is not bad. We typically
order a 6 dish menu and its big enough to feed a family of 9 with leftovers.
Overall, food is pretty tasty!',1,0,0);

INSERT INTO TIP_T (tipId, userId, busId,tipText,tipDate,tipComplimentCount)
VALUES
('101', 'yL60onlTh1BmJKVLli_K3g','PMH4oUa-bWELKogdtkWewg', 'Great Service!', '10-
16-2021', 3),
('102', 'yL60onlTh1BmJKVLli_K3g','PMH4oUa-bWELKogdtkWewg', 'Very polite! Had a
great time!', '05-04-2021', 1),
('103', 'MgAHuFGzScMAuLpDmHK7iQ','PMH4oUa-bWELKogdtkWewg', 'Thanks for the great
service :)', '11-06-2021', 1),
('104', 'MgAHuFGzScMAuLpDmHK7iQ','A_Ij4SwFmlRbVtRnsdSzWA', 'nice food nice staff',
'11-16-2021', 0),
('105', '2uZ8uULKN38ZiM-Iakr5TA','A_Ij4SwFmlRbVtRnsdSzWA', 'The waitress was very
polite', '10-20-2021', 3),
('106', '2uZ8uULKN38AiM-Iakr5TA','A_Ij4SwFmlRbVtRnsdSzWA', 'loved it', '10-10-
2021', 2),
('107', '6ZR7HuUpHk_NQNs0dT0oLg','A_Ij4SwFmlRbVtRnsdSzWA', 'great food', '02-02-
2021', 0),
('108', '6ZR7HuUpHk_NQNs0dT0oLg','nbhBRhZtdaZmMMeb2i02pg', 'Was not happy. Had to
wait a long time for the order', '10-16-2021', 0),
('109', '4D4JwxN07FFDIFswH8E4Ow','nbhBRhZtdaZmMMeb2i02pg', 'Loved the mocktails',
'10-16-2021', 9),
('110', 'xyTgJUyW9nPV1wbnr9u-_A','nbhBRhZtdaZmMMeb2i02pg', 'good food did not
disappoint', '10-16-2021', 1),
('111', '7xwLiQx0-lCOXBUDAcazZA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('112', 'wd_VNRXXGyoEUs-bMW5pGA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('113', 'rr8lzo9fJWDrFZb-qcDcvw','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('114', '7xwLiQx0-lCOXBUDAcazZA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('115', '4D4JwxN07FFDIFswH8E4Ow','OcUVZniPo7CnIG-Tv83XcQ', NULL, NULL, NULL),
('116', '4D4JwxN07FFDIFswH8E4Ow','OcUVZniPo7CnIG-Tv83XcQ', NULL, NULL, NULL),
('117', '7xwLiQx0-lCOXBUDAcazZA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('118', 'wd_VNRXXGyoEUs-bMW5pGA','OcUVZniPo7CnIG-Tv83XcQ', NULL, NULL, NULL),
('119', '2uZ8uULKN38AiM-Iakr5TA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL),
('120', '2uZ8uULKN38ZiM-Iakr5TA','OcUVZniPo7CnIG-Tv83XcQ', NULL, NULL, NULL),
('121', 'xyTgJUyW9nPV1wbnr9u-_A','OcUVZniPo7CnIG-Tv83XcQ', NULL, NULL, NULL),
('122', '7xwLiQx0-lCOXBUDAcazZA','EXsmUB2mJyJsCpCV-56Ujw', NULL, NULL, NULL);