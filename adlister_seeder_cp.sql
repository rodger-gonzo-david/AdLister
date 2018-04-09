INSERT INTO users(username, email, password) VALUES
  ("username",'benji@gmail.com', 'abc123'),
  ("username2",'albert@gmail.com', 'ally'),
  ("username3",'bobo@gmail.com', 'bobo12'),
  ("username4",'stanley@stan.com', 'pppeld'),
  ("username5",'goober@goobermail.com', 'abc123'),
  ("username6",'derp@aol.com', 'abc123'),
  ("username7",'derpington@aol.com', 'albertington'),
  ("username8",'aoili@aol.com', 'kakkd125'),
  ("username9",'pepper@gmail.com', 'salty');

INSERT INTO categories (cat_name) VALUES
  ('Home'),
  ('Auto'),
  ('Personal'),
  ('Services'),
  ('Marketing'),
  ('Travel'),
  ('Jobs');

INSERT INTO ads (users_id, title, description) VALUES
  (1, 'Cool Cookies', 'Some home baked cookies that taste good: Price by dozen', 30.00),
  (5, 'Laptop', 'Bad macbook 4 sale', 2000.00),
  (2, 'NEW CAR', 'Car from 2000 that is automatic transmission, see pic for details', 17000.23),
  (8, 'Muffler', 'Muffler go vroom vroom for cheap', 13.00),
  (7, 'Handy Man Available!!!!', 'Experienced handy man who is willing to work for as little as $5/hr', 15.00),
  (5, 'Travel to the bahamas!', 'Join us on our expedition into one of the worlds best kept secrets', 1500.00),
  (3, 'Mexico! CANCUN!', 'WE ARE YELLING AT YOU TO GO TO CANCUN!!!! VERY FUN! ALL EXPENSE PAID TRIP BY YOU!!!', 850.00),
  (5, 'Looking for Entry Level Lawyer', 'Looking for a brand new lawyer with 25 years experience in the legal sector $8/hr', NULL),
  (9, 'Make your business shine!', 'Here at Shiny Marketing, we will make your business look way better than it really is.', 300.29),
  (1, 'Looking 4 Furry Friends', 'Am human looking to be involved with furry friends, will pay for companion (inquire below)', NULL),
  (3, 'Banana Friends', 'We make banana posters that are all salmon colored', 147.78),
  (6, 'ASUS Laptop', 'Not actually an asus laptop, but that\'s cool right? It has an asus sticker', 700.99),
  (9, 'Welder Needed', 'Need experienced titanium welder fast. BOOKU Bucks to be made', NULL);

