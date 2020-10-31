-- Create Parent Table
CREATE TABLE parent (
	-- Columns for the parent table
	parent_id int identity,
	parent_first_name varchar(30) not null,
	parent_last_name varchar(50) not null,
	parent_street_address varchar(100) not null,
	parent_city varchar(30) not null,
	parent_state char(2) not null,
	parent_zipcode char(5) not null,
	parent_phone_number char(10) not null,
	parent_email_address varchar(100),
	parent_primary_language varchar(30),
	-- Constraints on Parent Table
	CONSTRAINT PK_parent PRIMARY KEY (parent_id)
)
-- End creating Parent Table.

-- Create School Table
CREATE TABLE school (
	-- Columns for the school table
	school_id int identity,
	school_name varchar(100) not null,
	school_street_address varchar(100) not null,
	school_city varchar(30) not null,
	school_state char(2) not null,
	school_zipcode char(5) not null,
	school_phone_number char(10) not null,
	school_sb_contact_first_name varchar(30) not null,
	school_sb_contact_last_name varchar(50) not null,
	school_sb_contact_phone_number char(10) not null,
	school_sb_contact_email_address varchar(100) not null,
	school_ss_contact_first_name varchar(30) not null,
	school_ss_contact_last_name varchar(50) not null,
	school_ss_contact_phone_number char(10) not null,
	school_ss_contact_email_address varchar(100) not null,
	-- Constraints on School Table
	CONSTRAINT PK_school PRIMARY KEY (school_id)
)
-- End creating School Table.

-- Create Vendor Table
CREATE TABLE vendor (
	-- Columns for the vendor table
	vendor_id int identity,
	vendor_name varchar(100) not null,
	vendor_street_address varchar(100) not null,
	vendor_city varchar(30) not null,
	vendor_state char(2) not null,
	vendor_zipcode char(5) not null,
	vendor_phone_number char(10) not null,
	vendor_contact_first_name varchar(30),
	vendor_contact_last_name varchar(50),
	vendor_email_address varchar(100),
	-- Constraints on Vendor Table
	CONSTRAINT PK_vendor PRIMARY KEY (vendor_id)
)
-- End creating Vendor Table.

-- Create Grade Level table
CREATE TABLE grade_level (
	-- Columns for the grade level table
	grade_level_id int identity,
	grade_level_name char(2),
	-- Constraints on Grade Level Table
	CONSTRAINT PK_grade_level PRIMARY KEY (grade_level_id)
)
-- End creating Grade Level Table

-- Create Spelling Bee Table
CREATE TABLE spelling_bee (
	-- Columns for the spelling bee table
	spellingbee_id int identity,
	pronounder_first_name varchar(30) not null,
	pronouncer_last_name varchar(50) not null,
	pronouncer_phone_number char(10) not null,
	pronouncer_email_address varchar(100) not null,
	judge_first_name varchar(30) not null,
	judge_last_name varchar(50) not null,
	judge_phone_number char(10) not null,
	judge_email_address varchar(100) not null,
	-- Constraints on Vendor Table
	CONSTRAINT PK_spelling_bee PRIMARY KEY (spellingbee_id)
)
-- End creating Spelling Bee Table.

/* To correct column name pronounder_first_name varchar(30) not null,
	I right clicked the column under Object Explorer, then corrected
	the coulmn name to pronouncer_first_name varchar(30) not null,
*/


-- Create Volunteer Table
CREATE TABLE volunteer (
	-- Columns for the volunteer table
	volunteer_id int identity,
	volunteer_first_name varchar(30) not null,
	volunteer_last_name varchar(50) not null,
	volunteer_phone_number char(10) not null,
	volunteer_email_address varchar(100),
	-- Constraints on Volunteer Table
	CONSTRAINT PK_volunteer PRIMARY KEY (volunteer_id)
)
-- End creating Volunteer Table.

-- Create Student Table
CREATE TABLE student (
	-- Columns for the student table
	student_id int identity,
	student_first_name varchar(30) not null,
	student_last_name varchar(50) not null,
	student_street_address varchar(100) not null,
	student_city varchar(30) not null,
	student_state char(2) not null,
	student_zipcode char(5) not null,
	student_gender char(1) not null,
	student_birthdate DATETIME not null,
	shirt_size char(3) not null,
	school_id int not null,
	grade_level_id int not null,
	-- Constraints on Student Table
	CONSTRAINT PK_student PRIMARY KEY (student_id),
	CONSTRAINT FK1_student FOREIGN KEY (school_id) REFERENCES school(school_id),
	CONSTRAINT FK2_student FOREIGN KEY (grade_level_id) REFERENCES grade_level(grade_level_id),
)
-- End creating Student Table.

