# Question - 1:
# What is the ratio of animated movies to live action movies for films produced from 2012 to 2022?
# Significance 1. Over the past decade, Disney has been increasingly interested in remaking their classic animated movies into 
# live action films. Producing greater numbers of live action movies could indicate how Disney is trying to appeal to a wider audience. 

SELECT 
    t.release_year,
    SUM(CASE WHEN tg.Animated = 1 THEN 1 ELSE 0 END) AS Animated_Count,
    SUM(CASE WHEN tg.Animated = 0 THEN 1 ELSE 0 END) AS Live_Action_Count,
    (SUM(CASE WHEN tg.Animated = 1 THEN 1 ELSE 0 END) * 1.0 / NULLIF(SUM(CASE WHEN tg.Animated = 0 THEN 1 ELSE 0 END), 0)) AS Ratio
FROM 
    Title t
INNER JOIN 
    (SELECT title_id, MAX(CASE WHEN Genre_ID = 5 THEN 1 ELSE 0 END) AS Animated FROM Title_Genre GROUP BY title_id) tg ON t.title_id = tg.title_id
WHERE 
    t.release_year BETWEEN 2012 AND 2022
GROUP BY 
    t.release_year
ORDER BY
	t.release_year;


# Question 2:
# What is the ratio of movies to TV shows for each year from 2019 to 2022?
# Significance 2. The Guardian reported that television shows are beginning to overtake movies as the most profitable and popular media platform. 
# Audiences are attending the cinema less and less and production budgets have massively increased for television shows since 2020.
# The production of more television shows over movies could indicate Disney+ is following this recent trend of streaming more television shows.

SELECT
    release_year,
    SUM(CASE WHEN show_type = 'MOVIE' THEN 1 ELSE 0 END) AS movie_count,
    SUM(CASE WHEN show_type = 'SHOW' THEN 1 ELSE 0 END) AS tv_show_count,
    (SUM(CASE WHEN show_type = 'MOVIE' THEN 1 ELSE 0 END) * 1.0) / NULLIF(SUM(CASE WHEN show_type = 'SHOW' THEN 1 ELSE 0 END), 0) 
    AS movie_to_tv_show_ratio
FROM
    sys.Title
WHERE
    release_year BETWEEN 2019 AND 2022
GROUP BY
    release_year
ORDER BY
    release_year ASC;


# Question 3:
# From 2010 to 2020, how many PG 13 rated movies are available? 
# Significance 3. Disney has long been associated with both rated G and PG films. Producing films for teenagers could
# indicate a trend of appealing to audiences who are above age 13.

SELECT 
  YearSeries.year, 
  COALESCE(PG13Movies.PG13_movie_count, 0) AS PG13_movie_count
FROM 
  (SELECT 2010 AS year UNION ALL SELECT 2011 UNION ALL SELECT 2012 UNION ALL 
   SELECT 2013 UNION ALL SELECT 2014 UNION ALL SELECT 2015 UNION ALL 
   SELECT 2016 UNION ALL SELECT 2017 UNION ALL SELECT 2018 UNION ALL 
   SELECT 2019 UNION ALL SELECT 2020 UNION ALL SELECT 2021 UNION ALL
   SELECT 2022) AS YearSeries
LEFT JOIN 
  (SELECT 
     T.release_year, 
     COUNT(*) AS PG13_movie_count
   FROM 
     Title AS T
   JOIN 
     AgeCertifications AS AC ON T.Age_Certification_Code = AC.Age_Certification_Code
   WHERE 
     AC.Age_Certification_Name = 'PG-13' 
     AND T.release_year BETWEEN 2010 AND 2022
   GROUP BY 
     T.release_year) AS PG13Movies ON YearSeries.year = PG13Movies.release_year
ORDER BY 
  YearSeries.year;


