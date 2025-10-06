USE imdb;

/* Now that you have imported the data sets, let’s explore some of the tables. 
 To begin with, it is beneficial to know the shape of the tables and whether any column has null values.
 Further in this segment, you will take a look at 'movies' and 'genre' tables.*/


-- Segment 1:


-- Q1. Find the total number of rows in each table of the schema?
-- Type your code below:

SELECT 
    TABLE_NAME, SUM(TABLE_ROWS)
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'IMDB'
GROUP BY TABLE_NAME;

-- Director_mapping has a total of 3867 rows
-- Genre has a total of 14662 rows
-- Movie has a total of 7875 rows
-- Names has a total of 29209 rows
-- Ratings has a total of 7927 rows
-- Role_mapping has a total of 16459 rows


-- Q2. Which columns in the movie table have null values?
-- Type your code below:


-- Checking for Null Values in Table Director_Mapping.
SELECT SUM(CASE WHEN movie_id IS NULL THEN 1 ELSE 0 END) AS movie_id_NULL,
	   COUNT(movie_id) AS movie_id_NOT_NULL,
       SUM(CASE WHEN name_id IS NULL THEN 1 ELSE 0 END) AS name_id_NULL,
	   COUNT(name_id) AS name_id_NOT_NULL       
FROM director_mapping;
-- As per results there are no Null values in table Director_Mapping and there are a total of 3867 Non Null Values.

-- Checking for Null Values in Table Genre.
SELECT SUM(CASE WHEN movie_id IS NULL THEN 1 ELSE 0 END) AS movie_id_NULL,
	   COUNT(movie_id) AS movie_id_NOT_NULL,
       SUM(CASE WHEN genre IS NULL THEN 1 ELSE 0 END) AS genre_NULL,
	   COUNT(genre) AS genre_NOT_NULL       
FROM genre;
-- As per results there are no Null values in table Genre and there are a total of 14662 Non Null Values.

-- Checking for Null Values in Table Movie.
SELECT SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_NULL,
	   COUNT(id) AS id_NOT_NULL,
       SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS title_NULL,
	   COUNT(title) AS title_NOT_NULL,
       SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS year_NULL,
	   COUNT(year) AS year_NOT_NULL,
       SUM(CASE WHEN date_published IS NULL THEN 1 ELSE 0 END) AS date_published_NULL,
	   COUNT(date_published) AS date_published_NOT_NULL,
       SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS duration_NULL,
	   COUNT(duration) AS duration_NOT_NULL,
       SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_NULL,
	   COUNT(country) AS country_NOT_NULL,
       SUM(CASE WHEN worlwide_gross_income IS NULL THEN 1 ELSE 0 END) AS worlwide_gross_income_NULL,
	   COUNT(worlwide_gross_income) AS worlwide_gross_income_NOT_NULL,
       SUM(CASE WHEN languages IS NULL THEN 1 ELSE 0 END) AS languages_NULL,
	   COUNT(languages) AS languages_NOT_NULL,
       SUM(CASE WHEN production_company IS NULL THEN 1 ELSE 0 END) AS production_company_NULL,
	   COUNT(production_company) AS production_company_NOT_NULL
FROM movie;
/*  As per results there are no Null values in Columns ID, Title, Year, Date_Published, Duration,
With a total of 7997 Non-Null Values.
Although there  are 20 Null Values in Country, 3724 Null Values in Worlwide_Gross_Income, 194 Null values in Languages
& 528 Null Values in Production_Company. */

-- Checking for Null Values in Table Names.
SELECT SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_NULL,
	   COUNT(id) AS id_NOT_NULL,
       SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_NULL,
	   COUNT(name) AS name_NOT_NULL,
       SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS height_NULL,
	   COUNT(height) AS height_NOT_NULL,
       SUM(CASE WHEN date_of_birth IS NULL THEN 1 ELSE 0 END) AS date_of_birth_NULL,
	   COUNT(date_of_birth) AS date_of_birth_NOT_NULL,
       SUM(CASE WHEN known_for_movies IS NULL THEN 1 ELSE 0 END) AS known_for_movies_NULL,
	   COUNT(known_for_movies) AS known_for_movies_NOT_NULL
FROM names;
/*  As per results there are no Null values in Columns ID & Name
With a total of 25735 Non-Null Values.
Although there  are 17335 Null Values in Height, 13431 Null Values in Date_of_Birth, 15226 Null values in Known_for_Movies. */

