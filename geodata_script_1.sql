SELECT 
    t1.title, t2.title, t3.title
FROM
    geodata._cities AS t1
        LEFT JOIN
    geodata._countries AS t2 ON t1.country_id = t2.id
        LEFT JOIN
    geodata._regions AS t3 ON t1.region_id = t3.id
