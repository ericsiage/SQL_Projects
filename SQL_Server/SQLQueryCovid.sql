--Select Location, date, total_cases, new_cases, total_deaths, population
--From ProjectPortfolio..DeathsCovid as DC
--order by 1,2




--muestra el porcentaje de muertes por población de cada pais


Select location, population, sum(new_deaths) as total_d, sum((new_deaths)/population)*100 as percentage_deaths_by_country
from ProjectPortfolio..DeathsCovid
group by location, population
order by percentage_deaths_by_country desc




--Vemos la tasa de infectados por pais

select location, population, sum(new_cases) as Total_Cases, sum((new_cases)/population)*100 as percentage_cases_by_country
from ProjectPortfolio..DeathsCovid
group by location, population
order by percentage_cases_by_country desc



-- Relacion entre vacunas totales y muertes totales por pais

Select VC.location, sum(VC.daily_vaccinations) as total_vac, sum(DC.new_deaths) as total_death
from ProjectPortfolio..VaccinationsCovid AS VC
inner join ProjectPortfolio..DeathsCovid AS DC ON VC.location = DC.location
group by VC.location
order by total_vac desc




-- Muestra el porcentaje de muertes diario en uruguay en el año 2022

Select location, date, total_deaths, total_cases, (total_deaths/total_cases)*100 as percentage_deaths_by_cases 
from ProjectPortfolio..DeathsCovid as DC
where location = 'Uruguay' AND Date like '%2022%'
