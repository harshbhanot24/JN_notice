CREATE TABLE `user` (
	`UID` INT(10) NOT NULL AUTO_INCREMENT,
	`NAME` VARCHAR(100) NOT NULL,
	`EMAIL` VARCHAR(200) NOT NULL,
	`PASSWORD` VARCHAR(100) NOT NULL,
	`ACTIVE` CHAR(1) NOT NULL DEFAULT '1',
	`TYPE` CHAR(50) NOT NULL,
	`CREATED` DATETIME NOT NULL,
	`UPDATED` DATETIME NOT NULL,
	`TRADE` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`UID`)
);



CREATE TABLE `notice` (
	`NID` INT(10) NOT NULL AUTO_INCREMENT,
	`HEADING` VARCHAR(100) NOT NULL,
	`NAME` VARCHAR(1000) NOT NULL,
	`TRADE` VARCHAR(60) NOT NULL,
	`URL` VARCHAR(500) NOT NULL,
	`ATTACHEMENT` VARCHAR(5) NOT NULL,
	`TYPE` VARCHAR(30) NOT NULL,
	`IS_TIMED` VARCHAR(5) NOT NULL,
	`START_DATE` DATETIME NOT NULL,
	`END_DATE` DATETIME NOT NULL,
	`ACTIVE` VARCHAR(10) NOT NULL,
	`CREATED` DATETIME NOT NULL,
	`UPDATED` DATETIME NOT NULL,
	PRIMARY KEY (`NID`)
);


CREATE TABLE `notice_attachemnt` (
	`NAID` INT(10) NOT NULL AUTO_INCREMENT,
	`NID` INT(10) NOT NULL,
	`FILE_NAME` VARCHAR(150) NOT NULL,
	`CONTENT_TYPE` VARCHAR(150) NOT NULL,
	`FILE` MEDIUMBLOB NOT NULL,
	`CREATED` DATETIME NOT NULL,
	`UPDATED` DATETIME NOT NULL,
	PRIMARY KEY (`NAID`),
	INDEX `FK__notice` (`NID`),
	CONSTRAINT `FK__notice` FOREIGN KEY (`NID`) REFERENCES `notice` (`NID`) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO USER_ROLE (ROLE,ACTIVE,CREATED, UPDATED) VALUES ('ADMIN','Y',NOW(),NOW());
INSERT INTO USER_ROLE (ROLE,ACTIVE,CREATED, UPDATED) VALUES ('FACULTY','Y',NOW(),NOW());
INSERT INTO USER_ROLE (ROLE,ACTIVE,CREATED, UPDATED) VALUES ('STUDENT','N',NOW(),NOW());

INSERT INTO TRADE (TRADE_SHORT,TRADE_NAME,ACTIVE,CREATED, UPDATED) VALUES ('ECE','ELECTRONICS & COMMUNICATION','Y',NOW(),NOW());
INSERT INTO TRADE (TRADE_SHORT,TRADE_NAME,ACTIVE,CREATED, UPDATED) VALUES ('ME','MECHANICAL','Y',NOW(),NOW());
INSERT INTO TRADE (TRADE_SHORT,TRADE_NAME,ACTIVE,CREATED, UPDATED) VALUES ('CE','CIVIL','Y',NOW(),NOW());
INSERT INTO TRADE (TRADE_SHORT,TRADE_NAME,ACTIVE,CREATED, UPDATED) VALUES ('TE','TEXTILE','Y',NOW(),NOW());

insert into user(UTID,TID,name,email,password,active,created,updated) values(1,1,'Harsh','sunnypaonta@gmail.com','abc','Y',now(),now());

//so select user table
select ur.role,u.name,t.trade_short,u.active,u.created,u.updated from user u,user_role ur,trade t where u.TID=t.TID and u.URID=ur.URID;



//here to select notice from notice table attached by foreign key of notice with user foreign key of trade with notice
////////////////////////////////////////
select notice.NID,notice.UID,notice.HEADING,notice.MESSAGE,notice.IS_ATTACHEMENT,notice.`TYPE`,notice.IS_TIMED,notice.START_DATE,notice.END_DATE,notice.ACTIVE,trade.TRADE_SHORT,trade.TRADE_NAME,user.NAME from notice,trade,user where user.UID=notice.UID and trade.NID=notice.NID
////////////////////////////////////////////////
/////////////////////////////////////////////simple query on notice table/////////////////////
select notice.NID,notice.UID,notice.HEADING,notice.MESSAGE,notice.IS_ATTACHEMENT,notice.`TYPE`,notice.IS_TIMED,notice.START_DATE,notice.END_DATE from notice
//////////////////////////////////////////////////////////////////////////////////////////
///////////////query to select trade from table using notice fk/////////
select trade.TRADE_SHORT,trade.TRADE_NAME,notice.NID from trade,notice where trade.NID=notice.NID
////////////////////////////////////////////////////////////////////////////////////
////////////////////////query to select user from user table using notice FK
////////////select notice.NID,user.NAME from notice,user where notice.UID=user.UID/////////////////////	