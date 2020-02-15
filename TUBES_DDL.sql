CREATE table DOKTER
(kd_dokter varchar(100) not null, nama_dokter varchar(100), alamat_dokter varchar(100),
spesialis_dokter varchar(20),
constraint kd_dokter primary key(kd_dokter));

CREATE table ruang
(kd_ruang varchar(20) not null, nama_ruang varchar(20), nama_gedung varchar(20),
constraint kd_ruang primary key(kd_ruang));

CREATE table petugas
(id_petugas varchar(20) not null, nama_petugas varchar(20), alamat_petugas varchar(20),
jam_jaga timestamp,
constraint id_petugas primary key(id_petugas));

CREATE table pembayaran
(kd_pembayaran varchar(20) not null, id_petugas varchar(20), id_pasien varchar(20),
jumlah_harga INT,
constraint kd_pembayaran primary key(kd_pembayaran));

CREATE table pasien
(id_pasien varchar(20) not null, nama_pasien varchar(100), alamat_pasien varchar(100),
tanggal_datang date, keluhan varchar(1000),kd_dokter varchar(100),
constraint id_pasien primary key(id_pasien));

CREATE table rawat_inap
(id_rawatinap varchar(20) not null, kd_ruang varchar(20), id_pasien varchar(20),
constraint id_rawatinap primary key(id_rawatinap));

ALTER TABLE rawat_inap ADD CONSTRAINT inap_pasien_FK FOREIGN KEY ( id_pasien ) REFERENCES pasien ( id_pasien ) ;
ALTER TABLE rawat_inap ADD CONSTRAINT ruang_inap_FK FOREIGN KEY ( kd_ruang ) REFERENCES ruang ( kd_ruang ) ;
ALTER TABLE pasien ADD CONSTRAINT pasien_dokter_FK FOREIGN KEY ( kd_dokter ) REFERENCES dokter ( kd_dokter ) ;
ALTER TABLE pembayaran ADD CONSTRAINT bayar_pasien_FK FOREIGN KEY ( id_pasien ) REFERENCES pasien ( id_pasien ) ;
ALTER TABLE pembayaran ADD CONSTRAINT bayar_petugas_FK FOREIGN KEY ( id_petugas ) REFERENCES petugas ( id_petugas ) ;
ALTER TABLE petugas MODIFY jam_jaga VARCHAR(20);