-- Checking for Null Values in Table Ratings.
SELECT SUM(CASE WHEN movie_id IS NULL THEN 1 ELSE 0 END) AS movie_id_NULL,
	   COUNT(movie_id) AS movie_id_NOT_NULL,
       SUM(CASE WHEN avg_rating IS NULL THEN 1 ELSE 0 END) AS avg_rating_NULL,
	   COUNT(avg_rating) AS avg_rating_NOT_NULL,
       SUM(CASE WHEN total_votes IS NULL THEN 1 ELSE 0 END) AS total_votes_NULL,
	   COUNT(total_votes) AS total_votes_NOT_NULL,
       SUM(CASE WHEN median_rating IS NULL THEN 1 ELSE 0 END) AS median_rating_NULL,
	   COUNT(median_rating) AS median_rating_NOT_NULL 
FROM ratings;
-- As per results there are no Null values in table Ratings and there are a total of 7997 Non Null Values.

-- Checking for Null Values in Table Role_Mapping.
SELECT SUM(CASE WHEN movie_id IS NULL THEN 1 ELSE 0 END) AS movie_id_NULL,
	   COUNT(movie_id) AS movie_id_NOT_NULL,
       SUM(CASE WHEN name_id IS NULL THEN 1 ELSE 0 END) AS name_id_NULL,
	   COUNT(name_id) AS name_id_NOT_NULL,
       SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_NULL,
	   COUNT(category) AS category_NOT_NULL
FROM role_mapping;
-- As per results there are no Null values in table Role_Mapping and there are a total of 15615 Non Null Values.


-- Now as you can see four columns of the movie table has null values. Let's look at the at the movies released each year. 
-- Q3. Find the total number of movies released each year? How does the trend look month wise? (Output expected)

/* Output format for the first part:

+---------------+-------------------+
| Year			|	number_of_movies|
+-------------------+----------------
|	2017		|	2134			|
|	2018		|		.			|
|	2019		|		.			|
+---------------+-------------------+


Output format for the second part of the question:
+---------------+-------------------+
|	month_num	|	number_of_movies|
+---------------+----------------
|	1			|	 134			|
|	2			|	 231			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

-- Total number of movies released each year in Ascending Order.
SELECT 
    Year, COUNT(id) AS number_of_movies
FROM
    movie
GROUP BY year
ORDER BY year;


-- Total number of movies released each month in Ascending Order.
SELECT 
    MONTH(date_published) AS month_num,
    COUNT(id) AS number_of_movies
FROM
    movie
GROUP BY MONTH(date_published)
ORDER BY MONTH(date_published);


/*The highest number of movies is produced in the month of March.
So, now that you have understood the month-wise trend of movies, let’s take a look at the other details in the movies table. 
We know USA and India produces huge number of movies each year. Lets find the number of movies produced by USA or India for the last year.*/
  
-- Q4. How many movies were produced in the USA or India in the year 2019??
-- Type your code below:

SELECT 
    COUNT(DISTINCT id) AS Total_no_of_movies_produced_by_India_or_USA,
    Year
FROM
    movie
WHERE
    year = 2019
        AND (country LIKE '%USA%'
        OR country LIKE '%India%');
-- USA and India all together produced a total of 1059 movies in the year 2019


/* USA and India produced more than a thousand movies(you know the exact number!) in the year 2019.
Exploring table Genre would be fun!! 
Let’s find out the different genres in the dataset.*/

-- Q5. Find the unique list of the genres present in the data set?
-- Type your code below:

SELECT DISTINCT genre from genre;
-- There are a total of 13 Unique Genres.


/* So, RSVP Movies plans to make a movie of one of these genres.
Now, wouldn’t you want to know which genre had the highest number of movies produced in the last year?
Combining both the movie and genres table can give more interesting insights. */

-- Q6.Which genre had the highest number of movies produced overall?
-- Type your code below:

SELECT 
    g.Genre, COUNT(m.id) AS Num_of_movies
FROM
    movie m
        INNER JOIN
    genre g ON m.id = g.movie_id
GROUP BY genre
ORDER BY COUNT(m.id) DESC
LIMIT 1;
-- So the most number of movies produced belong to the Drama Genre with Number of Movies equal to 4285. 


