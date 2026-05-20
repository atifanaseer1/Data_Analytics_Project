USE netflix_analysis;

SELECT release_year,
       COUNT(*) AS yearly_content,
       SUM(COUNT(*)) OVER(ORDER BY release_year) AS cumulative_content
FROM netflix_titles
GROUP BY release_year;

-- Movies vs TV Shows Count
SELECT type, COUNT(*) AS total_content
FROM netflix_titles
GROUP BY type;

-- Top 10 Countries Producing Content
SELECT country, COUNT(*) AS total
FROM netflix_titles
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- Most Common Ratings
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC
LIMIT 10;

-- Recent Releases
SELECT title, release_year
FROM netflix_titles
ORDER BY release_year DESC
LIMIT 10;


-- Longest Movies
SELECT title, duration
FROM netflix_titles
WHERE type='Movie'
ORDER BY CAST(REPLACE(duration,' min','') AS UNSIGNED) DESC
LIMIT 10;

-- Most Common Genres
SELECT listed_in AS genre,
       COUNT(*) AS total_content
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_content DESC
LIMIT 10;

-- Country-wise Content
SELECT country,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- Content Added Per Year
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS added_year,
       COUNT(*) AS total_added
FROM netflix_titles
GROUP BY added_year
ORDER BY added_year
LIMIT 10;

-- Trends Over Years
SELECT release_year,
       COUNT(*) AS content_count
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year
LIMIT 10;

SELECT country,
       COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC;

SELECT release_year,
       COUNT(*) AS yearly_content,
       SUM(COUNT(*)) OVER(ORDER BY release_year) AS cumulative_content
FROM netflix_titles
GROUP BY release_year;

