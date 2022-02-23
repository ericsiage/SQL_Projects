--Select VC.iso_code, VC.location, VC.daily_vaccinations,
--DC.iso_code, DC.location, DC.new_deaths
--from VaccinationsCovid AS VC
--inner join DeathsCovid AS DC
--ON VC.location = DC.location

--ORDER BY VC.daily_vaccinations DESC

--Select Location, date, total_cases, new_cases, total_deaths, population
--From ProjectPortfolio..DeathsCovid as DC
--order by 1,2


-- Casos totales vs muertes totales
-- muestra el porcentaje de muertes por casos
--Select location, date, total_deaths, total_cases, (total_deaths/total_cases)*100 as percentage_deaths_by_cases 
--from ProjectPortfolio..DeathsCovid as DC
--order by 1,2 DESC


--muestra el porcentaje de casos por población
select location, date, population, total_cases, (total_cases/population)*100 as percentage_cases_by_population
from ProjectPortfolio..DeathsCovid
where location like '%uruguay%'
order by 1,2 DESC


--vemos la tasa de infectados por pais
select location, population, max(total_cases) as max_cases, max((total_cases/population))*100 as percentage_cases_by_country
from ProjectPortfolio..DeathsCovid
group by location, population
order by 1,2


--Porcentaje de muertes con vacunas.
--select DC.location, DC.date, DC.population, VC.total_vaccinations, DC.total_deaths, (DC.total_deaths/VC.total_vaccinations)*100 as percentage_deaths_with_vaccines
--from ProjectPortfolio..DeathsCovid AS DC
--inner join ProjectPortfolio..VaccinationsCovid as VC
--on DC.location = VC.location