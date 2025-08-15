SELECT main_content_name,
       published_topic_title_list, 
       main_author_name,
       COUNT(DISTINCT puid) AS mau
FROM bookmate.audition
INNER JOIN bookmate.content
USING (main_content_id)
INNER JOIN bookmate.author
USING (main_author_id)
WHERE EXTRACT(MONTH FROM msk_business_dt_str)  = 11
GROUP BY main_content_name, published_topic_title_list, main_author_name
ORDER BY mau DESC
LIMIT 3;

Результат
main_content_name	published_topic_title_list	main_author_name	mau
Собачка Соня на даче	['Детская проза и поэзия', 'Аудио']	Андрей Усачев	4597
Женькин клад и другие школьные рассказы	['Сказки и фольклор', 'Детская проза и поэзия', 'Аудио']	Игорь Носов	3050
Знаменитая собачка Соня	['Аудиоспектакли', 'Детская проза и поэзия', 'Аудио']	Андрей Усачев	2785

