 WITH cte AS(
      SELECT DATE_TRUNC('month',msk_business_dt_str)::date AS month,
             COUNT(DISTINCT puid) AS mau,
             ROUND(SUM(hours),2) AS hours
      FROM bookmate.audition
      WHERE msk_business_dt_str BETWEEN '01.09.2024' AND '30.11.2024'
      GROUP BY month
      
)
SELECT month,
       mau,
       hours,
       ROUND(mau*399.0/hours,2)  AS avg_hour_rev
FROM cte
GROUP BY month, mau, hours  

Результат
month	mau	hours	avg_hour_rev
2024-09-01	16320	105539	61.7
2024-10-01	18280	137384	53.09
2024-11-01	18594	145351	51.04
