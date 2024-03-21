## How to Use the SQL Files

Steps to import the files into MySQL:

1. Import HotelDB_creation.sql
2. Import HotelData_insertion.sql
3. Import HotelData_insertion2.sql

## Research on MySQL Triggers

A trigger is defined to activate when a statement inserts, updates, or deletes rows in the associated table. These row operations are trigger events. For example, rows can be inserted by INSERT or LOAD DATA statements, and an insert trigger activates for each inserted row. A trigger can be set to activate either before or after the trigger event. For example, you can have a trigger activate before each row that is inserted into a table or after each row that is updated.

> ##### IMPORTANT NOTE:
>
> MySQL triggers activate only for changes made to tables by SQL statements. This includes changes to base tables that underlie updatable views. Triggers do not activate for changes to tables made by APIs that do not transmit SQL statements to the MySQL Server. This means that triggers are not activated by updates made using the NDB API.

### Example

Associates a trigger with a table, to activate for INSERT operations.
The trigger acts as an accumulator, summing the values inserted into one of the columns of the table.

> mysql> CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));
> Query OK, 0 rows affected (0.03 sec)
>
> mysql> CREATE TRIGGER ins_sum BEFORE INSERT ON account
> FOR EACH ROW SET @sum = @sum + NEW.amount;
> Query OK, 0 rows affected (0.01 sec)

Source: https://dev.mysql.com/doc/refman/8.0/en/triggers.html
Source: https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html
