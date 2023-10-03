                               ---QUERIES FOR TABLEAU NBA---

--Select number of championship per franchise
SELECT fr.code,fr.current_city,fr.actual_name,count(ch.code) as tot
from champions ch RIGHT JOIN franchises fr ON fr.code = ch.code
GROUP by fr.code,fr.current_city,fr.actual_name ORDER BY tot DESC;

--Select TOP5 best scorer of all time with franchise name
with total_point as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.points) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.points) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(points) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_point where rank<=5;

--Select TOP5 best 3PT shooter of all time with franchise name
with total_3PT as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.three_point) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.three_point) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(three_point) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_3PT where rank<=5;

--SELECT TOP5 best blocker of all time with franchise name
with total_block as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.block) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.block) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(block) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_block where rank<=5;

--Select TOP5 players with the most seasons
with total_seasons as (SELECT fr.code,fr.actual_name as franchise,player,
count(1) as total,
row_number() over(PARTITION BY fr.actual_name ORDER BY count(1) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING count(1) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_seasons where rank<=5;

--Select TOP5 players with the most steals
with total_steals as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.steal) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.steal) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(steal) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_steals where rank<=5;

--Select TOP5 best rebounders 
with total_rebounds as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.total_rebound) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.total_rebound) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(total_rebound) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_rebounds where rank<=5;

--Select Top assit per team
with total_assist as (SELECT fr.code,fr.actual_name as franchise,player,
sum(se.assist) as total,
rank() over(PARTITION BY fr.actual_name ORDER BY sum(se.assist) DESC) as rank 
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY fr.code,fr.actual_name,player HAVING sum(assist) NOTNULL ORDER BY fr.actual_name ,total DESC)
SELECT code,franchise,player,total from total_assist where rank<=5;

--Select League 3PT% per season
SELECT year,SUM(three_point)/SUM(three_point_attempted) as League_3PT_per 
FROM seasons GROUP BY year ORDER BY year ASC;

--Select League 3PT% rank of the team in each season
SELECT fr.code,fr.actual_name as franchise,year,SUM(se.three_point)/SUM(se.three_point_attempted) as tot,
rank() OVER(PARTITION BY year order by SUM(se.three_point)/SUM(se.three_point_attempted) DESC) as rank
FROM seasons se JOIN franchises fr ON fr.code = se.franchise_code
GROUP BY year,fr.code,fr.actual_name ORDER BY year,rank;

--Select Player height, weight
Select distinct se.player,pl.height_meter,pl.weight_kilo from players pl JOIN seasons se on se.player = pl.name;
