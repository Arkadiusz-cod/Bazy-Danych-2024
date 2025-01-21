===========ZADANIE 1===========
CREATE TABLE pracownik ( id INT AUTO_INCREMENT PRIMARY KEY,
imie VARCHAR(50) NOT NULLL,
nazwisko VARCHAR(100) NOT NULL,
data_urodzenia DATE,
stanowisko ENUM("sprzedawca","magazynier","księgowa")
);
===========ZADANIE 2===========
INSERT INTO pracownik (imie,nazwisko,data_urodzenia,stanowisko) VALUES
('Jan','Kowalski','1985-03-15','sprzedawca'),
('Anna','Nowak','1990-07-22','księgowa'),
('Piotr','Wiśniewski','1978-11-30','magazynier');
===========ZADANIE 3===========
CREATE TABLE dzial (id INT AUTO_INCREMENT PRIMARY KEY,
  nazwa VARCHAR(255) NOT NULL
  );
===========ZADANIE 4===========
INSERT INTO dzial (nazwa) 
VALUES 
('sprzedaż'),
('księgowość'),
('magazyn');
===========ZADANIE 5===========
ALTER TABLE pracownik MODIFY COLUMN stanowisko ENUM('sprzedawca','magazynier','księgowa') DEFAULT 'sprzedawca';
===========ZADANIE 6===========
ALTER TABLE pracownik ADD COLUMN pensja FLOAT(7,2);
UPDATE pracownik 
SET pensja = CASE
    WHEN id = 1 THEN 3500.00
    WHEN id = 2 THEN 4500.50
    WHEN id = 3 THEN 4000.75
END;
===========ZADANIE 7===========
ALTER TABLE dzial CHANGE COLUMN id id_dzialu INT AUTO_INCREMENT PRIMARY KEY,
CHANGE COLUMN nazwa nazwa_dzialu VARCHAR(255) NOT NULL;

ALTER TABLE pracownik CHANGE COLUMN id id_pracownika INT AUTO_INCREMENT PRIMARY KEY;
===========ZADANIE 8===========
DELETE FROM pracownik WHERE id_pracownika = (SELECT MAX(id_pracownika) FROM pracownik)
===========ZADANIE 9===========
ALTER TABLE pracownik ADD COLUMN dzial INT;

ALTER TABLE pracownik ADD CONSTRAINT fk_pracownik_dzial
FOREIGN KEY (dzial) REFERENCES dzial(id_dzialu)
ON DELETE RESTRICT;

UPDATE pracownik 
SET dzial = CASE
    WHEN id_pracownika = 1 THEN 1
    WHEN id_pracownika = 2 THEN 2
    WHEN id_pracownika = 3 THEN 3
END;

DELETE FROM dzial WHERE id_dzialu = 1;
DELETE FROM pracownik WHERE id_pracownika = 1;
===========ZADANIE 10===========
CREATE TABLE stanowisko (id_stanowiska INT AUTO_INCREMENT PRIMARY KEY,nazwa_stanowiska VARCHAR(255) NOT NULL );
INSERT INTO stanowisko (nazwa_stanowiska) SELECT DISTINCT stanowisko FROM pracownik;

ALTER TABLE pracownik ADD COLUMN id_stanowiska INT;
UPDATE pracownik p JOIN stanowisko s ON p.stanowisko = s.nazwa_stanowiska SET p.id_stanowiska = s.id_stanowiska;
ALTER TABLE pracownik ADD CONSTRAINT fk_pracownik_stanowisko FOREIGN KEY (id_stanowiska) REFERENCES stanowisko(id_stanowiska);
===========ZADANIE 11===========
ALTER TABLE pracownik MODIFY COLUMN stanowisko INT;
ALTER TABLE pracownik ADD CONSTRAINT fk_pracownik_stanowisko FOREIGN KEY (stanowisko) REFERENCES stanowisko(id_stanowiska);
UPDATE pracownik p JOIN stanowisko s ON p.stanowisko = s.nazwa_stanowiska SET p.stanowisko = s.id_stanowiska;
===========ZADANIE 12===========
ALTER TABLE pracownik DROP FOREIGN KEY fk_pracownik_dzial;
ALTER TABLE pracownik ADD CONSTRAINT fk_pracownik_dzial
FOREIGN KEY (dzial) REFERENCES dzial(id_dzialu) ON DELETE SET NULL;
DELETE FROM dzial WHERE id_dzialu = 1;
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
ZAPYTANIA SQL ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
===========ZADANIE 1===========
SELECT nazwisko FROM pracownik ORDER BY nazwisko ASC;
===========ZADANIE 2===========
SELECT imie, nazwisko, pensja FROM pracownik WHERE data_urodzenia > '1979-12-31';
===========ZADANIE 3===========
SELECT * FROM pracownik WHERE pensja BETWEEN 3500 AND 5000;
===========ZADANIE 4===========
SELECT towar FROM stan_magazynowy WHERE ilosc > 10;
===========ZADANIE 5===========
SELECT * FROM towar WHERE towar LIKE 'A%' OR towar LIKE 'B%' OR towar LIKE 'C%';
===========ZADANIE 6===========
SELECT * FROM klient WHERE czy_firma = 0;
===========ZADANIE 7===========
SELECT * FROM zamowienie ORDER BY number_zamowienia DESC LIMIT 10;
===========ZADANIE 8===========
SELECT * FROM pracownik ORDER BY pensja ASC LIMIT 5;
===========ZADANIE 9===========
SELECT * FROM towar WHERE nazwa_towaru NOT LIKE '%A%' ORDER BY nazwa_towaru DESC LIMIT 10;
===========ZADANIE 10===========
SELECT * FROM towar
WHERE jednostka_miary = 'szt'
ORDER BY nazwa_towaru ASC, cena_zakupu DESC;
===========ZADANIE 11===========
CREATE TABLE towary_powyzej_100 AS SELECT id_towaru, nazwa_towaru, kategoria, cena_zakupu, opis FROM towar WHERE cena >= 100;
===========ZADANIE 12===========
CREATE TABLE pracownik_50_plus AS SELECT * FROM pracownik WHERE 1 = 0;

INSERT INTO pracownik_50_plus
SELECT *
FROM pracownik
WHERE TIMESTAMPDIFF(YEAR, data_urodzenia, CURDATE()) >= 50;
