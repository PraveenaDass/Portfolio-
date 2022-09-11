Select *
From [Portfolio project ]..[Covid Deaths]

order by 3,4

Select *
From [Portfolio project ]..[Covid vaccinations]
order by 3,4


Select Location, date,total_cases, new_cases ,total_deaths,population 
From [Portfolio project ]..[Covid Deaths]
Order by 1,2


-- Total cases VS Total Deaths 
select Location, date, total_cases,total_deaths , (total_deaths/total_cases)*100 as Deathpercentage 
From [Portfolio project ]..[Covid Deaths]
Where location like '%India%'
Order by 1,2

-- Total cases VS Population 
--what percentage of population got covid 

select Location, date,population,total_cases ,(total_cases/population)*100 as PercentpopulationInfected
From [Portfolio project ]..[Covid Deaths]
Where location like '%India%'
Order by 1,2

--Countries with Highest Infection Rate compared to Population 

select Location ,population,MAX (total_cases) as HighestInfectioncount,  MAX((total_cases/population))*100 as PercentpopulationInfected 
From [Portfolio project ]..[Covid Deaths]
--Where location like '%India%'
Group by location,population
Order by PercentpopulationInfected desc

--Countries with Highest Death count per population

select Location ,MAX(cast(total_cases as int)) as totaldeathcounts
From [Portfolio project ]..[Covid Deaths]
--Where location like '%India%'
where continent is not null
Group by location
Order by totaldeathcounts desc



-- LET'S BREAK THINGS DOWN BY CONTINET 


-- showing continets with the highest death count per population 

select continent ,MAX(cast(total_cases as int)) as totaldeathcounts
From [Portfolio project ]..[Covid Deaths]
--Where location like '%India%'
where continent is not null
Group by continent
Order by totaldeathcounts desc

-- GLOBAL NUMBERS

select SUM(new_cases) as total_cases ,SUM(cast(new_deaths as int)) as total_deaths ,SUM(cast(new_deaths as int))/SUM (New_cases)*100 as Deathpercentage
From [Portfolio project ]..[Covid Deaths]
--Where location like '%India%'
Where continent is not null 
--Group By date
Order by 1,2


-- Looking at Total population Vs Vaccinations 

select dea.continent ,dea.location,dea.date , dea.population , vac.new_vaccinations
From [Portfolio project ]..[Covid Deaths] dea
join [Portfolio project ]..[Covid vaccinations] vac
    On dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null 
	order by 2,3

	


