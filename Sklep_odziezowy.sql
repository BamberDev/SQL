-- 1
CREATE DATABASE Sklep_odziezowy;

USE Sklep_odziezowy;

-- 2
CREATE TABLE Producenci (
    id_producenta INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_producenta VARCHAR(255) NOT NULL,
    adres_producenta VARCHAR(255) NOT NULL,
    nip_producenta CHAR(10) UNIQUE NOT NULL,
    data_podpisania_umowy DATE NOT NULL
);

-- 3
CREATE TABLE Produkty (
    id_produktu INT AUTO_INCREMENT PRIMARY KEY,
    id_producenta INT NOT NULL,
    nazwa_produktu VARCHAR(255) NOT NULL,
    opis_produktu TEXT NOT NULL,
    cena_netto_zakupu DECIMAL(10,2) NOT NULL CHECK (cena_netto_zakupu > 0),
    cena_brutto_zakupu DECIMAL(10,2) NOT NULL CHECK (cena_brutto_zakupu > 0),
    cena_netto_sprzedazy DECIMAL(10,2) NOT NULL CHECK (cena_netto_sprzedazy > 0),
    cena_brutto_sprzedazy DECIMAL(10,2) NOT NULL CHECK (cena_brutto_sprzedazy > 0),
    procent_vat_sprzedazy TINYINT NOT NULL DEFAULT 23 CHECK (procent_vat_sprzedazy BETWEEN 0 AND 23)
);

-- 4
CREATE TABLE Zamowienia (
    id_zamowienia INT AUTO_INCREMENT PRIMARY KEY,
    id_klienta INT NOT NULL,
    id_produktu INT NOT NULL,
    data_zamowienia DATE NOT NULL
);

-- 5
CREATE TABLE Klienci (
    id_klienta INT AUTO_INCREMENT PRIMARY KEY,
    imie_klienta VARCHAR(255) NOT NULL,
    nazwisko_klienta VARCHAR(255) NOT NULL,
    adres_klienta VARCHAR(255) NOT NULL
);

-- 6
ALTER TABLE Produkty
ADD CONSTRAINT fk_producent
FOREIGN KEY (id_producenta) REFERENCES Producenci(id_producenta);

ALTER TABLE Zamowienia
ADD CONSTRAINT fk_produkt
FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu);

ALTER TABLE Zamowienia
Add CONSTRAINT fk_klient
FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta);

-- 7
INSERT INTO Producenci (nazwa_producenta, adres_producenta, nip_producenta, data_podpisania_umowy) VALUES
('ModaPlus Sp. z o.o.', 'ul. Słoneczna 12, 00-001 Warszawa', '1234563218', '2023-03-15'),
('Styl & Trendy S.A.', 'ul. Wiosny 45, 30-002 Kraków', '9876543210', '2022-07-01'),
('EcoWear Polska', 'ul. Leśna 9, 40-003 Katowice', '5554443339', '2024-01-10'),
('UrbanFashion Ltd.', 'ul. Miła 33, 50-004 Wrocław', '2223334445', '2021-11-20');

INSERT INTO Produkty (id_producenta, nazwa_produktu, opis_produktu, cena_netto_zakupu, cena_brutto_zakupu, cena_netto_sprzedazy, cena_brutto_sprzedazy) VALUES
(1, 'T-shirt Basic Biały', 'Klasyczny biały T-shirt z bawełny 100%.', 20.00, 24.60, 35.00, 43.05),
(1, 'Bluza Hoodie Grafit', 'Bluza z kapturem w kolorze grafitowym.', 50.00, 61.50, 85.00, 104.55),
(1, 'Jeansy Slim Fit Niebieskie', 'Spodnie jeansowe slim fit, kolor niebieski.', 60.00, 73.80, 110.00, 135.30),
(1, 'Koszula Formalna Biała', 'Elegancka koszula formalna w kolorze białym.', 45.00, 55.35, 75.00, 92.25),
(1, 'Sukienka Letnia Kwiaty', 'Letnia sukienka w kwiatowy wzór, materiał lekki.', 80.00, 98.40, 145.00, 178.35),
(2, 'Marynarka Męska Grafit', 'Marynarka męska grafitowa, materiał 100% wełna.', 200.00, 246.00, 320.00, 393.60),
(2, 'Spódnica Midi Czarna', 'Spódnica midi w kolorze czarnym.', 55.00, 67.65, 95.00, 116.85),
(2, 'Kamizelka Jeansowa Niebieska', 'Kamizelka jeansowa, kolor niebieski.', 35.00, 43.05, 60.00, 73.80),
(2, 'T-shirt Eco Zielony', 'T-shirt wykonany z organicznej bawełny, zielony kolor.', 25.00, 30.75, 45.00, 55.35),
(2, 'Bluza Eco Cappuccino', 'Bluza z organicznej bawełny, kolor cappuccino.', 55.00, 67.65, 95.00, 116.85),
(3, 'Legginsy Eco-Fit Czarne', 'Legginsy dopasowane, kolor czarny, materiał ekologiczny.', 40.00, 49.20, 75.00, 92.25),
(3, 'Kurtka Przejściowa Khaki', 'Kurtka przejściowa w kolorze khaki.', 120.00, 147.60, 195.00, 239.85),
(3, 'Sneakersy Męskie Białe', 'Stylowe sneakersy męskie w kolorze białym.', 150.00, 184.50, 260.00, 319.80),
(3, 'Trampki Damskie Granat', 'Trampki damskie w kolorze granatowym.', 110.00, 135.30, 185.00, 227.55),
(3, 'Kurtka Puchowa Damska Bordo', 'Kurtka puchowa damska w kolorze bordo.', 300.00, 369.00, 450.00, 553.50),
(4, 'Szalik Zimowy Szary', 'Szalik zimowy w kolorze szarym, wełna + akryl.', 30.00, 36.90, 55.00, 67.65),
(4, 'Czapka Zimowa Czarna', 'Czapka zimowa czarna, akryl + wełna.', 20.00, 24.60, 38.00, 46.74),
(4, 'Pasek Skórzany Brązowy', 'Skórzany pasek męski brązowy.', 45.00, 55.35, 80.00, 98.40),
(4, 'Kurtka Skórzana Męska Czarna', 'Kurtka skórzana męska kolor czarny.', 400.00, 492.00, 620.00, 762.60),
(4, 'Portfel Skórzany Brązowy', 'Skórzany portfel męski brązowy.', 70.00, 86.10, 110.00, 135.30);

