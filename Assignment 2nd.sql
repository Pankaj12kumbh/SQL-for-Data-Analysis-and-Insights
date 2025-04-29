use assignment_2;

insert into games (gametitle, genre, releasedate, developer)
values ('future racing', 'racing', '2024-10-01', 'speed studios');

Select * from games;




#Question 2
update game_sales set Price=60
where GameID=2 and platform='PlayStation';

select * from game_sales

#question 3
SELECT * FROM game_sales WHERE GameID = 5;


delete from game_sales
where GameID=5 ;



#question 4
SELECT GameID, SUM(UnitsSold) AS TotalUnitsSold
FROM game_sales
GROUP BY GameID;

#question 5

SELECT GameID, SUM(UnitsSold) AS TotalUnitsSold
FROM game_sales
WHERE SalesRegion = 'North America'
GROUP BY GameID
ORDER BY TotalUnitsSold DESC
LIMIT 1;

#Question 6
SELECT g.GameTitle, gs.Platform, gs.SalesRegion, gs.UnitsSold
FROM game_sales gs
JOIN Games g ON gs.GameID = g.GameID;


#Question 7
SELECT g.GameTitle
FROM Games g
LEFT JOIN game_sales gs ON g.GameID = gs.GameID;


#Question 8

SELECT gs.*
FROM game_sales gs
LEFT JOIN Games g ON gs.GameID = g.GameID
WHERE g.GameID IS NULL;

#Question 9
SELECT DISTINCT gs.GameID, gs.Platform, gs.SalesRegion, gs.UnitsSold, gs.Price
FROM game_sales gs
WHERE gs.SalesRegion IN ('North America', 'Europe');



#Question 10
SELECT gs.GameID, gs.Platform, gs.SalesRegion, gs.UnitsSold, gs.Price
FROM game_sales gs
WHERE gs.SalesRegion IN ('North America', 'Europe');

