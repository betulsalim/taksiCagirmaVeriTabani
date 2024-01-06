Use uygulama;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


/*Taksi Çağırma Uygulaması*/

/*Öncelikle Musteri tablosu oluştur*/

CREATE TABLE `Musteri`(
`MusteriKayit_id`INT PRIMARY KEY NOT NULL,
`Musteri_ad` char(20) NOT NULL,
`Musteri_soyad` char(20) NOT NULL,
`Musteri_mail` varChar(30) UNIQUE KEY  NOT NULL,
`MusteriAdres_id` INT  NOT NULL,
`GidilecekAdres_id` INT  NOT NULL,
`MusteriTelefon_id`INT    NOT NULL,
`TaksiCesidi_id` varChar(30) NOT NULL,
FOREIGN KEY (TaksiCesidi_id) REFERENCES Taksi_cesidi(TaksiCesidi_id),
 FOREIGN KEY (MusteriAdres_id) REFERENCES Musteri_adres(MusteriAdres_id),
  FOREIGN KEY (GidilecekAdres_id) REFERENCES Gidilecek_adres(GidilecekAdres_id)
);


INSERT INTO `Musteri` (`MusteriKayit_id` , `Musteri_ad` , `Musteri_soyad` , `Musteri_mail`,`MusteriTelefon_id` , `MusteriAdres_id` , `GidilecekAdres_id` , `TaksiCesidi_id`) VALUES
(1 , 'Salih' , 'Yaman' , 'salihyaman@gmail.com' , 5, 1 , 1 ,  'turkuazTaksi'),
(2 , 'İbrahim' , 'Okan' , 'ibrahimokan@gmail.com' , 4 , 2 , 3 , 'sarıTaksi'),
(3 , 'Nesrin' , 'Sarı' , 'nesrinsari@gmail.com' , 3 , 3, 2, 'buyukTaksi') ,
(4 , 'Burak' , 'Derin' , 'burakderin@gmail.com' , 2 , 4 , 4 , 'turkuazTaksi'),
(5 , 'Betül' , 'Naz' , 'betulnaz@gmail.com' , 1 , 5 , 5 , 'sarıTaksi');


CREATE TABLE `Gidilecek_adres`(
`GidilecekAdres_id` INT PRIMARY KEY,
`Gidilecek_adres` varChar(100) NOT NULL
);

INSERT INTO `Gidilecek_adres` (`GidilecekAdres_id` , `Gidilecek_adres`) VALUES
(1 , 'beyoğlu/istanbul'),
(2 , 'üsküdar/istanbul'),
(3 , 'gebze'),
(4 , 'fatih/istanbul'),
(5 ,  'avcılar/istanbul' );

CREATE TABLE `Musteri_adres`(
`MusteriAdres_id` INT PRIMARY KEY NOT NULL,
`Musteri_adres` varChar(100) NOT NULL
);

INSERT INTO `Musteri_adres`(`MusteriAdres_id` , `Musteri_adres`) VALUES
(1,'gaziosmanpaşa/istanbul' ),
(2, 'maslak/istanbul' ),
(3,'esenyurt/istanbul'  ),
(4,'bahçelievler/istanbul' ),
(5, 'küçükköy/istanbul' );


CREATE TABLE `MusteriTelefonNo`(
`MusteriTelefon_id` INT PRIMARY KEY,
`MusteriTelefon_no` FLOAT NOT NULL 
);

INSERT INTO `MusteriTelefonNo` (`MusteriTelefon_id` , `MusteriTelefon_no`) VALUES
(1, 5123456789),
(2, 5234567890),
(3, 5345678901),
(4 , 5456789012),
(5 , 5678901234);



CREATE TABLE `Surucu`(
`MusteriKayit_id` INT NOT NULL,
`SurucuKayit_id` INT PRIMARY KEY NOT NULL,
`Surucu_ad` char(20) NOT  NULL,
`Surucu_soyad` char(20) NOT  NULL,
`MusteriAdres_id` INT NOT NULL,
`GidilecekAdres_id` INT NOT NULL,
`SurucuTelefon_no` FLOAT NOT NULL,
`MusteriTelefon_id` INT NOT NULL,
`TaksiCesidi_id` varChar(30) NOT NULL,
FOREIGN KEY (MusteriKayit_id) REFERENCES Musteri(MusteriKayit_id),
FOREIGN KEY (MusteriTelefon_id) REFERENCES MusteriTelefonNo(MusteriTelefon_id),
FOREIGN KEY (MusteriAdres_id) REFERENCES Musteri_adres(MusteriAdres_id),
FOREIGN KEY (TaksiCesidi_id) REFERENCES Taksi_cesidi(TaksiCesidi_id),
FOREIGN KEY (GidilecekAdres_id)  REFERENCES Gidilecek_adres(GidilecekAdres_id)
) ;