INSERT INTO Klienci (imie_klienta, nazwisko_klienta, adres_klienta) VALUES
('Anna', 'Kowalska', 'ul. Łąkowa 5, 42-400 Zawiercie'),
('Marcin', 'Nowak', 'ul. Długa 12, 00-950 Warszawa'),
('Ewa', 'Wiśniewska', 'ul. Sienkiewicza 20, 31-015 Kraków'),
('Paweł', 'Wójcik', 'ul. Zielona 8, 40-001 Katowice'),
('Karolina', 'Lewandowska', 'ul. Parkowa 3, 60-101 Poznań'),
('Tomasz', 'Zieliński', 'ul. Ogrodowa 14, 70-200 Szczecin'),
('Magdalena', 'Kaczmarek', 'ul. Reymonta 11, 50-300 Wrocław'),
('Jakub', 'Sikora', 'ul. Mariacka 7, 44-100 Gliwice'),
('Agnieszka', 'Piotrowska', 'ul. Piękna 22, 80-000 Gdańsk'),
('Łukasz', 'Grabowski', 'ul. Kościuszki 18, 90-100 Łódź');

INSERT INTO Zamowienia (id_klienta, id_produktu, data_zamowienia) VALUES
(1, 2, '2025-01-01'),
(2, 5, '2025-02-03'),
(3, 14, '2025-02-03'),
(4, 8, '2025-03-07'),
(5, 2, '2025-03-09'),
(6, 20, '2025-05-11'),
(7, 3, '2025-05-13'),
(8, 17, '2025-06-15'),
(9, 9, '2025-07-17'),
(10, 15, '2025-06-19');

-- 8
SELECT * FROM Produkty
WHERE id_producenta = 1;

-- 9
SELECT * FROM Produkty
WHERE id_producenta = 1
ORDER BY nazwa_produktu ASC;

-- 10
SELECT AVG(cena_netto_sprzedazy) AS srednia_cena
FROM Produkty
WHERE id_producenta = 1;

-- 11
SELECT nazwa_produktu, cena_netto_sprzedazy,
CASE 
    WHEN cena_netto_sprzedazy <= 90 THEN 'Tanie'
    ELSE 'Drogie'
END AS kategoria_ceny
FROM Produkty
WHERE id_producenta = 1;

-- 12
SELECT p.nazwa_produktu AS zamowione_produkty, p.cena_netto_sprzedazy
FROM Produkty AS p
JOIN Zamowienia AS z 
ON p.id_produktu = z.id_produktu;

-- 13
SELECT p.nazwa_produktu AS pierwsze_5_zamowionych_produktow
FROM Produkty AS p
JOIN Zamowienia AS z 
ON p.id_produktu = z.id_produktu
LIMIT 5;

-- 14
SELECT SUM(p.cena_netto_sprzedazy) AS wartosc_zamowien
FROM Produkty AS p
JOIN Zamowienia AS z 
ON p.id_produktu = z.id_produktu;

-- 15
SELECT
    z.*,
    p.nazwa_produktu
FROM Zamowienia AS z 
JOIN Produkty AS p
ON z.id_produktu = p.id_produktu
ORDER BY z.data_zamowienia DESC;

-- 16
SELECT * FROM Produkty;
-- Wszystkie kolumny sa wypelnione poprawnymi danymi

-- Sprawdzenie brakow danych w tabeli Produkty
SELECT * FROM Produkty
WHERE
    id_produktu IS NULL
    OR id_producenta IS NULL
    OR nazwa_produktu IS NULL
    OR nazwa_produktu = ''
    OR opis_produktu IS NULL
    OR opis_produktu   = ''
    OR cena_netto_zakupu IS NULL
    OR cena_brutto_zakupu IS NULL
    OR cena_netto_sprzedazy IS NULL
    OR cena_brutto_sprzedazy IS NULL
    OR procent_vat_sprzedazy IS NULL;
