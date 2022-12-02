CREATE TABLE ogrenciler5
(
ogrenci_no char(7),	--Uzunlugunu bildigimiz stringler icin CHAR kullanilir
isim varchar (20),  --Uzunlugunu bilmedigimiz stringler icin VHARCHAR kullaniriz
soyisim varchar(25),
not_ort real, 		-- ondalikli sayilar icin kullanilir (double gibi)
kayit_tarih date -- sonda virgül konulmaz.
);

-- varolan bir tablodan yeni bir tablo olusturma
CREATE TABLE notlar
AS
SELECT isim,not_ort FROM ogrenciler5;

select * FROM ogrenciler5;


-- INSERT - TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Ayda', 99.1);
INSERt INTO notlar VALUES ('Esra', 92.1);
INSERT INTO notlar VALUES ('Emine', 89.1);
INSERT INTO notlar VALUES ('Ömer', 99.1);
INSERT INTO notlar VALUES ('Alp', 99.1);

select * from notlar;

Create table talebeler
(
isim varchar(10),
notlar real 
);


INSERT INTO talebeler VALUES ('Ayda', 99.1);
INSERt INTO talebeler VALUES ('Esra', 92.1);
INSERT INTO talebeler VALUES ('Emine', 76.1);
INSERT INTO talebeler VALUES ('Ömer', 99.1);
INSERT INTO talebeler VALUES ('Alp', 99.1);
select * from talebeler;


select isim from notlar;

-- CONSTRAINT 
-- UNIQUE

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,	
isim varchar(20) not null, 
soyisim varchar(25),
not_ort real,
kayit_tarih date 
);

select * from ogrenciler7;


INSERT INTO ogrenciler7 VALUES ('1234567','Alperen', 'Ycdl', 87.5, now());
INSERT INTO ogrenciler7 VALUES ('1234568','Ali', 'Veli', 87.5, now());

INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES ('1234569', 'evr', 85.5); -- NOT NULL kisitlamasi oldugu icin isim olmadan calismadi.


-- PRIMARY KEY atamasi

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,	
isim varchar(20) , 
soyisim varchar(25),
not_ort real,
kayit_tarih date 
);

-- PRIMARY KEY atamasi 2. yol

CREATE TABLE ogrenciler9
(
ogrenci_no char(7) ,	
isim varchar(20) , 
soyisim varchar(25),
not_ort real,
kayit_tarih date ,
CONSTRAINT ogr PRIMARY KEY (ogrenci_no) 
);



--Practice
/*
“tedarikciler3” isimli bir tablo olusturun. 
Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char (5) PRIMARY KEY,
tedarikci_ismi varchar (20),
letisim_isim varchar (20)
);


CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
foreign KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

select * from tedarikciler3;
select * from urunler;


--Practice 2:
/*
“calisanlar” isimli bir Tablo olusturun. 
Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');  --INT / STRING KABUL ETMEZ
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;




-- CHECK CONSTRAINT

CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES ('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14'); --10000'den büyük olsun dedigimiz icin error verir eger kucuk olursa
SELECT * FROM calisanlar1;


-- DQL -- WHERE KULLANNIMI
SELECT * FROM calisanlar; -- tüm tablo icin.
SELECT isim FROM calisanlar; -- belli bir sutun icin .


-- Calisanlar tablosundan maasi 50000 den büyük olan isimleri listeleyiniz
SELECT isim,maas FROM calisanlar WHERE maas>5000;


--Calisanlar tablosundan ismi Veli Han olan veriyi listeleyiniz
SELECT * FROM calisanlar WHERE isim='Veli Han';


--Calisanlar tablosundan maasi 5000 olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE maas=5000;


-- DML -- DELETE KOMUTU 
DELETE FROM calisanlar; -- eger parent table baska bir child tablo ile iliskili ise once child tablo silinmeli 
DELETE FROM adresler; --DELETE 5 der yani 5 deger silindi
SELECT * FROM adresler;


-- Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';



-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

CREATE TABLE ogrenciler10
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler10;

