# **First Issue** #

In this issue there where 4 main requests:

### Request 1: ###
#### **_`"Create a Database named "ACCIDENTSDW (ACCIDENTS DATA WAREHOUSE)" via SQL Server Management Studio and a table named "accdata" to insert all the data from the ACCDATA.txt file."`_** ####

At first, I created the database with the given name and after looking closely inside the ACCDATA.txt, I decided to create the "accdata" table with columns as mentioned in the `create_accdata.sql` file. 
The table was successfully created and afterwards I inserted the data in it. Note that some manual adjustments had to be made, in order to pass the data correctly into the table:
```console
BULK INSERT accdata
FROM 'C:\data\ACCDATA.TXT' 
WITH (FIRSTROW =2, FIELDTERMINATOR='|', ROWTERMINATOR = '\n');
```

### Request 2: ###
#### **_`"Create a Star-Schema database model based on the accdata table's data."`_** ####
Now we will create the schema of the data warehouse. This schema will implement the star schema model as stated in the assignment. 
Observing the given data and the corresponding fields, we conclude that the table with accidents will be the fact table (as it contains basic information) and we will name it accident (fact) (see create_fact_table.sql). 
We also see that we have the following dimensions, for each of which we create the corresponding table (create_dimension_tables.sql):
* Driver
* Surface
* Timeinfo
* Vehicle
* Severity

### Request 3: ###
#### **_`"After the creation of the Star-Schema model, feed the tables with the apropriate data."`_** ####

After creating our tables, the next step is to populate them with the necessary data. This is achieved with the commands as seen in the `insert_data.sql` file. We start with the dimension tables, for example:
```console
INSERT INTO driver
  SELECT DISTINCT driver_class_id,sex_of_driver,age_of_driver
		FROM accdata
```
In our Fact Table `accident`, as observed, a new column named "num_of_casualties" has been added, representing the number of casualties in each accident. 
This column will take values as the count of the casualty's age in each accident separately. 
In other words, for each "accident_id," we calculate the number of rows with the same id value in the "age_of_casualty" column from the "accdata" table (we could also consider the "sex_of_casualty"). We do this because it will be needed for thw queries in the next issue. 
For this reason, we create a temp table (cas) where we insert the desired values to later insert them into our "Accident" table in the "num_of_casualties" column.
Provided that we finished with the insertions, we won't need the cas temp table anymore, therefore we drop it:
```console
DROP TABLE cas;
```
### Request 4: ###
#### **_`"Diagrammatic representation of the data storage model."`_** ####
To create a new database diagram via SSMS:
1. In Object Explorer, right-click the Database Diagrams folder.
2. Choose New Database Diagram on the shortcut menu.
3. Select the required tables in the Tables list and click Add.
4. The tables are displayed graphically in the new database diagram as seen in the `Star-Schema.png`.

