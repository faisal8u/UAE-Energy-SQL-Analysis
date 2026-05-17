-- ================================================
-- UAE Energy Operations Database Analysis 2023
-- Analyst: Faisal Mujeeb Abdullah
-- Tool: SQLite
-- ================================================

-- Query 1: Total Generation by Source
SELECT Source, SUM(Generation_MWh) AS Total_Generation
FROM energy_data
GROUP BY Source
ORDER BY Total_Generation DESC;

-- Query 2: Average Capacity Factor by Region
SELECT Region, AVG(Capacity_Factor) AS Average_Capacity
FROM energy_data
GROUP BY Region
ORDER BY Average_Capacity DESC;

-- Query 3: Top 5 Highest Generation Records
SELECT Month, Region, Source, Generation_MWh
FROM energy_data
ORDER BY Generation_MWh DESC
LIMIT 5;

-- Query 4: Records Above Average Generation
SELECT Month, Region, Source, Generation_MWh
FROM energy_data
WHERE Generation_MWh > (SELECT AVG(Generation_MWh) FROM energy_data)
ORDER BY Generation_MWh DESC;

-- Query 5: Total Generation Cost by Plant
SELECT p.Plant_Name, p.Operator, e.Source,
       SUM(e.Generation_MWh * e.Cost_per_MWh) AS Total_Cost
FROM energy_data e
JOIN plant_details p
ON e.Source = p.Source
AND e.Region = p.Region
GROUP BY p.Plant_Name, p.Operator, e.Source
ORDER BY Total_Cost DESC;

-- Query 6: Months With Above Average CO2 Emissions
SELECT Month, Region, Source, CO2_Tonnes
FROM energy_data
WHERE CO2_Tonnes > (SELECT AVG(CO2_Tonnes) FROM energy_data)
ORDER BY CO2_Tonnes DESC;

-- Query 7: Complete Plant Performance Report
SELECT p.Plant_Name, p.Operator,
       SUM(e.Generation_MWh) AS Total_Generation,
       AVG(e.Capacity_Factor) AS Avg_Capacity,
       SUM(e.CO2_Tonnes) AS Total_CO2
FROM energy_data e
JOIN plant_details p
ON e.Source = p.Source
AND e.Region = p.Region
GROUP BY p.Plant_Name, p.Operator
ORDER BY Total_Generation DESC;

-- Query 8: Running Total of Generation by Source
SELECT Month, Source, Generation_MWh,
       SUM(Generation_MWh) OVER (PARTITION BY Source ORDER BY Month) AS Cumulative_Generation
FROM energy_data
WHERE Region = 'Abu Dhabi'
ORDER BY Source, Month;

-- Query 9: Capacity Factor Performance Ranking
SELECT Month, Region, Source, Capacity_Factor,
       RANK() OVER (ORDER BY Capacity_Factor DESC) AS Performance_Rank
FROM energy_data
ORDER BY Performance_Rank;

-- Query 10: Month Over Month Gas Generation Change
SELECT Month, Source, Generation_MWh,
       LAG(Generation_MWh) OVER (PARTITION BY Source ORDER BY Month) AS Previous_Month,
       Generation_MWh - LAG(Generation_MWh) OVER (PARTITION BY Source ORDER BY Month) AS Month_Change
FROM energy_data
WHERE Region = 'Dubai'
AND Source = 'Gas'
ORDER BY Month;