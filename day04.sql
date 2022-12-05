--									ALIASES
-- Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir

drop table if exists calisanlr

CREATE TABLE calisanlr (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);


INSERT INTO calisanlr VALUES(123456789, 'Ali Can' , 'Istanbul'); 
INSERT INTO calisanlr VALUES(234567890, 'Veli Cem' , 'Ankara'); 
INSERT INTO calisanlr VALUES(345678901, 'Mine Bulut' , 'Izmir' );

select * from calisanlr

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar




-- 						IS NULL CONDITION


CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

-- Name sutununda null olan değerleri listeleyelim
SELECT name FROM insanlar WHERE name IS NULL

-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz
SELECT name FROM insanlar WHERE name IS NOT NULL

-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET name='No Name'
WHERE name IS NULL




-- 								ORDER BY CLAUSE-KOMITU
/*
		ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
	
	Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
	Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
	Default olarak küçükten büyüğe sıralama yapar
	Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar ORDER BY adres;

select * from insanlar order by soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar WHERE isim='Mine' ORDER BY ssn

--	NOT : Order By komutundan sonra field ismi yerine field(sutun) numarasi da kullanilabilir
--	Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar WHERE soyisim='Bulut' order by 4