/* So, based on the insight that you just drew, RSVP Movies should focus on the ‘Drama’ genre. 
But wait, it is too early to decide. A movie can belong to two or more genres. 
So, let’s find out the count of movies that belong to only one genre.*/

-- Q7. How many movies belong to only one genre?
-- Type your code below:

WITH count_genre AS 
(
SELECT 
    COUNT(genre) AS ct_genre
FROM
    genre
GROUP BY movie_id
HAVING ct_genre = 1
)
SELECT 
    COUNT(*) AS Movie_count_1_genre
FROM
    count_genre;
-- Creting a CTE to create a column which would contain number of rows equal to the movies which has only 1 genre.
-- Then using that CTE to count the total number of rows in that table.


/* There are more than three thousand movies which has only one genre associated with them.
So, this figure appears significant. 
Now, let's find out the possible duration of RSVP Movies’ next project.*/

-- Q8.What is the average duration of movies in each genre? 
-- (Note: The same movie can belong to multiple genres.)


/* Output format:

+---------------+-------------------+
| genre			|	avg_duration	|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

SELECT 
    g.genre, ROUND(AVG(m.duration), 2) AS avg_duration
FROM
    movie m
        INNER JOIN
    genre g ON m.id = g.movie_id
GROUP BY genre
ORDER BY AVG(m.duration) DESC;
-- Maximum avg_duration is observed for Action genre which is equal to 112.88 mins.

/* Now you know, movies of genre 'Drama' (produced highest in number in 2019) has the average duration of 106.77 mins.
Lets find where the movies of genre 'thriller' on the basis of number of movies.*/

-- Q9.What is the rank of the ‘thriller’ genre of movies among all the genres in terms of number of movies produced? 
-- (Hint: Use the Rank function)


/* Output format:
+---------------+-------------------+---------------------+
| genre			|		movie_count	|		genre_rank    |	
+---------------+-------------------+---------------------+
|drama			|	2312			|			2		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:

WITH genre_rank AS 
(
SELECT 
	genre,
    COUNT(DISTINCT movie_id) AS movie_count,
    RANK() OVER (ORDER BY COUNT(DISTINCT movie_id) DESC) AS genre_rank 
FROM 
	genre 
GROUP BY 
	genre
)
SELECT 
    *
FROM
    genre_rank
WHERE
    genre = 'Thriller';
/* By creating a CTE we can list all the genre as per their rankings then finally we can print only the details for row which has 
thriller mentioned as its genre.
Genre Thriller stands at No 3 with a total movie count of 1484. */


/*Thriller movies is in top 3 among all genres in terms of number of movies
 In the previous segment, you analysed the movies and genres tables. 
 In this segment, you will analyse the ratings table as well.
To start with lets get the min and max values of different columns in the table*/




-- Segment 2:




-- Q10.  Find the minimum and maximum values in  each column of the ratings table except the movie_id column?
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
| min_avg_rating|	max_avg_rating	|	min_total_votes   |	max_total_votes 	 |min_median_rating|min_median_rating|
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
|		0		|			5		|	       177		  |	   2000	    		 |		0	       |	8			 |
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+*/
-- Type your code below:


SELECT 
    MIN(avg_rating) AS min_avg_rating,
    MAX(avg_rating) AS max_avg_rating,
    MIN(total_votes) AS min_total_votes,
    MAX(total_votes) AS max_total_votes,
    MIN(median_rating) AS min_median_rating,
    MAX(median_rating) AS max_median_rating
FROM
    ratings;
/* Min_Avg_Rating = 1
   Max_Avg_Rating = 10
   Min_Total_Votes = 100
   Max_Total_Votes = 725138
   Min_Median_Rating = 1
   Max_Median_Rating = 10 */


/* So, the minimum and maximum values in each column of the ratings table are in the expected range. 
This implies there are no outliers in the table. 
Now, let’s find out the top 10 movies based on average rating.*/

-- Q11. Which are the top 10 movies based on average rating?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		movie_rank    |
+---------------+-------------------+---------------------+
| Fan			|		9.6			|			5	  	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:
-- It's ok if RANK() or DENSE_RANK() is used too


WITH ranking_movies AS 
(
	SELECT 
		m.title,
		r.avg_rating, 
		DENSE_RANK() OVER (ORDER BY r.avg_rating DESC) AS movie_rank 
	FROM 
		ratings r
			INNER JOIN 
		movie m ON r.movie_id=m.id 
)
SELECT 
    *