-- Create Student Parent Table
CREATE TABLE student_parent (
	-- Columns for the student parent table
	student_parent_id int identity,
	student_id int not null,
	parent_id int not null,
	-- Constraints on Student  Parent Table
	CONSTRAINT PK_student_parent PRIMARY KEY (student_parent_id),
	CONSTRAINT FK1_student_parent FOREIGN KEY (student_id) REFERENCES student(student_id),
	CONSTRAINT FK2_student_parent FOREIGN KEY (parent_id) REFERENCES parent(parent_id),
)
-- End creating Student Parent Table.

-- Create Student Spelling Bee Table
CREATE TABLE student_spelling_bee (
	-- Columns for the student spelling bee table
	student_spelling_bee_id int identity,
	student_id int not null,
	spellingbee_id int not null,
	-- Constraints on Student Spelling Bee Table
	CONSTRAINT PK_student_spelling_bee PRIMARY KEY (student_spelling_bee_id),
	CONSTRAINT FK1_student_spelling_bee FOREIGN KEY (student_id) REFERENCES student(student_id),
	CONSTRAINT FK2_student_spelling_bee FOREIGN KEY (spellingbee_id) REFERENCES spelling_bee(spellingbee_id),
)
-- End creating Student Spelling Bee Table.

-- Create Volunteer Spelling Bee Table
CREATE TABLE volunteer_spelling_bee (
	-- Columns for the volunteer spelling bee table
	volunteer_spelling_bee_id int identity,
	volunteer_id int not null,
	spellingbee_id int not null,
	-- Constraints on Volunteer Spelling Bee Table
	CONSTRAINT PK_volunteer_spelling_bee PRIMARY KEY (volunteer_spelling_bee_id),
	CONSTRAINT FK1_volunteer_spelling_bee FOREIGN KEY (volunteer_id) REFERENCES volunteer(volunteer_id),
	CONSTRAINT FK2_volunteer_spelling_bee FOREIGN KEY (spellingbee_id) REFERENCES spelling_bee(spellingbee_id),
)
-- End creating Student Spelling Bee Table.

-- Create Super Saturday Class Table
CREATE TABLE ss_class (
	-- Columns for the super saturday class table
	ss_class_id int identity,
	ss_class_name varchar(100) not null,
	vendor_id int not null,
	-- Constraints on Super Saturday Class Table
	CONSTRAINT PK_ss_class PRIMARY KEY (ss_class_id),
	CONSTRAINT FK1_ss_class FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id),
)
-- End creating Super Saturday Class Table.

-- Create Grade Level Super Saturday Class Table
CREATE TABLE grade_level_ss_class (
	-- Columns for the Grade Level Super Saturday Class table
	grade_level_ss_class_id int identity,
	grade_level_id int not null,
	ss_class_id int not null,
	-- Constraints on Grade Level Super Saturday Class Table
	CONSTRAINT PK_grade_level_ss_class PRIMARY KEY (grade_level_ss_class_id),
	CONSTRAINT FK1_grade_level_ss_class FOREIGN KEY (grade_level_id) REFERENCES grade_level(grade_level_id),
	CONSTRAINT FK2_grade_level_ss_class FOREIGN KEY (ss_class_id) REFERENCES ss_class(ss_class_id),
)
-- End creating Grade Level Super Saturday Class Table.

-- Create Student Super Saturday Class Table
CREATE TABLE student_ss_class (
	-- Columns for the Student Super Saturday Class table
	student_ss_class_id int identity,
	student_id int not null,
	ss_class_id int not null,
	-- Constraints on Student Super Saturday Class Table
	CONSTRAINT PK_student_ss_class PRIMARY KEY (student_ss_class_id),
	CONSTRAINT FK1_student_ss_class FOREIGN KEY (student_id) REFERENCES student(student_id),
	CONSTRAINT FK2_student_ss_class FOREIGN KEY (ss_class_id) REFERENCES ss_class(ss_class_id),
)
-- End creating Student Super Saturday Class Table.

