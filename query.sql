-- membuat database
CREATE DATABASE kantor;

-- menghapus database
DROP DATABASE kantor;

-- one to one

-- buat tabel karyawan & divisi
CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY,
    nama VARCHAR(255),
    lulusan VARCHAR(255),
    id_divisi INT,
    FOREIGN KEY (id_divisi) REFERENCES divisi(id_divisi)
);

CREATE TABLE divisi (
    id_divisi INT PRIMARY KEY,
    nama VARCHAR(255)
);

-- memasukkan data ke dalam tabel
INSERT INTO divisi(id_divisi,nama)
VALUES (1,'Data Scientist'),
(2,'Web Developer'),
(3,'Quality Assurance');

INSERT INTO karyawan(id_karyawan,nama,lulusan,id_divisi)
VALUES (1,'Michael','Sarjana Arsitektur',3),
(2,'Jhonson','Sarjana Komputer',2),
(3,'Mikaela','Sarjana Komputer',1);

-- tampilkan data di dalam tabel (semua)
SELECT * FROM karyawan;

-- tampilkan data di dalam tabel (spesifik)
SELECT * from karyawan WHERE id_divisi = 1;

SELECT name from divisi WHERE id_divisi = 3;

-- update data di dalam tabel
UPDATE karyawan SET
nama = 'Susilowati',
lulusan = 'SMK'
WHERE id_karyawan = 3;

-- hapus data di dalam tabel
DELETE FROM karyawan WHERE id_karyawan = 3;

-- one to many

-- buat tabel penjual & produk
CREATE TABLE penjual (
    id_penjual INT PRIMARY KEY,
    nama_toko VARCHAR(255),
    alamat VARCHAR(255),
    no_hp VARCHAR(255)
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama VARCHAR(255),
    kategori VARCHAR(255),
    stok INT,
    id_penjual INT,
    FOREIGN KEY (id_penjual) REFERENCES penjual(id_penjual)
);

-- memasukkan data ke dalam tabel
INSERT INTO penjual(id_penjual,nama_toko,alamat,no_hp)
VALUES (1,'YohanShop','Bandung','021'),
(2,'Yohan Store','Manado','089'),
(3,'MR.BeastFeast','Bogor','923');

INSERT INTO produk(id_produk,nama,kategori,stok,id_penjual)
VALUES (1,'Baju Hitam','Baju',5,1),
(2,'Baju Panjang Merah','Baju',5,1),
(3,'Rolex','Jam Tangan',2,2),
(4,'Casio','Jam Tangan',4,2),
(5,'Tuxedo','Jas',7,3);

-- tampilkan data di dalam tabel (semua)
SELECT * FROM produk;

-- tampilkan data di dalam tabel (spesifik)
SELECT * from produk WHERE kategori = 'baju';

SELECT * from produk WHERE id_penjual = 3;

-- update data di dalam tabel
UPDATE produk SET
nama = 'Casio',
kategori = 'Jam Tangan',
stok = 0
WHERE id_produk = 4;

UPDATE penjual SET
nama_toko = 'YohaneShop',
alamat = 'Bandung',
no_hp = '120'
WHERE id_penjual = 1;
-- hapus data di dalam tabel
DELETE FROM produk WHERE id_produk = 4;