FROM
    ranking_movies
WHERE
    movie_rank <= 10;
-- There are a total of 40 movies in the list of Top 40 based on their IMDB ratings.


/* Do you find you favourite movie FAN in the top 10 movies with an average rating of 9.6? If not, please check your code again!!
So, now that you know the top 10 movies, do you think character actors and filler actors can be from these movies?
Summarising the ratings table based on the movie counts by median rating can give an excellent insight.*/

-- Q12. Summarise the ratings table based on the movie counts by median ratings.
/* Output format:

+---------------+-------------------+
| median_rating	|	movie_count		|
+-------------------+----------------
|	1			|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:
-- Order by is good to have


SELECT 
    median_rating, COUNT(movie_id) AS movie_count
FROM
    ratings
GROUP BY median_rating
ORDER BY median_rating;
-- Lowest movie_count as per median rating is for median_rating = 1 with movie_count = 94


/* Movies with a median rating of 7 is highest in number. 
Now, let's find out the production house with which RSVP Movies can partner for its next project.*/

-- Q13. Which production house has produced the most number of hit movies (average rating > 8)??
/* Output format:
+------------------+-------------------+---------------------+
|production_company|movie_count	       |	prod_company_rank|
+------------------+-------------------+---------------------+
| The Archers	   |		1		   |			1	  	 |
+------------------+-------------------+---------------------+*/
-- Type your code below:

WITH prod_company_ranking AS
(
	SELECT 
		m.production_company, 
		COUNT(r.movie_id) AS movie_count, 
		RANK() OVER (ORDER BY COUNT(r.movie_id) DESC) AS prod_company_rank
	FROM 
		ratings r
			INNER JOIN 
		movie m
		ON r.movie_id=m.id
	WHERE r.avg_rating > 8 AND m.production_company IS NOT NULL 
	GROUP BY m.production_company
)
SELECT 
    *
FROM
    prod_company_ranking
WHERE
    prod_company_rank = 1;
-- Both Dream Warrior Pictures and National Theatre Live are ranked on Top with movie_count = 3


-- It's ok if RANK() or DENSE_RANK() is used too
-- Answer can be Dream Warrior Pictures or National Theatre Live or both

-- Q14. How many movies released in each genre during March 2017 in the USA had more than 1,000 votes?
/* Output format:

+---------------+-------------------+
| genre			|	movie_count		|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:


SELECT 
    g.genre AS genre, COUNT(g.movie_id) AS movie_count
FROM
    genre g
        INNER JOIN
    movie m ON g.movie_id = m.id
        INNER JOIN
    ratings r ON m.id = r.movie_id
WHERE
    r.total_votes > 1000
        AND m.country LIKE ('%USA%')
        AND m.year = 2017
        AND MONTH(m.date_published) = 3
GROUP BY g.genre
ORDER BY COUNT(g.movie_id) DESC;
-- Highest movie_count is observed for Drama genre which has a total movie_count of 24


-- Lets try to analyse with a unique problem statement.
-- Q15. Find movies of each genre that start with the word ‘The’ and which have an average rating > 8?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		genre	      |
+---------------+-------------------+---------------------+
| Theeran		|		8.3			|		Thriller	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:


SELECT 
    m.title AS title,
    r.avg_rating AS avg_rating,
    g.genre AS genre
FROM
    movie m
        INNER JOIN
    ratings r ON m.id = r.movie_id
        INNER JOIN
    genre g ON m.id = g.movie_id
WHERE
    m.title LIKE 'The%'
        AND r.avg_rating > 8
ORDER BY r.avg_rating DESC;
/* There are a total of 15 movies which have an avg_rating greater than 8 and start with the Alphabets 'The' form various genres like
Drama, Horror, Mystery, Crime, Action and Romance */


-- You should also try your hand at median rating and check whether the ‘median rating’ column gives any significant insights.
-- Q16. Of the movies released between 1 April 2018 and 1 April 2019, how many were given a median rating of 8?
-- Type your code below:


SELECT 
    COUNT(m.id) AS movie_count, median_rating
FROM
    movie m
        INNER JOIN
    ratings r ON m.id = r.movie_id
WHERE
    r.median_rating = 8
        AND m.date_published BETWEEN '2018-04-01' AND '2019-04-01'
