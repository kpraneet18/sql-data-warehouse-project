/*
=================================
Creating Database and Schemas
=================================
This script creates a new database named 'Datawarehouse'. Aditionally, the script sets up three schemas within 
the database:'bronze','siver','gold'.

*/
USE master;
--creating the data warehouse
CREATE DATABASE DataWareHouse;

USE DataWareHouse;
--creating the schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
