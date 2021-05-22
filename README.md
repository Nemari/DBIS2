# DBIS2
To use flyway with other DBMS, you need to change the configuration in the flyway.conf file.

To migrate the database with all the data in it, you first need to run the create.py and populate.py files, and then use the flyway migrate command.

If you need to migrate without data, then no preliminary steps are required and you can immediately use the flyway migrate command.