GROUP BY r.median_rating;
-- There are a total of 361 movies that were released between 1st April,2018 and 1st April,2019 with an avg_rating of 8


-- Once again, try to solve the problem given below.
-- Q17. Do German movies get more votes than Italian movies? 
-- Hint: Here you have to find the total number of votes for both German and Italian movies.
-- Type your code below:


SELECT 
    SUM(r.total_votes) AS vote_count, m.country
FROM
    movie m
        INNER JOIN
    ratings r ON m.id = r.movie_id
WHERE
    m.country IN ('Germany' , 'Italy')
GROUP BY m.country;
/* German movies have a total vote_count of 106710 whereas Italy has a total vote_count of 77965 which mean German movies have more vote than
Italian movies. */


-- Answer is Yes

/* Now that you have analysed the movies, genres and ratings tables, let us now analyse another table, the names table. 
Let’s begin by searching for null values in the tables.*/




-- Segment 3:



-- Q18. Which columns in the names table have null values??
/*Hint: You can find null values for individual columns or follow below output format
+---------------+-------------------+---------------------+----------------------+
| name_nulls	|	height_nulls	|date_of_birth_nulls  |known_for_movies_nulls|
+---------------+-------------------+---------------------+----------------------+
|		0		|			123		|	       1234		  |	   12345	    	 |
+---------------+-------------------+---------------------+----------------------+*/
-- Type your code below:

-- Checking for Null Values in Table Names.
SELECT SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_nulls,
       SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS height_nulls,
       SUM(CASE WHEN date_of_birth IS NULL THEN 1 ELSE 0 END) AS date_of_birth_nulls,
       SUM(CASE WHEN known_for_movies IS NULL THEN 1 ELSE 0 END) AS known_for_movies_nulls
FROM names;
/*  As per results there are no Null values in Column Name With a total of 25735 Non-Null Values.
Although there  are 17335 Null Values in Height, 13431 Null Values in Date_of_Birth, 15226 Null values in Known_for_Movies. */


/* There are no Null value in the column 'name'.
The director is the most important person in a movie crew. 
Let’s find out the top three directors in the top three genres who can be hired by RSVP Movies.*/

-- Q19. Who are the top three directors in the top three genres whose movies have an average rating > 8?
-- (Hint: The top three genres would have the most number of movies with an average rating > 8.)
/* Output format:

+---------------+-------------------+
| director_name	|	movie_count		|
+---------------+-------------------|
|James Mangold	|		4			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:


WITH top_genre AS
(
	SELECT
	g.genre,
	COUNT(g.movie_id) as movie_count
	FROM 
    genre g
		INNER JOIN
	ratings r
	ON g.movie_id = r.movie_id
	WHERE r.avg_rating>8
	GROUP BY g.genre
	ORDER BY movie_count DESC
	LIMIT 3
),
top_director AS
(
	SELECT
	n.name as director_name,
	COUNT(dm.movie_id) as movie_count,
	RANK() OVER(ORDER BY COUNT(dm.movie_id) DESC) director_rank
	FROM names n
		INNER JOIN 
	director_mapping dm 
	ON n.id = dm.name_id
		INNER JOIN 
	ratings r
	ON r.movie_id = dm.movie_id
		INNER JOIN 
	genre g
	ON g.movie_id = dm.movie_id,
	top_genre tg
	WHERE r.avg_rating > 8 AND g.genre IN (tg.genre)
	GROUP BY n.name
	ORDER BY movie_count DESC
)
SELECT 
	director_name,
	movie_count
FROM 
	top_director
WHERE director_rank <= 3
LIMIT 3;
-- Top 3 Directors are James Mangold, Soubin Shahir & Joe Russo.


/* James Mangold can be hired as the director for RSVP's next project. Do you remeber his movies, 'Logan' and 'The Wolverine'. 
Now, let’s find out the top two actors.*/

