
-- 1. Stwórz Bazę „Sklep odzieżowy”
CREATE DATABASE Sklep_odziezowy;
USE Sklep_odziezowy;

-- 2. Utwórz tabelę „Producenci” z kolumnami:
CREATE TABLE Producenci (
    id_producenta INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_producenta VARCHAR(255) NOT NULL,
    adres_producenta VARCHAR(255) NOT NULL,
    nip_producenta VARCHAR(15) NOT NULL,
    data_podpisania_umowy DATE NOT NULL
);

-- 3. Utwórz tabelę „Produkty” z kolumnami:
CREATE TABLE Produkty (
    id_produktu INT AUTO_INCREMENT PRIMARY KEY,
    id_producenta INT NOT NULL,
    nazwa_produktu VARCHAR(255) NOT NULL,
    opis_produktu TEXT,
    cena_netto_zakupu DECIMAL(10, 2) NOT NULL,
    cena_brutto_zakupu DECIMAL(10, 2) NOT NULL,
    cena_netto_sprzedazy DECIMAL(10, 2) NOT NULL,
    cena_brutto_sprzedazy DECIMAL(10, 2) NOT NULL,
    procent_VAT_sprzedazy DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (id_producenta) REFERENCES Producenci(id_producenta)
);


-- 4. Utwórz tabelę „Zamówienia” z kolumnami:
CREATE TABLE Zamówienia (
    id_zamówienia INT AUTO_INCREMENT PRIMARY KEY,
    id_klienta INT NOT NULL,
    id_produktu INT NOT NULL,
    data_zamówienia DATE NOT NULL,
    FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
);

ALTER TABLE Zamówienia
ADD FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta);


-- 5. Utwórz tabelę „Klienci” z kolumnami:
CREATE TABLE Klienci (
    id_klienta INT AUTO_INCREMENT PRIMARY KEY,
    imię VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL,
    adres VARCHAR(255) NOT NULL
);
-- 6. Połącz tabele ze sobą za pomocą kluczy obcych // polączono od razu przy tworzeniu + dodana brakujaca za pomoca ALTER TABLE


-- 7. Każdą tabelę uzupełnij danymi wg:
INSERT INTO Producenci (nazwa_producenta, adres_producenta, nip_producenta, data_podpisania_umowy)
VALUES
    ('ABC Electronics', 'ul. Elektroniczna 123', '123-456-789', '2023-01-15'),
    ('XYZ Appliances', 'ul. Gospodarcza 45', '987-654-321', '2023-02-10'),
    ('BestGadgets Inc.', 'ul. Technologiczna 67', '456-789-123', '2023-03-22'),
    ('MegaTech Ltd.', 'ul. Innowacyjna 89', '789-123-456', '2023-04-05');
    
INSERT INTO Produkty (id_producenta, nazwa_produktu, opis_produktu, cena_netto_zakupu, cena_brutto_zakupu, cena_netto_sprzedazy, cena_brutto_sprzedazy, procent_VAT_sprzedazy)
VALUES
    (1, 'Laptop Dell XPS 15', 'Potężny laptop', 2000.00, 2460.00, 2500.00, 3075.00, 23.00),
    (1, 'Monitor Dell UltraSharp', 'Wysokiej jakości monitor', 400.00, 492.00, 500.00, 615.00, 23.00),
    (2, 'Lodówka Samsung', 'Duża lodówka', 800.00, 984.00, 1000.00, 1230.00, 23.00),
    (2, 'Pralka LG', 'Energooszczędna pralka', 600.00, 738.00, 750.00, 922.50, 23.00),
    (3, 'Smartfon Apple iPhone 12', 'Najnowszy model iPhone', 900.00, 1107.00, 1200.00, 1476.00, 23.00),
    (3, 'Tablet Samsung Galaxy Tab S7', 'Wysokiej jakości tablet', 600.00, 738.00, 800.00, 984.00, 23.00),
    (4, 'Telewizor LG OLED 4K', 'Telewizor z rozdzielczością 4K', 1500.00, 1845.00, 1800.00, 2214.00, 23.00),
    (4, 'Konsola Sony PlayStation 5', 'Nowa generacja konsol', 700.00, 861.00, 800.00, 984.00, 23.00),
    (1, 'Drukarka HP LaserJet Pro', 'Wielofunkcyjna drukarka', 300.00, 369.00, 400.00, 492.00, 23.00),
    (2, 'Kuchenka mikrofalowa Whirlpool', 'Kuchenka z funkcjami grillowania', 200.00, 246.00, 250.00, 307.50, 23.00),
    (1, 'Słuchawki Bose QuietComfort 35 II', 'Słuchawki z redukcją hałasu', 250.00, 307.50, 300.00, 369.00, 23.00),
    (3, 'Aparat fotograficzny Canon EOS 80D', 'Lustrzanka cyfrowa', 700.00, 861.00, 900.00, 1107.00, 23.00),
    (2, 'Ekspres do kawy Philips', 'Automatyczny ekspres', 400.00, 492.00, 500.00, 615.00, 23.00),
    (1, 'Myszka komputerowa Logitech MX Master', 'Myszka ergonomiczna', 60.00, 73.80, 80.00, 98.40, 23.00),
    (4, 'Odkurzacz Dyson V11', 'Bezprzewodowy odkurzacz', 350.00, 430.50, 450.00, 553.50, 23.00),
    (3, 'Smartwatch Garmin Fenix 6', 'Zegarek sportowy', 300.00, 369.00, 400.00, 492.00, 23.00),
    (2, 'Blender KitchenAid', 'Blender o mocy 1000W', 80.00, 98.40, 100.00, 123.00, 23.00),
    (1, 'Głośniki Sonos Play:5', 'Wielokierunkowe głośniki', 500.00, 615.00, 600.00, 738.00, 23.00),
    (4, 'Suszarka do ubrań Samsung', 'Suszarka z technologią inwersyjną', 250.00, 307.50, 300.00, 369.00, 23.00),
    (2, 'Żelazko Philips PerfectCare', 'Żelazko parowe', 40.00, 49.20, 50.00, 61.50, 23.00)
    ;
    
