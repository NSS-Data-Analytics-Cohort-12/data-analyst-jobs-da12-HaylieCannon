-- 1.	How many rows are in the data_analyst_jobs table?
-- SELECT COUNT(*)
-- FROM data_analyst_job;

-- Answer: 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT *
-- FROM data_analyst_job
-- limit 10;

--Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- SELECT COUNT(location), location
-- FROM data_analyst_job
-- WHERE location like 'TN' 
-- group by location;

--Answer: Posting in TN = 21

-- SELECT COUNT(location)
-- FROM data_analyst_job
-- WHERE location like 'TN' OR location like 'KY' 
-- group by location;

--	Answer:	Posting in TN or KY = 27

-- 4.	How many postings in Tennessee have a star rating above 4?
-- SELECT COUNT(location)
-- from data_analyst_job
-- where location like 'TN' AND star_rating > 4
-- group by location;

-- Answer: 3	

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
-- SELECT COUNT(review_count)
-- from data_analyst_job
-- where review_count between 500 and 1000;

--Answer: 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
-- SELECT location AS state, AVG(star_rating) AS avg_rating
-- from data_analyst_job
-- GROUP BY location 
-- ORDER BY avg_rating DESC;

-- Answer: NE

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT COUNT (DISTINCT title)
-- from data_analyst_job;

--Answer: 881

-- 8.	How many unique job titles are there for California companies?
-- SELECT count(distinct title)
-- from data_analyst_job
-- where location = 'CA';

-- Anser: 230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- SELECT COUNT (DISTINCT company)
-- -- SELECT Distinct(company), AVG(star_rating) AS avg_star_rating
-- from data_analyst_job
-- where review_count > 5000
-- -- group by company;

-- Answer: 40

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- SELECT Distinct(company), AVG(star_rating) AS avg_star_rating
-- from data_analyst_job
-- where review_count > 5000
-- group by company
-- ORDER BY avg_star_rating DESC;

-- Answer: 4.199999809

-- 11.	Find all the job titles that contain the word 'Analyst'. How many different job titles are there? 
-- SELECT COUNT (DISTINCT title)
-- FROM data_analyst_job
-- WHERE title like '%Analyst%'

-- Answer: 754

-- 12.	How many different job titles do not contain either the word 'Analyst' or the word 'Analytics'? What word do these positions have in common?
-- SELECT DISTINCT(title)
-- FROM data_analyst_job
-- WHERE title NOT Ilike '%Analyst%' AND title NOT Ilike '%Analytics%';

-- Answer: 4 They all list Tableau

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
-- SELECT domain, COUNT(DISTINCT title) AS count_old_postings
-- from data_analyst_job
-- where skill = 'SQL' AND days_since_posting > 21 AND domain IS NOT NULL
-- GROUP BY domain
-- ORDER BY count_old_postings DESC
-- LIMIT 4;

-- Answer: Consulting - 4 postings
-- 			Consumer goods and services - 2 postings
-- 			Computer and Electronics & Internet and Software- 1 posting

