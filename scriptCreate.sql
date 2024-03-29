
CREATE DATABASE [Proiect];

CREATE TABLE [dbo].[Adresa](
	[id_adresa] [int] IDENTITY(1,1) NOT NULL,
	[oras] [varchar](50) NOT NULL,
	[strada] [varchar](50) NOT NULL,
	[numar] [int] NOT NULL,
	[apartament] [int] NULL,
	[cod_postal] [int] NOT NULL,
	[id_client] [int] NOT NULL,
	[bloc] [int] NULL,
	[etaj] [int] NULL,
 CONSTRAINT [PK_Adresa_1] PRIMARY KEY CLUSTERED 
(
	[id_adresa] ASC
));



CREATE TABLE [dbo].[Angajat](
	[id_angajat] [int] IDENTITY(1,1) NOT NULL,
	[nume_angajat] [varchar](50) NOT NULL,
	[prenume_angajat] [varchar](50) NOT NULL,
	[email_angajat] [varchar](50) NOT NULL,
	[salariu] [int] NULL,
	[id_departament] [int] NOT NULL,
	[data_angajare] [date] NOT NULL,
 CONSTRAINT [PK_Angajat] PRIMARY KEY CLUSTERED 
(
	[id_angajat] ASC
));

CREATE TABLE [dbo].[Client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[id_adresa] [int] NOT NULL,
	[nume_client] [varchar](50) NOT NULL,
	[prenume_client] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[numar_telefon] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client_1] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
));
CREATE TABLE [dbo].[Comanda](
	[id_comanda] [int] IDENTITY(1,1) NOT NULL,
	[id_client] [int] NOT NULL,
	[id_adresa] [int] NOT NULL,
	[id_angajat] [int] NOT NULL,
 CONSTRAINT [PK_Comanda] PRIMARY KEY CLUSTERED 
(
	[id_comanda] ASC
));
CREATE TABLE [dbo].[Departament](
	[id_departament] [int] IDENTITY(1,1) NOT NULL,
	[nume_departament] [varchar](50) NOT NULL,
	[email_departament] [varchar](50) NULL,
 CONSTRAINT [PK_Departament] PRIMARY KEY CLUSTERED 
(
	[id_departament] ASC
));
CREATE TABLE [dbo].[Produs](
	[id_produs] [int] IDENTITY(1,1) NOT NULL,
	[nume_produs] [varchar](50) NOT NULL,
	[descriere] [varchar](50) NULL,
	[pret] [int] NOT NULL,
	[stoc] [int] NULL,
 CONSTRAINT [PK_Produs] PRIMARY KEY CLUSTERED 
(
	[id_produs] ASC
));
CREATE TABLE [dbo].[ProdusComanda](
	[id_produscomanda] [int] IDENTITY(1,1) NOT NULL,
	[id_comanda] [int] NOT NULL,
	[id_produs] [int] NOT NULL,
	[numar_bucati] [int] NOT NULL,
 CONSTRAINT [PK_ProdusComanda] PRIMARY KEY CLUSTERED 
(
	[id_produscomanda] ASC
));
CREATE TABLE [dbo].[ProdusRecenzie](
	[id_produsrecenzie] [int] IDENTITY(1,1) NOT NULL,
	[id_produs] [int] NULL,
	[id_recenzie] [int] NULL,
 CONSTRAINT [PK_ProdusRecenzie] PRIMARY KEY CLUSTERED 
(
	[id_produsrecenzie] ASC
));
CREATE TABLE [dbo].[ProdusReducere](
	[id_produsreducere] [int] IDENTITY(1,1) NOT NULL,
	[id_produs] [int] NULL,
	[id_reducere] [int] NULL,
 CONSTRAINT [PK_ProdusReducere] PRIMARY KEY CLUSTERED 
(
	[id_produsreducere] ASC
));
CREATE TABLE [dbo].[Recenzie](
	[id_recenzie] [int] IDENTITY(1,1) NOT NULL,
	[titlu] [varchar](50) NOT NULL,
	[continut] [varchar](50) NOT NULL,
	[nota] [int] NULL,
 CONSTRAINT [PK_Recenzie] PRIMARY KEY CLUSTERED 
(
	[id_recenzie] ASC
));
CREATE TABLE [dbo].[Reducere](
	[id_reducere] [int] IDENTITY(1,1) NOT NULL,
	[id_produs] [int] NOT NULL,
	[data_inceput] [date] NULL,
	[data_sfarsit] [date] NULL,
	[tip] [varchar](50) NULL,
	[valoare] [int] NULL,
 CONSTRAINT [PK_Reducere] PRIMARY KEY CLUSTERED 
(
	[id_reducere] ASC
));
ALTER TABLE [dbo].[Angajat] ADD  CONSTRAINT [DF_Angajat_data_angajare]  DEFAULT (getdate()) FOR [data_angajare]
GO
ALTER TABLE [dbo].[Reducere] ADD  CONSTRAINT [DF_Reducere_data_inceput]  DEFAULT (getdate()) FOR [data_inceput]
GO
ALTER TABLE [dbo].[Reducere] ADD  CONSTRAINT [DF_Reducere_data_sfarsit]  DEFAULT (getdate()) FOR [data_sfarsit]
GO
ALTER TABLE [dbo].[Angajat]  WITH CHECK ADD  CONSTRAINT [FK_Angajat_Departament] FOREIGN KEY([id_departament])
REFERENCES [dbo].[Departament] ([id_departament])
GO
ALTER TABLE [dbo].[Angajat] CHECK CONSTRAINT [FK_Angajat_Departament]
GO
ALTER TABLE [dbo].[Comanda]  WITH CHECK ADD  CONSTRAINT [FK_Comanda_Adresa] FOREIGN KEY([id_adresa])
REFERENCES [dbo].[Adresa] ([id_adresa])
GO
ALTER TABLE [dbo].[Comanda] CHECK CONSTRAINT [FK_Comanda_Adresa]
GO
ALTER TABLE [dbo].[Comanda]  WITH CHECK ADD  CONSTRAINT [FK_Comanda_Angajat] FOREIGN KEY([id_angajat])
REFERENCES [dbo].[Angajat] ([id_angajat])
GO
ALTER TABLE [dbo].[Comanda] CHECK CONSTRAINT [FK_Comanda_Angajat]
GO
ALTER TABLE [dbo].[Comanda]  WITH CHECK ADD  CONSTRAINT [FK_Comanda_Client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[Comanda] CHECK CONSTRAINT [FK_Comanda_Client]
GO
ALTER TABLE [dbo].[ProdusComanda]  WITH CHECK ADD  CONSTRAINT [FK_ProdusComanda_Comanda] FOREIGN KEY([id_comanda])
REFERENCES [dbo].[Comanda] ([id_comanda])
GO
ALTER TABLE [dbo].[ProdusComanda] CHECK CONSTRAINT [FK_ProdusComanda_Comanda]
GO
ALTER TABLE [dbo].[ProdusComanda]  WITH CHECK ADD  CONSTRAINT [FK_ProdusComanda_Produs] FOREIGN KEY([id_produs])
REFERENCES [dbo].[Produs] ([id_produs])
GO
ALTER TABLE [dbo].[ProdusComanda] CHECK CONSTRAINT [FK_ProdusComanda_Produs]
GO
ALTER TABLE [dbo].[ProdusRecenzie]  WITH CHECK ADD  CONSTRAINT [FK_ProdusRecenzie_Produs] FOREIGN KEY([id_produs])
REFERENCES [dbo].[Produs] ([id_produs])
GO
ALTER TABLE [dbo].[ProdusRecenzie] CHECK CONSTRAINT [FK_ProdusRecenzie_Produs]
GO
ALTER TABLE [dbo].[ProdusRecenzie]  WITH CHECK ADD  CONSTRAINT [FK_ProdusRecenzie_Recenzie] FOREIGN KEY([id_recenzie])
REFERENCES [dbo].[Recenzie] ([id_recenzie])
GO
ALTER TABLE [dbo].[ProdusRecenzie] CHECK CONSTRAINT [FK_ProdusRecenzie_Recenzie]
GO
ALTER TABLE [dbo].[ProdusReducere]  WITH CHECK ADD  CONSTRAINT [FK_ProdusReducere_Produs] FOREIGN KEY([id_produs])
REFERENCES [dbo].[Produs] ([id_produs])
GO
ALTER TABLE [dbo].[ProdusReducere] CHECK CONSTRAINT [FK_ProdusReducere_Produs]
GO
ALTER TABLE [dbo].[ProdusReducere]  WITH CHECK ADD  CONSTRAINT [FK_ProdusReducere_Reducere] FOREIGN KEY([id_reducere])
REFERENCES [dbo].[Reducere] ([id_reducere])
GO
ALTER TABLE [dbo].[ProdusReducere] CHECK CONSTRAINT [FK_ProdusReducere_Reducere]
GO
ALTER TABLE [dbo].[Angajat]  WITH CHECK ADD  CONSTRAINT [CK_Angajat] CHECK  (([salariu]>(0)))
GO
ALTER TABLE [dbo].[Angajat] CHECK CONSTRAINT [CK_Angajat]
GO
ALTER TABLE [dbo].[Produs]  WITH CHECK ADD  CONSTRAINT [CK_Produs] CHECK  (([pret]>(0)))
GO
ALTER TABLE [dbo].[Produs] CHECK CONSTRAINT [CK_Produs]
GO
ALTER TABLE [dbo].[Recenzie]  WITH CHECK ADD  CONSTRAINT [CK_Recenzie] CHECK  (([nota]='5' OR [nota]='4' OR [nota]='3' OR [nota]='2' OR [nota]='1' OR [nota]='0'))
GO
ALTER TABLE [dbo].[Recenzie] CHECK CONSTRAINT [CK_Recenzie]
GO
ALTER TABLE [dbo].[Reducere]  WITH CHECK ADD  CONSTRAINT [CK_Reducere] CHECK  (([data_inceput]<[data_sfarsit]))
GO
ALTER TABLE [dbo].[Reducere] CHECK CONSTRAINT [CK_Reducere]
GO
ALTER TABLE [dbo].[Reducere]  WITH CHECK ADD  CONSTRAINT [CK_Reducere_1] CHECK  (([valoare]>(0)))
GO
ALTER TABLE [dbo].[Reducere] CHECK CONSTRAINT [CK_Reducere_1]
GO
ALTER TABLE [dbo].[Reducere]  WITH CHECK ADD  CONSTRAINT [CK_Reducere_2] CHECK  (([tip]='suma' OR [tip]='procent'))
GO
ALTER TABLE [dbo].[Reducere] CHECK CONSTRAINT [CK_Reducere_2]
GO
USE [master]
GO
ALTER DATABASE [Proiect] SET  READ_WRITE 
GO






INSERT [dbo].[Departament] ( [nume_departament], [email_departament]) VALUES ( N'Vanzari', N'vanzari.apple@yahoo.com')
INSERT [dbo].[Departament] ( [nume_departament], [email_departament]) VALUES ( N'Website', N'website.apple@yahoo.com')
INSERT [dbo].[Departament] ( [nume_departament], [email_departament]) VALUES ( N'Showroom', N'showroom.apple@yahoo.com')
INSERT [dbo].[Departament] ( [nume_departament], [email_departament]) VALUES ( N'Impachetari Comenzi', N'impachetare_comenzi.apple@yahoo.com')
INSERT [dbo].[Departament] ( [nume_departament], [email_departament]) VALUES ( N'Credite Online', N'credite_online.apple@yahoo.com')

INSERT [dbo].[Angajat] ( [nume_angajat], [prenume_angajat], [email_angajat], [salariu], [id_departament], [data_angajare]) VALUES ( N'Andrei', N'Balea', N'andreibalea@yahoo.com', 7500, 2, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Angajat] ( [nume_angajat], [prenume_angajat], [email_angajat], [salariu], [id_departament], [data_angajare]) VALUES ( N'Georgian', N'Avram', N'georgianavram@yahoo.com', 3500, 3, CAST(N'2017-11-17' AS Date))
INSERT [dbo].[Angajat] ( [nume_angajat], [prenume_angajat], [email_angajat], [salariu], [id_departament], [data_angajare]) VALUES ( N'Dobre', N'Stefan', N'dobre_stefan@yahoo.com', 4200, 4, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[Angajat] ( [nume_angajat], [prenume_angajat], [email_angajat], [salariu], [id_departament], [data_angajare]) VALUES ( N'Enciu', N'Clara', N'enciuclara@yahoo.com', 5000, 5, CAST(N'2014-12-01' AS Date))
INSERT [dbo].[Angajat] ( [nume_angajat], [prenume_angajat], [email_angajat], [salariu], [id_departament], [data_angajare]) VALUES ( N'Tuloiu', N'Paul', N'tuloiupaul@gmail.com', 9000, 1, CAST(N'2012-12-12' AS Date))


INSERT [dbo].[Adresa] ( [oras], [strada], [numar], [apartament], [cod_postal], [id_client], [bloc], [etaj]) VALUES ( N'Bucuresti', N'Alexandru Macedon', 14, 66, 71432, 1, 18, 6)
INSERT [dbo].[Adresa] ( [oras], [strada], [numar], [apartament], [cod_postal], [id_client], [bloc], [etaj]) VALUES ( N'Bucuresti', N'Paduroiu', 5, 7, 41472, 2, 3, 3)
INSERT [dbo].[Adresa] ( [oras], [strada], [numar], [apartament], [cod_postal], [id_client], [bloc], [etaj]) VALUES ( N'Craiova', N'Maxima', 10, 34, 12643, 3, 27, 7)
INSERT [dbo].[Adresa] ( [oras], [strada], [numar], [apartament], [cod_postal], [id_client], [bloc], [etaj]) VALUES ( N'Constanta', N'Unirii', 5, 23, 112743, 4, 1, 2)
INSERT [dbo].[Adresa] ( [oras], [strada], [numar], [apartament], [cod_postal], [id_client], [bloc], [etaj]) VALUES ( N'Cluj-Napoca', N'Iuliu Maniu', 10, 52, 257246, 5, 1, 9)


INSERT [dbo].[Client] ([id_client], [id_adresa], [nume_client], [prenume_client], [email], [numar_telefon]) VALUES (14, 1, N'Ion', N'Al Glanetasului', N'IonSiPamantul@gmail.com', N'0765255081')
INSERT [dbo].[Client] ([id_client], [id_adresa], [nume_client], [prenume_client], [email], [numar_telefon]) VALUES (16, 2, N'Marcel', N'Prichindelu', N'Marcel2387@7yahoo.com', N'0765255021')
INSERT [dbo].[Client] ([id_client], [id_adresa], [nume_client], [prenume_client], [email], [numar_telefon]) VALUES (19, 3, N'Horia', N'Marinescu', N'horia.marinescu@gmail.com', N'0765235081')
INSERT [dbo].[Client] ([id_client], [id_adresa], [nume_client], [prenume_client], [email], [numar_telefon]) VALUES (20, 4, N'Nedelcu', N'Radu', N'radu.nedelcu@gmail.com', N'073425081')
INSERT [dbo].[Client] ([id_client], [id_adresa], [nume_client], [prenume_client], [email], [numar_telefon]) VALUES (21, 5, N'Topana', N'Mihai', N'topana_mihai@gmail.com', N'073423081')


INSERT [dbo].[Comanda] ( [id_client], [id_adresa], [id_angajat]) VALUES (14, 5, 6)
INSERT [dbo].[Comanda] ( [id_client], [id_adresa], [id_angajat]) VALUES (16, 6, 9)
INSERT [dbo].[Comanda] ( [id_client], [id_adresa], [id_angajat]) VALUES (19, 7, 10)
INSERT [dbo].[Comanda] ( [id_client], [id_adresa], [id_angajat]) VALUES (20, 8, 11)
INSERT [dbo].[Comanda] ( [id_client], [id_adresa], [id_angajat]) VALUES ( 21, 9, 12)

INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'test', N'test', 10, 10)
INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'Telefon iPhone', N'Bun pentru adolescenti', 1200, 99)
INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'iPad Pro', N'Investitie foarte buna pentru antreprenori', 2500, 35)
INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'iPad Mini', N'Investitie foarte buna pentru copii', 1400, 10)
INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'Apple Watch Ultra', N'Special destinat iubitorilor de sport', 4500, 5)
INSERT [dbo].[Produs] ( [nume_produs], [descriere], [pret], [stoc]) VALUES (N'Airpods Pro', N'Special destinat iubitorilor de muzica', 1100, 15)


