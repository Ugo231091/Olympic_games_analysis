/****** Script de la commande SelectTopNRows à partir de SSMS  ******/
SELECT 
  [ID], 
  [Name] AS "Athlete" --Renamed column
  , 
  CASE WHEN [Sex] = 'M' THEN 'Male' WHEN [Sex] = 'F' THEN 'Female' ELSE 'Unknown' END AS [Sexe] -- Better for name filter 
  , 
  [Age], 
  CASE WHEN [Age] < 18 THEN 'Under 18' WHEN [Age] BETWEEN 18 
  AND 25 THEN '18-25' WHEN [Age] BETWEEN 25 
  AND 30 THEN '25-30' WHEN [Age] BETWEEN 30 
  AND 35 THEN '30-35' WHEN [Age] > 35 THEN 'Over 35' END AS [Age Binned] -- Serve for Analysis
  , 
  [Height], 
  [Weight], 
  NOC --,[Games] 
  , 
  LEFT(
    Games, 
    CHARINDEX(' ', Games)-1
  ) AS 'Year' -- Isolate the Year thanks to CHARINDEX which returns the number of char before it finds the ' ' value
  , 
  RIGHT(
    Games, 
    CHARINDEX(
      ' ', 
      REVERSE(Games)
    )-1
  ) AS 'Season' -- Isolate the Season thanks to CHARINDEX which returns the number of char before it finds the ' ' value, use of REVERSE to count from the Right 
  , 
  [City], 
  [Sport], 
  [Event], 
  CASE WHEN [Medal] = 'NA' THEN 'No Medal' ELSE Medal END AS 'Medal' 
FROM 
  dbo.athletes_event_results 
WHERE 
  RIGHT(
    Games, 
    CHARINDEX(
      ' ', 
      REVERSE(Games)
    )-1
  ) = 'Summer'


  