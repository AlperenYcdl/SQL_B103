CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


-----------------------------------------------------------------------
--Isme gore toplam maaslari bulun
SELECT isim,sum(maas)FROM personel
GROUP BY isim 

--Personel tablosundaki isimleri gruplandirin.

SELECT isim, count(sehir) FROM personel
GROUP BY isim

--Sehre gore personel sayisini bulun

SELECT sehir, count(isim) FROM personel
GROUP BY sehir

---------------------------------------------------------------------------------

-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
--Having komutu yalnizca group by komutu ile kullanilir.
--Eger gruplamadan sonra bir sart varsa having komutu kullanilir.
--Where kullanimi ile ayni mantikta calisir.


--Her sirketin min maaslarini 2000den buyukse goster
SELECT sirket, MIN(maas) AS en_az_maas FROM personel 
GROUP BY sirket HAVING MIN(maas)>2000;

--Her sirketin MIN  maaslarini eger 4000’den buyukse goster
SELECT sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren kodu yaziniz..

SELECT isim,sum(maas) FROM personel
GROUP BY isim 
HAVING sum(maas)>10000

--Eger bir sehirde calisan personel sayisi 1den cok ise sehir ismini ve personel sayisini vern sorguyu yaziniz

SELECT sehir, COUNT (isim) as toplam_personel_sayisi FROM personel 
GROUP BY sehir 
HAVING count(isim)>1

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

SELECT sehir, MAX(maas) FROM personel
GROUP BY sehir
HAVING MAX (maas)<5000;

-----------------------------------------------------------------------------------------------

--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir.

-- Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

SELECT isim,maas FROM personel WHERE maas>4000
UNION
SELECT sehir,maas FROM personel WHERE maas>5000;


--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz

SELECT isim as isim_ve_sehir ,maas FROM personel WHERE isim = 'Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir='Istanbul'
ORDER BY maas DESC

-----------------------------------------------------------------------------------------------------------
-- 								UNION OPERATOR
-- 						2 Tablodan Data Birlestirme

CREATE TABLE personel1
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

SELECT sehir as sehir_ve_tel ,maas as maas_ve_cocuksayisi FROM personel1 WHERE id=123456789
UNION
SELECT tel,cocuk_sayisi FROM personel_bilgi WHERE id=123456789

---------------------------------------------------------------------------------------------------------

--                         UNION ALL
/*
union tekrarli verileri teke dusurur ve bize o sekilde sonuc verir
union all ise tekrarli verilerle birlikte tum sorgulari getiri
*/
/*UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir. UNION ALL ise tekrarli elemanlari, 
tekrar sayisinca yazar.*/


--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel1 WHERE maas<5000
UNION ALL
SELECT isim,maas FROM personel1 WHERE maas<5000

---------------------------------------------------------------------------------------------------------

--INTERSECT (KESISIM)
/*
Farkli iki tablodaki ortak verileri INTERSECT komutu ile getiririz.
*/

-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir

--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

SELECT id FROM personel1 WHERE sehir IN ('Istanbul' , 'Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
 
SELECT isim FROM personel1 WHERE sirket = 'Honda'
INTERSECT
SELECT isim FROM personel1 WHERE sirket = 'Ford'
INTERSECT
SELECT isim FROM personel1 WHERE sirket = 'Tofas'

-------EX
/*
Iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir
*/

--5000den az maas alip Honda da calismayanalri yazdirin

SELECT isim,sirket FROM personel1 WHERE maas<5000
EXCEPT
SELECT isim,sirket FROM personel1 WHERE sirket = 'HONDA'