# What I learned This Week

## Databases

### ???

  * Use dotenv from node to hide credentials.  SUPER USEFUL!

  * The foreign key is on the many side. The foreign key is on the many side. The foreign key is on the many side.  MANY FOREIGNERS.

  * Don't close Pool/Client connections in express apps.  Very nasty?!

  * use axios.get? instead of jquery?
    - res.data is what we want!
  
  * in the .catch() in promises, the err.message has a much better easier to ready msg!

### Node-Postgres

  * Connecting to node-pg in linux 

  ```
  psql -h localhost -p 5432 -U labber bootcampx
  ```

  * Generally prefer to use POOLS over CLIENTS because POOLS manage multiple CLIENTS for us. 
    - POOLS lets us use a re-usable pool of clients we can check out and use and return.


### Why Normalize?

* Reduce duplicate data in tables.
* If we update a value in a denormalized table, we have to do it for every single row.
* Easier to enforce integrity - far easier to make mistakes when storing duplicate values rather than a ID.

### 3NF

Example here: https://en.wikipedia.org/wiki/Database_normalization

1. First Normal Form
  * Make sure there are no duplicated columns that contain the same data.
  * Each row contains a primary key.
  * Each column must have only one value for each row in the table.
  * If there are columns that contain same type of data, split them up into different tables.

2. Second Normal Form
  * 1NF + all non-key attributes are fully functional dependent on the primary key, not just part of it.
  * Further breaking into multiple tables.

3. Third Normal Form
  * No 'transitive dependencies'.  Make sure there are not any columns that rely on another column that is NOT the PK.
    * ie: if there is a column that is relying on another column that is not the pk, we should isolate it into another table.

4. Fourth Normal Form
  * Get rid of Many-to-Many relationships by introducing a 'join' table

## SQL

* HAVING clause is like WHERE but for aggregated data.  It is evaluated before SELECT so we can't use alias.

* if we use having, group by and order by, the order is generally:
  - GROUP BY -> HAVING -> ORDER BY

* We can use sub-selects in many places:
  * as a column in 'SELECT'
  ```sql
  SELECT (
            SELECT count(assignments)
            FROM assignments
         )-count(assignment_submissions) as total_incomplete
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel';
  ``` 
  
  * as a 'FROM' sub select table
  ```sql
  SELECT avg(total_students) as average_students
  FROM (
    SELECT count(students) as total_students
    FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
  ) as totals_table;
  ```

  * search with a result set 'IN' (where)
  ```sql
  SELECT assignments.name
  FROM assignments 
  WHERE id NOT IN
  (
    SELECT assignment_id
    FROM assignment_submissions
    JOIN students ON students.id = student_id
    WHERE students.name = 'Ibrahim Schimmel'
  );
  ```

* Whenever we are using an 'in' clause in  WHERE, that works on a subquery, make sure that subquery only contains ONE column.

* we can't nest a aggregate function inside another, so we need to split it into a nested select statement.  ex:

```sql
select avg(computed_table) as new_table_name
from (select sum(a_attribute) as computed_table
  where...
)
```

* When using a nested subquery in a WHERE clause for comparisons, ensure that the subquery returns a single value that can be directly compared to the value in the outer query (one column, one row).

### PSQL

#### PSQL Facts

* SERIAL in database table creation, is used as PK and autoincrements.  They are unique INTEGER values.

* VARCHAR means variable length

#### PSQL Commands

* Start PSQL

```
startpostgres
```

* Connecting to a DB (bootcampx name of db)

```
\c bootcampx
```

* Logging in.  user is labber/vagrant, postgres is the name of db.

```
psql -U username -d postgres
```

* Stop PSQL

```
sudo service postgresql stop
```

* Logging out + exit psql session

```
\q
```

* Connection info ... 
* list users ... 
* list/show details tables [table name optional]

```
\conninfo    \du    \d [table_name]
```