-- AGGREGATE METHOD

--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

/*
    Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
istediğimiz ismi yazarız
*/

--Calisanlar tablosunda minimum maası listeleyiniz
SELECT min(maas) AS minimum_maas FROM calisanlar2;


--Calisanlar tablosundaki maasların toplamını listeleyiniz
SELECT sum(maas) AS toplam_maas FROM calisanlar2;


--Calisanlar tablosundaki maasların ortalamasını listeleyiniz
SELECT avg(maas) FROM calisanlar2;
--ya da;
SELECT round(avg(maas),2) FROM calisanlar2;


--Calisanlar tablosundaki maasların sayısı
SELECT count(maas) AS maas_sayısı FROM calisanlar2; --Burada satir degil maas sayar.
--ya da
SELECT count(maas) FROM calisanlar2;
SELECT count(*) FROM calisanlar2; --yildizla da olur hepsini sayacagi icin.(satirlari sayar)
/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/


-- AGGREGATE METHODLARDA SUBQUERY
select * from calisanlar2;

-- Her markanin id’sini, ismini ve toplam kaç şehirde 
-- bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id,marka_isim,
(SELECT count(sehir ) AS sehir_sayisi FROM calisanlar2
WHERE marka_isim=isyeri) FROM markalar;


--  Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--  toplam maaşini listeleyiniz
CREATE view summaas
as
SELECT marka_isim,calisan_sayisi,
(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar
select * from summaas

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar


-- VIEW Kullanımı
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden isten sorgulama yenine
view'e atadığımız ismi SELECT komutuyla çağırırız
*/

CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;

SELECT * FROM maxminmaas;
SELECT * FROM summaas;


-- EXİSTS CONDITION

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

/*
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/

SELECT urun_id,musteri_isim FROM mart --anasorgusu mart oldugu icin o tablodakileri dahil eder
WHERE exists (SELECT urun_id from nisan WHERE mart.urun_id=nisan.urun_id)


/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

SELECT urun_isim,musteri_isim FROM nisan 
WHERE EXISTS (select urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)

--DML--> UPDATE
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select * from tedarikciler
select * from urunler
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi='istenen veri'
*/
UPDATE tedarikciler
SET firma_ismi = 'Vestel' WHERE vergi_no=102;
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler
SET firma_ismi = 'Casper',irtibat_ismi='Ali Veli' WHERE vergi_no=101
--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler
SET urun_isim = 'Telefon' WHERE urun_isim='Phone';
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler
SET urun_id = urun_id + 1 WHERE urun_id>1004;
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler
SET urun_id = urun_id + ted_vergino
DELETE FROM urunler
--* urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci  tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler                      
SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adam Eve')                       
WHERE musteri_isim='Ali Bak';                       
--* Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler                      
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')                     
WHERE urun_isim='Laptop' 