WITH initial_cohort AS(
    SELECT DISTINCT puid
    FROM bookmate.audition
    WHERE msk_business_dt_str ='02.12.2024'
),
daily_retention AS (
    SELECT msk_business_dt_str::date - '02.12.2024'::date AS day_since_install,
           COUNT(DISTINCT b.puid) AS retained_users
    FROM bookmate.audition AS b
    INNER JOIN initial_cohort
    USING(puid)
    WHERE msk_business_dt_str >='02.12.2024'
    GROUP BY 1
)
SELECT day_since_install,
       retained_users,
       ROUND(1.0 *retained_users/MAX(retained_users) OVER (),2) AS retention_rate        
FROM daily_retention
GROUP BY 1,2
ORDER BY 1

Результат
day_since_install	retained_users	retention_rate
0	4259	1
1	2698	0.63
2	2550	0.6
3	2421	0.57
4	2231	0.52
5	1994	0.47
6	2129	0.5
7	2287	0.54
8	2274	0.53
9	2207	0.52
