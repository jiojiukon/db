INSERT INTO  musician
VALUES(1, 'Eminem'),(2, 'Порнофильмы'),(3,'Post-dukes'),(4,'AC/DC'),(5, 'Ласковый май'),(6, 'Red Hot Chili Peppers');


INSERT INTO  genre
VALUES(1, 'Rap'),(2, 'Russian rock'),(3,'Elecro-folk'),(4,'Rock'), (5, 'Pop');


INSERT INTO  album 
VALUES(1, 'Удмурт рейв', 1680, TO_DATE('15/11/2020', 'DD/MM/YYYY')), 
      (2, 'The Eminem Show', 4620, TO_DATE('29/01/2002', 'DD/MM/YYYY')),
      (3,'Это пройдёт', 1740, TO_DATE('26/05/2020', 'DD/MM/YYYY')),
      (4, 'Back In Black', 2520, TO_DATE('25/07/1980', 'DD/MM/YYYY'));


INSERT INTO  musician_album 
VALUES(1, 2), (2, 3), (3, 1), (4, 4),(2,4);


INSERT INTO  musician_genre
VALUES(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 4);


INSERT INTO  track 
VALUES(1, 'Это пройдёт', 237, 3), (2, 'Back In Black', 256, 4), (3,'Уроки любви', 317, 3), (4,'Куно пумитан', 185, 1),
      (5, 'Shake a Leg',246, 4), (6, 'Вай кырӟалом', 226, 1), (7,'Hailies Song', 321, 2), (8,'Доброе сердце', 252, 3),
      (9,'My Friends', 246, NULL), (10, 'Мой зайчик', 246, NULL);
        
     
INSERT INTO  compilation  
VALUES(1, 'Favorite', 2530, 2022), (2, 'Бодрость', 1506, 2015), (3,'Пиво', 1855, 2012), (4,'Спорт', 1965, 2020);      


INSERT INTO  track_compilation  
VALUES(4, 1), (2, 1), (3, 3), (4, 4), (4, 3), (2, 3), (6, 3), (6, 2);
     