-- Create Volunteer Super Saturday Class Table
CREATE TABLE volunteer_ss_class (
	-- Columns for the Volunteer Super Saturday Class table
	volunteer_ss_class_id int identity,
	ss_class_id int not null,
	volunteer_id int not null,
	-- Constraints on Volunteer Super Saturday Class Table
	CONSTRAINT PK_volunteer_ss_class PRIMARY KEY (volunteer_ss_class_id),
	CONSTRAINT FK1_volunteer_ss_class FOREIGN KEY (ss_class_id) REFERENCES ss_class(ss_class_id),
	CONSTRAINT FK2_volunteer_ss_class FOREIGN KEY (volunteer_id) REFERENCES volunteer(volunteer_id),
)
-- End creating Volunteer Super Saturday Class Table.


-- Adding data into Parent Table
INSERT INTO parent(parent_first_name, parent_last_name, parent_street_address, parent_city, parent_state, parent_zipcode
	, parent_phone_number, parent_email_address, parent_primary_language)
	VALUES 
		('Lindy', 'Shwenn', '1 Milwaukee Street', 'Cary', 'NC', '27519', '9199717801', 'lshwenn0@geocities.jp', 'English'),
		('Venus', 'Ogers', '770 Oak Point', 'Raleigh', 'NC', '27506', '9195693844', 'vogers1@wiley.com', 'Spanish'),
		('Emlen', 'Readwin', '212 Novick Street', 'Raleigh', 'NC', '25706', '9197027306', 'ereadwin2@webnode.com', 'English'),
		('Desmund', 'Rosewell', '91 Debs Crossing', 'Apex', 'NC', '27511', '9194536439', 'drosewell3@themeforest.net', 'English'),
		('Devon', 'Rawles', '590 Briar Crest Terrace', 'Morrisville', 'NC', '27560', '9195777560', 'drawles4@yahoo.co.jp', 'Hindi'),
		('Jesus', 'Madre', '53317 Ilene Plaza', 'Raleigh', 'NC', '27509', '9196477809', 'jmadre5@webs.com', 'Spanish'),
		('Nan', 'Kennicott', '1296 Ruskin Place', 'Cary', 'NC', '25719', '9197527459', 'nkennicott6@wp.com', 'Mandarin'),
		('Henry', 'Lieb', '2683 Tennessee Court', 'Apex', 'NC', '27511', '9193335063', 'hlieb7@dailymotion.com', 'English'),
		('Opal', 'Coulthard', '48073 Crowley Way', 'Wake Forest', 'NC', '25709', '9191403281', 'ocoulthard8@hc360.com', 'English'),
		('Eveleen', 'Lum', '270 Quincy Court', 'Knightdale', 'NC', '27580', '9196047295', 'elum9@tumblr.com', 'English')
-- Examine Parent table
SELECT * FROM parent

-- Adding data into School Table
INSERT INTO school(school_name, school_street_address, school_city, school_state, school_zipcode, school_phone_number
		, school_sb_contact_first_name, school_sb_contact_last_name, school_sb_contact_phone_number, school_sb_contact_email_address
		, school_ss_contact_first_name, school_ss_contact_last_name, school_ss_contact_phone_number, school_ss_contact_email_address)
	VALUES
		('Brooks Elementary School', '53 Troy Pass', 'Raleigh', 'NC', '25706', '9195357600'
		, 'Yulma', 'Monson', '9195357696', 'ymonsonn@goo.ne.jp', 'Merridie', 'Hutcheons', '9195357655', 'mhutcheonso@bravesites.com'),
		('Powell Elementary School', '15362 Hooker Way', 'Raleigh', 'NC', '27516', '9197179800'
		, 'Ric', 'Lelliott', '9197179812', 'rlelliottp@ocn.ne.jp', 'Benetta', 'Boyton', '9197179820', 'bboytonq@fc2.com'),
		('Salem Elementary School', '24627 Eastlawn Center', 'Apex', 'NC', '27511', '9196522600'
		, 'Neils', 'Thomazet', '9196522650', 'nthomazetr@dailymotion.com', 'Elwood', 'Garbert', '9196522645', 'egarberts@sitemeter.com'),
		('Green Hope Elementary School', '14 Dapin Drive', 'Cary', 'NC', '27519', '9198487500'
		, 'Philippe', 'Janauschek', '9198487515', 'pjanauschekt@utexas.edu', 'Lew', 'Horley', '9198487526', 'lhorleyu@sohu.com'),
		('Knightdale Elementary School', '187 Lyons Junction', 'Knightdale', 'NC', '27580', '9196584500'
		, 'Danell', 'April', '9196584512', 'daprilv@privacy.gov.au', 'Charissa', 'Vivers', '9196584585', 'cviversw@webeden.co.uk')
