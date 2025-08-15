SELECT main_author_name, COUNT(DISTINCT puid) AS mau
FROM bookmate.audition
INNER JOIN bookmate.content
USING (main_content_id)
INNER JOIN bookmate.author
USING (main_author_id)
WHERE EXTRACT(MONTH FROM msk_business_dt_str)  = 11
GROUP BY main_author_name
ORDER BY mau DESC
LIMIT 3;

Результат
main_author_name	mau
Андрей Усачев	7107
Лиана Шнайдер	3338
Игорь Носов	3063
