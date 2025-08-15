WITH users_per_month_and_city AS(
    SELECT usage_geo_id_name AS city,
           EXTRACT(MONTH FROM msk_business_dt_str) as month,
           COUNT(DISTINCT puid) AS count_per_month
    FROM bookmate.audition
    INNER JOIN bookmate.geo
    USING (usage_geo_id)
    WHERE (usage_geo_id_name = 'Москва' OR usage_geo_id_name = 'Санкт-Петербург') 
    GROUP BY city,month 
),
purchases_per_city AS(
    SELECT city,
           SUM(count_per_month) AS purchases
    FROM users_per_month_and_city
    GROUP BY city
)
SELECT usage_geo_id_name AS city,
       COUNT(DISTINCT puid) AS total_users,
       ROUND(purchases*399.0/COUNT(DISTINCT puid),2) AS ltv
    FROM bookmate.audition 
    INNER JOIN bookmate.geo AS b
    USING (usage_geo_id)
    INNER JOIN purchases_per_city AS p ON b.usage_geo_id_name = p.city
    GROUP BY 1,purchases