-- Examine School table
SELECT * FROM school

-- Adding data into Vendor Table
INSERT INTO vendor(vendor_name, vendor_street_address, vendor_city, vendor_state, vendor_zipcode, vendor_phone_number
		, vendor_contact_first_name, vendor_contact_last_name, vendor_email_address) 
	VALUES
		('Armstrong and Sons', '851 Northwestern Alley', 'Raleigh', 'NC', '27509', '9193536159', 'Hunter', 'Kingswell', 'hkingswell14@amazon.de'),
		('Schulist, Kozey and Mitchell', '762 Schmedeman Hill', 'Raleigh', 'NC', '25706', '9196542653', 'Anna', 'Gruszka', 'agruszka15@domainmarket.com'),
		('Lakin, Smith and Treutel', '50324 Farragut Road', 'Cary', 'NC', '27511', '9197652356', 'Abbot', 'Oswick', 'aoswick16@unesco.org'),
		('Parker, Hegmann and Breitenberg', '71 Jay Center', 'Raleigh', 'NC', '27506', '9192643568', 'Normay', 'Hare', 'nhare17@accuweather.com'),
		('Jacobson, Grimes and Fadel', '34577 Butternut Place', 'Cary', 'NC', '27519', '9196549587', 'Billi', 'Harriott', 'bharriott18@myspace.com')
-- Examine Vendor table
SELECT * FROM vendor

-- Adding data into Grade Level Table
INSERT INTO grade_level(grade_level_name) 
	VALUES
		('00'), ('01'), ('02'), ('03'), ('04'), ('05'), ('06'), ('07'), ('08'), ('09'), ('10'), ('11'), ('12')
-- Examine Grade Level table
SELECT * FROM grade_level

-- Adding data into Spelling Bee table
INSERT INTO spelling_bee(pronounder_first_name, pronouncer_last_name, pronouncer_phone_number, pronouncer_email_address, judge_first_name
		, judge_last_name, judge_phone_number, judge_email_address) 
	VALUES
		('Joscelin', 'Martinuzzi', '9197640528', 'jmartinuzzi19@ftc.gov', 'Kevyn', 'Motherwell', '3369902143', 'kmotherwell1a@altervista.org'),
		('Hermione', 'Penna', '9104465981', 'hpenna1b@cnet.com', 'Demetris', 'Snoad', '9198052831', 'dsnoad1c@webeden.co'),
		('Leslie', 'Wharton', '9199406682', 'lwharton1d@1688.com', 'Ichabod', 'Degnen', '9193766811', 'idegnen1e@hubpages.com'),
		('Packston', 'Frisch', '9197908054', 'pfrisch1f@g.co', 'Theobald', 'Hatt', '9102155243', 'thatt1g@icq.com'),
		('Barrett', 'Newrick', '9197969774', 'bnewrick1h@hud.gov', 'Paige', 'Rutherford', '9191111283', 'prutherford1i@reverbnation.com')
-- Examine Spelling Bee table
SELECT * FROM spelling_bee

-- Adding data into Volunteer table
INSERT INTO volunteer(volunteer_first_name, volunteer_last_name, volunteer_phone_number, volunteer_email_address) 
	VALUES
		('Ferdinand', 'Godlee', '9194158919', 'fgodlee1j@a8.net'),
		('Deana', 'Cullen', '9194356357', 'dcullen1k@oakley.com'),
		('Daveta', 'Scyone', '9198825494', 'dscyone1l@ed.gov'),
		('Susette', 'Crab', '9197455420', 'scrab1m@bing.com'),
		('Caria', 'Hassan', '9193980110', 'chassan1n@domainmarket.com'),
		('Manfred', 'Endersby', '9198132223', 'mendersby1o@china.com.cn'),
		('Devlen', 'Elford', '9196073733', 'delford1p@vistaprint.com'),
		('Mandel', 'Holcroft', '9191558686', 'mholcroft1q@newsvine.com'),
		('Delmer', 'Mariot', '9191228775', 'dmariot1r@bravesites.com'),
		('Beulah', 'Kull', '9191287476', 'bkull1s@typepad.com')