-- Q20. Who are the top two actors whose movies have a median rating >= 8?
/* Output format:

+---------------+-------------------+
| actor_name	|	movie_count		|
+-------------------+----------------
|Christain Bale	|		10			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:


SELECT 
    n.name, COUNT(m.id) AS movie_count
FROM
    movie m
        INNER JOIN
    ratings r ON r.movie_id = m.id
        INNER JOIN
    role_mapping rm ON rm.movie_id = m.id
        INNER JOIN
    names n ON rm.name_id = n.id
WHERE
    r.median_rating >= 8
GROUP BY n.name
ORDER BY movie_count DESC
LIMIT 2;
-- Top 2 actors with movies having median_rating>=8 are Mammootty & Mohanlal.


/* Have you find your favourite actor 'Mohanlal' in the list. If no, please check your code again. 
RSVP Movies plans to partner with other global production houses. 
Let’s find out the top three production houses in the world.*/

-- Q21. Which are the top three production houses based on the number of votes received by their movies?
/* Output format:
+------------------+--------------------+---------------------+
|production_company|vote_count			|		prod_comp_rank|
+------------------+--------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/
-- Type your code below:


SELECT 
	m.production_company, 
    SUM(r.total_votes) AS vote_count, 
    RANK() OVER(ORDER BY SUM(r.total_votes) DESC)
FROM 
	movie m 
    INNER JOIN 
    ratings r ON m.id=r.movie_id
GROUP BY m.production_company
LIMIT 3;
-- Top 3 Production_companies are Marvel Studios, Twentieth Century Fox & Warner Bros.


/*Yes Marvel Studios rules the movie world.
So, these are the top three production houses based on the number of votes received by the movies they have produced.

Since RSVP Movies is based out of Mumbai, India also wants to woo its local audience. 
RSVP Movies also wants to hire a few Indian actors for its upcoming project to give a regional feel. 
Let’s find who these actors could be.*/

-- Q22. Rank actors with movies released in India based on their average ratings. Which actor is at the top of the list?
-- Note: The actor should have acted in at least five Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, then the total number of votes should act as the tie breaker.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actor_name	|	total_votes		|	movie_count		  |	actor_avg_rating 	 |actor_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Yogi Babu	|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:


SELECT 
    actor_name,
    total_votes,
    movie_count,
    actor_avg_rating,
    actor_rank
FROM (
    SELECT 
        n.name AS actor_name,
        SUM(r.total_votes) AS total_votes,
        COUNT(DISTINCT m.id) AS movie_count,
        ROUND(SUM(r.avg_rating * r.total_votes) / SUM(r.total_votes), 2) AS actor_avg_rating,
        RANK() OVER (ORDER BY ROUND(SUM(r.avg_rating * r.total_votes) / SUM(r.total_votes), 2) DESC, SUM(r.total_votes) DESC) AS actor_rank
    FROM 
        names AS n
        INNER JOIN role_mapping AS rm ON rm.name_id = n.id
        INNER JOIN movie AS m ON rm.movie_id = m.id
        INNER JOIN ratings AS r ON r.movie_id = m.id
    WHERE 
        rm.category = 'actor' 
        AND m.country LIKE '%India%'
    GROUP BY 
        actor_name
    HAVING 
        movie_count >= 5
) AS ranked_actress
WHERE 
    actor_rank <= 5;
-- List of top Indian Actors based on their ratings are Vijay Sethupathi, Fahadh Faasil, Yogi Babu, Joju George & Ammy Virk.


-- Top actor is Vijay Sethupathi

-- Q23.Find out the top five actresses in Hindi movies released in India based on their average ratings? 
-- Note: The actresses should have acted in at least three Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, then the total number of votes should act as the tie breaker.)
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |	actress_avg_rating 	 |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Tabu		|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:


SELECT 
    actress_name,
    total_votes,
    movie_count,
    actress_avg_rating,
    actress_rank
FROM (
    SELECT n.name AS actress_name,
        SUM(r.total_votes) AS total_votes,
        COUNT(DISTINCT m.id) AS movie_count,
        ROUND(SUM(r.avg_rating * r.total_votes) / SUM(r.total_votes), 2) AS actress_avg_rating,
        RANK() OVER (ORDER BY ROUND(SUM(r.avg_rating * r.total_votes) / SUM(r.total_votes), 2) DESC, SUM(r.total_votes) DESC) AS actress_rank
    FROM names AS n
    INNER JOIN role_mapping AS rm ON rm.name_id = n.id
    INNER JOIN movie AS m ON rm.movie_id = m.id
    INNER JOIN ratings AS r ON r.movie_id = m.id
    WHERE 
        rm.category = 'actress' 
        AND m.country LIKE '%India%'
        AND m.languages LIKE '%hindi%'
    GROUP BY 
        actress_name
    HAVING 
        movie_count >= 3
) AS ranked_actress
WHERE 
    actress_rank <= 5;
