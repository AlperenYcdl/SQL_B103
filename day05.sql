CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk ', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk ', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

delete from personel

select * from personel 

-- Isme gore toplam maaslari bulun
SELECT isim,sum(maas) FROM personel
GROUP BY isim

--Personel tablosundaki isimleri gruplandirin.
SELECT isim, count(sehir) FROM personel
GROUP BY isim

--Sehre gore personel sayisini bulun
SELECT sehir, count(isim) FROM personel
GROUP BY sehir
---------------------------------------------------------------------------------
--                                  HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
--Her sirketin min maaslarini 2000den buyukse goster
SELECT sirket, MIN(maas) AS en_az_maas FROM personel 
GROUP BY sirket HAVING MIN(maas)>2000;