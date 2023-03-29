TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes (names, cooking_time, rating)
VALUES ('Spaghetti Bolognese', 45, 5),
       ('Chicken Curry', 60, 4),
       ('Vegetable Stir Fry', 30, 4),
       ('Grilled Salmon', 25, 5);
