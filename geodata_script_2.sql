SELECT 
    t1.title AS 'city'
FROM
    geodata._cities AS t1
WHERE
    t1.region_id = (SELECT 
            t2.id
        FROM
            geodata._regions AS t2
        WHERE
            t2.title = 'Московская область')