-- Examine Volunteer table
SELECT * FROM volunteer

-- Enter extra data into volunteer table
INSERT INTO volunteer(volunteer_first_name, volunteer_last_name, volunteer_phone_number, volunteer_email_address) 
	VALUES
		('Opal', 'Coulthard', '9191403281', 'ocoulthard8@hc360.com'),
		('Eveleen', 'Lum', '9196047295', 'elum9@tumblr.com')
-- Examine Volunteer table
SELECT * FROM volunteer

-- Adding data into Student table
INSERT INTO student(student_first_name, student_last_name, student_street_address, student_city, student_state
		, student_zipcode, student_gender, student_birthdate, shirt_size, school_id, grade_level_id) 
	VALUES
		('William', 'Shwenn', '1 Milwaukee Street', 'Cary', 'NC', '27519', 'M', '03/09/2012', 'YS', '4', '03'),
		('Carrie', 'Ogers', '770 Oak Point', 'Raleigh', 'NC', '27506', 'F', '07/05/2008', 'YL', '2', '07'),
		('Mark', 'Readwin', '212 Novick Street', 'Raleigh', 'NC', '25706', 'M', '01/14/2009', 'YM', '1', '05'),
		('Eve', 'Rosewell', '91 Debs Crossing', 'Apex', 'NC', '27511', 'F', '02/12/2011', 'YM', '3', '04'),
		('Frankie', 'Rawles', '590 Briar Crest Terrace', 'Morrisville', 'NC', '27560', 'F', '01/04/2007', 'AS', '4', '08'),
		('Alex', 'Madre', '53317 Ilene Plaza', 'Raleigh', 'NC', '27509', 'M', '10/21/2010', 'AS', '1', '04'),
		('Tom', 'Kennicott', '1296 Ruskin Place', 'Cary', 'NC', '25719', 'M', '03/16/2007', 'YM', '2', '08'),
		('Heidi', 'Lieb', '2683 Tennessee Court', 'Apex', 'NC', '27511', 'F', '06/11/2011', 'YS', '3', '03'),
		('Beth', 'Coulthard', '48073 Crowley Way', 'Wake Forest', 'NC', '25709', 'F', '07/08/2009', 'YL', '5', '06'),
		('Dave', 'Lum', '270 Quincy Court', 'Knightdale', 'NC', '27580', 'M', '07/08/2007', 'AS', '5', '08')
-- Examine Student table
SELECT * FROM student

-- Adding data into Super Saturday table
INSERT INTO ss_class(ss_class_name, vendor_id) 
	VALUES
		('Bricks Stop Motion Animation Workshop', '1'),
		('Bricks Engineering Explorers', '1'),
		('Binary Code', '4'),
		('Optical Illusion', '5'),
		('Electronic Piano & Circuit Bending', '2'),
		('Introduction to the IMACS Mathematics Enrichment Program', '2'),
		('Bricks Junior Robotics', '3'),
		('Low Cost Stethoscope/ Hydraulic Hand and Arm', '3'),
		('Big Emotions, Little Bodies', '4'),
		('M&M Counting Fun/Estimation Station and Exploring Sound', '5')
-- Examine Super Saturday table
SELECT * FROM ss_class

-- Adding data into Student Parent table
INSERT INTO student_parent(student_id, parent_id) 
	VALUES
		('1', '1'), ('2', '2'), ('3', '3'),	('4', '4')
		, ('5', '5'), ('6', '6'), ('7', '7')
		, ('8', '8'), ('9', '9'), ('10', '10')
-- Examine Student Parent table
SELECT * FROM student_parent

-- Adding data into Student Parent table
INSERT INTO student_spelling_bee(student_id, spellingbee_id) 
	VALUES
		('1', '2'), ('2', '5'),	('3', '2'),	('4', '1')
		, ('5', '3'), ('6', '4'), ('7', '5')
		, ('8', '1'), ('9', '3'), ('10', '4') 
-- Examine Student Spelling Bee table
SELECT * FROM student_spelling_bee

-- Adding data into Volunteer Spelling Bee table
INSERT INTO volunteer_spelling_bee(volunteer_id, spellingbee_id)
	VALUES
		('1', '1'),	('4', '1'),	('7', '2'),	('9', '2')
		, ('10', '3'), ('5', '3'), ('2', '4')
		, ('3', '4'), ('6', '5'), ('8', '5')
