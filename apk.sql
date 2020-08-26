-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 26, 2020 at 02:58 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apk`
--

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_siswa`
--

CREATE TABLE `jawaban_siswa` (
  `id` int(11) NOT NULL,
  `no_soal` int(3) NOT NULL,
  `kd_jawab` varchar(11) NOT NULL,
  `jawaban` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kompetensi`
--

CREATE TABLE `kompetensi` (
  `kode_kompetensi` varchar(11) NOT NULL,
  `nama` text NOT NULL,
  `url_kompetensi` text NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kompetensi`
--

INSERT INTO `kompetensi` (`kode_kompetensi`, `nama`, `url_kompetensi`, `tanggal_upload`) VALUES
('uk_mat1', 'Uji Kompetensi Matematika 1', '\\doc\\KOMPETENSI.pdf', '2020-08-23 21:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `kode_materi` varchar(11) NOT NULL,
  `nama` text NOT NULL,
  `url_materi` text NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`kode_materi`, `nama`, `url_materi`, `tanggal_upload`) VALUES
('materi_mat1', 'Matematika satu', '\\doc\\materi pecahan.pdf', '2020-08-23 21:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `pk_jawab`
--

CREATE TABLE `pk_jawab` (
  `kd_jawab` varchar(11) NOT NULL,
  `kd_soal` varchar(11) NOT NULL,
  `tanggal_jawab` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `kode_soal` varchar(11) NOT NULL,
  `mapel` varchar(25) NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`kode_soal`, `mapel`, `tanggal_upload`) VALUES
('mat1', 'Matematika', '2020-08-24 22:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `soal_evaluasi`
--

CREATE TABLE `soal_evaluasi` (
  `no_soal` int(11) NOT NULL,
  `txt_soal` text NOT NULL,
  `a` text NOT NULL,
  `b` text NOT NULL,
  `c` text NOT NULL,
  `d` text NOT NULL,
  `kunci_jawaban` char(1) DEFAULT NULL,
  `kode_soal` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal_evaluasi`
--

INSERT INTO `soal_evaluasi` (`no_soal`, `txt_soal`, `a`, `b`, `c`, `d`, `kunci_jawaban`, `kode_soal`) VALUES
(1, 'Satu bambu dipotong menjadi 5 bagian sama panjang. Setiap bagian dari bambu itu nilainya . . ', '1/3', '1/4', '1/5', '1/6', NULL, 'mat1'),
(2, 'Ibu membeli 3/4 kg tepung terigu. Seperempat kilogram tepung terigu sudah digunakan untuk membuat kue. Sisa tepung terigu ibu sekarang ada . . .  kg', '1/4', '1/2', '3/4', '1', NULL, 'mat1'),
(3, 'Raihan mempunyai pita 7/8 meter. Untuk membuat kerajinan 3/8 meter. Sisa pita Raihan ada . . . meter', '3/8', '4/8', '5/8', '7/8', NULL, 'mat1'),
(4, 'Jarak rumah Fuad ke sekolah 5/10  km. Fuad bereangkat ke sekolah dengan bersepeda, dan ia sudah menempuh jarak 2/10 km. Jarak yang masih harus ditempuh Fuad untuk sampai ke sekolah adalah . . . km', '2/10', '3/10', '4/10', '5/10', NULL, 'mat1'),
(5, 'Bu Santi membeli 1/2 kg tepung terigu, 2,5 kg beras dan 1 1/4 kg telur. Total  berat belanjaan Bu Santi adalah ….', '4,20 kg', '3,75 kg', '4,25 kg', '5,5 kg', NULL, 'mat1'),
(6, 'Andi membuat tongkat sepanjang 1 1/2 meter dan Santoso membuat tongkat sepanjang 2 1/4 meter. Total panjang tongkat mereka berdua adalah …. Meter', '3 1/4', '3 1/2', '3 3/4', '3 2/4', NULL, 'mat1'),
(7, 'Dini mempunyai pita sepanjang 1/3 meter, Siska sepanjang 4/10 meter dan Rani sepanjang 3/4 meter. Maka dari hal tersebut dapat diketahui bahwa ….', 'Pita Dini paling panjang', 'Siswa yang paling pendek', 'Pita Dini lebih panjang dari pita Siska', 'Pita Rani paling panjang', NULL, 'mat1'),
(8, 'Bagas membelah semangka menjadi 8 bagian. Bagas kemudian memakan dua bagian semangka. Maka nilai semangka yang dimakan bagas jika ditulis dalam bentuk pecahan adalah ….', '1/2', '8/2', '2/8', '2/3', NULL, 'mat1'),
(9, 'Bu Yuni membeli 9 butir telur. Ternyata sampai dirumah pecah 1 butuir telur. Banyak telur yang pecah ada . . . butir telur. ', '4/9', '3/9', '2/9', '1/9', NULL, 'mat1'),
(10, 'Pak Joko memotong sebuah kayu panjang menjadi 10 bagian sama panjang. Empat potong kayu sudah ia gunakan untuk membuat kursi. Berapa bagian sisa kayu milik Pak Joko ? ', '2/5', '3/5', '7/10', '4/5', NULL, 'mat1');

-- --------------------------------------------------------

--
-- Table structure for table `soal_latihan`
--

CREATE TABLE `soal_latihan` (
  `no_soal` int(1) NOT NULL,
  `txt_soal` text NOT NULL,
  `kode_soal` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal_latihan`
--

INSERT INTO `soal_latihan` (`no_soal`, `txt_soal`, `kode_soal`) VALUES
(1, 'Ahmad memiliki tali sepanjang 7/8  m. Kemudian tali tersebut dipotong 3/7  m, maka sisa tali Ahmad ?', 'mat1'),
(2, 'Pak Karyo memiliki 11/4  m tali. Tali itu diberikan kepada ayah 6/5 m dan sisanya diberikan kepada kakak. Panjang tali yang diterima kakak ?', 'mat1'),
(3, 'Ayah memiliki tali sepanjang 23/4 m. Dipakai ayah untuk membuat jemuran sepanjang 17/5  m. Sisa tali ayah ?', 'mat1'),
(4, 'Kakak memiliki pita merah  9/5 m dan pita putih 5/6  m. Pita-pita tersebut akan diberikan kepada Nugie sepanjang 12/10 m. Sisa pita kakak ?', 'mat1'),
(5, 'Pak Surip memiliki tanah yang luasnya 5 hektar. 1 2/3 hektar ditanami jagung, 1 1/6 hektar ditanami padi, dan sisanya ditanami kedelai. Berapa hektar tanah yang ditanami kedelai....', 'mat1'),
(6, 'Bening memiliki pita sepanjang 2/3  m. Bening membeli lagi pita sepanjang 5/4 m. Panjang pita Bening sekarang ?', 'mat1'),
(7, 'Di dalam keranjang terdapat 7/2 kg beras.  3/4 kg garam dan 7/4  kg gula. Berat seluruh belanjaan ibu ?', 'mat1'),
(8, 'Ibu berbelanja di pasar membeli 1/4 kg bawang merah , 1/4 kg bawang putih, 1/2 kg dan 4/5 kg minyak goreng. Berat seluruh belanjaan ibu adalah ...', 'mat1'),
(9, 'Pak Harjo berkeinginan mengganti talang rumah. Untuk bagian depan rumah, talang yang diperlukan 5 ¼ meter, sedangkan untuk dapur 3 3/8 meter, padahal Pak Harjo baru mempunyai talang 4 ½ meter. Berapa meter talang yang harus dibeli Pak Harjo agar dapat mengganti seluruh talang rumahnya...', 'mat1'),
(10, 'Ibu mempunyai persediaan mentega sebanyak 2/3 kg. karena Adik ingin roti buatan ibu, maka ibu membuatkannya. Untuk membuat roti diperlukan 1/3 mentega. Supaya tidak kehabisan mentega, Ibu membeli lagi ¼ kg untuk persediaan. Berapa kg mentega yang dimiliki Ibu sekarang....', 'mat1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_jawab` (`kd_jawab`);

--
-- Indexes for table `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD PRIMARY KEY (`kode_kompetensi`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`kode_materi`);

--
-- Indexes for table `pk_jawab`
--
ALTER TABLE `pk_jawab`
  ADD PRIMARY KEY (`kd_jawab`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`kode_soal`);

--
-- Indexes for table `soal_evaluasi`
--
ALTER TABLE `soal_evaluasi`
  ADD PRIMARY KEY (`no_soal`);

--
-- Indexes for table `soal_latihan`
--
ALTER TABLE `soal_latihan`
  ADD KEY `kode_soal` (`kode_soal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
