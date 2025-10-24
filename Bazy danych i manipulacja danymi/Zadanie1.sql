-- 1
CREATE DATABASE Ksiazki;

USE Ksiazki;

-- 2
CREATE TABLE Biblioteczka (
    ID INT,
    Tytul TEXT,
    Data_zakupu DATE
);

-- 3
INSERT INTO Biblioteczka (ID, Tytul, Data_zakupu)
VALUES (1, "Cant Hurt Me", 20241024);

-- 4
SELECT * FROM Biblioteczka
WHERE ID = 1;

-- 5
INSERT INTO Biblioteczka (ID, Tytul, Data_zakupu)
VALUES 
(2, "Atomic Habits", 20241024),
(3, "The Lord of the Rings", 20241024);

-- 6
UPDATE Biblioteczka
SET Tytul = "Wesele", Data_zakupu = 20201208
WHERE ID = 1;

-- 7
ALTER TABLE Biblioteczka
ADD Autor TEXT;

-- 8
UPDATE Biblioteczka
SET Autor = "Stanislaw Wyspianski"
WHERE ID = 1;

UPDATE Biblioteczka
SET Autor = "James Clear"
WHERE ID = 2;

UPDATE Biblioteczka
SET Autor = "J.R.R. Tolkien"
WHERE ID = 3;

-- 9
DELETE FROM Biblioteczka
WHERE ID IN (2, 3);

-- 10
SELECT Autor FROM Biblioteczka
WHERE ID = 1;