INSERT [dbo].[ProdusComanda] ([id_comanda], [id_produs], [numar_bucati]) VALUES (4, 1, 1)
INSERT [dbo].[ProdusComanda] ([id_comanda], [id_produs], [numar_bucati]) VALUES (7, 2, 1)

INSERT [dbo].[Reducere] ([id_produs], [data_inceput], [data_sfarsit], [tip], [valoare]) VALUES (1, CAST(N'2022-12-12' AS Date), CAST(N'2022-12-16' AS Date), N'procent', 100)
INSERT [dbo].[Reducere] ([id_produs], [data_inceput], [data_sfarsit], [tip], [valoare]) VALUES (2, CAST(N'2022-11-25' AS Date), CAST(N'2022-12-27' AS Date), N'suma', 300)

INSERT [dbo].[ProdusReducere] ([id_produs], [id_reducere]) VALUES (1, 1)
INSERT [dbo].[ProdusReducere] ([id_produs], [id_reducere]) VALUES (2, 2)


INSERT [dbo].[Recenzie] ([titlu], [continut], [nota]) VALUES (N'test2', N'test2', 2)
INSERT [dbo].[Recenzie] ([titlu], [continut], [nota]) VALUES (N'Produs foarte bun pentru pasionati', N'Mi-a placut', 5)
INSERT [dbo].[Recenzie] ([titlu], [continut], [nota]) VALUES (N'Dezamagire', N'Mai trebuie lucrat pe partea software', 2)
 

INSERT [dbo].[ProdusRecenzie] ([id_produs], [id_recenzie]) VALUES (1, 5)
INSERT [dbo].[ProdusRecenzie] ([id_produs], [id_recenzie]) VALUES (1, 5)
INSERT [dbo].[ProdusRecenzie] ([id_produs], [id_recenzie]) VALUES (2, 6)


