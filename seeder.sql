USE adlister_db;

INSERT INTO users( username, email, password) VALUES
  ('username1','benji@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username2','albert@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username3','bobo@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username4','stanley@stan.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username5','goober@goobermail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username6','derp@aol.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username7','derpington@aol.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username8','aoili@aol.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username9','pepper@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username10','monstare999@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username11','barf@barfmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username12','zipper@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username13','preston@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username14','headphonemansire@hpms.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username15','jasper@aol.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username16','edgar@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username17','felix@yahoo.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username18','evie@aol.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username19','bingobango@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO'),
  ('username20','bongo@yahoo.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO');

INSERT INTO categories (category_name) VALUES
  ('Infant Clothes'),
  ('Toddler Clothes'),
  ('Baby Accessories'),
  ('Toys'),
  ('Books'),
  ('Strollers'),
  ('Cribs'),
  ('Car Seats');


INSERT INTO ads (user_id, title, description, price) VALUES
  (1, 'Never Used Infant Boy Sleepsack', 'Brand new Cuddlebuddy sleepsack. Perfect for nighttime', 10.00),
  (5, 'Jack in the Box', 'Scare your child with this creepy Jack0-in-the-box', 5.00),
  (2, 'Bottle Warmer', 'Ver efficient bottle warmer', 10.00),
  (15, 'Osh-Kosh Overalls', 'Gently worn overalls. Perfect for girl or boy. Size 3T.', 5.00),
  (7, 'Aventi Bottle Set', 'Our little one is onto sippy cups now. These are a great set of Aventi bottles with all parts.', 15.00),
  (5, 'Unopened Maxi-Cosi Car Seat', 'We got double of this seat at a baby shower. One of the top-rated carseats.', 150.00),
  (3, 'Pacifier clip', 'Keep that paci attached and off the floor.', 2.00),
  (5, 'Baby Einstein Music Activity Set', 'Give your child the gift of music from an early age. Great condition.', 8.00),
  (18, 'Solid Oak Crib', 'Well-crafted solid oak crib in great condition. Mesh crib guard included.', 300.00),
  (17, 'Jogging Stroller', 'Lightly used jogging stroller for sale. Perfect for getting some fresh air with baby', 100.00),
  (3, 'Baby First Shapes Collection', 'Collection of 10 puffy books. Perfect for an infant or early toddler', 9.00),
  (20, 'Richard Scarry Collection', 'Original encyclopedia set collection of all of Richard Scarry works. Perfect heirloom item!', 30.00),
  (9, 'Chico Active Stroller', 'Most Chico infant carseat models clip right in. Come check it out and see.', 50.00);

INSERT INTO pivot_categories (ads_id, categories_id) VALUES
  (1, 3),
  (2, 4),
  (3, 3),
  (4, 2),
  (5, 3),
  (6, 8),
  (7, 3),
  (8, 4),
  (9, 7),
  (10, 6),
  (11, 5),
  (12, 5),
  (13, 6);

INSERT INTO media (location) VALUES
  ('/avent_bottle.jpeg'),
  ('/bottle_warmer.jpeg'),
  ('/jack_in_box.jpeg'),
  ('/Maxi-Cosi.jpeg'),
  ('/overalls.png'),
  ('/pacifier_clip.png'),
  ('/sleeper.png'),
  ('/baby_shapes.png'),
  ('/chicco_stroller.png'),
  ('/einstein_music.png'),
  ('/jogging_stroller.jpeg'),
  ('/oak_crib.jpeg'),
  ('/scarry.jpeg');

INSERT INTO pivot_media (media_id, ad_id)
VALUES ('1','5'),
('2','3'),
('3','2'),
('4','9'),
('5','4'),
('6','7'),
('7', '1') , ('8','12'), ('9','13'), ('10','8'), ('11','10'), ('12','9'), ('13','11');

