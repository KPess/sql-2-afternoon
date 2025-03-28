-- Complete the instructions without using any joins. 
-- Only use nested queries to come up with the solution.

-- Syntax Hint
SELECT [column names] 
FROM [table] 
WHERE column_id IN ( SELECT column_id FROM [table2] WHERE [Condition] );

SELECT name, Email 
FROM Athlete 
WHERE AthleteId 
IN ( SELECT PersonId FROM PieEaters WHERE Flavor='Apple' );


-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * 
FROM invoice
WHERE invoice_id 
IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

-- Get all playlist tracks where the playlist name is Music.

SELECT *
FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );

-- Get all track names for playlist_id 5.

SELECT name
FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5) ;

-- Get all tracks where the genre is Comedy.

SELECT *
FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

-- Get all tracks where the album is Fireball.

SELECT *
FROM track
WHERE album_id IN ( SELECT album_id FROM album WHERE title = 'Fireball' );

-- Get all tracks for the artist Queen ( 2 nested subqueries ).

SELECT *
FROM track
WHERE album_id IN ( 
  SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  )
); 