-- Lits of top actresses based on their avg_ratings are Taapsee Pannu, Kriti Sanon, Divya Dutta, Shraddha Kapoor & Kriti Kharbanda.


/* Taapsee Pannu tops with average rating 7.74. 
Now let us divide all the thriller movies in the following categories and find out their numbers.*/


/* Q24. Select thriller movies as per avg rating and classify them in the following category: 

			Rating > 8: Superhit movies
			Rating between 7 and 8: Hit movies
			Rating between 5 and 7: One-time-watch movies
			Rating < 5: Flop movies
--------------------------------------------------------------------------------------------*/
-- Type your code below:


SELECT 
    m.title,
    g.genre,
    r.avg_rating,
    (CASE
        WHEN r.avg_rating > 8 THEN 'Superhit movies'
        WHEN r.avg_rating BETWEEN 7 AND 8 THEN 'Hit movies'
        WHEN r.avg_rating BETWEEN 5 AND 7 THEN 'One-time-watch movies'
        ELSE 'Flop movies'
    END) AS movie_category
FROM
    movie m
        INNER JOIN
    genre g ON m.id = g.movie_id
        INNER JOIN
    ratings r ON g.movie_id = r.movie_id
WHERE
    g.genre = 'Thriller';


/* Until now, you have analysed various tables of the data set. 
Now, you will perform some tasks that will give you a broader understanding of the data in this segment.*/

-- Segment 4:

-- Q25. What is the genre-wise running total and moving average of the average movie duration? 
-- (Note: You need to show the output table in the question.) 
/* Output format:
+---------------+-------------------+---------------------+----------------------+
| genre			|	avg_duration	|running_total_duration|moving_avg_duration  |
+---------------+-------------------+---------------------+----------------------+
|	comdy		|			145		|	       106.2	  |	   128.42	    	 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
+---------------+-------------------+---------------------+----------------------+*/
-- Type your code below:


