drop database if exists AccountDB;
create database AccountDB;
use AccountDB;

SET FOREIGN_KEY_CHECKS=0;

-- tab_id "-ACCDB014-"
drop table if exists Tbl_Professional;

-- tab_id "-ACCDB013-"
drop table if exists Tbl_MapFacultyToProject;

-- tab_id "-ACCDB012-"
drop table if exists Tbl_MapStudentToFaculty;

-- tab_id "-ACCDB011-"
drop table if exists Tbl_MapStudentToProject;

-- tab_id "-ACCDB010-"
drop table if exists Tbl_Project;

-- tab_id "-ACCDB009-"
drop table if exists Tbl_Publication;

-- tab_id "-ACCDB008-"
drop table if exists Tbl_Domain;

-- tab_id "-ACCDB007-"
drop table if exists Tbl_Faculty;

-- tab_id "-ACCDB006-"
drop table if exists Tbl_Student;

-- tab_id "-ACCDB005-"
drop table if exists Tbl_Department;

-- tab_id "-ACCDB004-"
drop table if exists Tbl_Contact;

-- tab_id "-ACCDB003-"
drop table if exists Tbl_Account;

-- tab_id "-ACCDB002-"
drop table if exists Tbl_AccountBaseEntity;

-- tab_id "-ACCDB001-"
drop table if exists Tbl_AccountDBCode;

SET FOREIGN_KEY_CHECKS=1;

-- ----------- Tbl_AccountDBCode -----------------------------------------
create table Tbl_AccountDBCode(
  tab_id          varchar(15) default "-ACCDB001-",
  Id_int          int null,

  ACCDBCode         int primary key auto_increment,
  ACCDBCodeType     varchar(80) not null,
  ACCDBCodeLabel    varchar(80) not null,
  DBR_Status  int,
  foreign key (DBR_Status) references Tbl_AccountDBCode (ACCDBCode),
  DBR_Version int,
  foreign key (DBR_Version) references Tbl_AccountDBCode (ACCDBCode)
);
alter table Tbl_AccountDBCode auto_increment = 1001;

  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Organization_Type", "Private");
  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Organization_Type", "Public");
  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Organization_Type", "Other");

  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Publication_Type", "Journal Article");
  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Publication_Type", "Case Study");
  insert into Tbl_AccountDBCode(ACCDBCodeType, ACCDBCodeLabel) values ("Publication_Type", "Other");

  -- ----------- Tbl_AccountBaseEntity -----------------------------------------

  create table Tbl_AccountBaseEntity(
              tab_id          varchar(15) default "-ACCDB002-",
              Id_uuid         varchar(40) primary key,
              Id_ui           varchar(40) unique key,
              NT              varchar(120),

              AccountDesc     varchar(500),
              Note            varchar(1000),

              CreatedOn       timestamp(6),
              CreatedBy       varchar(80),
              UpdatedOn       timestamp(6),
              UpdatedBy       varchar(80),

              DBR_Status  int,
              foreign key (DBR_Status) references Tbl_AccountDBCode (ACCDBCode),
              DBR_Version int,
              foreign key (DBR_Version) references Tbl_AccountDBCode (ACCDBCode)
  );

  -- ----------- Tbl_Account -----------------------------------------
  create table Tbl_Account
  (
  			      tab_id varchar(10) default "-ACCDB003-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
  			      foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid),

              Website varchar(80),
              Email varchar(80),
  			      SocialMediaId varchar(80),
              LegalTaxId varchar(80),
              LegalTaxId_label varchar(40),

              ParentAcct varchar(40),
              foreign key(ParentAcct) references Tbl_Account(Id_uuid)
  );

  -- ----------- Tbl_Contact -----------------------------------------
  create table Tbl_Contact
  (
  			      tab_id varchar(10) default "-ACCDB004-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
  			      foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid),

              DOB Date,
              Email varchar(80),
  			      SocialMediaId varchar(80),
              LegalTaxId varchar(80),
              LegalTaxId_label varchar(40),

              AccountId varchar(40),
              foreign key(AccountId) references Tbl_Account(Id_uuid)
  );

  -- ----------- Tbl_Department -----------------------------------------
  create table Tbl_Department
  (
              tab_id varchar(10) default "-ACCDB005-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
              foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid),

              AccountId varchar(40),
              foreign key(AccountId) references Tbl_Account(Id_uuid)
  );

  -- ----------- Tbl_Student -----------------------------------------
  create table Tbl_Student
  (
              tab_id varchar(10) default "-ACCDB006-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              ContactId varchar(40),
              foreign key(ContactId) references Tbl_Contact(Id_uuid)
  );

  -- ----------- Tbl_Faculty -----------------------------------------
  create table Tbl_Faculty
  (
              tab_id varchar(10) default "-ACCDB007-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              ContactId varchar(40),
              foreign key(ContactId) references Tbl_Contact(Id_uuid)
  );

  -- ----------- Tbl_Domain -----------------------------------------
  create table Tbl_Domain
  (
              tab_id varchar(10) default "-ACCDB008-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
              foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid)
  );

  -- ----------- Tbl_Publication -----------------------------------------
  create table Tbl_Publication
  (
              tab_id varchar(10) default "-ACCDB009-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
              foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid),

              PublicationType int,
              foreign key (PublicationType) references Tbl_AccountDBCode (ACCDBCode)
  );

  -- ----------- Tbl_Project -----------------------------------------
  create table Tbl_Project
  (
              tab_id varchar(10) default "-ACCDB010-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              BERef_uuid varchar(40),
              foreign key(BERef_uuid) references Tbl_AccountBaseEntity(Id_uuid),

              PublicationStatus bit,

              PublicationId varchar(40),
              foreign key(PublicationId) references Tbl_Publication(Id_uuid),

              DomainId varchar(40),
              foreign key(DomainId) references Tbl_Domain(Id_uuid)
  );

  -- ----------- Tbl_MapStudentToProject -----------------------------------------
  create table Tbl_MapStudentToProject
  (
              tab_id varchar(10) default "-ACCDB011-",
              Id_int int auto_increment primary key,

              StudentId varchar(40),
              foreign key(StudentId) references Tbl_Student(Id_uuid),

              ProjectId varchar(40),
              foreign key(ProjectId) references Tbl_Project(Id_uuid)
  );
  -- ----------- Tbl_MapStudentToFaculty -----------------------------------------
  create table Tbl_MapStudentToFaculty
  (
              tab_id varchar(10) default "-ACCDB012-",
              Id_int int auto_increment primary key,

              StudentId varchar(40),
              foreign key(StudentId) references Tbl_Student(Id_uuid),

              FacultyId varchar(40),
              foreign key(FacultyId) references Tbl_Faculty(Id_uuid)
  );

  -- ----------- Tbl_MapFacultyToProject -----------------------------------------
  create table Tbl_MapFacultyToProject
  (
              tab_id varchar(10) default "-ACCDB013-",
              Id_int int auto_increment primary key,

              FacultyId varchar(40),
              foreign key(FacultyId) references Tbl_Faculty(Id_uuid),

              ProjectId varchar(40),
              foreign key(ProjectId) references Tbl_Project(Id_uuid)
  );
  -- ----------- Tbl_Professional -----------------------------------------
  create table Tbl_Professional
  (
              tab_id varchar(10) default "-ACCDB014-",
              Id_int int auto_increment,
              key(Id_int),

              Id_uuid varchar(40) primary key,

              ContactId varchar(40),
              foreign key(ContactId) references Tbl_Contact(Id_uuid)
  );
