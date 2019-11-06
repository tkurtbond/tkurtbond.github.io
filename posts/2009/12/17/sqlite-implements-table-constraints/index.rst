.. title: sqlite implements table constraints
.. slug: sqlite-implements-table-constraints
.. date: 2009-12-17 17:02:04 UTC-05:00
.. tags: sql,sqlite,programming
.. category: computer
.. link: 
.. description: 
.. type: text


It's nice to see SQLite supports table constraints::

    $ sqlite3 test.db
    SQLite version 3.6.19
    Enter ".help" for instructions
    Enter SQL statements terminated with a ";"
    sqlite> create table t1
       ...> (k int,
       ...>  s int,
       ...>  e int,
       ...>  d int,
       ...>  constraint se_or_duration check
       ...>    ((s is not null and e is not null) or d is not null));
    sqlite> insert into t1 values (1, 8, 4, null);
    sqlite> insert into t1 values (2, null, null, 8);
    sqlite> insert into t1 values (3, null, null, null);
    SQL error: constraint failed
    sqlite>
 
