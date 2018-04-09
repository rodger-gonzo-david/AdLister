USE adlister_db;

INSERT INTO users( username, email, password) VALUES
  ('username1','benji@gmail.com', 'abc123'),
  ('username2','albert@gmail.com', 'ally'),
  ('username3','bobo@gmail.com', 'bobo12'),
  ('username4','stanley@stan.com', 'pppeld'),
  ('username5','goober@goobermail.com', 'abc123'),
  ('username6','derp@aol.com', 'abc123'),
  ('username7','derpington@aol.com', 'albertington'),
  ('username8','aoili@aol.com', 'kakkd125'),
  ('username9','pepper@gmail.com', 'salty'),
  ('username10','monstare999@gmail.com', 'adaleid'),
  ('username11','barf@barfmail.com', 'barfboi'),
  ('username12','zipper@gmail.com', 'zippy zipp'),
  ('username13','preston@gmail.com', 'keppler'),
  ('username14','headphonemansire@hpms.com', 'soundy'),
  ('username15','jasper@aol.com', 'jazzyjasp'),
  ('username16','edgar@gmail.com', 'edgarino'),
  ('username17','felix@yahoo.com', 'feelsgoodman'),
  ('username18','evie@aol.com', 'evieroxsox'),
  ('username19','bingobango@gmail.com', 'bingo'),
  ('username20','bongo@yahoo.com', 'bongo');

INSERT INTO categories (category_name) VALUES
  ('Home'),
  ('Auto'),
  ('Personal'),
  ('Services'),
  ('Marketing'),
  ('Travel'),
  ('Jobs');

INSERT INTO ads (user_id, title, description, price) VALUES
  (1, 'Cool Cookies', 'Some home baked cookies that taste good: Price by dozen', 30.00),
  (5, 'Laptop', 'Bad macbook 4 sale', 900.00),
  (2, 'NEW CAR', 'Car from 2000 that is automatic transmission, see pic for details', 1000.23),
  (15, 'Muffler', 'Muffler go vroom vroom for cheap', 13.00),
  (7, 'Handy Man Available!!!!', 'Experienced handy man who is willing to work for as little as $5/hr', 15.00),
  (5, 'Travel to the bahamas!', 'Join us on our expedition into one of the worlds best kept secrets', 1500.00),
  (3, 'Mexico! CANCUN!', 'WE ARE YELLING AT YOU TO GO TO CANCUN!!!! VERY FUN! ALL EXPENSE PAID TRIP BY YOU!!!', 850.00),
  (5, 'Looking for Entry Level Lawyer', 'Looking for a brand new lawyer with 25 years experience in the legal sector $8/hr', 8.00),
  (18, 'Make your business shine!', 'Here at Shiny Marketing, we will make your business look way better than it really is.', 300.29),
  (17, 'Looking 4 Furry Friends', 'Am human looking to be involved with furry friends, will pay for companion (inquire below)', 8.00),
  (3, 'Banana Friends', 'We make banana posters that are all salmon colored', 147.78),
  (20, 'ASUS Laptop', 'Not actually an asus laptop, but that is cool right? It has an asus sticker', 700.99),
  (9, 'Welder Needed', 'Need experienced titanium welder fast. BOOKU Bucks to be made', 9.00);

INSERT INTO pivot_categories (ads_id, categories_id) VALUES
  (1, 3),
  (1, 4),
  (2, 3),
  (3, 2),
  (3, 3),
  (4, 2),
  (4, 3),
  (5, 4),
  (5, 7),
  (6, 6),
  (6, 3),
  (6, 4),
  (6, 5),
  (7, 6),
  (7, 4),
  (8, 7),
  (8, 4),
  (9, 5),
  (10, 3),
  (11, 5),
  (12, 3),
  (13, 7);

INSERT INTO media (location) VALUES
  ('/cookies.jpeg'),
  ('/laptoppicture.jpeg'),
  ('/SICK_CAR_BRO.jpeg'),
  ('/OTHERANGLEOFCAR.jpeg'),
  ('/pic_of_donathan.png'),
  ('/stock_photo_bahama_1.png'),
  ('/stock_photo_bahama_2.png'),
  ('/stock_photo_bahama_3.png'),
  ('/stock_photo_bahama_4.png'),
  ('/cancun_before_nuclear_explosion.png'),
  ('/gavel.jpeg'),
  ('/sun_picture.jpeg'),
  ('/cat.jpeg'),
  ('/man_in_cat_costume.jpeg'),
  ('/man_in_cat_costume_holding_cat.jpeg'),
  ('/banana_logo_pic.png'),
  ('/laptop_asus.png');

INSERT INTO pivot_media (media_id, ad_id)
VALUES ('1','1'),
('2','5'),
('3','2'),
('4','10'),
('5','7'),
('6','5'),
('7', '3') , ('8','5'), ('9','13'), ('10','12'), ('11','3'), ('12','13'), ('13','9'), ('14','11'), ('15','5'), ('16','2'), ('17','9');
