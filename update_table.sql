      delete user_id, title, description, price, location, ads_id,
      categories_id, media_id, ad_id
 from ads
 join pivot_categories
   on ads.id = pivot_categories.ads_id
 join pivot_media
   on ads.id = pivot_media.ad_id
 join media
   on pivot_media.media_id = media.id
where ads.id               = 2;


delete from ads, pivot_categories, pivot_media, media
  join pivot_categories
    on ads.id=pivot_categories.ads_id
  join pivot_media 
    on pivot_media.ad_id=ads.id
  join media
    on pivot_media.media_id=media.id
 where ads.id               = 12;

DELETE messages , usersmessages  FROM messages  INNER JOIN usersmessages  
WHERE messages.messageid= usersmessages.messageid and messages.messageid = '1'


      delete ads, pivot_categories, pivot_media, media
 from ads
inner join pivot_categories
where ads.id               = pivot_categories.ads_id
inner join pivot_media
where pivot_media.ad_id    = ads.id
inner join media
where pivot_media.media_id = media.id
  and ads.id               = 12;


DELETE f
FROM table1 AS f
JOIN table2 AS dsy
  ON dsy.f1 = f.f1
JOIN table3 AS ds
  ON ds.f2 = f.f2
JOIN table4 AS dp
  ON dp.f3 = f.f3
JOIN table5 AS dg
  ON dg.f4 = f.f4
WHERE
  dsy.school_year = 2011 AND ds.id = 29620 AND dp.id = 14120 AND dg.grade_level = 5;


DELETE table1
    FROM table1 
    JOIN table2 
    JOIN table3 
    JOIN table4 
    JOIN table5 
    WHERE
    table2.f1 = table1 .f1
    AND table3.f2 = table1.f2
    AND table4.f3 = table1.f3
    AND table5.f4 = table1.f4
    AND table2.school_year = 2011
    AND table3.id = 29620
    AND table4.id = 14120
    AND table5.grade_level = 5;

      delete ads
 from ads
 join pivot_categories,pivot_media,media
where ads.id               = pivot_categories.ads_id
  and pivot_media.ad_id    = ads.id
  and pivot_media.media_id = media.id
  and ads.id               = 12;



SELECT ads.*, c.category_name, location,ad_id
  FROM ads
  JOIN pivot_categories pc
    ON ads.id = pc.ads_id
  JOIN categories c
    ON pc.categories_id = c.id
  join pivot_media
    on ads.id = pivot_media.ad_id
  join media
    on pivot_media.media_id = media.id
 order by ad_id;

SELECT *
  FROM ads
  JOIN pivot_categories pc 
    ON ads.id = pc.ads_id
  JOIN categories c        
    ON pc.categories_id = c.id
  join pivot_media
    on ads.id = pivot_media.ad_id
  join media
    on pivot_media.media_id = media.id
 order by ad_id;



















