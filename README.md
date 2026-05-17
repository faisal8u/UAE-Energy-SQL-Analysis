# UAE Energy Operations SQL Analysis 2023

## Project Overview
SQL analysis of UAE electricity generation operations 
for 2023 using SQLite — covering Dubai, Abu Dhabi 
and Sharjah across Solar, Gas and Nuclear sources.

## Business Questions Answered
1. What was total generation by source?
2. Which region had highest average capacity factor?
3. What were the top 5 highest generation months?
4. Which records exceeded average generation?
5. What was total generation cost by plant?
6. Which months had above average CO2 emissions?
7. Complete plant performance report
8. Running cumulative generation by source
9. Capacity factor performance ranking
10. Month over month Gas generation change

## Key Findings
- Gas dominated generation at 912,000 MWh (43%)
- Nuclear achieved highest capacity factor at 93.75%
- Al Aweer Gas Plant cost 47M AED — most expensive
- Barakah Nuclear cheapest per MWh at 18 AED
- July had biggest Gas generation increase (+17,000 MWh)
- December had biggest decrease (-17,000 MWh)
- Nuclear held Rank 1 capacity factor at 96%
- Solar held last rank at 17% in winter months

## SQL Concepts Used
- SELECT, FROM, WHERE
- GROUP BY with SUM, AVG, MAX, MIN
- ORDER BY and LIMIT
- Subqueries
- JOINs (INNER JOIN)
- Window Functions (RANK, LAG, Running Total)
- HAVING

## Database Structure
Two tables:
- energy_data: Monthly generation data by region and source
- plant_details: Plant information including operator and capacity

## About
Built as Project 3 of 7 in my Energy Data Analyst 
portfolio — targeting roles in UAE and India.
