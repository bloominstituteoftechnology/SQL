Inner Join, The Most Common Join



```sql
 SELECT Employee.ID, Employee.Name, Department.Name
             FROM Employee, Department
             WHERE Employee.DepartmentID = Department.ID;
```


Alternative syntax:

```sql
SELECT Employee.ID, Employee.Name, Department.Name
             FROM Employee INNER JOIN Department
             ON Employee.DepartmentID = Department.ID;
```

Left Outer Join (includes rows that have null values in right table (table after LEFT JOIN clause))

```sql
 SELECT Employee.ID, Employee.Name, Department.Name
             FROM Employee LEFT JOIN Department
             ON Employee.DepartmentID = Department.ID;
```

Right Outer Join (includes rows that have null values in left table(table after FROM clause))

```sql
SELECT Employee.ID, Employee.Name, Department.Name
             FROM Employee RIGHT JOIN Department
             ON Employee.DepartmentID = Department.ID;
```

Full Outer Join

Blend of left and right outer join. All information from both tables is selected, with NULL filling the gaps where necessary. 

```sql
SELECT Employee.ID, Employee.Name, Department.Name
              FROM Employee
              FULL JOIN Department
              ON Employee.DepartmentID = Department.ID;

```

Parameterized Queries
--------
Will save you from desanitized inputs from users! 
Sanitize your inputs! 

https://node-postgres.com/features/queries#parameterized-query


Indexes
--------
```sql
CREATE INDEX ON Employee (LastName);
```

Make sure if you are doing a search or a join on a table that your columns are indexed. This is a way to create an index that doesn't have a primary key. 


Transactions
----------
You can bundle a series of statements into a transaction. The transaction all at once or not at all. 

This makes transactions atomic. Transactions will either be done all at once when you commit the change or not at all. 

ROLLBACK will rollback your commands in case you make a mistake. COMMIT will commit your changes or not at all if there are errors. 

Normalization
------------
Process of designing or refactoring your tables for maximum consistency and minimum redundancy. We normalize databases to avoid anomalies. 

    * Insert anomaly -- When we cannot insert a row into the table because some of the dependent information is not yet known.

    * Update anomaly -- When info is duplicated in the database and some of the rows are updated but not others..

    * Delete anomaly -- The opposite of insert anomaly. When we delete some information and some other related information must also be deleted against our will. 

There are many normal forms:

First Normal Form
---------------
When a database is in first normal form, there is a primary key for each row and there are no repeating sets of columns that should be in their own table. 

Second Normal Form
---------------
To Be in Second Normal Form, a table must already be in First Normal Form. Additionally, all non-key data must fully relate to the key-data in the table. 

Third Normal Form
--------------
A table in Third Normal Form, a table must already be in Second Normal form. Additonally, columns that relate to each other AND to the key need to be moved into their own tables. This is know as removing transitive dependencies. 