-- Examine Volunteer Spelling Bee table
SELECT * FROM volunteer_spelling_bee

-- Adding data into Grade Level Super Satuerday Class table
INSERT INTO grade_level_ss_class(grade_level_id, ss_class_id)
	VALUES
		('1', '2'), ('1', '6'), ('1', '10'), ('2', '2')
		, ('2', '6'), ('2', '10'), ('3', '2'), ('3', '6')
		, ('3', '10'), ('4', '1'), ('4', '2'), ('4', '3')
		, ('4', '4'), ('4', '7'), ('4', '8'), ('5', '1')
		, ('5', '2'), ('5', '3'), ('5', '4'), ('5', '7')
		, ('5', '8'), ('6', '1'), ('6', '2'), ('6', '3')
		, ('6', '4'), ('6', '7'), ('6', '8'), ('7', '5')
		, ('7', '9'), ('8', '5'), ('8', '9'), ('9', '5')
		, ('9', '9')
-- Examine Grade Level Super Saturday table
SELECT * FROM grade_level_ss_class

-- Adding data into Student Super Saturday table
INSERT INTO student_ss_class(student_id, ss_class_id)
	VALUES
		('1', '2'), ('1', '6'), ('3', '1'), ('3', '4')
		, ('4', '4'), ('4', '7'), ('5', '9'), ('7', '5')
		, ('7', '9'), ('8', '1'), ('8', '10'), ('9', '1')
		, ('9', '2'), ('10', '9')
-- Examine Student Super Saturday Class table
SELECT * FROM student_ss_class

-- Adding data into Volunteer Super Saturday Class table
INSERT INTO volunteer_ss_class (ss_class_id, volunteer_id)
	VALUES
		('1', '1'), ('2', '2'), ('3', '3'), ('4', '4')
		, ('5', '5'), ('6', '6'), ('7', '7')
		, ('8', '8'), ('9', '9'), ('10', '10')
-- Examine Volunteer Super Saturday Class table
SELECT * FROM volunteer_ss_class

-- To create Super Saturday and Spelling Bee school contact list (for Question 1 and 2)
GO
CREATE VIEW SBandSSContacts 
AS
SELECT 
		school_name															AS SchoolName
		, school_sb_contact_last_name + ',' + school_sb_contact_first_name	AS SpellBName
		, school_sb_contact_phone_number									AS SpellBNumber
		, school_sb_contact_email_address									AS SpellBEmail
		, school_ss_contact_last_name + ',' + school_ss_contact_first_name	AS SupSatName
		, school_ss_contact_phone_number									AS SupSatNumber
		, school_ss_contact_email_address									AS SupSatEmail
	FROM school
GO 

-- Examine Create View SBandSSContacts
SELECT * FROM SBandSSContacts 

-- To create Parent contact list (for Question 3)
GO
CREATE VIEW ParentContactInfo 
AS
SELECT 
		parent_last_name + ',' + parent_first_name								AS ParentName
		, parent_street_address + parent_city + parent_state + parent_zipcode	AS ParentAddress
		, parent_phone_number													AS ParentNumber
		, parent_email_address													AS ParentEmail
	FROM parent
GO 

-- Drop ParentContactView due to errors
DROP VIEW ParentContactInfo 

-- To create Corrected Parent contact list (for Question 3)
GO
CREATE VIEW ParentContactInfo 
AS
SELECT 
		parent_last_name + ',' + parent_first_name												AS ParentName
		, parent_street_address + ',' + parent_city + ',' + parent_state + ' ' + parent_zipcode	AS ParentAddress
		, parent_phone_number																	AS ParentNumber
		, parent_email_address																	AS ParentEmail
	FROM parent
GO 

-- Examine Parent Contact List
SELECT * FROM ParentContactInfo

-- To see if parents are also willing to volunteer for PAGE (for Question 4)
GO
CREATE VIEW ParentVolunteerList 
AS
SELECT 
		parent_last_name + ',' + parent_first_name							AS ParentName
		, volunteer_last_name + ',' + volunteer_first_name					AS VolunteerName
	FROM parent, volunteer
	WHERE parent_last_name = volunteer_last_name
GO 

-- Examine how many parent also volunteer
SELECT * FROM ParentVolunteerList

