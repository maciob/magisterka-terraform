USE master;
GO

CREATE DATABASE menadzer;
GO

USE menadzer;
GO

-- CREATE LOGIN N'$(Login)' WITH PASSWORD = N'$(Password)';
-- GO

-- CREATE USER N'$(Login)' FOR LOGIN N'$(Login)';
-- GO

-- GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::menadzer TO N'$(Login)';
-- GO

CREATE TABLE Session
(
    Session_ID UNIQUEIDENTIFIER PRIMARY KEY, 
    data DATETIME NOT NULL, 
    active BIT NOT NULL
);
GO

CREATE TABLE User_data
(
    ID_user UNIQUEIDENTIFIER PRIMARY KEY,
    Login VARCHAR(128) NOT NULL,
    Password VARCHAR(128) NOT NULL,
    TwoFA BIT NOT NULL,
    Type_of_2FA VARCHAR(128),
    E_mail VARCHAR(128) NOT NULL,
    TwoFA_code VARCHAR(128),
    Activated BIT NOT NULL
);
GO

CREATE TABLE User_session 
(
    UserSessionID BIGINT PRIMARY KEY IDENTITY(1,1),
    ID_user UNIQUEIDENTIFIER NOT NULL REFERENCES User_data(ID_user), 
    Session_ID UNIQUEIDENTIFIER NOT NULL REFERENCES Session(Session_ID)
);
GO

CREATE TABLE Website
(
    ID_website BIGINT PRIMARY KEY IDENTITY(1,1),
    ID_user UNIQUEIDENTIFIER NOT NULL REFERENCES User_data(ID_user),
    website_name VARCHAR(128) NOT NULL,
    website_adress VARCHAR(128) NOT NULL,
    Login VARCHAR(128) NOT NULL,
    Password VARCHAR(128) NOT NULL,
    Data DATETIME NOT NULL,
    Icon VARCHAR(128) NOT NULL
);
GO