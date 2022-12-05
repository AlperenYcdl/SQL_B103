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

--Ismi 'Mustafa Bak' ve 'Nesibe Yilmaz' olan kayitlari silelim.

DELETE FROM ogrenciler10 WHERE isim='Mustafa Bak' or isim= 'Nesibe Yilmaz';


--Veli ismi Hasan olan datayi silelim

DELETE FROM ogrenciler10 WHERE veli_isim='Hasan';

-- TRUNCATE --
-- Bir tablodaki tüm verileri geri alamayacagimiz sekilde siler. Sartli silme yapmaz

TRUNCATE TABLE ogrenciler10


-- ON DELETE CASCADE
DROP TABLE if exists adresler --Eger tablo varsa tabloyu siler 


CREATE TABLE talebeler2
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar2
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler2(id))
on delete cascade -- direk parent i silersen child class i da silmek icin.
);

INSERT INTO talebeler2 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler2 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler2 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler2 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler2 VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar2 VALUES ('123','kimya',75);
INSERT INTO notlar2 VALUES ('124', 'fizik',65);
INSERT INTO notlar2 VALUES ('125', 'tarih',90);
INSERT INTO notlar2 VALUES ('126', 'Matematik',90);

select * from talebeler2;
select * from notlar2;



-- Notlar tablosundan talebeler_id'si 123 olan datayı silelim

DELETE FROM notlar WHERE talebe_id='123';

--Talebeler tablosundan id'si 126 olan datayi silelim.

delete FROM talebeler2 WHERE id='126';

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);


INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe;
select * from not1;

--Talebeler tablosundan id'si 126 olan datayi silelim.

DELETE FROM talebe WHERE id='126'

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
	parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
	data child tablo dan da silinir
*/



