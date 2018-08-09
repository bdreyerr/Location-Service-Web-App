
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/12/2018 10:24:20
-- Generated from EDMX file: C:\Users\BenDreyer\source\repos\REALWEBAPP\REALWEBAPP\Models\ModelContext.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LocationService];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [LocationId] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StNumber] nvarchar(max)  NOT NULL,
    [StName] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LocationAddress'
CREATE TABLE [dbo].[LocationAddress] (
    [Locations_Id] int  NOT NULL,
    [Addresses_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Locations_Id], [Addresses_Id] in table 'LocationAddress'
ALTER TABLE [dbo].[LocationAddress]
ADD CONSTRAINT [PK_LocationAddress]
    PRIMARY KEY CLUSTERED ([Locations_Id], [Addresses_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LocationId] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_LocationPerson]
    FOREIGN KEY ([LocationId])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationPerson'
CREATE INDEX [IX_FK_LocationPerson]
ON [dbo].[People]
    ([LocationId]);
GO

-- Creating foreign key on [Locations_Id] in table 'LocationAddress'
ALTER TABLE [dbo].[LocationAddress]
ADD CONSTRAINT [FK_LocationAddress_Location]
    FOREIGN KEY ([Locations_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Addresses_Id] in table 'LocationAddress'
ALTER TABLE [dbo].[LocationAddress]
ADD CONSTRAINT [FK_LocationAddress_Address]
    FOREIGN KEY ([Addresses_Id])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationAddress_Address'
CREATE INDEX [IX_FK_LocationAddress_Address]
ON [dbo].[LocationAddress]
    ([Addresses_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------