-- To see if schools have both a Spelling Bee and have students in Super Saturday classes (Question 5)
GO
CREATE VIEW SpellingBeeandSupSatClassSchools
AS
SELECT 
		student_last_name + ',' + student_first_name	AS StudetnName
		, school_name									AS School	
		, ss_class_name									AS SSClassName
	FROM school 
	INNER JOIN student ON school.school_id = student.school_id 
	INNER JOIN ss_class 
	INNER JOIN student_ss_class ON ss_class.ss_class_id = student_ss_class.ss_class_id
	ON student.student_id = student_ss_class.student_id
GO

DROP VIEW SpellingBeeandSupSatClassSchools

-- To see if schools have both a Spelling Bee and have students in Super Saturday classes (Question 5)
GO
CREATE VIEW SpellingBeeandSupSatClassSchools
AS
SELECT 
		student_last_name + ',' + student_first_name	AS StudentName
		, school_name									AS School	
		, ss_class_name									AS SSClassName
	FROM school 
	INNER JOIN student ON school.school_id = student.school_id 
	INNER JOIN ss_class 
	INNER JOIN student_ss_class ON ss_class.ss_class_id = student_ss_class.ss_class_id
	ON student.student_id = student_ss_class.student_id
GO
-- Examine schools that have Spelling Bee and Sup. Sat. Classes
SELECT * FROM SpellingBeeandSupSatClassSchools
	ORDER BY school

-- To see which students are participating in Super Saturday classes (Question 6).
GO
CREATE VIEW StudentsandSupSatClasses
AS
SELECT 
		student_last_name + ',' + student_first_name	AS StudentName	
		, ss_class_name									AS SSClassName
	FROM student
	LEFT JOIN student_ss_class ON student.student_id = student_ss_class.student_id
	LEFT JOIN ss_class ON ss_class.ss_class_id = student_ss_class.ss_class_id
GO
-- Examine which students are participating in Super Saturday classes.
SELECT * FROM StudentsandSupSatClasses

-- To see which type of classes PAGE is offering on Super Saturday (Question 7)
GO 
CREATE VIEW SupSatClassList
AS
	SELECT 
		ss_class_name			AS SupSatClassList
	FROM ss_class
GO
-- Examine Super Saturday Class list to see the types of classes offered
SELECT * FROM SupSatClassList

-- To count how many pronouncers are in the database
GO
CREATE FUNCTION dbo.pronouncercount(@pronouncer_last_name varchar(30))
RETURNS int AS -- COUNT() is an integer value, so return it as an int
BEGIN
	DECLARE @returnValue varchar(30) -- matches the function's return type

	SELECT @returnValue = COUNT(pronouncer_last_name) FROM spelling_bee
	WHERE spelling_bee.pronouncer_last_name = @pronouncer_last_name

	RETURN @returnValue
END
GO
-- Function did work the way it was needed, deleted it. 
DROP FUNCTION dbo.pronouncercount

-- To see how many pronouncers PAGE has for Spelling and their contact info (Question 8&9).
GO
CREATE VIEW SpellBeePronouncerList
AS
SELECT 
		pronouncer_last_name + ',' + pronouncer_first_name	AS PronouncerName	
		, pronouncer_phone_number							AS PronouncerNumber
		, pronouncer_email_address							AS PronouncerEmail
	FROM spelling_bee
GO
-- Examine how many pronouncers PAGE has for Spelling and their contact info (Question 8&9).
SELECT * FROM SpellBeePronouncerList

-- To see how many judges PAGE has for Spelling and their contact info (Question 8&9).
GO
CREATE VIEW SpellBeeJudgeList
AS
SELECT 
		judge_last_name + ',' + judge_first_name	AS JudgeName	
		, judge_phone_number						AS JudgeNumber
		, judge_email_address						AS JudgeEmail
	FROM spelling_bee
GO
-- Examine how many judges PAGE has for Spelling and thier contact info (Question 8&9).
SELECT * FROM SpellBeeJudgeList

-- To create volunteer list.
GO
CREATE VIEW VolunteerList
AS
SELECT 
		volunteer_last_name + ',' + volunteer_first_name	AS VolunteerName	
		, volunteer_phone_number							AS VolunteerNumber
		, volunteer_email_address							AS VolunteerEmail
	FROM volunteer
GO
-- Examine Volunteer List.
SELECT * FROM VolunteerList