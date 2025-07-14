create table Plant(
	Id int identity (1,1) primary key,
	Name varchar (50) not null,
	City varchar (30) not null,
	Country varchar (30) not null,
	TotalArea decimal (10,2) not null,
	Year int not null

)

go

create table CarModel (
	IdModel int identity (1,1) primary key,
	Name varchar (50) not null,
	CarType varchar (5) not null,
	Capacity float not null,
	Year int not null,
	FuelType varchar (10) not null
)

go

create table ProductionPlan (
	Id int identity (1,1) primary key,
	Name varchar (50) not null,
	Month varchar (10) not null,
	Year int not null,
	Target int not null,
	Notes varchar (300),
)

go

create table Dealer (
	Id int identity (1,1) primary key,
	DealerName varchar (50) not null,
	City varchar (30) not null,
	State varchar (30) not null,
	Contact varchar (20) not null,
	Year int not null

)

go

create table CarSale (
	Id int identity (1,1) primary key,
	CustName varchar (50) not null,
	CarModel varchar (30) not null,
	Date date not null,
	Price decimal (10,2) not null,
	PaymentType varchar (20) not null

)
go

create table MaintenanceLog (
	Id int identity (1,1) primary key,
	CustName varchar (50) not null,
	CarModel varchar (30) not null,
	Date date not null,
	ServiceType varchar (20) not null,
	ServiceCenterName varchar (30) not null

)
go

create table PartInventory (
	Id int identity (1,1) primary key,
	PartName varchar (50) not null,
	PartCategory varchar (30) not null,
	Stock int not null,
	Price decimal (10,2) not null,
	TypePart varchar (20) not null
)
go

create table CustomerFeedback (
	Id int identity (1,1) primary key,
	CustName varchar (50) not null,
	CarModel varchar (30) not null,
	Date date not null,
	Rating int not null,
	Comments varchar (400)
)
go