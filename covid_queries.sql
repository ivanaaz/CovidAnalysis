-- percent people vaccinated per country   
SELECT location,
       date,
       max(people_vaccinated),
       population,
       (max(people_vaccinated)/population) * 100 as vaccinated_per_100
  FROM full_covid_data
  WHERE continent != '' and people_vaccinated != ''
 GROUP BY location;

 
--calculate deaths global numbers
 SELECT SUM(new_cases) as cases,
       SUM(new_deaths) as deaths,
       (SUM(new_deaths)/SUM(new_cases))*100 AS death_percentage
  FROM full_covid_data
  WHERE continent != '';


--total death count by continent
SELECT location,
       SUM(new_deaths) as death_count
  FROM full_covid_data
  -- exclude the following locations
  WHERE continent = '' and location not in ('World', 'European Union', 'International') 
  GROUP BY location
 ORDER BY death_count desc;
 
  

-- what countries have the highest percent of people infected based on their highest total cases
SELECT date,
       location,
       MAX(total_cases),
       population,
       (MAX(total_cases/population))*100 AS infected_percentage
  FROM full_covid_data
   where location = 'Canada'
  GROUP BY location, population, date
 ORDER BY infected_percentage desc;
