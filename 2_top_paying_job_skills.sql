/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id= company_dim.company_id
WHERE
    job_title_short='Data Analyst' AND
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT top_paying_jobs.*,
    skills
from top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
    LIMIT 100;


/*Most Frequently Mentioned Skills:
Python: This skill is by far the most commonly requested (appears 36 times). Python is known for its versatility and is used widely for data analysis, machine learning, automation, and statistical modeling.

SQL: SQL appears 34 times, indicating that a strong command of database querying and management is crucial. SQL is foundational for extracting, manipulating, and analyzing data in relational databases.

NoSQL: This skill appears 7 times, showing that knowledge of non-relational databases (e.g., MongoDB) is valuable in specific use cases.

Java: Appears 8 times, showing that some roles require knowledge of Java, likely for data pipelines or integrating with larger systems.

Scala: Appears 5 times, highlighting its importance in big data environments, especially for those using Apache Spark.

R: Appears 4 times, indicating its continued use in statistical analysis and data visualization.

Go: Appears 4 times, often associated with performance-critical applications or backend systems.
*/