INSERT INTO Klienci (imię, nazwisko, adres)
VALUES
    ('Jan', 'Kowalski', 'ul. Przykładowa 1'),
    ('Anna', 'Nowak', 'ul. Testowa 2'),
    ('Piotr', 'Wiśniewski', 'ul. Prosta 3'),
    ('Maria', 'Dąbrowska', 'ul. Obwodowa 4'),
    ('Andrzej', 'Lewandowski', 'ul. Szybka 5'),
    ('Ewa', 'Wójcik', 'ul. Długa 6'),
    ('Michał', 'Kamiński', 'ul. Ulica 7'),
    ('Agnieszka', 'Jankowska', 'ul. Nocna 8'),
    ('Krzysztof', 'Woźniak', 'ul. Wiejska 9'),
    ('Barbara', 'Kozłowska', 'ul. Główna 10');
    
    
INSERT INTO Zamówienia (id_klienta, id_produktu, data_zamówienia)
VALUES
    (1, 1, '2023-05-01'),
    (2, 3, '2023-05-02'),
    (3, 5, '2023-05-03'),
    (4, 2, '2023-05-04'),
    (5, 4, '2023-05-05'),
    (6, 3, '2023-05-11'),
    (7, 2, '2023-05-12'),
    (8, 5, '2023-05-13'),
    (9, 4, '2023-05-14'),
    (10, 1, '2023-05-15');

-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci”
-- 9. Posortuj te produkty alfabetycznie po nazwie
SELECT producenci.id_producenta, nazwa_producenta, adres_producenta, nip_producenta, data_podpisania_umowy, id_produktu, nazwa_produktu FROM Producenci
JOIN produkty
ON Producenci.id_producenta = Produkty.id_producenta
WHERE Producenci.ID_producenta = 1
ORDER BY produkty.nazwa_produktu ASC;

-- 10. Wylicz średnią cenę za produktu od producenta z pozycji 1
SELECT AVG(produkty.cena_brutto_sprzedazy) AS srednia_cena FROM produkty
WHERE id_producenta = 1;

-- 11. Wyświetl dwie grupy produktów tego producenta // wydaje mi sie ze autor tego projektu zdecydowanie chcial tu uzyc opcji srednia zamiast mediana :D bo wyliczanie mediany ni hu hu nie pasuje do poziomu tego szkolenia i projektu :D
WITH ProduktRank AS (
    SELECT p.*, ROW_NUMBER() OVER (ORDER BY cena_brutto_sprzedazy) AS RowNum,
        COUNT(*) OVER () AS TotalCount
    FROM
        Produkty AS p
    WHERE
        p.id_producenta = 1
)

SELECT
    p.*,
    CASE
        WHEN pr.RowNum <= ROUND(pr.TotalCount / 2) THEN 'Tanie'
        ELSE 'Drogie'
    END AS grupa
FROM
    Produkty AS p
JOIN
    ProduktRank AS pr
ON
    p.id_produktu = pr.id_produktu;
    
-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę // tu mozna dodac ewentualnie jeszcze DISTINCT
SELECT produkty.nazwa_produktu FROM Zamówienia
JOIN produkty
ON zamówienia.id_produktu = produkty.id_produktu;
    
-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji
SELECT DISTINCT produkty.nazwa_produktu, zamówienia.data_zamówienia FROM Zamówienia
JOIN produkty
ON zamówienia.id_produktu = produkty.id_produktu
LIMIT 5;
    
    
-- 14. Policz łączną wartość wszystkich zamówień
SELECT SUM(produkty.cena_brutto_sprzedazy) FROM Zamówienia
JOIN produkty
ON zamówienia.id_produktu = produkty.id_produktu; 

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego    
SELECT id_zamówienia, produkty.nazwa_produktu, zamówienia.data_zamówienia FROM Zamówienia
JOIN produkty
ON zamówienia.id_produktu = produkty.id_produktu
ORDER BY data_zamówienia ASC;
    
-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych
SELECT * FROM produkty
WHERE id_producenta IS NULL
   OR nazwa_produktu IS NULL
   OR opis_produktu IS NULL
   OR cena_netto_zakupu IS NULL
   OR cena_brutto_zakupu IS NULL
   OR cena_netto_sprzedazy IS NULL
   OR cena_brutto_sprzedazy IS NULL
   OR procent_VAT_sprzedazy IS NULL;
   
-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną
SELECT produkty.nazwa_produktu, produkty.cena_brutto_sprzedazy, COUNT(nazwa_produktu) AS ilosc_sprzedanych FROM Zamówienia
JOIN produkty
ON zamówienia.id_produktu = produkty.id_produktu
GROUP BY produkty.nazwa_produktu, produkty.cena_brutto_sprzedazy
ORDER BY ilosc_sprzedanych DESC
LIMIT 1; 

-- zmiana danych w tabeli aby lepiej bylo widac wyniki zadania
UPDATE zamówienia
SET id_produktu = 1
WHERE id_zamówienia = 2;

UPDATE zamówienia
SET data_zamówienia = '2023-05-01'
WHERE id_zamówienia = 2;

-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień
SELECT data_zamówienia, COUNT(data_zamówienia) as Ilosc_zamowien FROM zamówienia
GROUP BY data_zamówienia
Order BY ilosc_zamowien DESC
LIMIT 1;



