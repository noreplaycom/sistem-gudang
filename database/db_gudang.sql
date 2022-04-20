/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ db_gudang /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE db_gudang;

DROP TABLE IF EXISTS agamas;
CREATE TABLE `agamas` (
  `id_agama` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_agama` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_agama`),
  KEY `id_agama` (`id_agama`),
  KEY `id_agama_2` (`id_agama`),
  KEY `id_agama_3` (`id_agama`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id_kategori` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS employees;
CREATE TABLE `employees` (
  `id_karyawan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sap` char(7) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `id_gender` int(10) unsigned NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tgl_daftar` date NOT NULL,
  `id_agama` int(10) unsigned DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`),
  KEY `id_pasien` (`id_karyawan`),
  KEY `id_pasien_2` (`id_karyawan`),
  KEY `id_agama` (`id_agama`),
  KEY `id_agama_2` (`id_agama`),
  KEY `id_gender` (`id_gender`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `agamas` (`id_agama`) ON UPDATE CASCADE,
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `genders` (`id_gender`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS genders;
CREATE TABLE `genders` (
  `id_gender` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_gender` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_resets;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS products;
CREATE TABLE `products` (
  `id_produk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `id_kategori` int(10) unsigned NOT NULL,
  `image` varchar(100) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `id_unit` int(10) unsigned NOT NULL,
  `id_supplier` int(10) unsigned NOT NULL,
  `lokasi` varchar(200) NOT NULL,
  `ket_produk` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produk`),
  KEY `id_produk` (`id_produk`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_unit` (`id_unit`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `categories` (`id_kategori`) ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id_unit`) ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS purchases;
CREATE TABLE `purchases` (
  `id_purchase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_purchase` date NOT NULL,
  `id_produk` int(10) unsigned NOT NULL,
  `qty_purchase` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_purchase`),
  KEY `id_purchase` (`id_purchase`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `products` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS sells;
CREATE TABLE `sells` (
  `id_sell` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_sell` date NOT NULL,
  `id_karyawan` int(10) unsigned NOT NULL,
  `id_produk` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_sell`),
  KEY `id_sell` (`id_sell`),
  KEY `id_karyawan` (`id_karyawan`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `employees` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `products` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE `suppliers` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(100) NOT NULL,
  `cp` varchar(100) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `telp_supplier` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_supplier`),
  KEY `id_supplier` (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS units;
CREATE TABLE `units` (
  `id_unit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_unit` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_unit`),
  KEY `id_unit` (`id_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akses` enum('admin','operator') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'operator',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO agamas(id_agama,nama_agama,created_at,updated_at) VALUES(1,'Islam','2019-03-22 15:42:30','2019-03-22 15:42:30'),(2,'Kristen','2019-03-22 15:42:49','2019-03-22 15:42:49'),(3,'Katolik','2019-03-22 15:42:57','2019-03-22 15:42:57'),(4,'Hindu','2019-03-22 15:43:06','2019-03-22 15:43:06'),(7,'Budha','2019-11-19 13:32:08','2019-11-19 13:35:07');

INSERT INTO categories(id_kategori,nama_kategori,created_at,updated_at) VALUES(1,'Grad B','2019-11-27 19:51:39','2020-01-06 06:27:35'),(2,'Kategori 2','2019-11-27 19:51:39',NULL),(4,'Grad A','2019-11-28 09:26:40','2020-01-06 06:25:34'),(5,'Kategori 4','2020-01-06 06:13:58','2020-01-06 06:13:58');

INSERT INTO employees(id_karyawan,sap,nama_karyawan,id_gender,tgl_lahir,tgl_daftar,id_agama,alamat,telp,created_at,updated_at) VALUES(9,'1234567','Karyawan A',1,'1980-09-23','2009-11-18',1,'Jl. Indah Kasih','08123123','2019-11-18 10:26:05','2019-11-18 22:30:19'),(12,'0987654','Karyawan E',1,'1980-10-10','2000-11-18',1,'Jn. Permai','0567654343','2019-11-18 14:01:38','2019-11-18 14:01:38'),(13,'1102233','Karyawan D',3,'1988-09-23','2009-11-28',1,'Jl. 1','08435654767','2019-11-28 09:19:52','2020-01-03 23:10:19'),(14,'4538276','Karyawan H',1,'1987-09-10','2000-01-03',3,'Jl. Satu','556455656567','2020-01-03 22:59:27','2020-01-03 22:59:27');

INSERT INTO genders(id_gender,nama_gender,created_at,updated_at) VALUES(1,'Laki-laki','2019-03-22 16:38:24','2019-03-22 16:38:24'),(3,'Perempuan','2019-11-19 13:18:02','2019-11-19 13:26:48');

INSERT INTO migrations(id,migration,batch) VALUES(1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);

INSERT INTO password_resets(email,token,created_at) VALUES('arif@contoh.com','$2y$10$teDGfASs9BQExEzZkCf/OOoMBeOMYIlbwfHUzyVKNEg2NECzNIxyC','2019-08-26 07:41:24');

INSERT INTO products(id_produk,kode_produk,nama_produk,id_kategori,image,stok_produk,id_unit,id_supplier,lokasi,ket_produk,created_at,updated_at) VALUES(1,'MH009','Metal Ring',1,'1577107585.jpg',21,3,1,'rak 4, kolom12',X'466c616d61626c65','2019-12-23 20:26:25','2019-12-23 20:26:25'),(4,'MM001','A3 SIDU',2,'1578270970.jpg',30,3,1,'rak 5, kolom 1',X'557267656e74','2020-01-06 07:36:10','2020-01-06 07:36:10');

INSERT INTO purchases(id_purchase,tgl_purchase,id_produk,qty_purchase,status,created_at,updated_at) VALUES(5,'2020-01-06',4,15,1,'2020-01-06 12:09:57','2020-01-06 12:11:30'),(7,'2020-01-06',4,10,1,'2020-01-06 13:49:18','2020-01-06 13:49:21'),(8,'2022-02-03',1,1,0,'2022-02-03 16:25:23','2022-02-03 16:25:23'),(9,'2022-02-25',4,2,0,'2022-02-03 16:25:29','2022-02-03 16:25:29');

INSERT INTO sells(id_sell,tgl_sell,id_karyawan,id_produk,qty,status,created_at,updated_at) VALUES(1,'2019-12-23',9,1,2,1,'2019-12-23 20:27:42','2019-12-23 20:28:09'),(3,'2020-01-06',9,4,3,1,'2020-01-06 11:34:45','2020-01-06 11:42:18'),(4,'2020-01-06',9,4,4,0,'2020-01-06 13:39:19','2020-01-06 13:39:19');

INSERT INTO suppliers(id_supplier,nama_supplier,cp,alamat_supplier,telp_supplier,created_at,updated_at) VALUES(1,'Supplier 1','Joko',X'50616c656d62616e67','081232435436','2019-11-28 10:14:50','2019-11-28 10:27:22'),(4,'Supplier 4','Bari',X'4a616b61626172696e67','067677987987','2020-01-04 23:34:10','2020-01-04 23:34:10');

INSERT INTO units(id_unit,nama_unit,created_at,updated_at) VALUES(1,'kg','2019-11-28 21:30:50','2019-11-28 21:30:50'),(3,'piece','2019-11-28 21:31:53','2019-11-28 21:31:53');
INSERT INTO users(id,name,username,email,akses,password,remember_token,created_at,updated_at) VALUES(4,'Administrator','admin','admin@contoh.com','admin','$2y$10$MnTwLh0DfW8NYyfF.eMaKelqZZkQpq4/RtW.2I.XU3aoOdlExVyDO','RY6NN1eTa5zHu9YVhLqmFR6iEEheV3ee1NpKJvGYfC9RYLFyuEL4WIF1AcAL','2019-03-27 16:18:02','2019-11-28 09:18:04'),(8,'M Siddik','siddik','siddik@contoh.com','operator','$2y$10$Z0c.v7qIqwQzHK.CZRR.t.i39bJDF5qXJpLIVqv.tgr3CwvoLwwNa',NULL,'2020-01-06 09:39:05','2020-01-06 09:39:05');

DROP TRIGGER IF EXISTS barang_masuk;
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `purchases` FOR EACH ROW BEGIN
	UPDATE products SET stok_produk = stok_produk+NEW.qty_purchase
    WHERE id_produk = NEW.id_produk;
END;

DROP TRIGGER IF EXISTS cancel_purchase;
CREATE TRIGGER `cancel_purchase` AFTER DELETE ON `purchases` FOR EACH ROW BEGIN
	UPDATE products SET stok_produk = products.stok_produk - OLD.qty_purchase
	WHERE id_produk = OLD.id_produk;
END;

DROP TRIGGER IF EXISTS pengambilan;
CREATE TRIGGER `pengambilan` AFTER INSERT ON `sells` FOR EACH ROW BEGIN
	UPDATE products SET stok_produk = stok_produk-NEW.qty
    WHERE id_produk = NEW.id_produk;
END;

DROP TRIGGER IF EXISTS cancel_sell;
CREATE TRIGGER `cancel_sell` AFTER DELETE ON `sells` FOR EACH ROW BEGIN
	UPDATE products SET stok_produk = products.stok_produk + OLD.qty
	WHERE id_produk = OLD.id_produk;
END;