# Question 4:
# Looking at television series produced from 2010 to 2020, what is the number of television series that have a TV-Y7 or TV-Y7-FV rating? 
# Significance 4. It would be interesting to know if Disney is actively decreasing the amount of media they produce for children below
# the age of 7. Answering this question would reveal if Disney+ is shifting its content focus away from very small children.

SELECT 
  YearSeries.year, 
  COALESCE(PG13Movies.TV_Y7_TV_Y7_FV_count, 0) AS TV_Y7_TV_Y7_FV_count
FROM 
  (SELECT 2010 AS year UNION ALL SELECT 2011 UNION ALL SELECT 2012 UNION ALL 
   SELECT 2013 UNION ALL SELECT 2014 UNION ALL SELECT 2015 UNION ALL 
   SELECT 2016 UNION ALL SELECT 2017 UNION ALL SELECT 2018 UNION ALL 
   SELECT 2019 UNION ALL SELECT 2020 UNION ALL SELECT 2021 UNION ALL
   SELECT 2022) AS YearSeries
LEFT JOIN 
  (SELECT 
     T.release_year, 
     COUNT(*) AS TV_Y7_TV_Y7_FV_count
   FROM 
     Title AS T
   JOIN 
     AgeCertifications AS AC ON T.Age_Certification_Code = AC.Age_Certification_Code
   WHERE 
     AC.Age_Certification_Name = 'TV-Y7' OR AC.Age_Certification_Name = 'TV-Y7-FV'
     AND T.release_year BETWEEN 2010 AND 2022
   GROUP BY 
     T.release_year) AS PG13Movies ON YearSeries.year = PG13Movies.release_year
ORDER BY 
  YearSeries.year;


# Question 5: 
# Looking at their entire catalog, how many movies and tv shows produced between 2018 and 2022 fall under the documentation genre?
# Significance 5. Disney has been increasingly interested in producing documentary films, having recently released the widely acclaimed
# The Beatles: Get Back television documentary in 2021 on Disney+. According to a survey published by Moving Docs and Cineuropa, the documentary
# genre usually attracts audiences who are between the ages of 30 and 50. The increase in the production of documentary films could
# indicate an effort to widen their subscriber growth by appealing to older audiences.
 
SELECT
  T.release_year, 
  COUNT(*) AS documentary_count
FROM 
  Title AS T
JOIN 
  Title_Genre AS TG ON T.title_id = TG.title_id
JOIN 
  Genre AS G ON TG.Genre_ID = G.Genre_ID
WHERE 
  G.Genre_Name = 'documentation'
  AND T.release_year BETWEEN 2018 AND 2022
GROUP BY 
  T.release_year
ORDER BY 
  T.release_year;


# Question 6:
# Looking at live action films produced from 2010 to 2022 with at least 10,000 imdb votes, what is the average imdb score given to each film?  
# Significance 6. As a concluding question, we would like to explore whether or not Disney’s experimentation with producing more
# live action films has been primarily a critical success or not. Having a greater understanding of their recent critical success
# will reveal whether or not Disney’s brand shifting is creating positive or negative reactions.

SELECT 
    t.release_year,
    AVG(t.IMDB_Score) AS Average_Score
FROM 
    Title t
INNER JOIN 
    (SELECT title_id, MAX(CASE WHEN Genre_ID = 5 THEN 1 ELSE 0 END) AS Animated FROM Title_Genre GROUP BY title_id) tg ON t.title_id = tg.title_id
WHERE 
    t.release_year BETWEEN 2010 AND 2022
    AND t.IMDB_Votes >= 10000
    AND tg.Animated = 0
GROUP BY 
    t.release_year
ORDER BY
	t.release_year;


# Table Schema:
SHOW FIELDS FROM Credit;
SHOW FIELDS FROM Title;
SHOW FIELDS FROM Title_Genre;
SHOW FIELDS FROM AgeCertifications;
SHOW FIELDS FROM Genre;

# Drop Tables:
drop table CREDIT;
drop table Title_Genre;
drop table Title;
drop table AgeCertifications;
drop table Genre;