-- Delete Rows
-- Always do a select before a delete to make sure you get back exactly what you want 
-- and only what you want to delete! Since we cannot delete anything from the pre-defined 
-- tables ( foreign key restraints ), use the following SQL code to create a dummy table:

-- DELETE FROM [table] WHERE [condition]

-- Delete all 'bronze' entries from the table.

DELETE FROM practice_delete
WHERE type = 'bronze';

-- Delete all 'silver' entries from the table.

DELETE FROM practice_delete
WHERE type = 'silver';

-- Delete all entries whose value is equal to 150.

DELETE FROM practice_delete
WHERE value = '150';