SELECT
	genre,
	ROUND(AVG(duration),0) AS avg_duration,
	SUM(ROUND(AVG(duration),1)) OVER(ORDER BY genre) AS running_total_duration,
	ROUND(AVG(ROUND(AVG(duration),2)) OVER (ORDER BY genre ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS moving_avg_duration
FROM 
	movie m
		INNER JOIN 
	genre g
	ON m.id = g.movie_id
GROUP BY genre;
-- Highest avg_duaration is 113 minutes for Action genre with an moving_avg_duration of 112.88 minutes.


-- Round is good to have and not a must have; Same thing applies to sorting


-- Let us find top 5 movies of each year with top 3 genres.

-- Q26. Which are the five highest-grossing movies of each year that belong to the top three genres? 
-- (Note: The top 3 genres would have the most number of movies.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| genre			|	year			|	movie_name		  |worldwide_gross_income|movie_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	comedy		|			2017	|	       indian	  |	   $103244842	     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:

-- Top 3 Genres based on most number of movies


WITH top_3_genres AS
(
SELECT 
	g.genre, 
    count(m.id) as movie_count
FROM 
	movie as m
		INNER JOIN 
	genre as g ON g.movie_id = m.id
GROUP BY genre
ORDER BY movie_count DESC),
 
top_grossing AS 
(
SELECT 
	g.genre, 
    m.year, 
    (m.title) AS movie_name,
    m.worlwide_gross_income,
	ROW_NUMBER() OVER (PARTITION BY m.year ORDER BY m.worlwide_gross_income DESC) AS movie_rank
FROM
	movie AS m
		INNER JOIN 
	genre AS g ON g.movie_id = m.id
WHERE g.genre IN (SELECT g.genre FROM top_3_genres)
)
SELECT 
	* 
FROM top_grossing
WHERE movie_rank <= 5;
-- Top 5 movies as per Worldwide_gross_income are Shatamanam Bhavati, Winner, Thank You for your service & The Healer.


-- Finally, let’s find out the names of the top two production houses that have produced the highest number of hits among multilingual movies.
-- Q27.  Which are the top two production houses that have produced the highest number of hits (median rating >= 8) among multilingual movies?
/* Output format:
+-------------------+-------------------+---------------------+
|production_company |movie_count		|		prod_comp_rank|
+-------------------+-------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/
-- Type your code below:


SELECT 
	m.production_company AS production_company, 
	COUNT(*) AS movie_count,
	RANK() OVER (ORDER BY COUNT(*) DESC) AS prod_comp_rank
FROM 
	movie AS m
		INNER JOIN 
	ratings AS r ON m.id = r.movie_id
WHERE r.median_rating >= 8 AND POSITION(',' IN languages)>0 -- Checks for movies with multiple languages
	  AND m.production_company IS NOT NULL
GROUP BY m.production_company
ORDER BY prod_comp_rank
LIMIT 2;
-- The two production_company with highest hits among multilingual Languages are Star Cinema & Twentieth Century Fox.


-- Multilingual is the important piece in the above question. It was created using POSITION(',' IN languages)>0 logic
-- If there is a comma, that means the movie is of more than one language


-- Q28. Who are the top 3 actresses based on number of Super Hit movies (average rating >8) in drama genre?
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |actress_avg_rating	 |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Laura Dern	|			1016	|	       1		  |	   9.60			     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:


SELECT 
	n.name AS actress_name,
	SUM(r.total_votes) AS total_votes,
	COUNT(m.id) AS movie_count,
	AVG(r.avg_rating),
	RANK() OVER (ORDER BY COUNT(m.id) DESC) AS actress_rank
FROM
	names AS n
		INNER JOIN
	role_mapping AS rm ON rm.name_id = n.id
		INNER JOIN
	movie AS m ON rm.movie_id = m.id
		INNER JOIN
	genre AS g ON g.movie_id = m.id
		INNER JOIN
	ratings AS r ON r.movie_id = m.id
WHERE rm.category = 'actress' AND r.avg_rating > 8 AND g.genre = "Drama"
GROUP BY actress_name
ORDER BY movie_count DESC
LIMIT 3;
-- Top 3 Actresses based on super hit movies and Drama genre are Parvathy Thiruvothu, Susan Brown & Amanda Lawrence.


/* Q29. Get the following details for top 9 directors (based on number of movies)
Director id
Name
Number of movies
Average inter movie duration in days
Average movie ratings
Total votes
Min rating
Max rating
total movie durations

Format:
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
| director_id	|	director_name	|	number_of_movies  |	avg_inter_movie_days |	avg_rating	| total_votes  | min_rating	| max_rating | total_duration |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
|nm1777967		|	A.L. Vijay		|			5		  |	       177			 |	   5.65	    |	1754	   |	3.7		|	6.9		 |		613		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+

--------------------------------------------------------------------------------------------*/
-- Type you code below:


WITH movie_date_info AS
(
SELECT 
	d.name_id,
    name,
    d.movie_id,
    m.date_published, 
    LEAD(date_published, 1) OVER(PARTITION BY d.name_id ORDER BY date_published, d.movie_id) AS next_movie_date
FROM director_mapping d
	 JOIN names AS n ON d.name_id=n.id 
	 JOIN movie AS m ON d.movie_id=m.id
),

date_difference AS
(
	 SELECT 
		*,
        DATEDIFF(next_movie_date, date_published) AS diff
	 FROM movie_date_info
 ),
 
 avg_inter_days AS
 (
	 SELECT 
		name_id,
        AVG(diff) AS avg_inter_movie_days
	 FROM date_difference
	 GROUP BY name_id
 ),
 
 final_result AS
 (
	 SELECT 
		d.name_id AS director_id,
		name AS director_name,
		COUNT(d.movie_id) AS number_of_movies,
		ROUND(avg_inter_movie_days) AS inter_movie_days,
		ROUND(AVG(avg_rating),2) AS avg_rating,
		SUM(total_votes) AS total_votes,
		MIN(avg_rating) AS min_rating,
		MAX(avg_rating) AS max_rating,
		SUM(duration) AS total_duration,
		ROW_NUMBER() OVER(ORDER BY COUNT(d.movie_id) DESC) AS director_row_rank
	 FROM
		 names AS n 
         JOIN director_mapping AS d ON n.id=d.name_id
		 JOIN ratings AS r ON d.movie_id=r.movie_id
		 JOIN movie AS m ON m.id=r.movie_id
		 JOIN avg_inter_days AS a ON a.name_id=d.name_id
	 GROUP BY director_id
 )
 SELECT 
	*	
 FROM final_result
 LIMIT 9;