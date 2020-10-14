-- Query 1
SELECT count(*) FROM flights;

-- Query 2
SELECT origin, AVG(ArrDelay) as prom_arribades, AVG(DepDelay) as prom_sortides FROM 	flights
group by origin
order by Origin;

-- Query 3
SELECT origin, colyear, colmonth,  AVG(ArrDelay) as prom_arribades FROM flights
group by origin, colyear, colmonth
order by Origin, colYear,colMonth;

-- Query 4
SELECT u.city, colyear, colmonth,  AVG(ArrDelay) as prom_arribades FROM  flights as f,  usairports as u
where f.Origin = u.IATA
group by city, colyear, colmonth
order by city;

-- Query 5
SELECT UniqueCarrier, colyear, colmonth,  sum(Cancelled) as total_cancelled 
FROM  flights as f
group by UniqueCarrier, colyear, colmonth
order by  total_cancelled desc, colYear, colmonth, UniqueCarrier;

-- Query 6
SELECT  tailnum, sum(Distance) as totaldistance 
FROM flights 
where TailNum<>'' 
group by TailNum 
order by  totaldistance desc limit 10;

-- Query 7
SELECT  uniquecarrier, AVG(ArrDelay) as prom_arribades
FROM flights 
group by uniquecarrier 
having AVG(ArrDelay) > 10
order by prom_arribades DESC;





