


-- IN CONDITIOAN
DROP TABLE if exists musteriler  


CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

--IN CONDITION

--Musteriler tablosundna urun ismi orange ,apple ve Apricot olan tüm verileri listeleyiniz.
SELECT * FROM musteriler WHERE urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';

SELECT * FROM musteriler Where urun_isim IN ('Orange','Apple','Apricot');

-- NOT IN --> Yazdigimiz verilerin disindakileri getirir.
SELECT * FROM musteriler Where urun_isim NOT IN ('Orange','Apple','Apricot');


SELECT * FROM musteriler Where urun_isim='Orange' and urun_isim='Apple'



/*
							BETWEEN 
Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir 
*/

--BETWEEN CONDITION

--Musteriler tablosundan id si 20 ile 40 arasinda olan verileri listeleteyiniz.

--1.Yol;
SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;

--2.Yol;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40;

--araliginda degil ise boyle yazariz;
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;



--- SUBQUERIES --> Sorgu icinde sorgu;

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

delete  from markalar
CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);


select * from calisanlar2;
select * from markalar;

delete from calisanlar2;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini 
-- ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);


-- marka_id’si 101’den büyük olan marka çalişanlarinin 
-- isim, maaş ve şehirlerini listeleyiniz
SELECT isim,maas,sehir FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);


-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin
-- isimlerini ve maaşlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);


-- marka_id’si 101’den büyük olan marka çalişanlarinin
-- isim, maaş ve şehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

/*
--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
*/
select marka_id , calisan_sayisi , marka_isim from markalar where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara')


-- AGGREGATE METHOD

--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

