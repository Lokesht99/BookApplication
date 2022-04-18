create database Assignment5
use Assignment5

create table Category(CategoryID int primary key identity(1000,1),C_Name varchar(100));

create table Book(BookID int primary key identity(3000,1),B_Name varchar(100),Author varchar(100),Price int,Quantity int,B_Image varchar(100),Cat_ID int,constraint fk_d foreign key(Cat_ID) references Category(CategoryID))

create table OrderSummary(OrderSummaryID int primary key identity(5000,1),O_Name varchar(100),BookName varchar(100),Qty int,Amount int,B_id int,constraint fk_id foreign key(B_id) references Book(BookID))


CREATE TABLE [dbo].[Users](
[ID] [int] IDENTITY(1,1) NOT NULL,
[UserName] [varchar](50) NULL,
[UserPassword] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RoleMaster](
[ID] [int] IDENTITY(1,1) NOT NULL,
[RollName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UserRolesMapping](
[ID] [int] NOT NULL,
[UserID] [int] NOT NULL,
[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserRolesMapping] WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleMaster] ([ID])
GO



ALTER TABLE [dbo].[UserRolesMapping] WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO

insert into RoleMaster values('Admin');
insert into RoleMaster values('User');
insert into RoleMaster values('Customer');

insert into Users values('Admin','admin');
insert into Users values('User','user');
insert into Users values('Customer','customer');

insert into UserRolesMapping values(1,1,1);
insert into UserRolesMapping values(2,1,2);
insert into UserRolesMapping values(3,1,3);
insert into UserRolesMapping values(4,2,2);
insert into UserRolesMapping values(5,3,3);

select * from RoleMaster

select * from Users

select * from UserRolesMapping