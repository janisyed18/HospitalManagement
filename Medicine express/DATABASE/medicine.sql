drop database medicineexpress;
create database medicineexpress;
use medicineexpress;

create table Medical(
 MedicalId int auto_increment primary key,
 Name varchar(255) not null,
 RegistrationNumber int not null unique,
 Ownername varchar(255) not null,
 Phone varchar(255) not null unique,
 Password varchar(255) not null,
 Email varchar(255) not null unique,
 Opentime varchar(255)  not null,
 Closetime varchar(255) not null,
 Documents varchar(255) not null,
 Address varchar(255) not null,
 Status varchar(255) default 'activated'
);


create table Doctor(
DoctorId int auto_increment primary key,
Name varchar(255) not null,
Email varchar(255) not null unique,
Phone varchar(255) not null unique,
Password varchar(255) not null,
Education varchar(255) not null,
RegistrationNumber int not null unique,
Address varchar(255) not null,
Languages varchar(255) not null,
Experience varchar(255) not null,
Abouthim varchar(255) not null,
Photo varchar(255) not null,
Starttime varchar(255) not null,
Endtime varchar(255) not null,
Lunchtime varchar(255) not null,
Speciality varchar(255) not null,
Status  varchar(255) default 'activated'
);

create table Patient(
PatientId int auto_increment primary key,
Name varchar(255) not null,
Email varchar(255) not null unique,
Phone varchar(255) not null unique,
Password varchar(255) not null,
Age int not null,
Gender varchar(255) not null
);

create table Category(
CategoryId int auto_increment primary key,
CategoryName varchar(255) not null unique
);
 
 create table Subcategory(
 SubcategoryId int auto_increment primary key,
 SubcategoryName varchar(255) not null,
 CategoryId int not null,
 FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
 );


create table Medicine(
 MedicineId int auto_increment primary key,
 MedicineName varchar(255) not null,
 Brand varchar(255) not null,
 Power varchar(255) not null,
 PackingType varchar(255) not null,
 PrescriptionType varchar(255) not null,
 Mrp int not null,
 Description varchar(255) not null,
 Picture varchar(255) not null,
 Status varchar(255) not null default 'published',
 CategoryId int not null,
 SubcategoryId int not null,
 FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId),
 FOREIGN KEY (SubcategoryId) REFERENCES Subcategory(SubcategoryId)
 );
 
 create table StoreMedicines(
 StoreMedicineId int auto_increment primary key,
 MedicineId int not null,
 Quantity int not null,
 price int not null,
 FOREIGN KEY (MedicineId) REFERENCES Medicine(MedicineId)
 );
 

 create table Availability(
 AvailabilityId int auto_increment primary key,
 MedicineId int not null,
 MedicalId int not null,
 Available varchar(255) not null,
 price  varchar(255) not null,
 FOREIGN KEY (MedicineId) REFERENCES Medicine(MedicineId),
 FOREIGN KEY (MedicalId) REFERENCES Medical(MedicalId)
 );
 
create table PatientReport(
PatientreportId int auto_increment primary key,
Reporttitle varchar(255) not null,
Reportvalue varchar(255) not null,
PatientId int not null,
DoctorId int not null,
Datee DATETIME  default CURRENT_TIMESTAMP,
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId)
);
drop table PatientReport;

create table Prescription(
PrescriptionId int auto_increment primary key,
DoctorId int not null,
PatientId int not null,
Status varchar(255) default 'New',
Datee DATETIME  default CURRENT_TIMESTAMP,
FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId)
);


create table PatientMedicine(
PatientMedicineId int auto_increment primary key,
PrescriptionId int not null,
Quantity varchar(255) not null,
Price varchar(255),
MedicalId int,
MedicineId int , 
status varchar(255) default 'New',
FOREIGN KEY (PrescriptionId) REFERENCES Prescription(PrescriptionId),
FOREIGN KEY (MedicalId) REFERENCES Medical(MedicalId),
FOREIGN KEY (MedicineId) REFERENCES Medicine(MedicineId)
);

drop table Medicineorder;
create table Medicineorder(
Medicineorderid int auto_increment primary key,
PatientId int not null,
MedicalId int not null,
Status varchar(255) default 'Cart',
Datee DATETIME  default CURRENT_TIMESTAMP,
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (MedicalId) REFERENCES Medical(MedicalId)
);

drop table MedicineItem;
create table MedicineItem(
MedicineItemId int auto_increment primary key,
Medicineorderid int not null,
PatientId int not null,
MedicalId int not null,
MedicineId int not null,
PatientMedicineId int not null,
Quantity varchar(255) not null,
Price varchar(255),
Status varchar(255) default 'New',
FOREIGN KEY (Medicineorderid) REFERENCES Medicineorder(Medicineorderid),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (MedicalId) REFERENCES Medical(MedicalId),
FOREIGN KEY (MedicineId) REFERENCES Medicine(MedicineId),
FOREIGN KEY (PatientMedicineId) REFERENCES PatientMedicine(PatientMedicineId)
);
 
 drop table Wallet;
create table Wallet(
WalletId int auto_increment primary key,
PatientId int not null,
Medicineorderid int not null,
Amount varchar(255) not null,
WalletDate varchar(255) not null,
MedicalId int not null,
Datee DATETIME  default CURRENT_TIMESTAMP,
FOREIGN KEY (MedicalId) REFERENCES Medical(MedicalId),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (Medicineorderid) REFERENCES Medicineorder(Medicineorderid)
 );
 
select curdate() from MedicineItem;