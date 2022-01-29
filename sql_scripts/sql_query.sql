SELECT
    DISTINCT intensity.id AS number_of_consumers,
    (SELECT 
            AVG(Calories00)
        FROM 
            proven-aura-332322.bellabeat.calories AS cal) AS avg_calories
FROM 
    proven-aura-332322.bellabeat.calories AS calories,
    proven-aura-332322.bellabeat.activity AS activity
INNER JOIN 
    proven-aura-332322.bellabeat.intensities AS intensity
ON calories.id = intensity.id
WHERE intensity.id IS NOT null 
GROUP BY intensity.id
ORDER BY intensity.id ASC 