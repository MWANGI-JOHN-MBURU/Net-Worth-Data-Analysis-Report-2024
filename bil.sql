create database billionare;
use billionare;


# How many billionaires exist

select count(BillionairesRichestBillionaire2023)
from `billionaires-by-country-2024`;

# Count and Avg Net-worth of the billionaires by region(continent)

select count(BillionairesRichestBillionaire2023) AS Count_of_Billionares,
round(avg(BillionairesRichestNetWorth2023),2) as AVG_NET,
round(sum(BillionairesRichestNetWorth2023),2) as Total_NET
from `billionaires-by-country-2024`;



# African billionaires net worth as a pct of the whole world, and other countries too

select distinct region
from `billionaires-by-country-2024`;



SELECT 
  region,
  ROUND(SUM(BillionairesRichestNetWorth2023) * 100 / (SELECT SUM(BillionairesRichestNetWorth2023) FROM `billionaires-by-country-2024`), 2) AS pct_networth
FROM `billionaires-by-country-2024`
GROUP BY region;



# Top 5 billionaires regardless of country and region, by net worth

select distinct BillionairesRichestBillionaire2023,BillionairesRichestNetWorth2023
from `billionaires-by-country-2024`
order by BillionairesRichestNetWorth2023 desc
limit 10;


# Is there a relationship between the regions with the highest number of billionaires and;
#         -- Population growth rate
#         -- Population density


select distinct region,
round(avg(BillionairesRichestNetWorth2023),3),
round(avg(population_density_km),3),
round(avg(Population_growthRate),3)
from `billionaires-by-country-2024`
group by region
order by round(avg(BillionairesRichestNetWorth2023),3) desc;

#Avg net worth by UN member status


SELECT 
  unMember,
  ROUND(SUM(BillionairesRichestNetWorth2023 ) * 100 / (SELECT SUM(BillionairesRichestNetWorth2023) FROM `billionaires-by-country-2024`), 2) AS pct_networth
FROM `billionaires-by-country-2024`
GROUP BY unMember;
