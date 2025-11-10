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