INSERT INTO `Surucu`(`MusteriKayit_id`,`SurucuKayit_id` , `Surucu_ad` , `Surucu_soyad` , `MusteriAdres_id`, `GidilecekAdres_id`, `SurucuTelefon_no` , `MusteriTelefon_id`, `TaksiCesidi_id`) VALUES
(1,1 , 'Fatih' , 'Solmaz' , 1 , 1 , 5556669988 ,  5 , 'turkuazTaksi' ),
(2,2 , 'Selim' , 'Gece' , 2  , 3 ,5446667878 ,4, 'sarıTaksi'),
(3,3 , 'Mahmut' , 'Us' ,3  , 2, 5556667777,3,'buyukTaksi') ,
(4,4 , 'Mehmet' , 'Salih' ,4  , 4 ,5346267908,2, 'turkuazTaksi'),
(5,5 , 'Oğuz' , 'Ekin' ,  5   , 5 , 5512134455,1,'sarıTaksi');


 CREATE TABLE `KayitliAdresler`(
 `KayitliAdresler_id` INT PRIMARY KEY NOT NULL,
 `MusteriKayit_id` INT NOT NULL,
 `MusteriAdres_id` INT NOT NULL,
 `GidilecekAdres_id` INT NOT NULL,
 FOREIGN KEY (MusteriKayit_id) REFERENCES Musteri( MusteriKayit_id),
 FOREIGN KEY (MusteriAdres_id) REFERENCES Musteri_adres(MusteriAdres_id),
 FOREIGN KEY (GidilecekAdres_id) REFERENCES Gidilecek_adres(GidilecekAdres_id)
  );
 
 INSERT INTO `KayitliAdresler` (`Kayitliadresler_id` ,`MusteriKayit_id`, `MusteriAdres_id` , `GidilecekAdres_id`) VALUES
 (1 ,1,1 , 1),
 (2, 2,2   , 3),
(3 ,3,3   , 2 ) ,
(4  ,4,4  , 4),
(5,  5,5   , 5 );
 

 
CREATE TABLE `Taksi_cesidi`(
`TaksiCesidi_id` varChar(30) PRIMARY KEY NOT NULL );


INSERT INTO `Taksi_cesidi`(`TaksiCesidi_id`) VALUES
('TurkuazTaksi') ,
('sarıTaksi') , 
('buyukTaksi');

#BÜTÜN VERİLERİ LİSTELEYELİM

SELECT * FROM `Musteri` , `Gidilecek_adres`, `Musteri_adres`, `MusteriTelefonNo` , `Surucu` , `KayitliAdresler`;

#Müşterilerin verilerini listeleyelim

SELECT * FROM `Musteri`;

#Sürücülerin verilerini listeleyelim

SELECT * FROM `Surucu`;

#Şimdi müşteriler ve bulundukları adresleri sıralayalım

SELECT m.Musteri_ad ,m.Musteri_soyad , ma.Musteri_adres FROM musteri m LEFT OUTER JOIN musteri_adres ma ON m.MusteriKayit_id=ma.MusteriAdres_id;

#Şimdi müşteriler ve gidecekleri adresleri listeleyelim

SELECT m.Musteri_ad ,m.Musteri_soyad , ga.gidilecek_adres FROM musteri m LEFT OUTER JOIN gidilecek_adres ga ON m.MusteriKayit_id=ga.GidilecekAdres_id;



#Şimdi müşterilerin gidecekleri yerlere göre hangi sürücülerle gideceklerini görelim
SELECT  ga.gidilecek_adres , s.surucu_ad , s.Surucu_soyad FROM  gidilecek_adres ga LEFT OUTER JOIN  surucu s ON ga.GidilecekAdres_id=s.SurucuKayit_id;


#Şimdi gidilecek adrese göre müşterileri ve sürücüleri bulalım
SELECT  m.Musteri_ad , m.Musteri_soyad , s.surucu_ad , s.Surucu_soyad FROM  musteri m LEFT OUTER JOIN  surucu s ON m.MusteriKayit_id=s.SurucuKayit_id;


