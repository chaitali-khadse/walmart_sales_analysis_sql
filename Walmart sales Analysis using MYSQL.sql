SELECT * FROM salesdatawalmart.sales;
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(10);

UPDATE sales
SET time_of_day = ( 
       CASE
           WHEN 'time' BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
           WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
           ELSE "Evening"
       END
);
SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET time_of_day = CASE
    WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END
WHERE time IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;
