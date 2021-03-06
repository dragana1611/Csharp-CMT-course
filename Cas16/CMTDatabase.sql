

USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[skola](
	[skolaId] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](100) NOT NULL,
	[adresa] [nvarchar](100) NULL,
 CONSTRAINT [PK_skola] PRIMARY KEY CLUSTERED 
(
	[skolaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[polaznik](
	[polaznikId] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](100) NOT NULL,
	[prezime] [nvarchar](100) NOT NULL,
	[razred] [nvarchar](50) NULL,
	[skolaId] [int] NULL,
 CONSTRAINT [PK_polaznika] PRIMARY KEY CLUSTERED 
(
	[polaznikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[polaznik]  WITH CHECK ADD  CONSTRAINT [FK_polaznik_skola] FOREIGN KEY([skolaId])
REFERENCES [dbo].[skola] ([skolaId])
GO

ALTER TABLE [dbo].[polaznik] CHECK CONSTRAINT [FK_polaznik_skola]
GO


USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kurs](
	[kursId] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](100) NOT NULL,
	[jezik] [nvarchar](50) NULL,
 CONSTRAINT [PK_kurs] PRIMARY KEY CLUSTERED 
(
	[kursId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[predavac](
	[predavacId] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](100) NOT NULL,
	[prezime] [nvarchar](100) NOT NULL,
	[jmbg] [int] NOT NULL,
 CONSTRAINT [PK_predavac] PRIMARY KEY CLUSTERED 
(
	[predavacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pohadja](
	[polaznikId] [int] NOT NULL,
	[kursId] [int] NOT NULL,
	[ocena] [int] NULL,
 CONSTRAINT [PK_pohadja] PRIMARY KEY CLUSTERED 
(
	[polaznikId] ASC,
	[kursId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[pohadja]  WITH CHECK ADD  CONSTRAINT [FK_pohadja_kurs] FOREIGN KEY([kursId])
REFERENCES [dbo].[kurs] ([kursId])
GO

ALTER TABLE [dbo].[pohadja] CHECK CONSTRAINT [FK_pohadja_kurs]
GO

ALTER TABLE [dbo].[pohadja]  WITH CHECK ADD  CONSTRAINT [FK_pohadja_polaznik] FOREIGN KEY([polaznikId])
REFERENCES [dbo].[polaznik] ([polaznikId])
GO

ALTER TABLE [dbo].[pohadja] CHECK CONSTRAINT [FK_pohadja_polaznik]
GO

USE [CMT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[predaje](
	[predavacId] [int] NOT NULL,
	[kursId] [int] NOT NULL,
 CONSTRAINT [PK_predaje] PRIMARY KEY CLUSTERED 
(
	[predavacId] ASC,
	[kursId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[predaje]  WITH CHECK ADD  CONSTRAINT [FK_predaje_kurs] FOREIGN KEY([kursId])
REFERENCES [dbo].[kurs] ([kursId])
GO

ALTER TABLE [dbo].[predaje] CHECK CONSTRAINT [FK_predaje_kurs]
GO

ALTER TABLE [dbo].[predaje]  WITH CHECK ADD  CONSTRAINT [FK_predaje_predavac] FOREIGN KEY([predavacId])
REFERENCES [dbo].[predavac] ([predavacId])
GO

ALTER TABLE [dbo].[predaje] CHECK CONSTRAINT [FK_predaje_predavac]
GO


INSERT INTO skola VALUES ('Jovan Jovanović Zmaj', 'Zlatne Grede 4'); 
INSERT INTO skola VALUES ('Elektrotehnička škola Mihajlo Pupin', 'Futoška 17'); 
INSERT INTO skola VALUES ('Gimnazija Isidora Sekulić', 'Vladike Platona 2'); 
INSERT INTO skola VALUES ('Gimnazija Laza Kostić', 'Laze Lazarevića 1');  


INSERT INTO polaznik VALUES ('Aleksa', 'Đurđević', '3', 1 );
INSERT INTO polaznik VALUES ('Aleksandar', 'Cvejić', '4', 1);
INSERT INTO polaznik VALUES ('Aleksandar', 'Nikolić', 'fakultet', 1);
INSERT INTO polaznik VALUES ('Mario', 'Perić', '4', 1);
INSERT INTO polaznik VALUES ('Miloš', 'Miljanić', '4', 1);
INSERT INTO polaznik VALUES ('Nebojša', 'Horvat', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Nemanja', 'Brzak', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Nikola', 'Garabandić', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Ognjen', 'Nikolić', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Stefan', 'Vukanović', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Vladimir', 'Maćoš', 'fakultet', 2);
INSERT INTO polaznik VALUES ('Dragan', 'Draganić', NULL, 2);

INSERT INTO kurs VALUES ('OOP C#', 'C#');
INSERT INTO kurs VALUES ('C osnovni A', 'C');
INSERT INTO kurs VALUES ('C osnovni B', 'C');
INSERT INTO kurs VALUES ('C napredni B', NULL);


INSERT INTO predavac VALUES ('Boris', 'Šobot', 567891234);
INSERT INTO predavac VALUES ('Saša', 'Tošić', 567894567);
INSERT INTO predavac VALUES ('Zorana', 'Babić', 567897891);
INSERT INTO predavac VALUES ('Marko', 'Tot', 567893216);
INSERT INTO predavac VALUES ('Marko', 'Vasiljević', 567896549);
INSERT INTO predavac VALUES ('Vesna', 'Stanojevi', 567899873);
INSERT INTO predavac VALUES ('Ivan', 'Stojić', 567891472);

INSERT INTO predaje VALUES (1, 2);
INSERT INTO predaje VALUES (2, 2);

INSERT INTO predaje VALUES (7, 3);
INSERT INTO predaje VALUES (5, 3);

INSERT INTO predaje VALUES (4, 4);
INSERT INTO predaje VALUES (6, 4);

INSERT INTO predaje VALUES (3, 1);
INSERT INTO predaje VALUES (5, 1);


INSERT INTO pohadja VALUES (1, 1, 5);
INSERT INTO pohadja VALUES (2, 1, 4);
INSERT INTO pohadja VALUES (3, 3, 4);
INSERT INTO pohadja VALUES (4, 1, 2);
INSERT INTO pohadja VALUES (5, 1, 5);
INSERT INTO pohadja VALUES (6, 2, 3);
INSERT INTO pohadja VALUES (7, 2, 4);
INSERT INTO pohadja VALUES (8, 1, 5);
INSERT INTO pohadja VALUES (9, 1, 5);
INSERT INTO pohadja VALUES (10, 1, 4);
INSERT INTO pohadja VALUES (11, 1, 5);
INSERT INTO pohadja VALUES (2, 4, 4);
INSERT INTO pohadja VALUES (4, 3, 5);