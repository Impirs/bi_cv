-- 1. Number of films by genre
SELECT unnest(string_to_array(replace(replace("Genres", '[', ''), ']', ''), ',')) AS genre, COUNT(*) AS film_count
FROM "Letterboxd_movies"
GROUP BY genre
ORDER BY film_count DESC;

-- 2. Average rating by genre
SELECT unnest(string_to_array(replace(replace("Genres", '[', ''), ']', ''), ',')) AS genre, AVG("Average_rating") AS avg_rating
FROM "Letterboxd_movies"
GROUP BY genre
ORDER BY avg_rating DESC;

-- 3. Number of films by language
SELECT "Original_language", COUNT(*) AS film_count
FROM "Letterboxd_movies"
GROUP BY "Original_language"
ORDER BY film_count DESC;

-- 4. Average rating by year (if there is a Year column)
-- SELECT "Year", AVG("Average_rating") AS avg_rating, COUNT(*) AS film_count
-- FROM "Letterboxd_movies"
-- GROUP BY "Year"
-- ORDER BY "Year";

-- 5. Top 10 directors by average rating (with at least 10 films)
SELECT "Director", AVG("Average_rating") AS avg_rating, COUNT(*) AS film_count
FROM "Letterboxd_movies"
GROUP BY "Director"
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC
LIMIT 10;

-- 6. Correlation between runtime and rating
SELECT corr("Runtime", "Average_rating") AS runtime_rating_corr
FROM "Letterboxd_movies";
