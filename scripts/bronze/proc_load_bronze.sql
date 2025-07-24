/*
==============================================================================
This procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

This stored procedure does not accept any parameters or return any values.
==================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	PRINT'=========================';
	PRINT'Loading the bronze Layer' ;
	PRINT'=========================';

	PRINT '-------------------';
	PRINT'Loading CRM Tables';
	PRINT '-------------------';

	PRINT '>> TRUNCATING TABLE: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;
	PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> TRUNCATING TABLE: bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;
	PRINT '>> INSERTING DATA INTO: bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> TRUNCATING TABLE: bronze.crm_sales_details'
	TRUNCATE TABLE bronze.crm_sales_details;
	PRINT '>> INSERTING DATA INTO: bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '-------------------';
	PRINT'Loading ERP Tables';
	PRINT '-------------------';

	PRINT '>> TRUNCATING TABLE:bronze.erp_cust_az12';
	TRUNCATE TABLE bronze.erp_cust_az12;
	PRINT '>> INSERTING DATA INTO: bronze.bronze.erp_cust_az12';
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> TRUNCATING TABLE:bronze.erp_loc_a101';
	TRUNCATE TABLE bronze.erp_loc_a101;
	PRINT '>> INSERTING DATA INTO: bronze.bronze.erp_loc_a101';
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> TRUNCATING TABLE:bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	PRINT '>> INSERTING DATA INTO: bronze.bronze.erp_px_cat_g1v2';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\pkkpr\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END
