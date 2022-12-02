--DATABASE (VeriTabani) olusturma
Create dataBase evren;

create database erol;



-- DDL - DATA DEFINITION LANGUAGE
-- CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),	
isim varchar (20),
soyisim varchar(25),
not_ort real, 		-- ondalikli sayilar icin kullanilir (double gibi)
kayit_tarih date -- sonda virgül konulmaz.
);



-- VAR OLAN TABLODAN YENI BIR TABLO OLUSTURMA 
CREATE TABLE ogrenci_notlari
AS --Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için normal tablo oluştururken ki parantezler yerine 
   --AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler2;



-- DML - DATA MANUPULATION LANGUAGE
--INSERT (DataBase e veri ekleme)
INSERT INTO ogrenciler2 VALUES ('1234567', 'Alperen', 'YÜCEDAL', 85.5, now());
INSERT INTO ogrenciler2 VALUES ('1234567', 'Alperen', 'YÜCEDAL', 85.5, '2020-12-11');



--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK
INSERT INTO ogrenciler2 (isim ,soyisim) VALUES ('Erol', 'Evren');



-- DQL - DATA QUERY LANGUAGE
-- SELECT
select * FROM ogrenciler2;
