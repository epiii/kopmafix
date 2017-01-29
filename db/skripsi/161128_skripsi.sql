/*
Navicat MySQL Data Transfer

Source Server         : lumba_lumba
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : skripsi2

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-28 23:18:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `blokir` enum('N','Y') NOT NULL DEFAULT 'N',
  `foto` text NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', 'nama admin1', '0457934857', 'N', 'foto1.jpg');
INSERT INTO `admin` VALUES ('2', '2', 'nama admin2', '0317878', 'N', 'foto2.jpg');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'redaksi@bukulokomedia.com', '08238923848', 'admin', 'N');

-- ----------------------------
-- Table structure for artikel
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id_artikel` int(5) NOT NULL AUTO_INCREMENT,
  `id_label` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `judul_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `headline` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `isi_artikel` text COLLATE latin1_general_ci NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT '1',
  `tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_artikel`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of artikel
-- ----------------------------
INSERT INTO `artikel` VALUES ('69', '22', 'admin', 'Gelombang Solidaritas untuk Palestina', 'gelombang-solidaritas-untuk-palestina', 'Y', 'Serangan Israel kepada Palestina yang terjadi mulai akhir Desember 2008 silam telah menewaskan hampir seribu nyawa manusia. Warga sipil yang kebanyakan perempuan dan anak-anak menjadi korban keganasan tentara Israel. Warga dunia pun marah. Saat ini, hampir setiap hari sejumlah unjuk rasa mengecam kebiadaban Israel terjadi di seluruh belahan dunia. Kejahatan Israel adalah kejahatan kemanusiaan dan sudah menjadi isu bersama umat manusia.<br><br>Kecaman tidak hanya datang dari umat Islam, tapi juga dari umat agama lain. Lihat saja sejumlah biksu yang tergabung dalam Perwakilan Umat Buddha Indonesia (Walubi), kemudian Persatuan Tionghoa Indonesia serta Dewan Pemuda Kristen Indonesia.<br><br>Mereka semua ikut berpatisipasi dalam aksi solidaritas untuk Palestina yang dilaksanakan di lapangan Monas, Jakarta Ahad (11/1/2009) lalu. Mereka mengutuk kebiadaban Israel. (sumber: sabili.co.id)<br>', 'Sabtu', '2009-01-31', '14:34:18', '11solidaritas.jpg', '12', 'gaza,israel,palestina');
INSERT INTO `artikel` VALUES ('71', '2', 'admin', 'Ronaldo \"CR7\" Pecahkan Transfer Termahal', 'ronaldo-cr7-pecahkan-transfer-termahal', 'Y', 'Cristiano Ronaldo segera menjadi pemain termahal dunia, menumbangkan rekor Zinedine Zidane. Agen Ronaldo menyebut bahwa kliennya terikat pra kontrak 91 juta poundsterling dengan Real Madrid. Dengan transfer senilai Rp 1,5 triliun itu, maka CR7 dipastikan akan menjadi pemain termahal dunia. Tapi, itu mungkin baru terealisasi musim depan alias musim panas nanti.<br><br>Sport melansir bahwa Pemain Terbaik Dunia 2008 itu terikat kontrak dengan Madrid untuk jangka panjang. Bahkan, juga disebutkan bahwa agen Ronaldo, Jorge Mendes, akan terkena klausul penalti (penalty clause) 20 juta euro (18 juta pounds) jika Ronaldo tak hadir di Santiago Bernabeu, musim depan.<br><br>Sebelumnya, pemain berusia 23 tahun ini dikabarkan juga terikat kontrak dengan mantan presiden Madrid, Florentino Perez. Ronaldo akan menjadi alat kampanye Perez dalam pemilihan presiden Madrid, pertengahan Juli 2009.<br><br>Rekor pemain termahal dunia kini masih dipegang Zinedine Zidane dengan 46 juta poundsterling pada 2001. Perez juga menjadi aktor di balik kedatangan maestro asal Prancis itu dari Juventus ke Madrid.<br><br>Demikian juga runner up pemain termahal dunia, Luis Figo. Perez membajaknya dari rival bebuyutan Barcelona pada 2000 dengan nilai 38,7 juta pounds. Saat itu, Figo juga jadi alat kampanye Perez. (sumber: vivanews.com)<br>', 'Sabtu', '2009-01-31', '14:41:25', '97cristiano-ronaldo.jpg', '31', 'sepakbola');
INSERT INTO `artikel` VALUES ('72', '22', 'admin', 'Belajar Dari Krisis Amerika', 'belajar-dari-krisis-amerika', 'Y', 'Ibarat karena nila setitik, rusak susu sebelanga. Dan di kolam susu inilah tampaknya warga dunia tengah menunggu kapan giliran nila itu datang yang akan benar-benar melumpuhkan sendi perekonomian di negaranya masing-masing, tak terkecuali kita di Indonesia.<br><br>Dan kini kita paham bahwa kondisi yang cukup serius kali ini memang awalnya bermula dari krisis nasional di AS, yang kemudian menyebar dengan cepat ke seluruh dunia. Namun jelas bahwa ia bukanlah penyebab utamanya seperti yang dituding oleh sejumlah media (lihat \'Runtuhnya Pusat Kapitalisme\', Editorial Harian Radar Bogor, 27/09/08).<br><br>Yang menjadi benang merah dari rentetan krisis ini justru adalah penerapan globalisasi dimana roda perekonomian banyak negara di dunia digantungkan. Sebab dalam sistem ekonomi global yang tengah dipraktikkan banyak negara saat ini, krisis yang dialami suatu negara akan menular bak virus ke negara-negara lain, khususnya bila krisis itu bermula dari negara-negara maju dan yang punya otoritas dalam peta perkonomian dunia.<br><br>Meski belum memiliki definisi yang mapan, istilah globalisasi banyak dihubungkan dengan peningkatan keterkaitan dan ketergantungan antarbangsa dan antarmanusia di seluruh dunia dunia melalui perdagangan, investasi, perjalanan, budaya populer, dan bentuk-bentuk interaksi yang lain sehingga batas-batas suatu negara menjadi bias (wikipedia.com).<br><br>Di alam globalisasi inilah, kesalingbergantungan antara negara satu dengan negara lain terjalin begitu kuat. Dengan begitu, sebuah negara yang telah maju diharapkan akan merangsang perekonomian negara-negara yang sedang berkembang lewat sistem pasar bebas yang saling terhubung dan kompetitif. Tak heran bila globalisasi dipercaya akan mampu membawa kemaslahatan pada segenap umat manusia di dunia.<br><br>Sebuah niat yang kedengarannya cukup mulia memang. Dan sejak diterapkan pada era 80-an, globalisasi menjadi sistem ekonomi (mencakup juga aspek sosial, budaya, dan komunikasi) yang populer di banyak negara. Tak terkecuali bagi negara kita tercinta yang kala itu berada di bawah rezim Orde Baru.<br><br>Tapi dengan adanya krisis global ini, untuk pertama kalinya kita disadarkan, betapa sistem globalisasi yang tengah dipraktikkan kebanyakan negara saat ini, ternyata juga berpotensi membawa umat manusia pada krisis berkepanjangan. Ditambah lagi betapa globalisasi ekonomi dunia kian hari kita lihat semu dan banal, yakni di mana triliunan dollar AS diperjualbelikan dan dipermainkan di pasar modal, tetapi hanya sebagian saja diantaranya yang benar-benar menyentuh sektor riil.<br><br>Dengan kondisi kesalingterhubungan dan kesalingbergantungan inilah globalisasi ekonomi menciptakan budaya ekonomi sebagai jaringan terbuka (open network) yang rawan terhadap kemacetan di suatu titik jaringan dan serangan virus ke seluruh jaringan. Serangan virus (semisal kemacetan likuiditas) di sebuah titik jaringan (seperti AS) dengan cepat menjalar ke seluruh jejaring global tanpa ada yang tersisa.<br><br>Maka di titik ini pulalah kita sadar betapa Indonesia sebagai salah satu peserta yang turut serta dalam sistem ekonomi global, cukup rentan terkena dampak krisis ini.<br><br>Sejatinya, krisis global ini memang lebih banyak berpengaruh pada industri keuangan, khususnya pasar modal. Ruang gerak pasar modal itu sendiri belum meluas bagi usaha dan bisnis yang dijalankan bagi kebanyakan masyarakat Indonesia.<br><br>Bisa disimak bahwa roda perekonomian di Kota Bogor sendiri lebih banyak digerakkan oleh sektor riil dan usaha kecil menengah (UKM). Kebanyakan dari mereka menjalankan usaha yang tak memiliki persinggungan langsung dengan investor, juga dikerjakan oleh SDM dari dalam negeri sendiri.<br><br>Karenanya, kita selaku warga Bogor patut menjadikan peristiwa krisis global saat ini sebagai momentum dalam mendukung segenap pelaku bisnis dan UKM kota Bogor. Sebab, sejarah negeri ini telah membuktikan bahwa para pelaku bisnis dan UKM-lah yang mampu bertahan ketika krisis menerpa Indonesia di tahun 1998.<br><br>Dan kepada merekalah kita bisa berharap krisis global kali ini takkan mampir ke Indonesia. (sumber: http://prys3107.blogspot.com/)<br>', 'Sabtu', '2009-01-31', '14:48:09', '44amerika.jpg', '8', 'amerika');
INSERT INTO `artikel` VALUES ('74', '19', 'admin', 'Google Chrome Susupi Microsoft', 'google-chrome-susupi-microsoft', 'Y', '<p>\r\nBrowser Microsoft, Internet Explorer (IE), bisa mendominasi karena tersedia secara default pada banyak komputer di pasaran. Google Chrome akan menggoyang dengan menyusup di lahan yang sama. Google rupanya sudah bersiap-siap menawarkan Google Chrome secara default pada komputer-komputer baru. \r\n</p>\r\n<p>\r\nPichai juga menjanjikan Chrome akan keluar dari versi Beta (uji coba) pada awal 2009. \r\nJika Google berhasil menyusupkan Chrome dalam lahan yang selama ini jadi &#39;mainan&#39; Microsoft, lanskap perang browser akan mengalami perubahan. \r\n</p>\r\n<p>\r\nSaat ini Microsoft masih mendominasi pada kisaran 70 persen lewat Internet Explorer-nya, sedangkan Firefox menguasai sekitar 20 persen. (sumber: <a href=\"http://detikinet.com\" target=\"_blank\">detikinet.com</a>)\r\n</p>\r\n', 'Sabtu', '2009-01-31', '13:34:25', '25chrome.jpg', '30', 'browser,google');
INSERT INTO `artikel` VALUES ('60', '19', 'admin', 'Digerus Firefox, IE Makin Melempem', 'digerus-firefox-ie-makin-melempem', 'Y', 'Browser Mozilla Firefox sepertinya makin berkibar. Berdasarkan data terbaru dari biro penelitian Net Applications, Firefox menapak naik dengan menguasai 20,78 persen pangsa pasar browser pada bulan November, naik dari angka 19,97 persen di bulan Oktober.<br><br>Dikutip detikINET dari Afterdawn, Selasa (2/1/2/2008), Firefox kemungkinan sukses menggaet user yang sebelumnya mengandalkan browser Internet Explorer (IE) besutan Microsoft. Pasalnya, masih menurut data Net Applications, pangsa pasar IE kini menurun di bawah 70 persen untuk kali pertama sejak tahun 1998. IE sekarang menguasai 69,8 persen pangsa pasar dari sebelumnya 71,3 persen di bulan Oktober.<br><br>Padahal di masa jayanya di tahun 2003, IE pernah begitu dominan dengan menguasai 95 persen pasaran browser. Penurunan pangsa pasar IE ini disinyalir juga terkait musim liburan di AS di mana banyak perusahaan libur. Padahal browser IE banyak dipakai oleh kalangan perusahaan.<br><br>Adapun produk browser lainnya menunjukkan tren peningkatan. Apple Safari kini punya pangsa 7,13 persen dan Google Chrome sebesar 0,83 persen dari yang sebelumnya 0,74 persen. Sementara pangsa pasar Opera mengalami penurunan dari yang sebelumnya 0,75 persen menjadi 0,71 persen saja. (sumber: <a target=\"_blank\" title=\"http://detikinet.com\" href=\"http://detikinet.com\">detikinet.com</a>)<br>', 'Sabtu', '2009-01-31', '13:58:31', '47firefox.jpg', '4', 'browser');
INSERT INTO `artikel` VALUES ('61', '22', 'admin', 'Sepatu Melayang Saat Bush Berpidato di Irak', 'sepatu-melayang-saat-bush-berpidato-di-irak', 'Y', 'Apakah pemerintah AS sakit hati karena Presiden Bush ditimpuk sepatu? Sudah pasti. Tapi di Irak, sepatu melayang itu sebagai pamitan terindah untuk Bush. Muntazer Al Zaidi dieluk-elukkan di Irak. Tuntutan masyarakat agar dia dibebaskan juga semakin kencang. Mereka menilai tindakan Al Zaidi menimpuk Bush dengan sepatunya sebagai tindakan paling berani.<br><br>Sahabat Al Zaidi di stasiun TV Al Baghdadia, mengungkapkan betapa bencinya Al Zaidi pada Bush. Dia menganggap Bush sebagai tokoh yang memerintahkan perang di Irak.<br><br>\"Melempari sepatu pada Bush merupakan ciuman pamitan terbaik hingga sejauh ini ... itu merupakan ungkapan bagaimana rakyat Irak dan bangsa Arab lainnya membenci Bush,\" tulis Musa Barhoumeh, editor koran independen Yordania, Al-Gahd, Selasa (16/12).<br><br>Di Washington, Al Zaidi dicap sebagai orang yang cuma mencari perhatian.<br><br>\"Tak diketahui apa motivasi orang itu, ia tampaknya jelas hanya berusaha mendapatkan perhatian atas dirinya,\" kata Jurubicara Deplu AS, Roberet Wood, kepada para wartawan.<br><br>Pemerintah Irak mencap tindakan Zaidi sebagai \'memalukan\' dan menuntut permintaan maaf dari pemimpin redaksinya yang berkerdudukan di Kairo. Namun Bos Al Zaidi malah menuntut pembebasan reporternya itu. (sumber: <a target=\"_blank\" title=\"http://inilah.com\" href=\"http://inilah.com\">inilah.com</a>)<br>', 'Sabtu', '2009-01-31', '14:04:27', '38bush.jpg', '11', 'amerika,george-bush');
INSERT INTO `artikel` VALUES ('62', '22', 'admin', 'Monumen Menghormati Pelempar Sepatu Bush', 'monumen-menghormati-pelempar-sepatu-bush', 'Y', 'Wartawan pelempar sepatu ke arah mantan Presiden Amerika Serikat George W Bush Desember lalu, benar-benar menjadi pahlawan. Sebuah kota di Irak bahkan membuatkan monumen sepatu untuk menghormatinya. Seperti diartikelkan Reuters, Jumat (30/1/2009), monumen sepatu yang terletak di kota Tikrit Irak tersebut diresmikan Kamis kemarin. Sepatu sepanjang dua meter itu dilapis material berwarna perunggu.<br><br>\"Muntazar: Puasa (bicara) hingga pedang menyayat kebisuan dengan darah. Sunyi hingga mulut kami menyuarakan kebenaran,\" demikian tertulis di monument itu. Saat melemparkan sepatunya ke Bush dalam sebuah konferensi pers di Baghdad, wartawan televisi Al Baghdadia itu mengucapkan bahwa Bush merupakan orang yang bertangung jawab atas kematian ribuan warga Irak. Zaidi juga menyebut Bush dengan kata \"anjing\".<br><br>Sejak insiden itu Zaidi medekam di penjara Baghdad. Dia menghadapi tuntutan penyerangan terhadap tamu negara dengan ancaman hukuman penjara hingga 15 tahun.<br><br>Pimpinan rumah yatim piatu dan organisasi kesejahteraan anak Tikrit Fatin Abdul Qader mengatakan monumen itu didesain oleh Laith Al Amiri dengan bobot keseluruhan sekira 1,2 ton. Tema monumen tersebut adalah \"Patung Semangat dan Kedermawanan\".<br><br>\"Monumen ini merupakan ekspresi penghargaan dan apresiasi kami untuk Muntazhar Zaidi akrena hati orang-orang Irak akan tenang dengan leparan sepatunya,\" kata Fatin. (sumber: <a target=\"_blank\" title=\"http://sabili.co..id\" href=\"http://sabili.co..id\">sabili.co.id</a>)<br>', 'Sabtu', '2009-01-31', '14:11:28', '91bushet.jpg', '5', 'amerika,george-bush');
INSERT INTO `artikel` VALUES ('75', '22', 'admin', 'Krisis Ekonomi Amerika, Bukti Gagalnya Kapitalisme', 'krisis-ekonomi-amerika-bukti-gagalnya-kapitalisme', 'Y', '<p>\r\nPresiden Ekuador, Rafael Correa menilai krisis yang terjadi di Amerika menjadi bukti kegagalan sistem kapitalis dan periode Kapitalisme telah berakhir serta ekonomi Amerika sebagai pasar terbesar dunia telah dililit krisis. (Kantor artikel Fars Prensa Latina Kuba).\r\n</p>\r\n<p>\r\nCorrea menambahkan, apa yang terjadi di Amerika tidak terbatas pada krisis keuangan, namun bukti kebuntuan sebuah sistem yang dibangun tanpa dicermati secara serius. \r\n</p>\r\n<p>\r\nMenurut Correa, solusi krisis sistem keuangan Amerika tidak akan bisa selesai dengan menyuntikkan dana 700 miliar dolar kepada bank-bank yang telah bangkrut, namun yang lebih penting lagi adalah Amerika harus melakukan perubahan fundamental. (sumber: hidayatullah.com)\r\n</p>\r\n', 'Sabtu', '2009-01-31', '14:13:52', '54RafelKarera.jpg', '19', 'amerika');
INSERT INTO `artikel` VALUES ('79', '22', 'admin', 'Ahmadinejad: Gaza Akan Jadi Kuburan Israel', 'ahmadinejad-gaza-akan-jadi-kuburan-israel', 'Y', 'Iran dan Israel tampaknya tidak akan pernah melakukan genjatan senjata. Presiden Iran Mahmoud Ahmadinejad melontarkan kata-kata serangan terhadap Israel dengan menyebut negara Yahudi itu akan segera lenyap dari bumi. \"<span style=\"font-weight: bold; font-style: italic;\">Kejahatan yang dilakukan rejim Zionis (Israel) terjadi karena mereka sadar sudah sampai di akhir dan segera lenyap dari muka bumi</span>,\" kata Ahmadinejad dalam pawai anti-Israel yang berlangsung di Teheran, seperti dilaporkan kantor artikel Mehr dan dikutip DPA, Sabtu (13/12).<br><br>Dia mengatakan Israel sudah kehilangan arah dan kian sadar bahwa kelompok negara-negara kuat makin ragu untuk menunjukkan dukungan untuk negara Yahudi itu.<br><br>Ahmadinejad juga mengatakan bahwa kejahatan Israel di Gaza bertujuan mengganti pemimpin politik di wilayah itu agar sesuai dengan kepentingan politik Israel. (sumber: <a target=\"_blank\" title=\"Situs artikel Inilah.com\" href=\"http://inilah.com\">inilah.com</a>)<br>', 'Senin', '2009-02-02', '14:23:39', '22ahmadinejad.jpg', '88', 'gaza,israel,palestina');
INSERT INTO `artikel` VALUES ('65', '23', 'admin', 'Michael Heart \"Song for Gaza\"', 'michael-heart-song-for-gaza', 'Y', 'Banyak cara untuk men-support perjuangan rakyat Palestina di Gaza, salah satunya dengan lagu. Seorang penyanyi di Los Angeles Amerika Serikat - Michael Heart yang bernama asli Annas Allaf kelahiran Syiria, membuat sebuah lagu khusus yang dia tujukan untuk rakyat Gaza yang sampai saat ini masih jadi sasaran pembantaian oleh Zionis Israel.<br><br>Sejak dia merilis lagu yang berjudul \"We will not go down\" (Song for Gaza), lagu tersebut mendapat banyak respon, berupa komentar dukungan, sampai ia sendiri kewalahan menjawab dan membalas berbagai email yang masuk.<br><br>Michael Heart menggambarkan kondisi rakyat Gaza akan gempuran Zionis Israel dalam lagunya itu membuat kita merasa tersindir dan sedih akan nasib rakyat Gaza. Walaupun lagu itu baru di rilis, namun telah ratusan ribu orang melihatnya di youtube dan mendownload MP3 nya.<br><br>Awalnya dia berencana dengan menjual CD lagu MP3 nya itu dan hasil penjualannya akan dia donasikan untuk kepentingan amal kemanusiaan untuk penduduk Gaza, tapi karena dia merasa sulit kalau harus sendiri mendonasikan hasil penjualan CD MP3 nya, akhirnya dia memutuskan semua orang bisa mendownload gratis lagu tersebut. Dan dia berharap, setelah mendengarkan lagu itu, orang-orang akan tergerak hatinya untuk membantu rakyat Palestina di Gaza dengan mendonasikan uangnya ke lembaga-lembaga kemanusiaan yang ada atau organisasi yang didedikasikan untuk meringankan penderitaan rakyat Palestina.<br><br>Sebagai musisi Michael Heart sangat berterima kasih atas dukungan yang diberikan kepada dia atas lagu tersebut. Dan dia berharap setiap orang yang masih mempunyai hati nurani, mendukung perjuangan rakyat Palestina dan membantu mereka walau hanya dengan berupa doa.<br><br><br><span style=\"font-weight: bold;\">WE WILL NOT GO DOWN (Song for Gaza)</span><br style=\"font-weight: bold;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">A blinding flash of white light</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Lit up the sky over Gaza tonight</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">People running for cover</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Not knowing whether they\'re dead or alive</span><br style=\"font-style: italic;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">They came with their tanks and their planes</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">With ravaging fiery flames</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">And nothing remains</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Just a voice rising up in the smoky haze</span><br style=\"font-style: italic;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">We will not go down</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">In the night, without a fight</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">You can burn up our mosques and our homes and our schools</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">But our spirit will never die</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">We will not go down</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">In Gaza tonight</span><br style=\"font-style: italic;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Women and children alike</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Murdered and massacred night after night</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">While the so-called leaders of countries afar</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">Debated on who\'s wrong or right</span><br style=\"font-style: italic;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">But their powerless words were in vain</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">And the bombs fell down like acid rain</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">But through the tears and the blood and the pain</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">You can still hear that voice through the smoky haze</span><br style=\"font-style: italic;\"><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">We will not go down</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">In the night, without a fight</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">You can burn up our mosques and our homes and our schools</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">But our spirit will never die</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">We will not go down</span><br style=\"font-style: italic;\"><span style=\"font-style: italic;\">In Gaza tonight </span><br><br>(sumber: detik.com)<br>', 'Sabtu', '2009-01-31', '14:26:40', '24michaelheart.jpg', '24', 'gaza,israel,palestina');
INSERT INTO `artikel` VALUES ('66', '22', 'admin', 'Demo Kecam Israel Warnai Ibukota', 'demo-kecam-israel-warnai-ibukota', 'Y', 'Aksi unjuk rasa menentang agresi militer Israel ke Jalur Gaza, Palestina kembali mewarnai Jakarta. Unjuk rasa kali ini dilakukan oleh Ormas Islam Hizbut Thahrir di kawasan Silang Monas, Jakarta. Sejak Minggu (4/1) pagi, para pengunjuk rasa nampak berbondong-bondong membawa karton besar bertuliskan \'Save Palestine\' dan foto anak-anak serta perempuan Palestina yang menjadi korban tak berdosa dari serangan biadab militer Israel.<br><br>Kepada warga Jakarta yang berolahraga di sekitar kawasan Monas, para pengunjuk rasa juga mengedarkan kotak sumbangan untuk didonasikan kepada korban warga Palestina.<br><br>Aksi unjuk rasa dan banyaknya warga Jakarta yang rutin berolahraga di kawasan Silang Monas setiap Minggu pagi, membuat kawasan itu cukup padat untuk dilalui kendaraan bermotor.<br><br>Serangan udara Israel yang dimulai pada 27 Desember 2008 sudah terjadi selama sepekan di Jalur Gaza dan menewaskan lebih 420 orang.<br><br>Meski mendapat kutukan keras dari dunia Internasional, termasuk Indonesia, Israel sampai saat ini belum menunjukkan tanda-tanda akan menghentikan aksi militernya. (sumber: inilah.com)<br>', 'Sabtu', '2009-01-31', '14:29:16', '32demo.jpg', '23', 'gaza,israel,palestina');
INSERT INTO `artikel` VALUES ('67', '2', 'admin', 'Ana Ivanovic Dinobatkan Sebagai Ratu Tenis 2008', 'ana-ivanovic-dinobatkan-sebagai-ratu-tenis-2008', 'Y', 'Ana Ivanovic, dara kelahiran Belgrade pada tanggal 6 November 1987 sudah mulai bermain tenis sejak umur 5 tahun sesudah menonton Monica Seles di TV, mengingat nomor telpon sekolah tenis lokal dan memohon kepada orang tuanya untuk mengajak pergi ke sekolah itu. Kemudian di acara ulang tahunnnya yang ke-5, orang tuanya memberi hadiah berupa raket tenis dan sejak itu dia mulai jatuh cinta dengan dunia tenis. Kemudian Ana mulai berlatih tenis secara intens dengan Scott Byrnes pada bulan juli 2006.<br><br>Dragana, ibunya adalah seorang pengacara, sedangkan Miroslav bapaknya adalah seorang pebisnis, Milos kakaknya adalah seorang pemain basket dan seluruh keluarganya menyukai olahraga, tetapi tidak ada yang menyukai tenis seperti ana.<br><br>Senjata utamanya di tenis adalah pukulan forehand-nya, dan dia bisa main di segala jenis lapangan. Hobinya adalah menonton film di bioskop atau menonton DVD di rumah. Ana juga suka membaca, khususnya tentang Mitologi dan Sejarah Yunani. Ana juga senang sekali mendengarkan musik.<br><br>Pada tahun 2008 ini, setelah menjuarai Roland Garros prancis dengan mengalahkan Dinara safina dari rusia di final, maka saat ini peringkat Ana Ivanovic naik menjadi peringkat 1 dunia untuk petenis putri.<br>', 'Sabtu', '2009-01-31', '14:30:48', '20anaivanovic.jpg', '7', 'tenis');
INSERT INTO `artikel` VALUES ('73', '2', 'admin', 'Maria Kirilenko, Petenis Terseksi Versi WTA', 'maria-kirilenko-petenis-terseksi-versi-wta', 'Y', 'Pesona kecantikan Maria Sharapova dan Ana Ivanovic sepertinya sudah mendapat saingan baru. Tidak jauh-jauh, nama Maria Kirilenko tiba-tiba menyeruak di daftar petenis terseksi pilihan responden WTA. Artinya, Maria sukses merengkuh gelar yang musim lalu diraih Maria Sharapova.<br><br>Setengah dari 7 ribu responden yang masuk ke WTA menyebut, kalau Maria adalah sosok petenis ideal dan paling proporsional di level bentuk tubuh. Meski hanya berperingkat 18 dunia, namun pesonanya di atas lapangan tenis menjadi daya tarik tersendiri.<br><br>\"Tubuhnya sangat indah, siluetnya membuat setiap pria pasti penasaran ingin melihat lebih dekat. Yang jelas, ia memiliki kepribadian baik yang makin menyempurnakan pesona fisiknya,\" tulis seorang responden. Di kalangan petenis putri sendiri, sudah lama Maria menjadi saingan berat Masha dan Ana ivanovic.<br><br>Di situs pribadinya, petenis bernama asli Maria Yuryevna Kirilenko ini mengaku selalu menjaga proporsi tubuh dengan senam dan renang, selain tentu berlatih fisik tenis. \"Olahraga adalah cermin hidupku, jika tak olahraga sehari saja, kadang membuat tubuhku terasa lemas dan tak bergairah,\" ujar Maria.&nbsp; (persda network/bud)<br><br>Meksi bersaing di lapangan dan dunia mode, namun ternyata sosok Maria Kirilenko adalah sobat sejati Maria Sharapova. Bukan hanya karena sama-sama berasal dari Rusia, namun gaya hidup mereka berdualah yang membuat Maria-Masha banyak memiliki kecocokan.<br>Selain suka fotografi, mereka berdua juga memiliki hobi berbelanja, terutama fashion dan perhiasan. Bukan untuk pamer memang, tapi mereka melakukan itu untuk tabungan dan investasi.<br><br>Di beberapa turnamen, Masha dan Maria memang tampak bersama tatkala berada di luar lapangan. Mereka biasanya menyingkir dari rombongan pemain lain, dan memilih berburu barang kesukaan mereka dengan menyisir bagian kota tempat mereka tengah bertanding. \"Aku dan Masha seperti kakak beradik, bagiku dia lebih dari sekedar sahabat, dia begitu dewasa, apalagi saat kami berdua saling curhat,\" sebut Maria, di tennisnews. <br><br>Daftar petenis terseksi WTA:<br><ol><li>Maria Kirilenko (Russia)</li><li>Maria Sharapova (Russia)</li><li>Ana Ivanovic (Serbian)</li><li>Caroline Wozniacki (Danish)</li><li>Nicole Vaidisova (Czech)</li><li>Sania Mirza (Indian)</li><li>Ashley Harkleroad (American)</li><li>Gisela Dulko (Argentinian)</li><li>Samantha Stosur (Australian)<br></li></ol>', 'Sabtu', '2009-01-31', '15:01:49', '14mariakirilenko.jpg', '41', 'tenis');
INSERT INTO `artikel` VALUES ('68', '2', 'admin', 'Roger Federer, Petenis Legenda Abad Ini', 'roger-federer-petenis-legenda-abad-ini', 'Y', 'Siapa yang tak kenal dengan Roger Federer saat ini? Masih muda, ganteng, namun sudah jadi legenda. Bayangkan, dalam usia belum menginjak 26 tahun, ia sudah memecahkan rekor bertahan sebagai peringkat pertama dunia tenis selama 161 pekan berturut-turut. Ia memecahkan rekor Jimmy Connor yang sudah bertahan puluhan tahun. <br><br>Itu baru satu rekor. Sebelumnya, ia juga mendapat penghargaan Bagel Award, yakni penghargaan sebagai petenis paling banyak memenangkan set tenis dengan angka sempurna 6-0. \"Saya hanya berusaha melakukan yang terbaik dan tidak berhenti memperbaiki kesalahan-kesalahan saya,\"sebut Federer merendah tentang prestasinya itu.<br><br>Dengan kerendahhatian dan semangat untuk terus memperbaiki diri, pria keturunan campuran Swiss, German, dan Afrika Selatan ini sepertinya akan terus mengukir prestasi. Sebab, mengingat usia yang masih muda dan jarak nilai ATP dengan peringkat kedua dunia Rafael Nadal, cukup jauh, ia akan bisa terus bertahan di rangking satu dunia. Apalagi jika ia nantinya bisa memenangkan satu-satunya gelar tenis Grand Slam yang belum diraih, Perancis Terbuka. Ia akan jadi satu-satunya petenis pria yang bisa mengawinkan semua gelar tenis Grand Slam.<br><br>Roger Federer memang sepertinya terlahir untuk jadi legenda. Bahkan, menurut pengakuannya, sejak kecil ia sudah disebut banyak orang punya bakat gemilang di bidang olahraga. Tapi, menurut dirinya, bukan bakat yang membuatnya seperti sekarang. Kerja keras, ketekunan berlatih, dan keuletan di lapangan lah yang membuat dia bisa jadi juara sejati. \"Saya terus berlatih untuk meningkatkan teknik permainan saya dan menambah kekuatan saya. Proses ini saya jalani sampai hari ini dan bahkan makin saya tingkatkan sejak saya jadi juara. Ini saya lakukan karena saya yakin masih banyak perbaikan yang harus terus dilakukan.\"<br><br>Dengan tekad untuk terus melakukan perbaikan itu, Roger Federer terus meretas jalan untuk mengukir rekor-rekor lainnya. Namun, semua rekor dan kemenangan yang diperolehnya, ternyata bukan hanya untuk kebanggaan dirinya. Melalui sebuah yayasan yang diberi nama seperti dirinya, Roger Federer Foundation, ia membantu anak-anak kurang beruntung di dunia terutama di Afrika Selatan. Sebagian hadiah yang diperoleh dari kemenangannya di kejuaraan tenis, digunakan untuk membantu anak-anak itu. Ia juga berperan banyak saat terjadi tsunami akhir tahun 2005. Saat itu, ia terpilih menjadi duta UNICEF, untuk membantu anak-anak yang jadi korban tsunami di Tamil Nadu, India. Ia juga berjanji untuk mengukir lebih banyak kemenangan guna mengumpulkan lebih banyak dana untuk yayasannya. Ia juga merelakan beberapa raketnya untuk dilelang guna disumbangkan melalui UNICEF. Roger Federer telah membuktikan, dengan kerja keras, semangat pantang menyerah, tekad kuat, dan kepedulian terhadap sesama, telah menjadikannya sebagai juara sejati.<br><br>Dari kisah sukses Roger Federer ini, kita dapat mengambil pelajaran bahwa dengan kerja keras disertai semangat pantang menyerahlah kita bisa mewujudkan cita-cita. Selain itu, kepedulian kepada sesama juga selayaknya dapat mendorong semangat kita untuk terus mengukir prestasi. (sumber: andriewongso.com)<br>', 'Sabtu', '2009-01-31', '18:59:14', '33federer.jpg', '16', 'tenis');
INSERT INTO `artikel` VALUES ('70', '19', 'admin', 'Kisah Sukses Google', 'kisah-sukses-google', 'Y', 'Dalam daftar orang terkaya di Amerika baru-baru ini, terselip dua nama yang cukup fenomenal. Masih muda, usianya baru di awal 30-an, namun kekayaannya mencapai miliaran dolar. Nama kedua orang itu adalah Larry Page dan Sergey Brin. Mereka adalah pendiri Google, situs pencari data di internet paling terkenal saat ini.<br><br>Terlepas dari jumlah kekayaan mereka, ada beberapa hal yang perlu dicontoh dari kisah sukses mereka. Satu hal yang pertama, yang disebut Sergey Brin, yang kini menjabat sebagai Presiden Teknologi Google, yakni tentang kekuatan kesederhanaan. Menurutnya, simplicity web adalah hal yang disukai penjelajah internet. Dan, Google berhasil karena menggunakan filosofi tersebut, menghadirkan web yang bukan saja mudah untuk mencari informasi, namun juga menyenangkan orang.<br><br>Kunci sukses kedua adalah integritas mereka dalam mewujudkan impiannya. Mereka rela drop out dari program doktor mereka di Stanford University untuk mengembangkan google. Mereka pun pada awalnya tidak mencari keuntungan dari proyek tersebut. Malah, kedua orang itu berangkat dari sebuah ide sederhana. Yakni, bagaimana membantu banyak orang untuk mempermudah mencari sumber informasi dan data di dunia maya. Mereka sangat yakin, ide mereka akan sangat berguna bagi banyak orang untuk mempermudah mencari data apa saja di internet.<br><br>Kunci sukses lainnya yaitu mereka tidak melupakan jasa orang-orang yang mendukung kesuksesan mereka. Larry dan Sergey sangat memerhatikan kesejahteraan SDM di Google. Kantornya yang diberi nama Googleplex dinobatkan sebagai tempat bekerja terbaik di Amerika tahun 2007 oleh majalah Fortune. Di sana suasananya sangat kekeluargaan, ada makanan gratis tiga kali sehari, ada tempat perawatan bagi bayi ibu muda, bahkan sampai kursi pijat elektronik pun tersedia. Mereka sadar, di balik sukses inovasi yang dilakukan Google, ada banyak doktor matematika dan lulusan terbaik dari berbagai universitas yang membantu mereka.<br><br>Larry dan Sergey memang tak pernah menduga Google akan sesukses sekarang. Kedua orang yang terlahir dari keluarga ilmuwan ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“ ayah Sergey adalah doktor matematika, sedangkan Larry adalah putra almarhum doktor pertama komputer di Amerika ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“ ini memang hanya berangkat dari sebuah masalah sederhana. Mereka berusaha memecahkan masalah tersebut, dan berbagi dengan orang lain. Namun, justru dengan kesederhanaan dan integritas mereka, mampu membuat Google saat ini menjadi mesin pencari terdepan, dikunjungi lebih dari 300 juta orang perhari. Diterjemahkan dalam 88 bahasa dengan nilai saham mencapai lebih dari 500 dolar AS per lembar, membuat sebuah kesederhanaan menjelma menjadi kekuatan yang luar biasa.<br><br>Sebuah niat mulia, meski sesederhana apapun, jika dilandasi kerja keras dan integritas yang tinggi, akan menghasilkan sesuatu yang istimewa. Hal tersebut nampak dari contoh kisah sukses Larry Page dan Sergey Brin di atas. Google yang mereka dirikan terbukti telah membantu banyak orang untuk bisa mendapatkan apa saja dari internet. Dan kini, mereka pun mendapatkan imbalan yang bahkan tak diduga mereka sebelumnya. Kesuksesan sejati memang akan terasa saat kita bisa berbagi. Dan, Larry serta Sergey membuktikannya sendiri. (sumber: andriewongso.com)<br>', 'Minggu', '2009-01-25', '20:26:26', '73google.jpg', '6', 'google');
INSERT INTO `artikel` VALUES ('85', '19', 'admin', 'Windows 7 Gantikan Windows Vista', 'windows-7-gantikan-windows-vista', 'Y', '<p>\r\nMicrosoft  ingin memudahkan rencana para administrator komputer yang akan bermigrasi ke Windows 7, namun sebuah tulisan di blog salam satu anggota tim Windows 7 berkata sebaliknya.\r\nSkenario uji coba terbaru menunjukkan, sebagian besar pengguna, proses upgrading akan menyulitkan, mengambil waktu kira-kira 30 menit. \r\n</p>\r\n<p>\r\nProsentasi terbesar pengguna menyebut, migrasi butuh waktu hingga 21 jam.\r\nSalah satu anggota tim Windows dari Microsoft, Chris Hernandez, mengungkap hasi pengetesan timnya dengan berbagai merek komputer dan konfigurasi tipikal pengguna lewat simulasi pada tingkatan berbeda dari proses migrasi Vista ke Windwos pada Jumat akhir pekan lalu.\r\n</p>\r\n<p>\r\nTujuan simulasi untuk memastikan apakah upgrade dari Vista Service Pack (SP) 1 ke Windows 7, dalam lima persen percobaan utama, lebih cepat ketimbang upgrade dari Vista SP1 ke Vista SP2, ujar Chris.\r\nProses dari Vista SP1 ke Vista SP2 dipilih karena itu opsi instalasi paling umum digunakan Microsoft Product Support Services, yakni skenario repair (perbaikan ulang) di mana prosedur yang paling dianjurkan adalah melakukan re-instalasi sistem operasi (OS) yang sudah ada di komputer saat itu. \r\n</p>\r\n<p>\r\nChris menampilkan hasil tes dalam blognya.\r\nTim mengetes konfigurasi komputer khusus hadware, merentang dari label hardware low-end (spesifikasi rendah), mid-range (spesifikasi menengah) dan high-end (spesifikasi atas). label itu berlawanan dengan skenario pengguna pada umumnya yang berbasis pertanyaan seperti, berapa besar set data yang dibutuhkan pengguna dan bagaimana macam aplikasi tersebut diinstall.\r\n</p>\r\n<p>\r\nUntuk label komputer spesifikasi atas, Chris dan timnya mendefinisikan komputer dengan sistem operasi 32 bit dan memiliki CPU berprosesor Inter Core 2 Quad, yang bejalan di 2,4 GHz, memori 4GB dan hardisk 1 Terabyte .\r\nSementara, pengguna umumnya memiliki data sebesar 125 GB yang terikat dalam format dokumen, musik dan gambar dengan 40 aplikasi yang diinstal di komputer mereka.\r\nKinerja upgrade Vista SP1 ke Windows 7 pada hardware spesifikasi atas dengan konfigurasi pemilik pengguna kelas berat, membutuhkan 160 menit, atau sekitar 2,7 jam. \r\n</p>\r\n<p>\r\nSebagai perbandingan, upgrade repair (perbaikan) dari Vista SP1 ke Vista SP1 dengan hadware yang sama dan penggunaan bera membutuhkan 176 menit, atau 2,9 jam.\r\nSkenario terburuk muncul pada konfigurasi hadware kelas menengah, yakni CPU 32 bit namun dengan software dan konfigurasi &quot;pengguna super&quot;. Proses upgrading akan butuh waktu hingga 1.220 menit alias 20,3 jam. Padahal yang dianggap hadware kelas menengah, memiliki spesifikasi setara memory 2GB RAM, prosesor dual core, Athlon 64 X2, pada 2,6GHz dan hardisk 1 Terabyte.\r\n</p>\r\n<p>\r\nMereka yang dianggap pengguna super, memiliki profil lebih sadis dalam istilah penggunaan data, ketimbang pengguna kelas berat pada umumnya. Sebagai contoh, tim penguji menyebut pengguna super memiliki 650 GB data dan 40 aplikasi lebih yang terinstal dalam komputer mereka.\r\nLalu pada kelas rendah, pengguna medium, dengan 70 GB data dan 20 aplikasi, dengan memori sekitar 1 GB, prosesor 64 bit, AMD Athlon pada kecepatan 2,2 GHz, bakal butuh waktu bermigrasi sekitar 175 menit. Hardware yang lebih bertenaga, secara umum membutuhkan waktu instalasi lebih singkat.\r\n</p>\r\n<p>\r\nMicrosoft tidak selalu bisa mencapai target lima persen tujuan tim Chris yang telah dijanjikan. Dalam satu contoh, instalasi bersih (instalasi pertama pada komputer baru tanpa OS) Windows 7 pada hardware spesifikasi menengah membutuhkan 30 menit sementara instalasi bersih Vista SP1 butuhk 31 menit. Hanya saja, secara keseluruhan, tidak ada instalasi Windows 7 yang lebih lambat dibandingkan Vista.\r\n</p>\r\n<p>\r\nPertanyaan tersisa, apakah para toko dan ritel software akan mendengar rayuan Microsoft dan memutuskan hijrah ke Windows 7 lebih cepat? Tradisi yang berlaku, ritel IT akan cenderung menunggu Service Pack I sebelum mendatangkan versi terbaru Windows.\r\nWaktu yang akan menjadi sumber menentukan apakah kalangan profesional IT akan berpindah, sehingga Vista tak lagi menarik bagi ritel dan toko software. Jadi kehijrahan mereka ke Windows 7 dengan segera, menandakan pula, apakah para profesional IT suka dengan hasil pengujian waktu instal yang dilakukan Chris Hernandez.  internetnews/itz.\r\n</p>\r\n', 'Minggu', '2009-10-25', '07:25:22', '19windows7.jpg', '18', 'komputer');
INSERT INTO `artikel` VALUES ('92', '23', 'admin', 'Pemilik Facebook akan Dibuat Filmnya', 'pemilik-facebook-akan-dibuat-filmnya', 'Y', '<p>\r\nSutradara David Fincher nampak jeli melihat peluang di tengah booming fenomena Facebook. Fincher akan menghadirkan sebuah film yang menceritakan tentang Mark Zuckerberg dan Facebook bagi para pencinta film dan Facebook tentunya.\r\n</p>\r\n<p>\r\nFincher mengaku rencana pembuatan film ini masih dinegosiasikan dengan pihak Zuckerberg. Dia hanya menyebutkan, filmya akan fokus menceritakan Mark Zuckerberg yang awalnya merancang Facebook sebatas untuk keperluan mahasiswa Universitas Harvard.\r\n</p>\r\n<p>\r\nFilm ini memaparkan bagaimana setelah itu Facebook kemudian berkembang menjadi fenomena yang mendunia sejak diluncurkan pada 2004.\r\n</p>\r\n<p>\r\nDalam penggarapan film ini, Fincher mengajak serta orang-orang kompeten di bidang film. Antara lain Aaron Sorkin, yang merupakan penulis naskah acara serial televisi ternama The West Wing.\r\n</p>\r\n<p>\r\nSementara itu, Columbia Pictures yang menamai film ini &quot;The Social Network&quot; dipercaya untuk memulai produksi film pada akhir tahun ini.\r\n</p>\r\n<p>\r\nSebagian orang menilai kehadiran film ini nantinya akan mengorek kembali kasus lama dimana tiga teman Zuckerberg, Cameron dan Tyler Winklevoss serta Divya Narendra mengklaim Zuckerberg telah mencuri ide mereka untuk membuat Facebook.\r\n</p>\r\n<p>\r\nPada saat Zuckerberg meluncurkan Facebook, mereka menuntut perkara atas Zuckerberg. Awal tahun ini, pengadilan AS memutuskan Facebook harus membayar USD65 juta untuk melunasi perkara ini.\r\n</p>\r\n', 'Minggu', '2009-10-25', '07:36:47', '17mark_zuckerberg.jpg', '22', 'film');
INSERT INTO `artikel` VALUES ('90', '19', 'admin', 'Ferrari 458 Polesan Teknologi Jepang', 'ferrari-458-polesan-teknologi-jepang', 'Y', '<p>\r\nBarangkali hanya Jepang (diluar Italia) yang berani memoles bodi mobil dari Ferrari, sekaligus mengumumkan hasilnya kepada publik. Seperti dilakukan rumah modifikasi ASI terhadap Ferrari 458 yang oleh pabrikannya di Italia baru di launching.\r\n</p>\r\n<p>\r\nASI dengan keberaniannya menggarap proyek berisiko tinggi. Beberapa mobil berharga miliaran rupiah pernah digarap dan membuat tampilan mobil lebih sporty dan tambah dinamis dari versi standar.\r\n</p>\r\n<p>\r\nSebut saja, Bentley Continental GT (yang diberi julukan The ASI Tetsu GTR) dan Ferrari 430. Bahkan Ferrari milik seorang pengusaha muda di Indonesia pernah juga dimodifikasi (body) di Jepang pada 2007.\r\n</p>\r\n<p>\r\nCEO ASI Satoshi Kondo menjelaskan, bahwa tim rekayasanya telah bekerja keras memproduksi aerokit untuk Ferrari 458. ASI, katanya sengaja mengeluarkan sketsa dari hasil kerja mereka dengan terus melakukan finalisasi prototype yang ada, dan menghindari pencurian desain.\r\n</p>\r\n<p>\r\nSentuhan pada bagian depan dari kuda jingkrak menjadi salah satu yang menonjol. Di antaranya moncong yang baru, lubang udara lebih besar, dan dilanjutkan pada bagian roda. Dari sketsa gambar tampak terpasang sayap baru di bagian belakang.\r\n</p>\r\n<p>\r\nPaket body kit dari ASI mempertegas tampilan Ferrari sebagai hasil kawin silang dari gaya tuner Jepang dengan kendaraan eksotis khas Italia. ASI mengklaim, adanya perubahan dan penambahan pada bodi tidak mengurangi performa standar. Bahkan bobot kendaraan lebih ringan dari asli. (sumber: kompas.com)\r\n</p>\r\n', 'Minggu', '2009-10-25', '07:44:05', '4ferrari458.jpg', '2', 'mobil');
INSERT INTO `artikel` VALUES ('86', '22', 'admin', 'Program 100 Hari Menkominfo Tifatul', 'program-100-hari-menkominfo-tifatul', 'Y', '<p>\r\nBelum juga resmi diumumkan masuk jajaran kabinet, sejumlah calon menteri sudah berani membeberkan programnya. Salah satunya, Tifatul Sembiring. Tifatul disebut-sebut sebagai calon kuat Menkominfo (Menteri Komunikasi dan Informasi).\r\n</p>\r\n<p>\r\nApa saja program Tifatul? &quot;100 Hari pertama? Kita targetkan sampai 2014 itu ada 10 ribu desa komputer. Presiden menargetkan tiga bulan ini ada 100 desa komputer harus tercapai,&quot; kata Tifatul di Gedung MPR/DPR, Jakarta, Selasa 20 Oktober 2009.\r\n</p>\r\n<p>\r\nKomputer-komputer ini, kata dia, bisa dimasukkan ke lembaga pendidikan untuk meningkatkan sumber daya manusia. Bagaimana SDM Indonesia bisa masuk ke bisnis supaya Indonesia bisa bersaing dengan negara-negara lain. Selain itu juga untuk meningkatkan e-goverment untuk meminimalisir korupsi, kolusi, kolusi dan nepotisme.\r\n</p>\r\n<p>\r\nDengan e-goverment, kata dia, maka nantinya semua urusan menjadi less paper. Artinya pegawai di tingkat pemda dan kecamatan, tidak lagi menerima uang tunai. &quot;Tapi cukup menerima resi, sehingga sogok menyogok bisa diminimalisir,&quot; kata dia.\r\n</p>\r\n<p>\r\nTifatul sendiri mengaku tidak begitu asing dengan dunia Kominfo karena latar belakang pendidikannya cukup mendukung. Gelar sarjana strata satunya di bidang Informatika dan Komunikasi. Ia juga mengaju pernah bekerja selama delapan tahun di sistem informatika dan komunikasi PT Perusahaan Listrik Negara.\r\n</p>\r\n<p>\r\nSementara strata duanya di bidang politik internasional di Islamabad, Pakistan. &quot;Itu saja sih, pinter ya belum, diupayakan sesuai,&quot; kata dia.\r\n</p>\r\n<p>\r\nNamun ia berharap bisa menembus tantangan Kominfo ke depan, yakni perbedaan kemudahan akses di kota besar dan desa. Selain itu juga soal infrastruktur yang masih lemah. Masalah lain, kurangnya tayangan edukatif di bidang informasi. &quot;Dalam satu riset dikatakan 10 dari 75 tayangan di TV, radio masih bermasalah,&quot; kata dia.\r\n</p>\r\n<p>\r\nDia menambahkan, pelayanan informasi di Indonesia juga masih  lemah. Karena itu ia akan mengusahakan peningkatan layanan informasi ini. (Sumber: vivanews.com)\r\n</p>\r\n', 'Minggu', '2009-10-25', '07:49:46', '27tifatul_sembiring.jpg', '16', 'komputer');
INSERT INTO `artikel` VALUES ('93', '23', 'admin', 'Dalam Dua Pekan, KCB 2 Ditonton 1,5 Juta Penonton', 'dalam-dua-pekan-kcb-2-ditonton-15-juta-penonton', 'Y', '<p>\r\nFilm Ketika Cinta Bertasbih (KCB) 2 diyakini bakal mereguk sukses seperti sekuel pertamanya Sejak diputar perdana tanggal 17 September lalu atau selama 15 hari, film garapan SinemArt telah disaksikan 1,5 juta penonton. \r\n</p>\r\n<p>\r\nRekor yang sama juga dialami KCB 1. &quot;Pada pemutaran KCB 1 kami bisa memecah rekor pemutaran film di Indonesia, yaitu mendapat penonton sebanyak 100.000 perhari,&quot; ungkap Frans dari SinemArt saat promo film KCB 2 di Royal Plaza, Minggu (4/10).\r\n</p>\r\n<p>\r\nPihak SinemArt berharap KCB 2 bisa meraih prestasi minimal sama dengan KCB 1 dengan total 3 juta penonton. Untuk mencapai target tersebut, pihak SinemArt tak henti melakukan serangkaian promo di sejumlah kota di Tanah Air maupun di mancanegara.\r\n</p>\r\n<p>\r\n&quot;Hari ini (Minggu, 4/10), Kholidi (Kholidi Asadil Alam, pemeran Azzam) dan Oki (Oki Setiana Dewi pemeran Anna) ke Hongkong untuk promo di sana,&quot; imbuh Frans. Pekan depan (10-12 Oktober 2009), giliran Meyda Sefira berangkat ke Makau untuk kegiatan yang sama.\r\n</p>\r\n<p>\r\nFilm besutan sutradara Chaerul Umam ini juga dijadwalkan diputar di Aceh pada tanggal 11-12 Oktober mendatang. Menurut Frans, pemutaran KCB 1 di kota yang dikenal dengan sebutan Serambi Mekkah ini ditonton 8.000 orang.\r\n</p>\r\n<p>\r\nPadahal di kota tersebut sama sekali tidak ada gedung bioskop. Karena itu kru SinemArt terpaksa mengusung peralatan khusus dari Jakarta dan memutar di sebuah gedung khusus selama dua hari dalam tujuh kali show.\r\n</p>\r\n<p>\r\nBertutur tentang kesan berperan di KCB 2, Kholidi beberapa waktu lalu mengaku paling terkesan dengan adegan kecelakaan saat membonceng Bu&#39;e (Ninik L Karim). Karena ketika sepeda motornya terjatuh dia harus teriak memanggil ibundanya. &quot;Bu&#39;eee! Wah itu lumayan sulit,&quot; ungkap Kholidi.\r\n</p>\r\n<p>\r\nAdegan lain yang cukup berkesan adalah ketika pria asal Pasuruan ini terkapar di rumah sakit paska kecelakaan yang dia alami. &quot;Ekspresi orang sakitnya kan harus dapat. Terus suaranya juga harus disesuaikan, tidak seperti kita ngomong biasa, jadi agak sedikit tertahan di tenggorokan, powernya tidak full seperti ngomong biasanya,&quot; bebernya.\r\n</p>\r\n<p>\r\nUntuk adegan itu Kholidi yang kini menempuh pendidikan di Universitas Al Azhar, Jakarta melakukan observasi pada beberapa orang yang pernah mengalami kecelakaan. &quot;Aku juga tanya-tanya ke dokter. Ternyata di tempat tidurnya nggak bisa pakai bantal, posisi badannya harus lurus. Terus kalau ada gips di kaki, posisi jalan kita akan seperti apa. Biar nantinya terlihat lebih reel lah adengannya,&quot;  pungkas Kholidi. (sumber: <a href=\"http://surya.co.id\">surya.co.id</a>) \r\n</p>\r\n', 'Minggu', '2009-10-25', '07:55:45', '54kcb2.jpg', '53', 'film');
INSERT INTO `artikel` VALUES ('91', '2', 'admin', 'Manchester United Incar Zidane Baru', 'manchester-united-incar-zidane-baru', 'Y', '<p>\r\nManchester United sedang mengincar pemain muda Perancis berdarah Aljazair. Pemain itu adalah Sofiane Feghouli yang baru berusia 19 tahun.\r\n</p>\r\n<p>\r\nSofiane Feghouli saat ini memperkuat tim Liga Perancis, Grenoble Foot 38. Posisinya adalah di lapangan tengah.\r\n</p>\r\n<p>\r\nPemain yang punya tinggi badan 178 cm itu disebut punya gaya bermain yang serupa dengan Zinedine Zidane. Feghouli sudah masuk dalam tim nasional Perancis U-21.\r\n</p>\r\n<p>\r\nTak hanya MU yang menginginkan pemain yang pernah ditolak Paris Saint-Germain itu. Tim-tim besar macam Barcelona, Liverpool dan Inter Milan juga sedang mengambil ancang-ancang untuk mengajukan tawaran.\r\n</p>\r\n<p>\r\nSeperti diartikelkan Tribalfootball, MU sudah berencana untuk melakukan transaksi dengan Grenoble bulan Januari nanti. (Sumber: vivanews.com)\r\n</p>\r\n', 'Minggu', '2009-10-25', '13:58:18', '62sofiane.jpg', '20', 'sepakbola');
INSERT INTO `artikel` VALUES ('99', '19', 'admin', 'Editor TextArea Ala Ms Word', 'editor-textarea-ala-ms-word', 'Y', '<div style=\"text-align: center\">\r\n</div>\r\n<div style=\"text-align: center\">\r\n</div>\r\n<div style=\"text-align: center\">\r\n</div>\r\n<p>\r\nSecara standar, textarea akan ditampilkan apa adanya, artinya teks yang diketik tidak bisa diatur formatnya, misalnya apabila kita ingin kalimat tertentu ditebalkan, dimiringkan atau diatur jenis dan ukuran hurufnya. Hal ini tidak bisa dilakukan dalam textarea standar, kecuali Anda hapal perintah HTML, kemudian menuliskannya secara manual di textarea tersebut, namun bagi reporter atau user yang awam tentu hal ini cukup menyulitkan mereka.<br />\r\n<br />\r\nSolusinya, gunakan editor <strong>WYSIWYG</strong> (<em>What You See Is What You Get</em>) &ndash; Apa yang kau lihat adalah apa yang kau dapatkan. Menurut pengertian dari Wikipedia, WYSIWYG adalah suatu editor yang memungkinkan user untuk menentukan format, ukuran dan jenis huruf, menambahkan hyperlink dan tabel, dan juga bisa mengupload file, gambar, animasi flash, dan video.<br />\r\n</p>\r\n<div style=\"text-align: center\">\r\n<img src=\"http://localhost./lokomedia/tinymcpuk/gambar/Image/cktini.jpg\" alt=\" \" width=\"326\" height=\"72\" />\r\n</div>\r\n<p>\r\nSaat ini banyak sekali editor WYSIWYG, tapi daripada bingung memilih, saya sarankan untuk menggunakan <strong>TinyMCE</strong> atau <strong>CKEditor</strong>, karena kedua open source editor WYSIWYG tersebut sudah teruji di CMS sekelas Joomla dan Wordpress. Alasan lainnya, karena kelengkapan dokumentasi, kaya fiturnya, kompatibilitas browser, dukungan forum, update, dan plugins. \r\n</p>\r\n<p>\r\nSaat searching di Google, saya ketemu sama yang namanya <strong>tinyFCK</strong> (<a href=\"http://p4a2.crealabsfoundation.org/tinyfck\" target=\"_blank\">http://p4a2.crealabsfoundation.org/tinyfck</a>), editor WYSIWYG yang menggabungkan kelebihan dari TinyMCE dan CKEditor, atau yang lebih kompleks lagi, yaitu <strong>TinyMCPUK</strong>, karena selain menggabungkan kelebihan dari TinyMCE dan CKEditor, juga ditambahkan image manager yang berguna untuk memanipulasi gambar.\r\n</p>\r\n', 'Selasa', '2010-01-12', '02:27:42', '72office.jpg', '185', 'komputer');
INSERT INTO `artikel` VALUES ('101', '2', 'admin', 'Jadwal Lengkap Sepakbola Piala Dunia 2010', 'jadwal-lengkap-sepakbola-piala-dunia-2010', 'Y', '<p>\r\nPerhelatan akbar piala dunia 2010 yang diselenggrakan di Afsel (Afrika Selatan) akan jatuh pada bulan Juni nanti, walaupun pada piala dunia kali saya kurang antusias karena pemain pujaan tidak lagi bertanding, Zinedine Zidane, tapi tetep berusaha meyakinkan diri bahwa Perancis setidaknya dapat berbicara banyak nanti.<br />\r\n<br />\r\nBerikut ini adalah jadwal piala dunia 2010 berserta jam tayang, tanggal dan bulan, yang akan ditayangkan di ke 2 stasiun TV swasta yakni RCTI dan Global TV karena mereka yang dapat hak siar<br />\r\n<br />\r\n<strong>Keterangan</strong>: Waktu untuk pertandingan ialah GMT+1, yang perlu dilakukan untuk sesuaikan dengan waktu Indonesia cukup memajukan 6 jam saja karena Indonesia termasuk kedalam waktu GMT+7<br />\r\n<br />\r\nGrup A<br />\r\n<br />\r\nJumat, 11 Juni 2010<br />\r\nAfrika Selatan v Meksiko, 15:00<br />\r\nUruguay v Perancis, 19:30<br />\r\n<br />\r\nRabu, 16 Juni 2010<br />\r\nAfrika Selatan v Uruguay, 19:30<br />\r\n<br />\r\nKamis, 17 Juni 2010<br />\r\nFrance v Meksiko, 12:30<br />\r\n<br />\r\nSelasa, 22 Juni 2010<br />\r\nFrance v Afrika Selatan, 15:00<br />\r\nMeksiko v Uruguay, 15:00<br />\r\n<br />\r\nGrup B<br />\r\n<br />\r\nSabtu, 12 Juni 2010<br />\r\nArgentina v Nigeria, 12:30<br />\r\nKorea Selatan v Yunani, 15:00<br />\r\n<br />\r\nKamis, 17 Juni 2010<br />\r\nArgentina v Korea Selatan, 19:30<br />\r\nYunani v Nigeria, 15:00<br />\r\n<br />\r\nSelasa, 22 Juni 2010<br />\r\nYunani v Argentina, 19:30<br />\r\nNigeria v Korea Selatan, 19:30<br />\r\n<br />\r\nGrup C<br />\r\n<br />\r\nSabtu, 12 Juni 2010<br />\r\nEngland v USA, 19:30<br />\r\n<br />\r\nMinggu, 13 Juni 2010<br />\r\nAlgeria v Slovenia, 12:30<br />\r\n<br />\r\nJumat, 18 Juni 2010<br />\r\nEngland v Aljazair, 19:30<br />\r\nSlovenia v USA, 15:00<br />\r\n<br />\r\nRabu, 23 Juni 2010<br />\r\nSlovenia v England, 15:00<br />\r\nUSA v Aljazair, 15:00<br />\r\n<br />\r\nGrup D<br />\r\n<br />\r\nMinggu, 13 Juni 2010<br />\r\nJerman v Australia, 15:00<br />\r\nSerbia v Ghana, 19:30<br />\r\n<br />\r\nJumat, 18 Juni 2010<br />\r\nJerman v Serbia, 12:30<br />\r\n<br />\r\nSabtu, 19 Juni 2010<br />\r\nGhana v Australia, 12:30<br />\r\n<br />\r\nRabu, 23 Juni 2010<br />\r\nAustralia v Serbia, 19:30<br />\r\nGhana v Germany, 19:30<br />\r\n<br />\r\nGrup E<br />\r\n<br />\r\nSenin, 14 Juni 2010<br />\r\nJepang v Kamerun, 15:00<br />\r\nBelanda v denmark, 12:30<br />\r\n<br />\r\nSabtu, 19 Juni 2010<br />\r\nKamerun v denmark, 19:30<br />\r\nBelanda v Jepang, 15:00<br />\r\n<br />\r\nKamis, 24 Juni 2010<br />\r\nKamerun v Belanda, 19:30<br />\r\nDenmark v Jepang, 19:30<br />\r\n<br />\r\nGrup F<br />\r\n<br />\r\nSenin, 14 Juni 2010<br />\r\nItalia v Paraguay, 19:30<br />\r\n<br />\r\nSelasa, 15 Juni 2010<br />\r\nSelandia Baru v Slowakia, 12:30<br />\r\n<br />\r\nMinggu, 20 Juni 2010<br />\r\nItalia v Selandia Baru, 15:00<br />\r\nParaguay v Slowakia, 12:30<br />\r\n<br />\r\nKamis, 24 Juni 2010<br />\r\nParaguay v Selandia Baru, 15:00<br />\r\nSlovakia v Italia, 15:00<br />\r\n<br />\r\nGrup G<br />\r\n<br />\r\nSelasa, 15 Juni 2010<br />\r\nBrasil v Korea Utara, 19:30<br />\r\nPantai Gading v portugal, 15:00<br />\r\n<br />\r\nMinggu, 20 Juni 2010<br />\r\nBrasil v Pantai Gading, 19:30<br />\r\n<br />\r\nSenin, 21 Juni 2010<br />\r\nPortugal v Korea Utara, 12:30<br />\r\n<br />\r\nJumat, 25 Juni 2010<br />\r\nKorea Utara v Pantai Gading, 15:00<br />\r\nPortugal v Brazil, 15:00<br />\r\n<br />\r\nGrup H<br />\r\n<br />\r\nRabu, 16 Juni 2010<br />\r\nHonduras v Chili, 12:30<br />\r\nSpanyol v Swiss, 15:00<br />\r\n<br />\r\nSenin, 21 Juni 2010<br />\r\nChili v Swiss, 15:00<br />\r\nSpanyol v Honduras, 19:30<br />\r\n<br />\r\nJumat, 25 Juni 2010<br />\r\nChili v Spanyol, 19:30<br />\r\nSwiss v Honduras, 19:30\r\n</p>\r\n<p>\r\n(sumber: pialadunia2010com.com) \r\n</p>\r\n', 'Sabtu', '2010-04-10', '22:21:38', '54bola.jpg', '18', 'sepakbola');
INSERT INTO `artikel` VALUES ('102', '2', 'admin', 'Lionel Messi \'Berlumuran\' Rekor Gol', 'lionel-messi-berlumuran-rekor-gol', 'Y', '<p>\r\nTanpa ampun Lionel Messi menggelontor gawang Arsenal dengan empat gol\r\ndi Camp Nou. Dengan gol-gol itu, si andalan Barcelona pun bikin\r\nsejumlah raihan positif.<br />\r\n<br />\r\nDi hadapan sekitar 95 ribu penonton yang memadati Camp Nou, Rabu (7/4/2010) dinihari WIB, Barca memastikan laju ke semifinal usai Messi menjebol gawang Manuel Almunia pada menit 21,\r\n37, 42 dan 88. Arsenal sendiri hanya sempat membalas lewat gol Nicklas\r\nBendtner pada menit 18.<br />\r\n<br />\r\nDengan penampilan apik berbuah gol-gol\r\ntersebut, Messi dicatat situs Barca membuat sejumlah capaian. Berikut\r\ncapaian-capaian tersebut:<br />\r\n</p>\r\n<ul>\r\n	<li>\r\n	Ini adalah kali pertama Messi bikin\r\n	empat gol dalam satu pertandingan untuk Barca. Sebelumnya, si pemain\r\n	Argentina itu &quot;cuma&quot; bisa bikin lima hat-trick dan 18 kali membuat\r\n	sepasang gol dalam satu laga.</li>\r\n	<li>Messi menjadi pemain pertama musim ini yang berhasil membuat empat gol dalam satu laga di Liga Champions.</li>\r\n	<li>Messi menjadi satu dari enam pemain di dalam sejarah kompetisi ini\r\n	untuk membuat empat gol di satu partai. Sebelumnya telah ada Marco Van\r\n	Basten (AC Milan), Simone Inzaghi (Lazio), Dado Prso (M&ograve;naco), Ruud Van\r\n	Nistelroy (M. United) dan Andriy Shevchenko (AC Milan). Artinya, Messi\r\n	juga menjadi pemain pertama Barca yang melakukannya.</li>\r\n	<li>Berkat\r\n	tiga gol di paruh pertama, Messi menjadi satu dari sembilan pemain yang\r\n	mampu bikin hat-trick di babak pertama partai Liga Champions. Messi\r\n	adalah pemain pertama yang melakukannya musim ini.</li>\r\n	<li>Tambahan\r\n	empat gol ke gawang Arsenal membuat total gol Messi di Liga Champions\r\n	menjadi 25 gol. Ini menyamai pundi gol mantan pemain Barca, Rivaldo,\r\n	yang juga topskorer Barca dalam kompetisi tersebut.</li>\r\n	<li>Dengan\r\n	empat gol ke gawang Arsenal di satu partai, Messi membuat klub London\r\n	tersebut menjadi tim yang paling banyak dia bobol gawangnya di Eropa.\r\n	Sevilla dan Atletico Madrid adalah lumbung gol kesukaan Messi di La\r\n	Liga Primera dengan tujuh gol.</li>\r\n	<li>Dengan tambahan empat gol,\r\n	Messi kini menjadi topskorer sementara Liga Champions dengan delapan\r\n	gol. Pesaing terdekatnya adalah andalan Real Madrid --yang sudah\r\n	tersingkir-- Cristiano Ronaldo (tujuh gol) dan bintang Manchester\r\n	United Wayne Rooney (lima gol).</li>\r\n	<li>Messi sudah mengoleksi total\r\n	39 gol musim ini. Jumlah itu lebih banyak satu gol ketimbang musim\r\n	lalu. Messi kini bahkan melakukannya hanya dalam 42 laga, delapan\r\n	partai lebih sedikit dibandingkan musim lalu.</li>\r\n	<li>Empat gol ke\r\n	gawang Arsenal juga menambah catatan gol Messi di kandang Barca, yang\r\n	kini menjadi 67 gol. Sejumlah 52 gol lain dia buat di laga tandang.\r\n	</li>\r\n</ul>\r\n<p>\r\n(sumber: detiksport.com) \r\n</p>\r\n', 'Sabtu', '2010-04-10', '22:28:32', '51messi.jpg', '21', 'sepakbola');
INSERT INTO `artikel` VALUES ('103', '22', 'admin', 'Penanganan Gempa Berjalan Cepat, Presiden SBY Puas', 'penanganan-gempa-berjalan-cepat-presiden-sby-puas', 'Y', '<p>\r\nPresiden\r\nSusilo Bambang Yudhoyono (SBY) mengaku puas atas reaksi\r\ninstansi-instansi terkait dalam menangani gempa di Nanggroe Aceh\r\nDarussalam dan beberapa daerah di Sumatera pada Rabu (7/4) pukul 05.15\r\nWIB. Menurut Presiden, sistem reaksi cepat penanggulangan bencana telah\r\nberjalan dengan baik.<br />\r\n<br />\r\n&quot;Saya juga senang bahwa sistem telah\r\nberjalan karena begitu diterima gempa, satuan reaksi cepat\r\npenanggulangan bencana siap di Halim,&quot; kata Presiden di Bandara Halim\r\nPerdanakusuma, Rabu (7/4). Presiden menyampaikan hal itu sebelum\r\nbertolak menuju Hanoi, Vietnam untuk menghadiri KTT ASEAN hingga Sabtu\r\n(10/4).<br />\r\n<br />\r\nPresiden mengatakan, dirinya langsung berkomunikasi\r\nKetua Badan Nasional Penanggulangan Bencana (BNPB), Gubernur NAD, dan\r\nGubernur Sumatera Utara. Melalui komunikasi itu, Presiden mendapat\r\ninformasi bahwa kerusakan yang ditimbulkan tergolong ringan dan\r\npemadaman listrik sudah berakhir. Presiden mengucapkan terima kasih\r\natas kerja sigap instansi terkait.<br />\r\n<br />\r\nDalam kesempatan sama,\r\nMenteri Sosial, Salim Segaf Aljufri, mengatakan, dampak dari gempa di\r\nAceh itu tergolong ringan, tidak banyak bangunan yang rusak berat.\r\n&quot;Luka berat empat orang, seluruhnya 12 orang yang dirawat di rumah\r\nsakit,&quot; kata mantan Dubes RI di Arab Saudi ini.<br />\r\n<br />\r\nSalim\r\nmengatakan, gempa itu juga masih bisa ditangani oleh pemerintah daerah.\r\nAlasannya, stok bantuan bahan pangan di daerah masih mencukupi,\r\nkhususnya beras dan lauk pauk. &quot;Buffer stock kita di provinsi cukup,\r\nberas ada 50 ton,&quot; ujar Salim. Penyaluran bantuan pun belum ada kendala\r\nberarti.\r\n</p>\r\n<p>\r\n(sumber: republika.co.id) \r\n</p>\r\n', 'Sabtu', '2010-04-10', '22:32:19', '58sby.jpg', '10', '');
INSERT INTO `artikel` VALUES ('104', '23', 'admin', 'Film \'My Name is Khan\' Cetak Rekor di Amerika', 'film-my-name-is-khan-cetak-rekor-di-amerika', 'Y', '<p>Dengan US$1,86 juta pada <em>box office</em> di minggu pertamanya, film <em>My Name is Khan</em> yang dibintangi Shah Rukh Khan telah memecahkan rekor sebagai film India dengan pendapatan terbanyak yang diputar di Amerika Utara. <br /> <br /> Film arahan Karan Johar ini diperkirakan menghasilkan US$15.500 dari 120 bioskop di AS dan Kanada pada akhir pekan 12-14 Februari 2009. Rekor sebelumnya dipegang film musikal yang juga dibintangi Shah Rukh, <em>Om Shanti Om</em>, dengan pendapatan US$1,76 juta dari 114 bioskop saat dirilis pada 2007. <br /> <br /> Saat diluncurkan Jumat (12/2), <em>My Name is Khan</em> langsung mendapatkan US$444 ribu, lalu langsung meningkat 65% menjadi US$734.000 Sabtu (13/2). Tapi, film ini lalu menurun sebanyak 7% menjadi US$682 ribu pada Minggu (14/2) yang bertepatan dengan Hari Valentine. <br /> <br /> Terlebih lagi, <em>My Name is Khan</em> mendapatkan pujian dari kritikus AS. Publikasi surat kabar <em>Hollywood Reporter</em> mengatakan, \"Ini sepadan untuk perjalanan selama 162 menit. Shah Rukh Khan datang ke Amerika (walau melalui film Bollywood) dan telah menunjukkan bahwa dirinya adalah megabintang India,\" tambahnya. <br /> <br /> \"Yang khas dari bintang Bollywood adalah mereka tidak hanya aktor yang berkualitas, tapi juga memiliki kharisma. Jadi, tidak mengejutkan bila menemukan megabintang Shah Rukh Khan dalam <em>My Name is Khan</em>. Tampaknya ia sedang menantang dirinya sendiri untuk meningkatkan kemampuan aktingnya dan memperluas jaringan penggemar internasionalnya.\" <br /> <br /> \"Dengan arahan sutradara andal Karan Johar dan musik pengiring yang menggugah oleh Shankar, Ehsaan &amp; Loy, Khan membuat kita mudah meneteskan air mata seraya mengajarkan kita mengenai Islam dan toleransi,\" kata surat kabar <em>Times</em>. <br /> <br /> Di dalam negeri sendiri, pada saat rilis perdananya, Jumat (12/2), hanya 13 bioskop yang memutarnya dari awal rencana 63 bioskop. Tapi, pada Sabtu (13/2), semua bioskop di Mumbai, Pune, dan Maharashra telah menayangkannya. Terakhir, pendapatan film tersebut di seluruh dunia telah mencapai US$18 juta.</p>\r\n<p>(sumber: mediaindonesia.com)</p>', 'Sabtu', '2010-04-10', '22:46:50', '39khan.jpg', '19', 'film');
INSERT INTO `artikel` VALUES ('105', '2', 'admin', 'Taufik Berada di Grup Maut Kejuaran Dunia Bulutangkis', 'taufik-berada-di-grup-maut-kejuaran-dunia-bulutangkis', 'Y', '<p>\r\nTaufik Hidayat akan menghadapi pemain China, Bao Chunlai, di babak awal pertadingan Grup A \r\nkejuaraan World Super Series Masters Finals, Rabu (2/11).<br />\r\n<br />\r\nTaufik,\r\nyang merupakan satu-satunya pemain tunggal putra asal Indonesia,\r\nbergabung di Grup A bersama peringkat satu dunia Lee Chong Wei, Bao\r\nChunlai, serta pemain China Taipei, Hsieh Yu Hsin.<br />\r\n<br />\r\nMemakai\r\nsistem pertandingan round robin, Taufik akan menghadapi Chunlai,\r\nsedangkan Chong Wei bertemu dengan Hsieh Yu Hsin dalam pertandingan\r\nlainnya, Rabu (2/11).<br />\r\n<br />\r\nGrup A dianggap sebagai grup neraka atau\r\nmaut, sedangkan Grup B terdiri dari dua pemain Denmark, Peter Hoeg Gade\r\ndan Jan O Jorgensen, serta pemain Thailand, Boonsak Ponsana.<br />\r\n<br />\r\nTaufik\r\nsendiri menjadi satu-satunya pemain tunggal asal Indonesia setelah Sony\r\nDwi Kuncoro dan Simon Santoso absen karena diprioritaskan bermain di\r\najang SEA Games, Laos, Desember ini.<br />\r\n<br />\r\nPeraih medali emas\r\nOlimpiade Atlanta 2004 ini mengaku siap menghadapi tantangan di grup\r\nyang berat ini. Di jejaring sosial Facebook, ia menulis, &quot;Death Group?&quot;\r\nTantangan berat di Johor Bahru, tapi harus memberi yang terbaik! Let&#39;s\r\nGo!\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<div style=\"text-align: center\">\r\n<img src=\"http://localhost./lokomedia/tinymcpuk/gambar/Image/taufik_hidayat.jpg\" alt=\" \" width=\"350\" height=\"250\" />\r\n</div>\r\n<br />\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\nGrup A<br />\r\n1 [MAS] LEE Chong Wei<br />\r\n1 [CHN] BAO Chunlai <br />\r\n1 [INA] HIDAYAT Taufik<br />\r\n1 [TPE] HSIEH Yu Hsin<br />\r\n<br />\r\nGrup B<br />\r\n1 [DEN] GADE Peter Hoeg<br />\r\n1 [KOR] PARK Sung Hwan <br />\r\n1 [DEN] O JORGENSEN Jan<br />\r\n1 [THA] PONSANA Boonsak\r\n</p>\r\n<p>\r\n(sumber: artikeljitu.com) \r\n</p>\r\n', 'Sabtu', '2010-04-10', '22:51:14', '92taufik.jpg', '75', 'tenis');
INSERT INTO `artikel` VALUES ('122', '22', 'admin', 'Terima Kasih Gayus Tambunan', 'terima-kasih-gayus-tambunan', 'Y', '<p>\r\nSekali lagi, terima kasih Gayus Tambunan! Kita semua mesti berterima \r\nkasih pada pegawai Pajak golongan III A  ini.\r\nGara-gara aksinya terbongkar, semua mata kini memandang ke kasus  \r\npenggelapan pajak yang menimpanya. 25 Milyar rupiah bukan jumlah yang  \r\nsedikit. Apalagi dimiliki seorang pegawai negeri sipil yang gaji per  \r\nbulan plus tunjangan ini itu 12 jutaan.\r\n</p>\r\n<p>\r\nBerterima kasihlah pada Gayus. Karena berkat jasanya lah kasus  Century \r\njadi temaram. Siapa yang peduli dengan kasus 6,7 trilyun yang  tak jelas\r\nkemana itu. Setidaknya kini media massa ramai-ramai berdendang  lagu \r\nGAYUS. Lupakan huru hara di panggung paripurna DPR bulan lalu.  Lupakan \r\npula rekomendasi yang meminta penon aktifan dua petinggi negara,  Wapres\r\nBoediono dan Menteri Keuangan Sri Mulyani.\r\n</p>\r\n<p>\r\nKini arahkan pandangan kita pada rumah megah Gayus di Kelapa Gading.  \r\nSaya sendiri hanya berdecak kaget. Wow, darimana ya si Gayus yang masih \r\n30 tahunan itu bisa membangun istana semegah itu?\r\n</p>\r\n<p>\r\nBenarkah itu <em>tilepan</em> pajak rakyat? Atau suap para  pengemplang \r\npajak agar cuma bayar pajak dalam jumlah kecil. Entahlah.\r\n</p>\r\n<p>\r\nYang jelas saya ingin berucap terima kasih pada Gayus, karena berkat  \r\nkasusnya KPK, kepolisian, kejaksaan, atau para pengacara kondang bakal  \r\ndapat job menggiurkan. Ya siapa tahu kecipratan 25 M!\r\n</p>\r\n<p>\r\nGayus, di tangan saya masih ada form SPT yang baru terisi separuhnya.  \r\nSaya berencana menyerahkan form ini sebelum &ldquo;D&rdquo; day 31 Maret mendatang. \r\nTapi hati saya galau. Sebagai warga negara yang baik saya biasanya taat\r\nbayar pajak. Karena saya sadar pajak itu akan kembali pada kita \r\nsebagai  warga dalam bentuk layanan dan fasilitas publik.\r\n</p>\r\n<p>\r\nTapi, kelakuanmu Gayus, membuat saya dan juga pembayar pajak yang  taat \r\nterluka. Apalah artinya laporan pajak saya yang &#39;cuma&#39; beberapa  juta \r\nrupiah ini, jika ternyata uang pajak yang mestinya disalurkan  \r\ndikemplang pegawainya sendiri?\r\n</p>\r\n<p>\r\nHaruskah saya bayar pajak, Gayus? (sumber:www.kompas.com)\r\n</p>\r\n', 'Kamis', '2011-02-10', '23:23:57', '80gayus.jpg', '28', 'gayus');
INSERT INTO `artikel` VALUES ('121', '2', 'admin', 'Hantam Laos 6-0, Indonesia Semifinal', 'hantam-laos-60-indonesia-semifinal', 'Y', '<p>\r\nIndonesia menang meyakinkan atas Laos. Enam\r\ngol mereka lesakkan, membuat mereka lolos ke semifinal dengan status \r\njuara Grup A. Di stadion Gelora Bung Karno, Sabtu (4/12/2010), \r\nIndonesia langsung menekan sejak awal laga. Lewat sebuah serangan balik,\r\nIndonesia mengancam pertahanan Laos melalui M. Ridwan di sisi sayap \r\nkanan. Tapi umpan silang Ridwan masih bisa dihalau. Sepak pojok untuk \r\nIndonesia.\r\n</p>\r\n<p>\r\nPada menit ketujuh, Ridwan kembali mencoba \r\nperuntungannya. Tapi tendangan kaki kananannya dari luar kotak penalti \r\nmembentur tubuh pemain Laos. Kembali, Indonesia mendapatkan sepak pojok.<br />\r\n<br />\r\nSemenit\r\nberselang, umpan silang Firman Utina di sayap kiri diterima oleh Hamka \r\nHamzah di tiang jauh. Sial bagi Hamka, sundulannya masih melenceng \r\ntipis.<br />\r\n<br />\r\nOoh! Laos mendapatkan kesempatan emas pertamanya dalam \r\nlaga ini. Sepakan Kaysone Soukhavong dari luar kotak penalti membentur \r\ntiang gawang Indonesia. Nyaris.<br />\r\n<br />\r\nPenalti untuk Indonesia! Cristian\r\nGonzales dijatuhkan di dalam kotak penalti ketika memggiring bola di \r\ndalam kotak penalti.<br />\r\n<br />\r\nFirman Utina maju menjadi eksekutornya, dan \r\nkapten Indonesia ini berhasil mengecoh kiper Sengphachan Bounthisanh \r\nuntuk membawa Indonesia unggul 1-0.<br />\r\n<br />\r\nGol lagi untuk Indonesia! \r\nAksi Ridwan, usai memanfaatkan blunder operan Kitsada, membawa Indonesia\r\nunggul 2-0 atas Laos.<br />\r\n<br />\r\nRidwan membawa bola sendirian ke dalam \r\nkotak penalti, ia mengecoh kiper Bounthisanh, dan menceploskan bola ke \r\ndalam gawang, meski sempat terpeleset. <br />\r\n<br />\r\nIndonesia memulai babak \r\nkedua dengan baik, dan tepat pada menit 49 &#39;Garuda&#39; kembali membobol \r\njala Laos. Kembali Firman yang menjadi pencetak golnya.<br />\r\n<br />\r\nGol \r\ntersebut diawali oleh operan satu-dua dengan Ridan di luar kotak \r\npenalti. Begitu kembali menerima bola, Firman melepaskan sepakan kaki \r\nkanan ke tiang jauh. Indonesia unggul 3-0.<br />\r\n<br />\r\nKeunggulan Indonesia \r\nbertambah besar menjadi 4-0 di menit 51 dan yang menjadi pendulangnya \r\nadalah Irfan Bachdim. Ini adalah gol keduanya dalam turnamen ini.<br />\r\n<br />\r\nGol\r\nkeempat Indonesia itu tercipta setelah Irfan melakukan operan satu-dua \r\ndengan Cristian Gonzales. Lewat satu sepakan kaki kanan ke tiang jauh, \r\nIrfan pun membobol jala Laos.<br />\r\n<br />\r\nTekanan Indonesia ke pertahana Laos\r\nakhirnya kembali berbuah hasil di menit 76. Berawal dari umpan lambung \r\nFirman, terjadi kemelut di dalam kotak penalti Laos.<br />\r\n<br />\r\nSepakan \r\nHamka masih bisa ditepis Bounthisanh, tapi bola disambar oleh Arief \r\nSuyono dan terciptalah gol kelima Indonesia. Ini adalah gol kedua Arief \r\ndalam turnamen ini.<br />\r\n<br />\r\nGol lagi! Indonesia unggul jauh 6-0 atas Laos\r\ndi menit 80 dengan diawali oleh umpan terobosan Irfan kepada Okto \r\nManiani. Lewat kecepatannya, Okto mengungguli dua pemain Laos dan \r\nmelepaskan tendangan kaki kiri ke tiang dekat. Si pemain nomor 10 ini \r\nakhirnya mencetak gol.<br />\r\n<br />\r\nAksi Okto itu kemudian menjadi gol penutup\r\ndalam pertandingan ini. Indonesia menang enam gol tanpa balas dan \r\nberhak melaju ke semifinal dengan status juara Grup A. \r\n</p>\r\n', 'Kamis', '2011-02-10', '23:22:35', '1bachdim.jpg', '23', 'sepakbola');
INSERT INTO `artikel` VALUES ('120', '23', 'admin', 'Saat Raja Belajar Bertutur Kata', 'saat-raja-belajar-bertutur-kata', 'Y', '<p>Ini dia film yang meraih perolehan nominator terbanyak dalam acara Academy Awards ke 83. Dari 24 jumlah nominasi yang ada, The King\'s Speech berhasil meraih setengahnya dan menjadikan film produksi See Saw Films dan Bedlam Productions itu merajai Oscar 2011 yang merupakan ajang perfilman paling bergengsi di dunia.<br /> <br /> Setelah kematian ayahandanya, raja George V (Michael Gambon), pangeran Albert (Colin Firth) akhirnya dinobatkan sebagai raja. Diangkatnya ayah dua anak ini menjadi raja baru Inggris karena sang kakak, pangeran Edward VIII (Guy Pearce) yang seharusnya berkuasa, rela turun tahta karena lebih memilih seorang janda keturunan Amerika untuk dinikahinya. <br /> <br /> Tapi apa jadinya jika seorang raja menderita kesulitan berbicara?terutama pada saat berpidato. Karena sebelum dinobatkan sebagai Raja, beberapa kali Bertie (panggilan pangeran Albert dari orang-orang terdekatnya) harus mewakili pidato ayahnya yang sakit, baik secara langsung maupun melalui siaran radio dan hasilnya sangat mengecewakan bagi siapa saja yang mendengarnya.<br /> <br /> Dibantu sang istri tercinta, Elizabeth (Helena Bonham Carter), Raja George VI menemui ahli terapi bicara bersama Lionel Logue (Geoffrey Rush) yang eksentrik. Pertemuan keduanya walau diawali dengan perseteruan, keduanya akhirnya menjalani program terapi dan akhirnya membentuk ikatan yang tak terpisahkan.<br /> <br /> Masalah raja George VI ternyata bukan hanya dari dalam dirinya saja, dengan keadaan negara yang diambang peperangan, raja baru itu akhirnya melakukan pidato pertamanya di radio BBC untuk rakyat dan negaranya. Dengan dukungan dari Lionel, keluarga, pemerintah dan Winston Churchill (Timothy Spall), mampukah raja baru ini menginspirasi seluruh Inggris untuk bersiap melawan kebrutalan tentara Jerman.<strong><br /> </strong> <br /> Kejeniusan sang sutradara mengemas film akhirnya memberikan jaminan <strong>The King\'s Speech</strong> menjadi tontonan yang sangat menarik. Anda akan merasakan emosi sekaligus tertawa saat melihat Colin Firth yang sangat mendalami karakter raja George VI. Akting Geoffrey Rush sebagai ahli bicara membuktikan dirinya memang jago berbicara, bahkan di hadapan seorang Raja.</p>', 'Kamis', '2011-02-10', '23:15:39', '89speech.jpg', '10', 'film');
INSERT INTO `artikel` VALUES ('124', '19', 'admin', 'Angry Birds Siap Hadirkan Budaya Indonesia', 'angry-birds-siap-hadirkan-budaya-indonesia', 'Y', '<p>Game mobile Angry Birds yang tengah digandrungi, rencananya akan masuk pasar Indonesia. Tim game Rovio ingin menggaet developer tanah air. Mereka mengaku mengharapkan kelahiran Angry Birds yang khas Indonesia.</p>\r\n<p>\"Kami mengerti (keinginan) itu. Siapa tahu nantinya Angry Birds ala Indonesia akan memakai batik,\" ungkap Chief Marketing Officer Rovio, Peter Vesterbacka, saat ditemui di Hotel Kempinski, Jakarta, Rabu (25/1). \"Tapi kami ingin menyelami lebih dalam. Apa saja yang bisa digali dari Indonesia.\"</p>\r\n<p>Peter juga mengungkapkan telah menerima banyak masukan untuk menghadirkan wayang, batik, garuda dan Bali di game tersebut. Untuk itu, Rovio bersama Nokia kemudian menggelar kompetisi. Diharapkan dari situ akan lahir Angry Birds yang \"Indonesia Banget\".</p>\r\n<p>Sayangnya, Peter enggan menyebutkan kapan tepatnya rencana itu akan direalisasikan. Namun ini tetap menjadi kabar baik untuk developer lokal untuk semakin berkibar. \"Pengembang aplikasi di Indonesia memiliki potensi dan talenta untuk dikembangkan,\" lanjut Peter yakin.</p>\r\n<p>(sumber: wowkeren.com)</p>', 'Sabtu', '2012-02-11', '01:14:45', '32angrybird.jpg', '95', 'film');

-- ----------------------------
-- Table structure for atas
-- ----------------------------
DROP TABLE IF EXISTS `atas`;
CREATE TABLE `atas` (
  `id_atas` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  PRIMARY KEY (`id_atas`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of atas
-- ----------------------------
INSERT INTO `atas` VALUES ('1', 'head', '', 'logo.png', '2013-11-02');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id_banner` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `posisi` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  PRIMARY KEY (`id_banner`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('13', 'Snack Bouquet', 'bawah', 'http://', 'Snack Bouquet.jpg', '2016-10-20');
INSERT INTO `banner` VALUES ('14', 'Jaket Unesa', 'bawah', 'http://', 'Jaket Unesa.jpg', '2016-10-20');
INSERT INTO `banner` VALUES ('15', 'Kaos Unesa', 'bawah', 'http://', 'Kaos Unesa.jpg', '2016-10-20');

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id_download` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  PRIMARY KEY (`id_download`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for facebook
-- ----------------------------
DROP TABLE IF EXISTS `facebook`;
CREATE TABLE `facebook` (
  `id_fb` int(5) NOT NULL AUTO_INCREMENT,
  `nama_widget` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `alamat_fb` varchar(500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_fb`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of facebook
-- ----------------------------
INSERT INTO `facebook` VALUES ('12', 'Asrifin Sofi', 'https://www.facebook.com/sarungmotorsuper/?fref=ts&ref=br_tf');

-- ----------------------------
-- Table structure for fakultas
-- ----------------------------
DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL AUTO_INCREMENT,
  `fakultas` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fakultas`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fakultas
-- ----------------------------
INSERT INTO `fakultas` VALUES ('1', 'FT');
INSERT INTO `fakultas` VALUES ('2', 'FE');
INSERT INTO `fakultas` VALUES ('3', 'FMIPA');
INSERT INTO `fakultas` VALUES ('4', 'FIS');
INSERT INTO `fakultas` VALUES ('5', 'FIP');
INSERT INTO `fakultas` VALUES ('6', 'FIK');
INSERT INTO `fakultas` VALUES ('7', 'FIB');

-- ----------------------------
-- Table structure for header
-- ----------------------------
DROP TABLE IF EXISTS `header`;
CREATE TABLE `header` (
  `id_header` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  PRIMARY KEY (`id_header`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of header
-- ----------------------------
INSERT INTO `header` VALUES ('1', 'DaichaShop', 'semua-produk.html', 'DaichaShop..Best Online Shop, Mudah, murah, dan Terpercaya..', 'banner-width1.png', '2014-12-20');
INSERT INTO `header` VALUES ('2', 'We Serve Betterx', 'semua-produk.html', 'We Serve Better...Segera Order dan Dapatkan Produk terbaik kamix', 'banner-width2.png', '2014-12-20');

-- ----------------------------
-- Table structure for htmlkanan
-- ----------------------------
DROP TABLE IF EXISTS `htmlkanan`;
CREATE TABLE `htmlkanan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `isi_html` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of htmlkanan
-- ----------------------------

-- ----------------------------
-- Table structure for htmlkiri
-- ----------------------------
DROP TABLE IF EXISTS `htmlkiri`;
CREATE TABLE `htmlkiri` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `isi_html` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of htmlkiri
-- ----------------------------

-- ----------------------------
-- Table structure for hubungi
-- ----------------------------
DROP TABLE IF EXISTS `hubungi`;
CREATE TABLE `hubungi` (
  `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `dibuka` int(5) NOT NULL DEFAULT '1',
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_hubungi`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of hubungi
-- ----------------------------
INSERT INTO `hubungi` VALUES ('1', 'omah', 'computerz.engineerz@gmail.com', 'Cara konsinyasi bagaimana?', 'Bagaimana Cara Kerjasama Penjualan Produk?', '5', '2016-09-11');
INSERT INTO `hubungi` VALUES ('2', 'asrifin', 'asrifin_ilham@yahoo.com', 'cara Daftar Koperasi Mahasiswa Di Kopma Unesa Bagaimana Caranya?', 'Nyoba Kirim Pesan', '5', '2016-09-25');

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `jurusan` varchar(100) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  PRIMARY KEY (`id_jurusan`),
  KEY `id_fakultasFK` (`id_fakultas`) USING BTREE,
  CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES ('1', 'Tkenik elektro', '1');
INSERT INTO `jurusan` VALUES ('2', 'Teknik mesin', '1');
INSERT INTO `jurusan` VALUES ('4', 'Teknik Informatika', '1');
INSERT INTO `jurusan` VALUES ('5', 'PKK', '1');
INSERT INTO `jurusan` VALUES ('7', 'Ekonomi', '2');
INSERT INTO `jurusan` VALUES ('8', 'Akutansi', '2');
INSERT INTO `jurusan` VALUES ('9', 'Manajemen Pendidikan', '5');
INSERT INTO `jurusan` VALUES ('10', 'Teknologi Pendidikan', '5');

-- ----------------------------
-- Table structure for katajelek
-- ----------------------------
DROP TABLE IF EXISTS `katajelek`;
CREATE TABLE `katajelek` (
  `id_jelek` int(11) NOT NULL AUTO_INCREMENT,
  `kata` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `ganti` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_jelek`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of katajelek
-- ----------------------------
INSERT INTO `katajelek` VALUES ('4', 'sex', 's**');
INSERT INTO `katajelek` VALUES ('2', 'bajingan', 'b*******');
INSERT INTO `katajelek` VALUES ('3', 'bangsat', 'b******');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES ('19', 'Sepatu Gaul', 'sepatu-gaul');
INSERT INTO `kategori` VALUES ('20', 'T-Shirt Keren', 'tshirt-keren');

-- ----------------------------
-- Table structure for komentar
-- ----------------------------
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE `komentar` (
  `id_komentar` int(5) NOT NULL AUTO_INCREMENT,
  `id_artikel` int(5) NOT NULL,
  `nama_komentar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_komentar`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES ('12', '71', 'Wisnu', 'wisnu.wordpress.com', 'pertamax', '2009-02-02', '08:10:23', 'Y');
INSERT INTO `komentar` VALUES ('13', '71', 'Adrian', 'adrian.blogspot.com', 'CR 7 emang idola gua, melesat terus ya prestasinya.', '2009-02-02', '09:06:01', 'Y');
INSERT INTO `komentar` VALUES ('15', '79', 'Armen', 'detik.com', 'ahmadinejad emang idolaku', '2009-02-03', '10:05:20', 'Y');
INSERT INTO `komentar` VALUES ('17', '74', 'Lukman', 'hakim.com', 'apakah browser google secanggih search enginenya?', '2009-02-21', '10:12:23', 'Y');
INSERT INTO `komentar` VALUES ('34', '92', 'Rudi', 'bukulokomedia.com', ' Kalau  tentang  gue,  kapan  dibuat  filmnya  ya?   ', '2009-10-28', '21:21:21', 'Y');
INSERT INTO `komentar` VALUES ('22', '77', 'Raihan', 'bukulokomedia.com', 'mas .. tolong kirimin source code proyek lokomedia&nbsp; ke email saya di raihan@gmail.com', '2009-08-25', '16:30:00', 'Y');
INSERT INTO `komentar` VALUES ('23', '77', 'Wawan', 'bukulokomedia.com', 'woi .. kunjungin dong website saya di http://bukulokomedia.com, jangan lupa kasih komen dan sarannya ya.', '2009-08-25', '16:31:50', 'Y');
INSERT INTO `komentar` VALUES ('36', '93', 'Lukman', 'google.com', 'tes  kata-kata  jelek  sex   ', '2009-11-04', '10:04:26', 'Y');
INSERT INTO `komentar` VALUES ('65', '85', 'hilman', 'antonhilman.com', ' emang  sih,  windows  7  lebih  cepat  dibandingkan  vista,  tapi  masih  banyak  bug  bung.   ', '2010-01-15', '04:16:25', 'Y');
INSERT INTO `komentar` VALUES ('66', '78', 'ronaldinho', 'ronaldino.com', ' ronaldo  pantas  mendapatkannya  tahun  ini  dan  kayaknya  tahun  depan  masih  menjadi  miliknya.   ', '2010-01-15', '04:18:08', 'Y');
INSERT INTO `komentar` VALUES ('67', '99', 'lukman', 'bukulokomedia.com', ' tes   ', '2010-02-11', '02:42:46', 'Y');
INSERT INTO `komentar` VALUES ('69', '99', 'fathan', 'bukulokomedia.com', 'keduax', '2010-02-15', '07:44:12', 'Y');
INSERT INTO `komentar` VALUES ('70', '99', 'Rianto', 'bukulokomedia.com', ' kok  nggak  ada  yang  pertamax  ..  langsung  keduax  sih.   ', '2010-05-16', '11:33:26', 'Y');
INSERT INTO `komentar` VALUES ('72', '99', 'lokomedia', 'bukulokomedia.com', ' test  paging  komentar   ', '2012-01-03', '17:50:14', 'Y');
INSERT INTO `komentar` VALUES ('73', '99', 'husada', 'bukulokomedia.com', ' perbaikan  paging  halaman  komentar   ', '2012-01-03', '17:53:03', 'Y');
INSERT INTO `komentar` VALUES ('74', '99', 'hendra', 'bukulokomedia.com', ' iya  kemarin  sudah  saya  coba  yang  CMS  Lokomedia  versi  1.5,  paging  komentarnya  masih  error.   ', '2012-01-03', '17:53:59', 'Y');
INSERT INTO `komentar` VALUES ('75', '99', 'lukman', 'bukulokomedia.com', ' @  husada  dan  hendra:  terimakasih  atas  perbaikan  bugnya.   ', '2012-01-03', '17:54:41', 'Y');
INSERT INTO `komentar` VALUES ('76', '99', 'lokomedia', 'bukulokomedia.com', ' pada  versi  1.5.5,  bug  paging  halaman  komentar  sudah  diperbaiki.   ', '2012-01-03', '17:55:27', 'Y');
INSERT INTO `komentar` VALUES ('77', '99', 'hendra', 'bukulokomedia.com', '<p>paging halaman komentar sudah berjalan dengan baik, terima kasih</p>\r\n', '2012-01-03', '17:56:12', 'Y');

-- ----------------------------
-- Table structure for kota
-- ----------------------------
DROP TABLE IF EXISTS `kota`;
CREATE TABLE `kota` (
  `id_kota` int(3) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=MyISAM AUTO_INCREMENT=5515 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kota
-- ----------------------------
INSERT INTO `kota` VALUES ('1', 'Mataram', '25000');
INSERT INTO `kota` VALUES ('2', 'Ampenan', '25000');
INSERT INTO `kota` VALUES ('3', 'Cakranegara', '25000');
INSERT INTO `kota` VALUES ('4', 'Bima', '35000');
INSERT INTO `kota` VALUES ('5', 'Asakota', '35000');
INSERT INTO `kota` VALUES ('6', 'Rasanae Barat', '35000');
INSERT INTO `kota` VALUES ('7', 'Rasanae Timur', '35000');
INSERT INTO `kota` VALUES ('8', 'Raba', '35000');
INSERT INTO `kota` VALUES ('9', 'Mpunda', '35000');
INSERT INTO `kota` VALUES ('10', 'Dompu', '35000');
INSERT INTO `kota` VALUES ('11', 'Hu\'u', '66000');
INSERT INTO `kota` VALUES ('12', 'Kempo', '66000');
INSERT INTO `kota` VALUES ('13', 'Kilo', '66000');
INSERT INTO `kota` VALUES ('14', 'Pajo', '66000');
INSERT INTO `kota` VALUES ('15', 'Pekat', '66000');
INSERT INTO `kota` VALUES ('16', 'Woja', '44000');
INSERT INTO `kota` VALUES ('17', 'Manggelewa', '44000');
INSERT INTO `kota` VALUES ('18', 'Praya', '35000');
INSERT INTO `kota` VALUES ('19', 'Batukliang', '44000');
INSERT INTO `kota` VALUES ('20', 'Janapria', '44000');
INSERT INTO `kota` VALUES ('21', 'Jonggat', '44000');
INSERT INTO `kota` VALUES ('22', 'Kopang', '44000');
INSERT INTO `kota` VALUES ('23', 'Praya Barat', '35000');
INSERT INTO `kota` VALUES ('24', 'Praya Timur', '35000');
INSERT INTO `kota` VALUES ('25', 'Pringgarata', '44000');
INSERT INTO `kota` VALUES ('26', 'Pujut', '44000');
INSERT INTO `kota` VALUES ('27', 'Batukliang Utara', '44000');
INSERT INTO `kota` VALUES ('28', 'Praya Barat Daya', '35000');
INSERT INTO `kota` VALUES ('29', 'Praya Tengah', '35000');
INSERT INTO `kota` VALUES ('30', 'Selong', '35000');
INSERT INTO `kota` VALUES ('31', 'Aikmel', '44000');
INSERT INTO `kota` VALUES ('32', 'Keruak', '44000');
INSERT INTO `kota` VALUES ('33', 'Mas Bagik', '44000');
INSERT INTO `kota` VALUES ('34', 'Pringgabaya', '66000');
INSERT INTO `kota` VALUES ('35', 'Sakra', '44000');
INSERT INTO `kota` VALUES ('36', 'Sambelia', '66000');
INSERT INTO `kota` VALUES ('37', 'Sikur', '44000');
INSERT INTO `kota` VALUES ('38', 'Sukamulia', '44000');
INSERT INTO `kota` VALUES ('39', 'Terara', '44000');
INSERT INTO `kota` VALUES ('40', 'Jerowaru', '44000');
INSERT INTO `kota` VALUES ('41', 'Montong Gading', '44000');
INSERT INTO `kota` VALUES ('42', 'Pringgasela', '44000');
INSERT INTO `kota` VALUES ('43', 'Sakra Barat', '44000');
INSERT INTO `kota` VALUES ('44', 'Sakra Timur', '44000');
INSERT INTO `kota` VALUES ('45', 'Sembalun', '66000');
INSERT INTO `kota` VALUES ('46', 'Suela', '44000');
INSERT INTO `kota` VALUES ('47', 'Suralaga', '44000');
INSERT INTO `kota` VALUES ('48', 'Wanasaba', '44000');
INSERT INTO `kota` VALUES ('49', 'Labuhan Haji', '44000');
INSERT INTO `kota` VALUES ('50', 'Sumbawa Besar', '35000');
INSERT INTO `kota` VALUES ('51', 'Alas', '44000');
INSERT INTO `kota` VALUES ('52', 'Batu Lanteh', '66000');
INSERT INTO `kota` VALUES ('53', 'Empang', '44000');
INSERT INTO `kota` VALUES ('54', 'Lape-Lopok', '44000');
INSERT INTO `kota` VALUES ('55', 'Lunyuk', '66000');
INSERT INTO `kota` VALUES ('56', 'Moyohilir', '44000');
INSERT INTO `kota` VALUES ('57', 'Moyohulu', '44000');
INSERT INTO `kota` VALUES ('58', 'Plampang', '44000');
INSERT INTO `kota` VALUES ('59', 'Ropang', '66000');
INSERT INTO `kota` VALUES ('60', 'Utan-Rhee', '44000');
INSERT INTO `kota` VALUES ('61', 'Alas Barat', '44000');
INSERT INTO `kota` VALUES ('62', 'Labangka', '66000');
INSERT INTO `kota` VALUES ('63', 'Labuhan Badas', '44000');
INSERT INTO `kota` VALUES ('64', 'Sumbawa', '35000');
INSERT INTO `kota` VALUES ('65', 'Gerung', '35000');
INSERT INTO `kota` VALUES ('66', 'Bayan', '66000');
INSERT INTO `kota` VALUES ('67', 'Gangga', '66000');
INSERT INTO `kota` VALUES ('68', 'Kediri', '44000');
INSERT INTO `kota` VALUES ('69', 'Labu Api', '44000');
INSERT INTO `kota` VALUES ('70', 'Narmada', '44000');
INSERT INTO `kota` VALUES ('71', 'Sekotong Tengah', '66000');
INSERT INTO `kota` VALUES ('72', 'Tanjung', '44000');
INSERT INTO `kota` VALUES ('73', 'Batu Layar', '44000');
INSERT INTO `kota` VALUES ('74', 'Gunung Sari', '44000');
INSERT INTO `kota` VALUES ('75', 'Kayangan', '66000');
INSERT INTO `kota` VALUES ('76', 'Kuripan', '44000');
INSERT INTO `kota` VALUES ('77', 'Lembar', '44000');
INSERT INTO `kota` VALUES ('78', 'Lingsar', '44000');
INSERT INTO `kota` VALUES ('79', 'Pemenang', '66000');
INSERT INTO `kota` VALUES ('80', 'Taliwang', '35000');
INSERT INTO `kota` VALUES ('81', 'Jereweh', '44000');
INSERT INTO `kota` VALUES ('82', 'Seteluk', '66000');
INSERT INTO `kota` VALUES ('83', 'Sekongkang', '44000');
INSERT INTO `kota` VALUES ('84', 'Brang Rea', '44000');
INSERT INTO `kota` VALUES ('85', 'Woha', '35000');
INSERT INTO `kota` VALUES ('86', 'Ambalawi', '66000');
INSERT INTO `kota` VALUES ('87', 'Belo', '44000');
INSERT INTO `kota` VALUES ('88', 'Bolo', '44000');
INSERT INTO `kota` VALUES ('89', 'Donggo', '44000');
INSERT INTO `kota` VALUES ('90', 'Lambu', '44000');
INSERT INTO `kota` VALUES ('91', 'Langgudu', '66000');
INSERT INTO `kota` VALUES ('92', 'Mada Pangga', '44000');
INSERT INTO `kota` VALUES ('93', 'Monta', '44000');
INSERT INTO `kota` VALUES ('94', 'Sanggar', '66000');
INSERT INTO `kota` VALUES ('95', 'Sape', '44000');
INSERT INTO `kota` VALUES ('96', 'Tambora', '66000');
INSERT INTO `kota` VALUES ('97', 'Wawo', '44000');
INSERT INTO `kota` VALUES ('98', 'Wera', '44000');
INSERT INTO `kota` VALUES ('99', 'Ambon', '52000');
INSERT INTO `kota` VALUES ('100', 'Nusaniwe', '52000');
INSERT INTO `kota` VALUES ('101', 'Sirimau', '52000');
INSERT INTO `kota` VALUES ('102', 'Teluk Ambon Baguala', '52000');
INSERT INTO `kota` VALUES ('103', 'Teluk Ambon', '52000');
INSERT INTO `kota` VALUES ('104', 'Leitimur Selatan', '52000');
INSERT INTO `kota` VALUES ('105', 'Kota Masohi', '85000');
INSERT INTO `kota` VALUES ('106', 'Banda', '161000');
INSERT INTO `kota` VALUES ('107', 'Leihitu', '161000');
INSERT INTO `kota` VALUES ('108', 'Pulau Haruku', '161000');
INSERT INTO `kota` VALUES ('109', 'Sala Hutu', '107000');
INSERT INTO `kota` VALUES ('110', 'Seram Utara', '161000');
INSERT INTO `kota` VALUES ('111', 'Tehoru', '161000');
INSERT INTO `kota` VALUES ('112', 'Teon Nila Serua', '161000');
INSERT INTO `kota` VALUES ('113', 'Amahai', '161000');
INSERT INTO `kota` VALUES ('114', 'Nusa Laut', '161000');
INSERT INTO `kota` VALUES ('115', 'Saparua', '161000');
INSERT INTO `kota` VALUES ('116', 'Tual', '85000');
INSERT INTO `kota` VALUES ('117', 'Kei Besar', '161000');
INSERT INTO `kota` VALUES ('118', 'Kei Besar Selatan', '161000');
INSERT INTO `kota` VALUES ('119', 'Kei Besar Utara Timur', '161000');
INSERT INTO `kota` VALUES ('120', 'Kei Kecil', '161000');
INSERT INTO `kota` VALUES ('121', 'Pulau-Pulau Kur', '161000');
INSERT INTO `kota` VALUES ('122', 'Namlea', '85000');
INSERT INTO `kota` VALUES ('123', 'Air Buaya / Buru Utara Barat', '161000');
INSERT INTO `kota` VALUES ('124', 'Leksula / Buru Selatan', '161000');
INSERT INTO `kota` VALUES ('125', 'Waesama', '161000');
INSERT INTO `kota` VALUES ('126', 'Wayapo / Buru Utara Timur', '161000');
INSERT INTO `kota` VALUES ('127', 'Dobo', '161000');
INSERT INTO `kota` VALUES ('128', 'Pulau-Pulau Aru', '161000');
INSERT INTO `kota` VALUES ('129', 'Pulau-Pulau Aru Selatan', '161000');
INSERT INTO `kota` VALUES ('130', 'Pulau-Pulau Aru Tengah', '161000');
INSERT INTO `kota` VALUES ('131', 'Piru', '161000');
INSERT INTO `kota` VALUES ('132', 'Kairatu', '161000');
INSERT INTO `kota` VALUES ('133', 'Seram Barat', '161000');
INSERT INTO `kota` VALUES ('134', 'Taniwel', '161000');
INSERT INTO `kota` VALUES ('135', 'Waisala', '161000');
INSERT INTO `kota` VALUES ('136', 'Dataran Hunimoa', '161000');
INSERT INTO `kota` VALUES ('137', 'Bula', '161000');
INSERT INTO `kota` VALUES ('138', 'Pulau-Pulau Gorong', '161000');
INSERT INTO `kota` VALUES ('139', 'Seram Timur', '161000');
INSERT INTO `kota` VALUES ('140', 'Werinama', '161000');
INSERT INTO `kota` VALUES ('141', 'Saumlaki', '85000');
INSERT INTO `kota` VALUES ('142', 'Damer', '161000');
INSERT INTO `kota` VALUES ('143', 'Kormomolin', '161000');
INSERT INTO `kota` VALUES ('144', 'Luser', '161000');
INSERT INTO `kota` VALUES ('145', 'Mola', '161000');
INSERT INTO `kota` VALUES ('146', 'Nirunmas', '161000');
INSERT INTO `kota` VALUES ('147', 'Pulau-Pulau Babar', '161000');
INSERT INTO `kota` VALUES ('148', 'Pulau-Pulau Babar Timur', '161000');
INSERT INTO `kota` VALUES ('149', 'Pulau-Pulau Letimoa Lakor', '161000');
INSERT INTO `kota` VALUES ('150', 'Pulau-Pulau Terselatan', '161000');
INSERT INTO `kota` VALUES ('151', 'Pulau-Pulau Wetar', '161000');
INSERT INTO `kota` VALUES ('152', 'Selaru', '161000');
INSERT INTO `kota` VALUES ('153', 'Tanimbar Selatan', '161000');
INSERT INTO `kota` VALUES ('154', 'Tanimbar Utara', '161000');
INSERT INTO `kota` VALUES ('155', 'Wer Makatian', '161000');
INSERT INTO `kota` VALUES ('156', 'Wertamrian', '161000');
INSERT INTO `kota` VALUES ('157', 'Wuarlabobar', '161000');
INSERT INTO `kota` VALUES ('158', 'Yaru', '161000');
INSERT INTO `kota` VALUES ('159', 'Serwaru', '161000');
INSERT INTO `kota` VALUES ('160', 'Banjarmasin', '30000');
INSERT INTO `kota` VALUES ('161', 'Banjarmasin Barat', '30000');
INSERT INTO `kota` VALUES ('162', 'Banjarmasin Selatan', '30000');
INSERT INTO `kota` VALUES ('163', 'Banjarmasin Tengah', '30000');
INSERT INTO `kota` VALUES ('164', 'Banjarmasin Timur', '30000');
INSERT INTO `kota` VALUES ('165', 'Banjarmasin Utara', '30000');
INSERT INTO `kota` VALUES ('166', 'Barabai', '42000');
INSERT INTO `kota` VALUES ('167', 'Batang Alai Selatan', '53000');
INSERT INTO `kota` VALUES ('168', 'Batu Benawa', '53000');
INSERT INTO `kota` VALUES ('169', 'Batang Alai Utara', '53000');
INSERT INTO `kota` VALUES ('170', 'Haruyan', '53000');
INSERT INTO `kota` VALUES ('171', 'Labuan Amas Selatan', '53000');
INSERT INTO `kota` VALUES ('172', 'Labuan Amas Utara', '53000');
INSERT INTO `kota` VALUES ('173', 'Pandawan', '53000');
INSERT INTO `kota` VALUES ('174', 'Batang Alai Tengah', '53000');
INSERT INTO `kota` VALUES ('175', 'Hantakan', '53000');
INSERT INTO `kota` VALUES ('176', 'Kandangan', '42000');
INSERT INTO `kota` VALUES ('177', 'Angkinang', '53000');
INSERT INTO `kota` VALUES ('178', 'Daha Selatan', '53000');
INSERT INTO `kota` VALUES ('179', 'Daha Utara', '53000');
INSERT INTO `kota` VALUES ('180', 'Kalumpang', '53000');
INSERT INTO `kota` VALUES ('181', 'Loksado', '53000');
INSERT INTO `kota` VALUES ('182', 'Padang Batung', '53000');
INSERT INTO `kota` VALUES ('183', 'Simpur', '53000');
INSERT INTO `kota` VALUES ('184', 'Sungai Raya', '53000');
INSERT INTO `kota` VALUES ('185', 'Telaga Langsat', '53000');
INSERT INTO `kota` VALUES ('186', 'Daha Barat', '53000');
INSERT INTO `kota` VALUES ('187', 'Kota Baru', '42000');
INSERT INTO `kota` VALUES ('188', 'Hampang', '53000');
INSERT INTO `kota` VALUES ('189', 'Kelumpang Utara', '53000');
INSERT INTO `kota` VALUES ('190', 'Kelumpang Tengah', '53000');
INSERT INTO `kota` VALUES ('191', 'Kelumpang Hulu', '53000');
INSERT INTO `kota` VALUES ('192', 'Kelumpang Selatan', '53000');
INSERT INTO `kota` VALUES ('193', 'Pamukan Utara', '53000');
INSERT INTO `kota` VALUES ('194', 'Pamukan Selatan', '53000');
INSERT INTO `kota` VALUES ('195', 'Pulau Laut Selatan', '53000');
INSERT INTO `kota` VALUES ('196', 'Pulau Laut Barat', '53000');
INSERT INTO `kota` VALUES ('197', 'Pulau Laut Timur', '53000');
INSERT INTO `kota` VALUES ('198', 'Pulau Sembilan', '53000');
INSERT INTO `kota` VALUES ('199', 'Pulau Sebuku', '53000');
INSERT INTO `kota` VALUES ('200', 'Sampanahan', '53000');
INSERT INTO `kota` VALUES ('201', 'Sungai Durian', '53000');
INSERT INTO `kota` VALUES ('202', 'Pulau Laut Utara', '53000');
INSERT INTO `kota` VALUES ('203', 'Tanjung', '42000');
INSERT INTO `kota` VALUES ('204', 'Banua Lawas', '53000');
INSERT INTO `kota` VALUES ('205', 'Haruai', '53000');
INSERT INTO `kota` VALUES ('206', 'Jaro', '53000');
INSERT INTO `kota` VALUES ('207', 'Kelua', '53000');
INSERT INTO `kota` VALUES ('208', 'Muara Harus', '53000');
INSERT INTO `kota` VALUES ('209', 'Muara Uya', '53000');
INSERT INTO `kota` VALUES ('210', 'Murung Pudak', '53000');
INSERT INTO `kota` VALUES ('211', 'Pugaan', '53000');
INSERT INTO `kota` VALUES ('212', 'Tanta', '53000');
INSERT INTO `kota` VALUES ('213', 'Upau', '53000');
INSERT INTO `kota` VALUES ('214', 'Bintang Ara', '53000');
INSERT INTO `kota` VALUES ('215', 'BanjarBaru', '30000');
INSERT INTO `kota` VALUES ('216', 'Cempaka', '30000');
INSERT INTO `kota` VALUES ('217', 'Landasan Ulin', '30000');
INSERT INTO `kota` VALUES ('218', 'Amuntai', '42000');
INSERT INTO `kota` VALUES ('219', 'Amuntai Utara', '42000');
INSERT INTO `kota` VALUES ('220', 'Amuntai Selatan', '42000');
INSERT INTO `kota` VALUES ('221', 'Babirik', '53000');
INSERT INTO `kota` VALUES ('222', 'Danau Panggang', '53000');
INSERT INTO `kota` VALUES ('223', 'Sungai Pandan', '53000');
INSERT INTO `kota` VALUES ('224', 'Amuntai Tengah', '42000');
INSERT INTO `kota` VALUES ('225', 'Banjang', '53000');
INSERT INTO `kota` VALUES ('226', 'Marabahan', '42000');
INSERT INTO `kota` VALUES ('227', 'Alalak', '53000');
INSERT INTO `kota` VALUES ('228', 'Anjir Pasar', '53000');
INSERT INTO `kota` VALUES ('229', 'Anjir Muara', '53000');
INSERT INTO `kota` VALUES ('230', 'Barambai', '53000');
INSERT INTO `kota` VALUES ('231', 'Belawang', '53000');
INSERT INTO `kota` VALUES ('232', 'Cerbon', '53000');
INSERT INTO `kota` VALUES ('233', 'Kuripan', '53000');
INSERT INTO `kota` VALUES ('234', 'Mandastana', '53000');
INSERT INTO `kota` VALUES ('235', 'Mekar Sari', '53000');
INSERT INTO `kota` VALUES ('236', 'Rantau Badauh', '53000');
INSERT INTO `kota` VALUES ('237', 'Tabunganen', '53000');
INSERT INTO `kota` VALUES ('238', 'Tabukan', '53000');
INSERT INTO `kota` VALUES ('239', 'Tamban', '53000');
INSERT INTO `kota` VALUES ('240', 'Bakumpai', '53000');
INSERT INTO `kota` VALUES ('241', 'Wanaraya', '53000');
INSERT INTO `kota` VALUES ('242', 'Martapura', '42000');
INSERT INTO `kota` VALUES ('243', 'Aluh Aluh', '53000');
INSERT INTO `kota` VALUES ('244', 'Astambul', '53000');
INSERT INTO `kota` VALUES ('245', 'Gambut', '53000');
INSERT INTO `kota` VALUES ('246', 'Karang Intan', '53000');
INSERT INTO `kota` VALUES ('247', 'Kertak Hanyar', '53000');
INSERT INTO `kota` VALUES ('248', 'Pengaron', '53000');
INSERT INTO `kota` VALUES ('249', 'Simpang Empat', '53000');
INSERT INTO `kota` VALUES ('250', 'Sungai Tabuk', '53000');
INSERT INTO `kota` VALUES ('251', 'Sungai Pinang', '53000');
INSERT INTO `kota` VALUES ('252', 'Aranio', '53000');
INSERT INTO `kota` VALUES ('253', 'Mataraman', '53000');
INSERT INTO `kota` VALUES ('254', 'Pelaihari', '42000');
INSERT INTO `kota` VALUES ('255', 'Bati-Bati', '53000');
INSERT INTO `kota` VALUES ('256', 'Jorong', '53000');
INSERT INTO `kota` VALUES ('257', 'Kintap', '53000');
INSERT INTO `kota` VALUES ('258', 'Kurau', '53000');
INSERT INTO `kota` VALUES ('259', 'Panyipatan', '53000');
INSERT INTO `kota` VALUES ('260', 'Takisung', '53000');
INSERT INTO `kota` VALUES ('261', 'Batu Ampar', '53000');
INSERT INTO `kota` VALUES ('262', 'Tambang Ulang', '53000');
INSERT INTO `kota` VALUES ('263', 'Rantau', '42000');
INSERT INTO `kota` VALUES ('264', 'Bakarangan', '53000');
INSERT INTO `kota` VALUES ('265', 'Binuang', '53000');
INSERT INTO `kota` VALUES ('266', 'Bungur', '53000');
INSERT INTO `kota` VALUES ('267', 'Candi Laras Utara', '53000');
INSERT INTO `kota` VALUES ('268', 'Candi Laras Selatan', '53000');
INSERT INTO `kota` VALUES ('269', 'Hatungun', '42000');
INSERT INTO `kota` VALUES ('270', 'Lokpaikat', '53000');
INSERT INTO `kota` VALUES ('271', 'Piani', '53000');
INSERT INTO `kota` VALUES ('272', 'Salam Babaris', '42000');
INSERT INTO `kota` VALUES ('273', 'Tapin Tengah', '42000');
INSERT INTO `kota` VALUES ('274', 'Tapin Selatan', '42000');
INSERT INTO `kota` VALUES ('275', 'Tapin Utara', '42000');
INSERT INTO `kota` VALUES ('276', 'Muara Teweh', '42000');
INSERT INTO `kota` VALUES ('277', 'Gunung Purei', '53000');
INSERT INTO `kota` VALUES ('278', 'Gunung Timang', '53000');
INSERT INTO `kota` VALUES ('279', 'Lahei', '53000');
INSERT INTO `kota` VALUES ('280', 'Montalat', '53000');
INSERT INTO `kota` VALUES ('281', 'Teweh Timur', '53000');
INSERT INTO `kota` VALUES ('282', 'Teweh Tengah', '53000');
INSERT INTO `kota` VALUES ('283', 'Tamiang Layang', '42000');
INSERT INTO `kota` VALUES ('284', 'Awang', '53000');
INSERT INTO `kota` VALUES ('285', 'Benua Lima', '53000');
INSERT INTO `kota` VALUES ('286', 'Dusun Tengah', '53000');
INSERT INTO `kota` VALUES ('287', 'Patangkep Tutui', '53000');
INSERT INTO `kota` VALUES ('288', 'Pematang Karau', '53000');
INSERT INTO `kota` VALUES ('289', 'Dusun Timur', '53000');
INSERT INTO `kota` VALUES ('290', 'Puruk Cahu', '42000');
INSERT INTO `kota` VALUES ('291', 'Laung Tuhup', '53000');
INSERT INTO `kota` VALUES ('292', 'Permata Intan', '53000');
INSERT INTO `kota` VALUES ('293', 'Sumber Barito', '53000');
INSERT INTO `kota` VALUES ('294', 'Tanah Siang', '53000');
INSERT INTO `kota` VALUES ('295', 'Murung', '53000');
INSERT INTO `kota` VALUES ('296', 'Buntok', '42000');
INSERT INTO `kota` VALUES ('297', 'Dusun Hilir', '53000');
INSERT INTO `kota` VALUES ('298', 'Dusun Utara', '53000');
INSERT INTO `kota` VALUES ('299', 'Jenamas', '53000');
INSERT INTO `kota` VALUES ('300', 'Karau Kuala', '53000');
INSERT INTO `kota` VALUES ('301', 'Dusun Selatan', '53000');
INSERT INTO `kota` VALUES ('302', 'Gunung Bintang Awai', '53000');
INSERT INTO `kota` VALUES ('303', 'Paringin', '42000');
INSERT INTO `kota` VALUES ('304', 'Awayan', '53000');
INSERT INTO `kota` VALUES ('305', 'Batu Mandi', '53000');
INSERT INTO `kota` VALUES ('306', 'Halong', '53000');
INSERT INTO `kota` VALUES ('307', 'Juai', '53000');
INSERT INTO `kota` VALUES ('308', 'Lampihong', '53000');
INSERT INTO `kota` VALUES ('309', 'Batu Licin', '42000');
INSERT INTO `kota` VALUES ('310', 'Kusan Hilir', '53000');
INSERT INTO `kota` VALUES ('311', 'Kusan Hulu', '53000');
INSERT INTO `kota` VALUES ('312', 'Satui', '53000');
INSERT INTO `kota` VALUES ('313', 'Sungai Loban', '53000');
INSERT INTO `kota` VALUES ('314', 'Bandung', '10000');
INSERT INTO `kota` VALUES ('315', 'Cibiru', '10000');
INSERT INTO `kota` VALUES ('316', 'Ujungberung', '10000');
INSERT INTO `kota` VALUES ('317', 'Sukasari', '10000');
INSERT INTO `kota` VALUES ('318', 'Cicadas', '10000');
INSERT INTO `kota` VALUES ('319', 'Cidadap', '10000');
INSERT INTO `kota` VALUES ('320', 'Lengkong', '10000');
INSERT INTO `kota` VALUES ('321', 'Andir', '10000');
INSERT INTO `kota` VALUES ('322', 'Arcamanik', '10000');
INSERT INTO `kota` VALUES ('323', 'Astanaanyar', '10000');
INSERT INTO `kota` VALUES ('324', 'Babakanciparay', '10000');
INSERT INTO `kota` VALUES ('325', 'Bandung Kidul', '10000');
INSERT INTO `kota` VALUES ('326', 'Bandung Kulon', '10000');
INSERT INTO `kota` VALUES ('327', 'Bandung Wetan', '10000');
INSERT INTO `kota` VALUES ('328', 'Batununggal', '10000');
INSERT INTO `kota` VALUES ('329', 'Bojongloa Kaler', '10000');
INSERT INTO `kota` VALUES ('330', 'Bojongloa Kidul', '10000');
INSERT INTO `kota` VALUES ('331', 'Cibeunying Kaler', '10000');
INSERT INTO `kota` VALUES ('332', 'Cibeunying Kidul', '10000');
INSERT INTO `kota` VALUES ('333', 'Cicendo', '10000');
INSERT INTO `kota` VALUES ('334', 'Coblong', '10000');
INSERT INTO `kota` VALUES ('335', 'Kiaracondong', '10000');
INSERT INTO `kota` VALUES ('336', 'Margacinta', '10000');
INSERT INTO `kota` VALUES ('337', 'Rancasari', '10000');
INSERT INTO `kota` VALUES ('338', 'Regol', '10000');
INSERT INTO `kota` VALUES ('339', 'Sukajadi', '10000');
INSERT INTO `kota` VALUES ('340', 'Sumurbandung', '10000');
INSERT INTO `kota` VALUES ('341', 'Soreang', '10000');
INSERT INTO `kota` VALUES ('342', 'Arjasari', '16000');
INSERT INTO `kota` VALUES ('343', 'Baleendah', '16000');
INSERT INTO `kota` VALUES ('344', 'Banjaran', '16000');
INSERT INTO `kota` VALUES ('345', 'Bojong Soang', '16000');
INSERT INTO `kota` VALUES ('346', 'Cangkuang', '16000');
INSERT INTO `kota` VALUES ('347', 'Cicalengka', '16000');
INSERT INTO `kota` VALUES ('348', 'Cikancung', '16000');
INSERT INTO `kota` VALUES ('349', 'Cilengkrang', '16000');
INSERT INTO `kota` VALUES ('350', 'Cileunyi', '16000');
INSERT INTO `kota` VALUES ('351', 'Cimaung', '16000');
INSERT INTO `kota` VALUES ('352', 'Cimenyan', '16000');
INSERT INTO `kota` VALUES ('353', 'Ciparay', '16000');
INSERT INTO `kota` VALUES ('354', 'Ciwidey', '16000');
INSERT INTO `kota` VALUES ('355', 'Dayeuhkolot', '16000');
INSERT INTO `kota` VALUES ('356', 'Ibun', '16000');
INSERT INTO `kota` VALUES ('357', 'Kertasari', '16000');
INSERT INTO `kota` VALUES ('358', 'Katapang', '16000');
INSERT INTO `kota` VALUES ('359', 'Majalaya', '13000');
INSERT INTO `kota` VALUES ('360', 'Margaasih', '16000');
INSERT INTO `kota` VALUES ('361', 'Margahayu', '16000');
INSERT INTO `kota` VALUES ('362', 'Nagreg', '16000');
INSERT INTO `kota` VALUES ('363', 'Pacet', '16000');
INSERT INTO `kota` VALUES ('364', 'Pameungpeuk', '16000');
INSERT INTO `kota` VALUES ('365', 'Pangalengan', '16000');
INSERT INTO `kota` VALUES ('366', 'Paseh', '16000');
INSERT INTO `kota` VALUES ('367', 'Pasirjambu', '16000');
INSERT INTO `kota` VALUES ('368', 'Rancabali', '16000');
INSERT INTO `kota` VALUES ('369', 'Rancaekek', '10000');
INSERT INTO `kota` VALUES ('370', 'Solokan Jeruk', '16000');
INSERT INTO `kota` VALUES ('371', 'Cimahi', '10000');
INSERT INTO `kota` VALUES ('372', 'Cimahi Selatan', '10000');
INSERT INTO `kota` VALUES ('373', 'Cimahi Tengah', '10000');
INSERT INTO `kota` VALUES ('374', 'Cimahi Utara', '10000');
INSERT INTO `kota` VALUES ('375', 'Sumedang', '13000');
INSERT INTO `kota` VALUES ('376', 'Buahdua', '16000');
INSERT INTO `kota` VALUES ('377', 'Cibugel', '16000');
INSERT INTO `kota` VALUES ('378', 'Cimalaka', '16000');
INSERT INTO `kota` VALUES ('379', 'Cimanggu', '16000');
INSERT INTO `kota` VALUES ('380', 'Conggeang', '16000');
INSERT INTO `kota` VALUES ('381', 'Darmaraja', '16000');
INSERT INTO `kota` VALUES ('382', 'Ganeas', '16000');
INSERT INTO `kota` VALUES ('383', 'Pamulihan', '16000');
INSERT INTO `kota` VALUES ('384', 'Rancakalong', '16000');
INSERT INTO `kota` VALUES ('385', 'Situraja', '16000');
INSERT INTO `kota` VALUES ('386', 'Sukasari', '16000');
INSERT INTO `kota` VALUES ('387', 'Surian', '16000');
INSERT INTO `kota` VALUES ('388', 'Tanjungkerta', '16000');
INSERT INTO `kota` VALUES ('389', 'Tanjungsari', '16000');
INSERT INTO `kota` VALUES ('390', 'Tomo', '16000');
INSERT INTO `kota` VALUES ('391', 'Ujung Jaya', '16000');
INSERT INTO `kota` VALUES ('392', 'Wado', '16000');
INSERT INTO `kota` VALUES ('393', 'Jatinangor', '10000');
INSERT INTO `kota` VALUES ('394', 'Cisarua', '16000');
INSERT INTO `kota` VALUES ('395', 'Cisitu', '16000');
INSERT INTO `kota` VALUES ('396', 'Jatigede', '16000');
INSERT INTO `kota` VALUES ('397', 'Jatinunggal', '16000');
INSERT INTO `kota` VALUES ('398', 'Sumedang Selatan', '16000');
INSERT INTO `kota` VALUES ('399', 'Sumedang Utara', '16000');
INSERT INTO `kota` VALUES ('400', 'Tanjungmedar', '16000');
INSERT INTO `kota` VALUES ('401', 'Tasikmalaya', '13000');
INSERT INTO `kota` VALUES ('402', 'Cibeureum', '13000');
INSERT INTO `kota` VALUES ('403', 'Indihiang', '13000');
INSERT INTO `kota` VALUES ('404', 'Kawalu', '13000');
INSERT INTO `kota` VALUES ('405', 'Cihideung', '13000');
INSERT INTO `kota` VALUES ('406', 'Cipedes', '13000');
INSERT INTO `kota` VALUES ('407', 'Mangkubumi', '13000');
INSERT INTO `kota` VALUES ('408', 'Tamansari', '13000');
INSERT INTO `kota` VALUES ('409', 'Tawang', '13000');
INSERT INTO `kota` VALUES ('410', 'Banjar', '13000');
INSERT INTO `kota` VALUES ('411', 'Langensari', '13000');
INSERT INTO `kota` VALUES ('412', 'Pataruman', '13000');
INSERT INTO `kota` VALUES ('413', 'Purwaharja', '13000');
INSERT INTO `kota` VALUES ('414', 'Ciamis', '13000');
INSERT INTO `kota` VALUES ('415', 'Cihaurbeuti', '16000');
INSERT INTO `kota` VALUES ('416', 'Cijeungjing', '16000');
INSERT INTO `kota` VALUES ('417', 'Cikoneng', '16000');
INSERT INTO `kota` VALUES ('418', 'Cipaku', '16000');
INSERT INTO `kota` VALUES ('419', 'Jatinagara', '16000');
INSERT INTO `kota` VALUES ('420', 'Kawali', '16000');
INSERT INTO `kota` VALUES ('421', 'Panumbangan', '16000');
INSERT INTO `kota` VALUES ('422', 'Panawangan', '16000');
INSERT INTO `kota` VALUES ('423', 'Panjalu', '16000');
INSERT INTO `kota` VALUES ('424', 'Rajadesa', '16000');
INSERT INTO `kota` VALUES ('425', 'Sadananya', '16000');
INSERT INTO `kota` VALUES ('426', 'Sukadana', '16000');
INSERT INTO `kota` VALUES ('427', 'Banjarsari', '16000');
INSERT INTO `kota` VALUES ('428', 'Cimaragas', '16000');
INSERT INTO `kota` VALUES ('429', 'Cigugur', '16000');
INSERT INTO `kota` VALUES ('430', 'Cijulang', '16000');
INSERT INTO `kota` VALUES ('431', 'Cimerak', '16000');
INSERT INTO `kota` VALUES ('432', 'Cisaga', '16000');
INSERT INTO `kota` VALUES ('433', 'Kalipucang', '16000');
INSERT INTO `kota` VALUES ('434', 'Lakbok', '16000');
INSERT INTO `kota` VALUES ('435', 'Langkap lancar', '16000');
INSERT INTO `kota` VALUES ('436', 'Padaherang', '16000');
INSERT INTO `kota` VALUES ('437', 'Pamarican', '16000');
INSERT INTO `kota` VALUES ('438', 'Pangandaran', '16000');
INSERT INTO `kota` VALUES ('439', 'Parigi', '16000');
INSERT INTO `kota` VALUES ('440', 'Rancah', '16000');
INSERT INTO `kota` VALUES ('441', 'Tambaksari', '16000');
INSERT INTO `kota` VALUES ('442', 'Purwadadi', '16000');
INSERT INTO `kota` VALUES ('443', 'Cidolog', '16000');
INSERT INTO `kota` VALUES ('444', 'Baregbeg', '16000');
INSERT INTO `kota` VALUES ('445', 'Lumbung', '16000');
INSERT INTO `kota` VALUES ('446', 'Mangunjaya', '16000');
INSERT INTO `kota` VALUES ('447', 'Sidamulih', '16000');
INSERT INTO `kota` VALUES ('448', 'Sindangkasih', '16000');
INSERT INTO `kota` VALUES ('449', 'Singaparna', '13000');
INSERT INTO `kota` VALUES ('450', 'Bojonggambir', '16000');
INSERT INTO `kota` VALUES ('451', 'Cigalontang', '16000');
INSERT INTO `kota` VALUES ('452', 'Leuwisari', '16000');
INSERT INTO `kota` VALUES ('453', 'Sariwangi', '16000');
INSERT INTO `kota` VALUES ('454', 'Salawu', '16000');
INSERT INTO `kota` VALUES ('455', 'Sukarame', '16000');
INSERT INTO `kota` VALUES ('456', 'Mangunreja', '16000');
INSERT INTO `kota` VALUES ('457', 'Sodonghilir', '16000');
INSERT INTO `kota` VALUES ('458', 'Taraju', '16000');
INSERT INTO `kota` VALUES ('459', 'Bantarkalong', '16000');
INSERT INTO `kota` VALUES ('460', 'Culamega', '16000');
INSERT INTO `kota` VALUES ('461', 'Ciawi', '16000');
INSERT INTO `kota` VALUES ('462', 'Cibalong', '16000');
INSERT INTO `kota` VALUES ('463', 'Cikatomas', '16000');
INSERT INTO `kota` VALUES ('464', 'Cikalong', '16000');
INSERT INTO `kota` VALUES ('465', 'Cineam', '16000');
INSERT INTO `kota` VALUES ('466', 'Cipatujah', '16000');
INSERT INTO `kota` VALUES ('467', 'Cisayong', '16000');
INSERT INTO `kota` VALUES ('468', 'Jamanis', '16000');
INSERT INTO `kota` VALUES ('469', 'Karangnunggal', '16000');
INSERT INTO `kota` VALUES ('470', 'Manonjaya', '16000');
INSERT INTO `kota` VALUES ('471', 'Pancatengah', '16000');
INSERT INTO `kota` VALUES ('472', 'Rajapolah', '16000');
INSERT INTO `kota` VALUES ('473', 'Salopa', '16000');
INSERT INTO `kota` VALUES ('474', 'Sukaraja', '16000');
INSERT INTO `kota` VALUES ('475', 'Kadipaten', '16000');
INSERT INTO `kota` VALUES ('476', 'Bojongasih', '16000');
INSERT INTO `kota` VALUES ('477', 'Gunung Tanjung', '16000');
INSERT INTO `kota` VALUES ('478', 'Jatiwaras', '16000');
INSERT INTO `kota` VALUES ('479', 'Karangjaya', '16000');
INSERT INTO `kota` VALUES ('480', 'Padakembang', '16000');
INSERT INTO `kota` VALUES ('481', 'Pagerageung', '16000');
INSERT INTO `kota` VALUES ('482', 'Parungponteng', '16000');
INSERT INTO `kota` VALUES ('483', 'Puspahiang', '16000');
INSERT INTO `kota` VALUES ('484', 'Sukaratu', '16000');
INSERT INTO `kota` VALUES ('485', 'Sukaresik', '16000');
INSERT INTO `kota` VALUES ('486', 'Tanjungjaya', '16000');
INSERT INTO `kota` VALUES ('487', 'Sukahening', '16000');
INSERT INTO `kota` VALUES ('488', 'Garut, Kab. Garut', '13000');
INSERT INTO `kota` VALUES ('489', 'Banjarwangi', '16000');
INSERT INTO `kota` VALUES ('490', 'Banyuresmi', '16000');
INSERT INTO `kota` VALUES ('491', 'Bayongbong', '16000');
INSERT INTO `kota` VALUES ('492', 'Balubur Limbangan', '16000');
INSERT INTO `kota` VALUES ('493', 'Bungbulang', '16000');
INSERT INTO `kota` VALUES ('494', 'Cibatu', '16000');
INSERT INTO `kota` VALUES ('495', 'Cibiuk', '16000');
INSERT INTO `kota` VALUES ('496', 'Cikelet', '16000');
INSERT INTO `kota` VALUES ('497', 'Cikajang', '16000');
INSERT INTO `kota` VALUES ('498', 'Cilawu', '16000');
INSERT INTO `kota` VALUES ('499', 'Cisompet', '16000');
INSERT INTO `kota` VALUES ('500', 'Cisurupan', '16000');
INSERT INTO `kota` VALUES ('501', 'Cisewu', '16000');
INSERT INTO `kota` VALUES ('502', 'Kadungora', '16000');
INSERT INTO `kota` VALUES ('503', 'Karangpawitan', '16000');
INSERT INTO `kota` VALUES ('504', 'Leles', '16000');
INSERT INTO `kota` VALUES ('505', 'Leuwigoong', '16000');
INSERT INTO `kota` VALUES ('506', 'Malangbong', '16000');
INSERT INTO `kota` VALUES ('507', 'Pakenjeng', '16000');
INSERT INTO `kota` VALUES ('508', 'Peundeuy', '16000');
INSERT INTO `kota` VALUES ('509', 'Samarang', '16000');
INSERT INTO `kota` VALUES ('510', 'Selaawi', '16000');
INSERT INTO `kota` VALUES ('511', 'Singajaya', '16000');
INSERT INTO `kota` VALUES ('512', 'Sukawening', '16000');
INSERT INTO `kota` VALUES ('513', 'Talegong', '16000');
INSERT INTO `kota` VALUES ('514', 'Wanaraja', '16000');
INSERT INTO `kota` VALUES ('515', 'Caringin', '16000');
INSERT INTO `kota` VALUES ('516', 'Karangtengah', '16000');
INSERT INTO `kota` VALUES ('517', 'Sukaresmi', '16000');
INSERT INTO `kota` VALUES ('518', 'Cigedug', '16000');
INSERT INTO `kota` VALUES ('519', 'Cihurip', '16000');
INSERT INTO `kota` VALUES ('520', 'Kersamanah', '16000');
INSERT INTO `kota` VALUES ('521', 'Mekarmukti', '16000');
INSERT INTO `kota` VALUES ('522', 'Pangatikan', '16000');
INSERT INTO `kota` VALUES ('523', 'Pasirwangi', '16000');
INSERT INTO `kota` VALUES ('524', 'Sucinaraja', '16000');
INSERT INTO `kota` VALUES ('525', 'Tarogong Kaler', '16000');
INSERT INTO `kota` VALUES ('526', 'Tarogong Kidul', '16000');
INSERT INTO `kota` VALUES ('527', 'Garut Kota', '13000');
INSERT INTO `kota` VALUES ('528', 'Purwakarta', '13000');
INSERT INTO `kota` VALUES ('529', 'Jatiluhur', '16000');
INSERT INTO `kota` VALUES ('530', 'Campaka', '16000');
INSERT INTO `kota` VALUES ('531', 'Pasawahan', '16000');
INSERT INTO `kota` VALUES ('532', 'Babakancikao', '16000');
INSERT INTO `kota` VALUES ('533', 'Bungursari', '16000');
INSERT INTO `kota` VALUES ('534', 'Plered', '16000');
INSERT INTO `kota` VALUES ('535', 'Sukatani', '16000');
INSERT INTO `kota` VALUES ('536', 'Darangdan', '16000');
INSERT INTO `kota` VALUES ('537', 'Maniis', '16000');
INSERT INTO `kota` VALUES ('538', 'Tegalwaru', '16000');
INSERT INTO `kota` VALUES ('539', 'Wanayasa', '16000');
INSERT INTO `kota` VALUES ('540', 'Pondoksalam', '16000');
INSERT INTO `kota` VALUES ('541', 'Bojong', '16000');
INSERT INTO `kota` VALUES ('542', 'Kiarapedes', '16000');
INSERT INTO `kota` VALUES ('543', 'Ngamprah', '10000');
INSERT INTO `kota` VALUES ('544', 'Lembang', '10000');
INSERT INTO `kota` VALUES ('545', 'Batujajar', '16000');
INSERT INTO `kota` VALUES ('546', 'Cikalong Wetan', '16000');
INSERT INTO `kota` VALUES ('547', 'Cililin', '16000');
INSERT INTO `kota` VALUES ('548', 'Cipeundeuy', '16000');
INSERT INTO `kota` VALUES ('549', 'Cipatat', '16000');
INSERT INTO `kota` VALUES ('550', 'Cipongkor', '16000');
INSERT INTO `kota` VALUES ('551', 'Gununghalu', '16000');
INSERT INTO `kota` VALUES ('552', 'Padalarang', '16000');
INSERT INTO `kota` VALUES ('553', 'Sindangkerta', '16000');
INSERT INTO `kota` VALUES ('554', 'Cihampelas', '16000');
INSERT INTO `kota` VALUES ('555', 'Parongpong', '16000');
INSERT INTO `kota` VALUES ('556', 'Rongga', '16000');
INSERT INTO `kota` VALUES ('557', 'Cimareme', '10000');
INSERT INTO `kota` VALUES ('558', 'Subang', '13000');
INSERT INTO `kota` VALUES ('559', 'Binong', '16000');
INSERT INTO `kota` VALUES ('560', 'Blanakan', '16000');
INSERT INTO `kota` VALUES ('561', 'Ciasem', '16000');
INSERT INTO `kota` VALUES ('562', 'Cibogo', '16000');
INSERT INTO `kota` VALUES ('563', 'Cijambe', '16000');
INSERT INTO `kota` VALUES ('564', 'Cisalak', '16000');
INSERT INTO `kota` VALUES ('565', 'Compreng', '16000');
INSERT INTO `kota` VALUES ('566', 'Jalan Cagak', '16000');
INSERT INTO `kota` VALUES ('567', 'Kalijati', '16000');
INSERT INTO `kota` VALUES ('568', 'Pabuaran', '16000');
INSERT INTO `kota` VALUES ('569', 'Pamanukan', '16000');
INSERT INTO `kota` VALUES ('570', 'Patok Beusi', '16000');
INSERT INTO `kota` VALUES ('571', 'Pusakanagara', '16000');
INSERT INTO `kota` VALUES ('572', 'Sagalaherang', '16000');
INSERT INTO `kota` VALUES ('573', 'Tanjung Siang', '16000');
INSERT INTO `kota` VALUES ('574', 'Cikaum', '16000');
INSERT INTO `kota` VALUES ('575', 'Cipunagara', '16000');
INSERT INTO `kota` VALUES ('576', 'Legon Kulon', '16000');
INSERT INTO `kota` VALUES ('577', 'Pagaden', '16000');
INSERT INTO `kota` VALUES ('578', 'Bekasi', '8000');
INSERT INTO `kota` VALUES ('579', 'Bantar Gebang', '8000');
INSERT INTO `kota` VALUES ('580', 'Bekasi Barat', '8000');
INSERT INTO `kota` VALUES ('581', 'Bekasi Selatan', '8000');
INSERT INTO `kota` VALUES ('582', 'Bekasi Timur', '8000');
INSERT INTO `kota` VALUES ('583', 'Bekasi Utara', '8000');
INSERT INTO `kota` VALUES ('584', 'Jatiasih', '8000');
INSERT INTO `kota` VALUES ('585', 'Jatisampurna', '8000');
INSERT INTO `kota` VALUES ('586', 'Medan Satria', '8000');
INSERT INTO `kota` VALUES ('587', 'Mustika Jaya', '8000');
INSERT INTO `kota` VALUES ('588', 'Pondokgede', '8000');
INSERT INTO `kota` VALUES ('589', 'Pondok Melati', '8000');
INSERT INTO `kota` VALUES ('590', 'Rawalumbu', '8000');
INSERT INTO `kota` VALUES ('591', 'Cikarang', '8000');
INSERT INTO `kota` VALUES ('592', 'Cikarang Barat', '8000');
INSERT INTO `kota` VALUES ('593', 'Cikarang Pusat', '8000');
INSERT INTO `kota` VALUES ('594', 'Cikarang Selatan', '8000');
INSERT INTO `kota` VALUES ('595', 'Cikarang Timur', '8000');
INSERT INTO `kota` VALUES ('596', 'Cikarang Utara', '8000');
INSERT INTO `kota` VALUES ('597', 'Cabangbungin', '8000');
INSERT INTO `kota` VALUES ('598', 'Cibarusah', '8000');
INSERT INTO `kota` VALUES ('599', 'Cibitung', '8000');
INSERT INTO `kota` VALUES ('600', 'Kedungwaringin', '8000');
INSERT INTO `kota` VALUES ('601', 'Muara Gembong', '8000');
INSERT INTO `kota` VALUES ('602', 'Pebayuran', '8000');
INSERT INTO `kota` VALUES ('603', 'Serang Baru', '8000');
INSERT INTO `kota` VALUES ('604', 'Setu', '8000');
INSERT INTO `kota` VALUES ('605', 'Sukatani', '8000');
INSERT INTO `kota` VALUES ('606', 'Tambelang', '8000');
INSERT INTO `kota` VALUES ('607', 'Karangbahagia', '8000');
INSERT INTO `kota` VALUES ('608', 'Sukakarya', '8000');
INSERT INTO `kota` VALUES ('609', 'Sukawangi', '8000');
INSERT INTO `kota` VALUES ('610', 'Tambun Selatan', '8000');
INSERT INTO `kota` VALUES ('611', 'Tambun Utara', '8000');
INSERT INTO `kota` VALUES ('612', 'Tarumajaya', '8000');
INSERT INTO `kota` VALUES ('613', 'Babelan', '8000');
INSERT INTO `kota` VALUES ('614', 'Bojongmanggu', '8000');
INSERT INTO `kota` VALUES ('615', 'Bengkulu', '22000');
INSERT INTO `kota` VALUES ('616', 'Gading Cempaka', '22000');
INSERT INTO `kota` VALUES ('617', 'Kampung Melayu', '22000');
INSERT INTO `kota` VALUES ('618', 'Muara Bangkahulu', '22000');
INSERT INTO `kota` VALUES ('619', 'Ratu Agung', '22000');
INSERT INTO `kota` VALUES ('620', 'Ratu Samban', '22000');
INSERT INTO `kota` VALUES ('621', 'Selebar', '22000');
INSERT INTO `kota` VALUES ('622', 'Sungai Serut', '22000');
INSERT INTO `kota` VALUES ('623', 'Teluk Segara', '22000');
INSERT INTO `kota` VALUES ('624', 'Arga Makmur', '35000');
INSERT INTO `kota` VALUES ('625', 'Batik Nau', '44000');
INSERT INTO `kota` VALUES ('626', 'Giri Mulia', '44000');
INSERT INTO `kota` VALUES ('627', 'Lais', '44000');
INSERT INTO `kota` VALUES ('628', 'Padang Jaya', '44000');
INSERT INTO `kota` VALUES ('629', 'Air Besi', '44000');
INSERT INTO `kota` VALUES ('630', 'Air Napal', '44000');
INSERT INTO `kota` VALUES ('631', 'Enggano', '66000');
INSERT INTO `kota` VALUES ('632', 'Karang Tinggi', '44000');
INSERT INTO `kota` VALUES ('633', 'Kerkap', '44000');
INSERT INTO `kota` VALUES ('634', 'Ketahun', '44000');
INSERT INTO `kota` VALUES ('635', 'Pagar Jati', '44000');
INSERT INTO `kota` VALUES ('636', 'Pematang Tiga', '44000');
INSERT INTO `kota` VALUES ('637', 'Pondok Kelapa', '44000');
INSERT INTO `kota` VALUES ('638', 'Taba Penanjung', '44000');
INSERT INTO `kota` VALUES ('639', 'Napal Putih', '66000');
INSERT INTO `kota` VALUES ('640', 'Putri Hijau', '44000');
INSERT INTO `kota` VALUES ('641', 'Talang Empat', '44000');
INSERT INTO `kota` VALUES ('642', 'Curup', '35000');
INSERT INTO `kota` VALUES ('643', 'Kota Padang', '44000');
INSERT INTO `kota` VALUES ('644', 'Padang Ulak Tanding', '44000');
INSERT INTO `kota` VALUES ('645', 'Bermani Ulu', '44000');
INSERT INTO `kota` VALUES ('646', 'Selupu Rejang', '44000');
INSERT INTO `kota` VALUES ('647', 'Sindang Kelingi', '44000');
INSERT INTO `kota` VALUES ('648', 'Kota Manna', '35000');
INSERT INTO `kota` VALUES ('649', 'Kedurang', '44000');
INSERT INTO `kota` VALUES ('650', 'Pino', '44000');
INSERT INTO `kota` VALUES ('651', 'Manna', '44000');
INSERT INTO `kota` VALUES ('652', 'Pinoraya', '44000');
INSERT INTO `kota` VALUES ('653', 'Seginim', '44000');
INSERT INTO `kota` VALUES ('654', 'Kaur', '35000');
INSERT INTO `kota` VALUES ('655', 'Kaur Selatan', '35000');
INSERT INTO `kota` VALUES ('656', 'Kaur Tengah', '35000');
INSERT INTO `kota` VALUES ('657', 'Kaur Utara', '35000');
INSERT INTO `kota` VALUES ('658', 'Kinal', '44000');
INSERT INTO `kota` VALUES ('659', 'Nasal', '44000');
INSERT INTO `kota` VALUES ('660', 'Tanjung Kemuning', '44000');
INSERT INTO `kota` VALUES ('661', 'Maje', '44000');
INSERT INTO `kota` VALUES ('662', 'Kepahiang', '35000');
INSERT INTO `kota` VALUES ('663', 'Bermani Ilir', '44000');
INSERT INTO `kota` VALUES ('664', 'Tebat Karai', '44000');
INSERT INTO `kota` VALUES ('665', 'Ujan Mas', '44000');
INSERT INTO `kota` VALUES ('666', 'Lebong', '35000');
INSERT INTO `kota` VALUES ('667', 'Lebong Atas', '35000');
INSERT INTO `kota` VALUES ('668', 'Lebong Selatan', '35000');
INSERT INTO `kota` VALUES ('669', 'Lebong Tengah', '35000');
INSERT INTO `kota` VALUES ('670', 'Lebong Utara', '35000');
INSERT INTO `kota` VALUES ('671', 'Rimbo Pengadang', '44000');
INSERT INTO `kota` VALUES ('672', 'Muko-muko', '35000');
INSERT INTO `kota` VALUES ('673', 'Lubuk Pinang', '44000');
INSERT INTO `kota` VALUES ('674', 'Muko-Muko Selatan', '35000');
INSERT INTO `kota` VALUES ('675', 'Muko-Muko Utara', '35000');
INSERT INTO `kota` VALUES ('676', 'Pondok Suguh', '44000');
INSERT INTO `kota` VALUES ('677', 'Teras Terunjam', '44000');
INSERT INTO `kota` VALUES ('678', 'Tais', '35000');
INSERT INTO `kota` VALUES ('679', 'Air Periukan', '44000');
INSERT INTO `kota` VALUES ('680', 'Ilir Talo', '44000');
INSERT INTO `kota` VALUES ('681', 'Lubuk Sandi', '44000');
INSERT INTO `kota` VALUES ('682', 'Seluma', '44000');
INSERT INTO `kota` VALUES ('683', 'Seluma Barat', '44000');
INSERT INTO `kota` VALUES ('684', 'Seluma Selatan', '44000');
INSERT INTO `kota` VALUES ('685', 'Seluma Timur', '44000');
INSERT INTO `kota` VALUES ('686', 'Seluma Utara', '44000');
INSERT INTO `kota` VALUES ('687', 'Semidang Alas', '44000');
INSERT INTO `kota` VALUES ('688', 'Semidang Alas Maras', '44000');
INSERT INTO `kota` VALUES ('689', 'Sukaraja', '44000');
INSERT INTO `kota` VALUES ('690', 'Talo', '44000');
INSERT INTO `kota` VALUES ('691', 'Ulu Talo', '44000');
INSERT INTO `kota` VALUES ('692', 'Talo Kecil', '44000');
INSERT INTO `kota` VALUES ('693', 'Bogor', '8000');
INSERT INTO `kota` VALUES ('694', 'Bogor Barat', '8000');
INSERT INTO `kota` VALUES ('695', 'Bogor Selatan', '8000');
INSERT INTO `kota` VALUES ('696', 'Bogor Tengah', '8000');
INSERT INTO `kota` VALUES ('697', 'Bogor Timur', '8000');
INSERT INTO `kota` VALUES ('698', 'Bogor Utara', '8000');
INSERT INTO `kota` VALUES ('699', 'Tanah Sereal', '8000');
INSERT INTO `kota` VALUES ('700', 'Cibinong', '8000');
INSERT INTO `kota` VALUES ('701', 'Caringin', '8000');
INSERT INTO `kota` VALUES ('702', 'Cariu', '8000');
INSERT INTO `kota` VALUES ('703', 'Ciawi', '8000');
INSERT INTO `kota` VALUES ('704', 'Ciampea', '8000');
INSERT INTO `kota` VALUES ('705', 'Cibungbulang', '8000');
INSERT INTO `kota` VALUES ('706', 'Cigudeg', '8000');
INSERT INTO `kota` VALUES ('707', 'Cijeruk', '8000');
INSERT INTO `kota` VALUES ('708', 'Cileungsi', '8000');
INSERT INTO `kota` VALUES ('709', 'Ciomas', '8000');
INSERT INTO `kota` VALUES ('710', 'Cisarua', '8000');
INSERT INTO `kota` VALUES ('711', 'Citeureup', '8000');
INSERT INTO `kota` VALUES ('712', 'Dramaga', '8000');
INSERT INTO `kota` VALUES ('713', 'Gunung Sindur', '8000');
INSERT INTO `kota` VALUES ('714', 'Jasinga', '8000');
INSERT INTO `kota` VALUES ('715', 'Jonggol', '8000');
INSERT INTO `kota` VALUES ('716', 'Leuwiliang', '8000');
INSERT INTO `kota` VALUES ('717', 'Megamendung', '8000');
INSERT INTO `kota` VALUES ('718', 'Nanggung', '8000');
INSERT INTO `kota` VALUES ('719', 'Parung', '8000');
INSERT INTO `kota` VALUES ('720', 'Parung Panjang', '8000');
INSERT INTO `kota` VALUES ('721', 'Rumpin', '8000');
INSERT INTO `kota` VALUES ('722', 'Tenjo', '8000');
INSERT INTO `kota` VALUES ('723', 'Babakan Madang', '8000');
INSERT INTO `kota` VALUES ('724', 'Bojonggede', '8000');
INSERT INTO `kota` VALUES ('725', 'Cigombong', '8000');
INSERT INTO `kota` VALUES ('726', 'Ciseeng', '8000');
INSERT INTO `kota` VALUES ('727', 'Kemang', '8000');
INSERT INTO `kota` VALUES ('728', 'Klapanunggal', '8000');
INSERT INTO `kota` VALUES ('729', 'Leuwisadeng', '8000');
INSERT INTO `kota` VALUES ('730', 'Pamijahan', '8000');
INSERT INTO `kota` VALUES ('731', 'Ranca Bungur', '8000');
INSERT INTO `kota` VALUES ('732', 'Sukajaya', '8000');
INSERT INTO `kota` VALUES ('733', 'Sukamakmur', '8000');
INSERT INTO `kota` VALUES ('734', 'Sukaraja', '8000');
INSERT INTO `kota` VALUES ('735', 'Tajurhalang', '8000');
INSERT INTO `kota` VALUES ('736', 'Tamansari', '8000');
INSERT INTO `kota` VALUES ('737', 'Tanjungsari', '8000');
INSERT INTO `kota` VALUES ('738', 'Tenjolaya', '8000');
INSERT INTO `kota` VALUES ('739', 'Gunung Putri', '8000');
INSERT INTO `kota` VALUES ('740', 'Balikpapan', '36000');
INSERT INTO `kota` VALUES ('741', 'Samboja', '77000');
INSERT INTO `kota` VALUES ('742', 'Balikpapan Barat', '36000');
INSERT INTO `kota` VALUES ('743', 'Balikpapan Selatan', '36000');
INSERT INTO `kota` VALUES ('744', 'Balikpapan Tengah', '36000');
INSERT INTO `kota` VALUES ('745', 'Balikpapan Timur', '36000');
INSERT INTO `kota` VALUES ('746', 'Balikpapan Utara', '36000');
INSERT INTO `kota` VALUES ('747', 'Muara Jawa', '77000');
INSERT INTO `kota` VALUES ('748', 'Tanah Grogot', '61000');
INSERT INTO `kota` VALUES ('749', 'Batu Sopang', '77000');
INSERT INTO `kota` VALUES ('750', 'Kuaro', '77000');
INSERT INTO `kota` VALUES ('751', 'Long Kali', '77000');
INSERT INTO `kota` VALUES ('752', 'Long Ikis', '77000');
INSERT INTO `kota` VALUES ('753', 'Muara Komam', '77000');
INSERT INTO `kota` VALUES ('754', 'Pasir Balengkong', '116000');
INSERT INTO `kota` VALUES ('755', 'Batu Engau', '116000');
INSERT INTO `kota` VALUES ('756', 'Tanjung Harapan', '116000');
INSERT INTO `kota` VALUES ('757', 'Muara Samu', '116000');
INSERT INTO `kota` VALUES ('758', 'Tanjung Redeb', '61000');
INSERT INTO `kota` VALUES ('759', 'Biduk Biduk', '77000');
INSERT INTO `kota` VALUES ('760', 'Gunung Tabur', '77000');
INSERT INTO `kota` VALUES ('761', 'Kelay', '77000');
INSERT INTO `kota` VALUES ('762', 'Pulau Derawan', '77000');
INSERT INTO `kota` VALUES ('763', 'Sambaliung', '77000');
INSERT INTO `kota` VALUES ('764', 'Segah', '77000');
INSERT INTO `kota` VALUES ('765', 'Talisayan', '77000');
INSERT INTO `kota` VALUES ('766', 'Maratua', '77000');
INSERT INTO `kota` VALUES ('767', 'Teluk Bayur', '77000');
INSERT INTO `kota` VALUES ('768', 'Tubaan', '77000');
INSERT INTO `kota` VALUES ('769', 'Penajam', '61000');
INSERT INTO `kota` VALUES ('770', 'Waru', '77000');
INSERT INTO `kota` VALUES ('771', 'Babulu', '77000');
INSERT INTO `kota` VALUES ('772', 'Sepaku', '116000');
INSERT INTO `kota` VALUES ('773', 'Bontang', '49000');
INSERT INTO `kota` VALUES ('774', 'Bontang Barat', '49000');
INSERT INTO `kota` VALUES ('775', 'Bontang Selatan', '49000');
INSERT INTO `kota` VALUES ('776', 'Bontang Utara', '49000');
INSERT INTO `kota` VALUES ('777', 'Sangatta', '52000');
INSERT INTO `kota` VALUES ('778', 'Teluk Pandan', '52000');
INSERT INTO `kota` VALUES ('779', 'Batu Ampar', '98000');
INSERT INTO `kota` VALUES ('780', 'Bengalon', '65000');
INSERT INTO `kota` VALUES ('781', 'Busang', '98000');
INSERT INTO `kota` VALUES ('782', 'Kaliorang', '65000');
INSERT INTO `kota` VALUES ('783', 'Karangan', '98000');
INSERT INTO `kota` VALUES ('784', 'Kaubun', '98000');
INSERT INTO `kota` VALUES ('785', 'Kongbeng', '98000');
INSERT INTO `kota` VALUES ('786', 'Long Masengat', '98000');
INSERT INTO `kota` VALUES ('787', 'Muara Ancalong', '98000');
INSERT INTO `kota` VALUES ('788', 'Muara Bengkal', '98000');
INSERT INTO `kota` VALUES ('789', 'Muara Wahau', '65000');
INSERT INTO `kota` VALUES ('790', 'Rantau Pulung', '65000');
INSERT INTO `kota` VALUES ('791', 'Sandaran', '98000');
INSERT INTO `kota` VALUES ('792', 'Sangatta Selatan', '52000');
INSERT INTO `kota` VALUES ('793', 'Sangkulirang', '65000');
INSERT INTO `kota` VALUES ('794', 'Telen', '98000');
INSERT INTO `kota` VALUES ('795', 'Sangkima', '52000');
INSERT INTO `kota` VALUES ('796', 'Swarga Bara', '52000');
INSERT INTO `kota` VALUES ('797', 'Singa Gembara', '52000');
INSERT INTO `kota` VALUES ('798', 'Batam', '25000');
INSERT INTO `kota` VALUES ('799', 'Nongsa/ Kabil/ Lagoi', '25000');
INSERT INTO `kota` VALUES ('800', 'Sekupang/ Tanjung Ucang', '25000');
INSERT INTO `kota` VALUES ('801', 'Batu Ampar', '25000');
INSERT INTO `kota` VALUES ('802', 'Belakang Padang', '25000');
INSERT INTO `kota` VALUES ('803', 'Bulang Galang', '25000');
INSERT INTO `kota` VALUES ('804', 'Galang', '25000');
INSERT INTO `kota` VALUES ('805', 'Lubuk Baja', '25000');
INSERT INTO `kota` VALUES ('806', 'Sei Beduk', '25000');
INSERT INTO `kota` VALUES ('807', 'Daik', '50000');
INSERT INTO `kota` VALUES ('808', 'Lingga', '50000');
INSERT INTO `kota` VALUES ('809', 'Lingga Utara', '95000');
INSERT INTO `kota` VALUES ('810', 'Senayang', '95000');
INSERT INTO `kota` VALUES ('811', 'Singkep', '50000');
INSERT INTO `kota` VALUES ('812', 'Singkep Barat', '95000');
INSERT INTO `kota` VALUES ('813', 'Ranai', '50000');
INSERT INTO `kota` VALUES ('814', 'Bunguran Barat', '95000');
INSERT INTO `kota` VALUES ('815', 'Bunguran Timur', '95000');
INSERT INTO `kota` VALUES ('816', 'Bunguran Timur Laut', '95000');
INSERT INTO `kota` VALUES ('817', 'Bunguran Tengah', '95000');
INSERT INTO `kota` VALUES ('818', 'Bunguran Utara', '95000');
INSERT INTO `kota` VALUES ('819', 'Jemaja', '95000');
INSERT INTO `kota` VALUES ('820', 'Jemaja Timur', '95000');
INSERT INTO `kota` VALUES ('821', 'Midai', '95000');
INSERT INTO `kota` VALUES ('822', 'Pal Matak', '95000');
INSERT INTO `kota` VALUES ('823', 'Serasan', '95000');
INSERT INTO `kota` VALUES ('824', 'Siantan', '95000');
INSERT INTO `kota` VALUES ('825', 'Siantan Selatan', '95000');
INSERT INTO `kota` VALUES ('826', 'Siantan Timur', '95000');
INSERT INTO `kota` VALUES ('827', 'Subi', '95000');
INSERT INTO `kota` VALUES ('828', 'Pulau Laut', '95000');
INSERT INTO `kota` VALUES ('829', 'Pulau Tiga', '95000');
INSERT INTO `kota` VALUES ('830', 'Tanjung Balai Karimun', '50000');
INSERT INTO `kota` VALUES ('831', 'Buru', '95000');
INSERT INTO `kota` VALUES ('832', 'Karimun', '63000');
INSERT INTO `kota` VALUES ('833', 'Kundur', '50000');
INSERT INTO `kota` VALUES ('834', 'Kundur Barat', '63000');
INSERT INTO `kota` VALUES ('835', 'Kundur Utara', '63000');
INSERT INTO `kota` VALUES ('836', 'Meral', '63000');
INSERT INTO `kota` VALUES ('837', 'Moro', '95000');
INSERT INTO `kota` VALUES ('838', 'Tebing', '63000');
INSERT INTO `kota` VALUES ('839', 'Tanjung Batu', '63000');
INSERT INTO `kota` VALUES ('840', 'Banda Aceh', '33000');
INSERT INTO `kota` VALUES ('841', 'Meuraksa', '33000');
INSERT INTO `kota` VALUES ('842', 'Jaya Baru', '33000');
INSERT INTO `kota` VALUES ('843', 'Banda Raya', '33000');
INSERT INTO `kota` VALUES ('844', 'Baiturrahman', '33000');
INSERT INTO `kota` VALUES ('845', 'Lueng Bata', '33000');
INSERT INTO `kota` VALUES ('846', 'Kuta Alam', '33000');
INSERT INTO `kota` VALUES ('847', 'Kuta Raja', '33000');
INSERT INTO `kota` VALUES ('848', 'Syiah Kuala', '33000');
INSERT INTO `kota` VALUES ('849', 'Ulee Kareng', '33000');
INSERT INTO `kota` VALUES ('850', 'Langsa', '48000');
INSERT INTO `kota` VALUES ('851', 'Langsa Barat', '48000');
INSERT INTO `kota` VALUES ('852', 'Langsa Kota', '48000');
INSERT INTO `kota` VALUES ('853', 'Langsa Lama', '48000');
INSERT INTO `kota` VALUES ('854', 'Langsa Teungoh', '48000');
INSERT INTO `kota` VALUES ('855', 'Langsa Timur', '48000');
INSERT INTO `kota` VALUES ('856', 'Lhokseumawe', '48000');
INSERT INTO `kota` VALUES ('857', 'Muara Dua', '48000');
INSERT INTO `kota` VALUES ('858', 'Banda Sakti', '48000');
INSERT INTO `kota` VALUES ('859', 'Blang Mangat', '48000');
INSERT INTO `kota` VALUES ('860', 'Janto', '48000');
INSERT INTO `kota` VALUES ('861', 'Darul Imarah', '60000');
INSERT INTO `kota` VALUES ('862', 'Darussalam', '60000');
INSERT INTO `kota` VALUES ('863', 'Indrapuri', '60000');
INSERT INTO `kota` VALUES ('864', 'Ingin Jaya', '60000');
INSERT INTO `kota` VALUES ('865', 'Kuta Baro', '60000');
INSERT INTO `kota` VALUES ('866', 'Lho\'Nga', '60000');
INSERT INTO `kota` VALUES ('867', 'Lhoong', '60000');
INSERT INTO `kota` VALUES ('868', 'Mesjid Raya', '60000');
INSERT INTO `kota` VALUES ('869', 'Montasik', '60000');
INSERT INTO `kota` VALUES ('870', 'Peukan Bada', '60000');
INSERT INTO `kota` VALUES ('871', 'Suka Makmur', '60000');
INSERT INTO `kota` VALUES ('872', 'Simpang tiga', '60000');
INSERT INTO `kota` VALUES ('873', 'Baitussalam', '60000');
INSERT INTO `kota` VALUES ('874', 'Darul Kamal', '60000');
INSERT INTO `kota` VALUES ('875', 'Krueng Barona Jaya', '60000');
INSERT INTO `kota` VALUES ('876', 'Kuta Cot Glie', '60000');
INSERT INTO `kota` VALUES ('877', 'Kuta Malaka', '60000');
INSERT INTO `kota` VALUES ('878', 'Lembah Seulawah', '60000');
INSERT INTO `kota` VALUES ('879', 'Leupung', '60000');
INSERT INTO `kota` VALUES ('880', 'Puroaceh', '60000');
INSERT INTO `kota` VALUES ('881', 'Seulimeum', '60000');
INSERT INTO `kota` VALUES ('882', 'Bireuen', '48000');
INSERT INTO `kota` VALUES ('883', 'Jeunieb', '60000');
INSERT INTO `kota` VALUES ('884', 'Peusangan', '60000');
INSERT INTO `kota` VALUES ('885', 'Peudada', '60000');
INSERT INTO `kota` VALUES ('886', 'Samalanga', '60000');
INSERT INTO `kota` VALUES ('887', 'Ganda Pura', '60000');
INSERT INTO `kota` VALUES ('888', 'Makmur', '60000');
INSERT INTO `kota` VALUES ('889', 'Kuala', '60000');
INSERT INTO `kota` VALUES ('890', 'Jangka', '60000');
INSERT INTO `kota` VALUES ('891', 'Jeumpa', '60000');
INSERT INTO `kota` VALUES ('892', 'Juli', '60000');
INSERT INTO `kota` VALUES ('893', 'Kota Juang', '60000');
INSERT INTO `kota` VALUES ('894', 'Kuta Blang', '60000');
INSERT INTO `kota` VALUES ('895', 'Pandrah', '60000');
INSERT INTO `kota` VALUES ('896', 'Peusangan Selatan', '60000');
INSERT INTO `kota` VALUES ('897', 'Peusangan Siblah Krueng', '60000');
INSERT INTO `kota` VALUES ('898', 'Primbang', '60000');
INSERT INTO `kota` VALUES ('899', 'Simpang Mamplam', '60000');
INSERT INTO `kota` VALUES ('900', 'Kutacane', '48000');
INSERT INTO `kota` VALUES ('901', 'Badar', '60000');
INSERT INTO `kota` VALUES ('902', 'Bambel', '60000');
INSERT INTO `kota` VALUES ('903', 'Lawe Alas', '60000');
INSERT INTO `kota` VALUES ('904', 'Lawe Sigala-gala', '60000');
INSERT INTO `kota` VALUES ('905', 'Babul Makmur', '60000');
INSERT INTO `kota` VALUES ('906', 'Babul Rahmat', '60000');
INSERT INTO `kota` VALUES ('907', 'Babussalam', '60000');
INSERT INTO `kota` VALUES ('908', 'Bukit Tusam', '60000');
INSERT INTO `kota` VALUES ('909', 'Darul Hasanah', '60000');
INSERT INTO `kota` VALUES ('910', 'Lawe Bulan', '60000');
INSERT INTO `kota` VALUES ('911', 'Semadam', '60000');
INSERT INTO `kota` VALUES ('912', 'Meulaboh', '48000');
INSERT INTO `kota` VALUES ('913', 'Kec. Kaway XVI', '60000');
INSERT INTO `kota` VALUES ('914', 'Samatiga', '60000');
INSERT INTO `kota` VALUES ('915', 'Sungai Mas', '60000');
INSERT INTO `kota` VALUES ('916', 'Woyla', '60000');
INSERT INTO `kota` VALUES ('917', 'Bubon', '60000');
INSERT INTO `kota` VALUES ('918', 'Arongan Lambalek', '60000');
INSERT INTO `kota` VALUES ('919', 'Johan Pahlawan', '60000');
INSERT INTO `kota` VALUES ('920', 'Woyla Barat', '60000');
INSERT INTO `kota` VALUES ('921', 'Woyla Timur', '60000');
INSERT INTO `kota` VALUES ('922', 'Pante Ceureumen', '60000');
INSERT INTO `kota` VALUES ('923', 'Sigli', '48000');
INSERT INTO `kota` VALUES ('924', 'Batee', '60000');
INSERT INTO `kota` VALUES ('925', 'Delima', '60000');
INSERT INTO `kota` VALUES ('926', 'Geumpang', '60000');
INSERT INTO `kota` VALUES ('927', 'Glumpang Tiga', '60000');
INSERT INTO `kota` VALUES ('928', 'Indrajaya', '60000');
INSERT INTO `kota` VALUES ('929', 'Kembang Tanjung', '60000');
INSERT INTO `kota` VALUES ('930', 'Mila', '60000');
INSERT INTO `kota` VALUES ('931', 'Muara Tiga', '60000');
INSERT INTO `kota` VALUES ('932', 'Mutiara', '60000');
INSERT INTO `kota` VALUES ('933', 'Padang Tiji', '60000');
INSERT INTO `kota` VALUES ('934', 'Peukan Baro', '60000');
INSERT INTO `kota` VALUES ('935', 'Pidie', '60000');
INSERT INTO `kota` VALUES ('936', 'Sakti', '60000');
INSERT INTO `kota` VALUES ('937', 'Tangse', '60000');
INSERT INTO `kota` VALUES ('938', 'Tiro/Truseb', '60000');
INSERT INTO `kota` VALUES ('939', 'Titeua/Keumala', '60000');
INSERT INTO `kota` VALUES ('940', 'Gleumpang Baro', '60000');
INSERT INTO `kota` VALUES ('941', 'Grong-Grong', '60000');
INSERT INTO `kota` VALUES ('942', 'Mane', '60000');
INSERT INTO `kota` VALUES ('943', 'Mutiara Timur', '60000');
INSERT INTO `kota` VALUES ('944', 'Takengon', '48000');
INSERT INTO `kota` VALUES ('945', 'Bebesen', '60000');
INSERT INTO `kota` VALUES ('946', 'Bintang', '60000');
INSERT INTO `kota` VALUES ('947', 'Linge Isak', '60000');
INSERT INTO `kota` VALUES ('948', 'Pegasing', '60000');
INSERT INTO `kota` VALUES ('949', 'Silih Nara', '60000');
INSERT INTO `kota` VALUES ('950', 'Atu Lintang', '60000');
INSERT INTO `kota` VALUES ('951', 'Bies', '60000');
INSERT INTO `kota` VALUES ('952', 'Celala', '60000');
INSERT INTO `kota` VALUES ('953', 'Jagong Jeget', '60000');
INSERT INTO `kota` VALUES ('954', 'Kebayakan', '60000');
INSERT INTO `kota` VALUES ('955', 'Ketol', '60000');
INSERT INTO `kota` VALUES ('956', 'Kute Panang', '60000');
INSERT INTO `kota` VALUES ('957', 'LautTawar', '60000');
INSERT INTO `kota` VALUES ('958', 'Rusip Antara', '60000');
INSERT INTO `kota` VALUES ('959', 'Tapak Tuan', '48000');
INSERT INTO `kota` VALUES ('960', 'Bakongan', '60000');
INSERT INTO `kota` VALUES ('961', 'Kluet Utara', '60000');
INSERT INTO `kota` VALUES ('962', 'Kluet Selatan', '60000');
INSERT INTO `kota` VALUES ('963', 'Labuhan Haji', '60000');
INSERT INTO `kota` VALUES ('964', 'Meukek', '60000');
INSERT INTO `kota` VALUES ('965', 'Sama Dua', '60000');
INSERT INTO `kota` VALUES ('966', 'Trumon', '60000');
INSERT INTO `kota` VALUES ('967', 'Bakongan Timur', '60000');
INSERT INTO `kota` VALUES ('968', 'Kluet Tengah', '60000');
INSERT INTO `kota` VALUES ('969', 'Kluet Timur', '60000');
INSERT INTO `kota` VALUES ('970', 'Labuhan Haji Barat', '60000');
INSERT INTO `kota` VALUES ('971', 'Labuhan Haji Timur', '60000');
INSERT INTO `kota` VALUES ('972', 'Pasie raja', '60000');
INSERT INTO `kota` VALUES ('973', 'Trumon Timur', '60000');
INSERT INTO `kota` VALUES ('974', 'Sawang', '60000');
INSERT INTO `kota` VALUES ('975', 'Sabang', '48000');
INSERT INTO `kota` VALUES ('976', 'Sukakarya', '48000');
INSERT INTO `kota` VALUES ('977', 'Sukajaya', '48000');
INSERT INTO `kota` VALUES ('978', 'Blangpidie', '48000');
INSERT INTO `kota` VALUES ('979', 'Babah Rot', '60000');
INSERT INTO `kota` VALUES ('980', 'kuala Batee', '60000');
INSERT INTO `kota` VALUES ('981', 'Manggeng', '60000');
INSERT INTO `kota` VALUES ('982', 'Susoh', '60000');
INSERT INTO `kota` VALUES ('983', 'Tangan Tangan', '60000');
INSERT INTO `kota` VALUES ('984', 'Krueng Sabee/Calang', '48000');
INSERT INTO `kota` VALUES ('985', 'Jaya', '60000');
INSERT INTO `kota` VALUES ('986', 'Pangat', '60000');
INSERT INTO `kota` VALUES ('987', 'Sampo Niet', '60000');
INSERT INTO `kota` VALUES ('988', 'Setia Bakti', '60000');
INSERT INTO `kota` VALUES ('989', 'Teunom', '60000');
INSERT INTO `kota` VALUES ('990', 'Singkil', '48000');
INSERT INTO `kota` VALUES ('991', 'Danau Paris', '60000');
INSERT INTO `kota` VALUES ('992', 'Gunung Meriah', '60000');
INSERT INTO `kota` VALUES ('993', 'Kota Baharu', '60000');
INSERT INTO `kota` VALUES ('994', 'Pulau Banyak', '60000');
INSERT INTO `kota` VALUES ('995', 'Simpang Kanan', '60000');
INSERT INTO `kota` VALUES ('996', 'Singkil Utara', '60000');
INSERT INTO `kota` VALUES ('997', 'Singkohor', '60000');
INSERT INTO `kota` VALUES ('998', 'Suro Baru', '60000');
INSERT INTO `kota` VALUES ('999', 'Kuala Simpang', '48000');
INSERT INTO `kota` VALUES ('1000', 'Bendahara', '60000');
INSERT INTO `kota` VALUES ('1001', 'Karang Baru', '60000');
INSERT INTO `kota` VALUES ('1002', 'Kejuruan Muda', '60000');
INSERT INTO `kota` VALUES ('1003', 'Manyak Payed', '60000');
INSERT INTO `kota` VALUES ('1004', 'Rantau', '60000');
INSERT INTO `kota` VALUES ('1005', 'Seuruway', '60000');
INSERT INTO `kota` VALUES ('1006', 'Tamiang Hulu', '60000');
INSERT INTO `kota` VALUES ('1007', 'Idi Rayeuk', '48000');
INSERT INTO `kota` VALUES ('1008', 'Banda Alam', '60000');
INSERT INTO `kota` VALUES ('1009', 'Birem Bayeun', '60000');
INSERT INTO `kota` VALUES ('1010', 'Darul Aman', '60000');
INSERT INTO `kota` VALUES ('1011', 'Darul Iksan', '60000');
INSERT INTO `kota` VALUES ('1012', 'Idi Tuning', '60000');
INSERT INTO `kota` VALUES ('1013', 'Indra Makmur', '60000');
INSERT INTO `kota` VALUES ('1014', 'Julok', '60000');
INSERT INTO `kota` VALUES ('1015', 'Madat', '60000');
INSERT INTO `kota` VALUES ('1016', 'Nurussalam', '60000');
INSERT INTO `kota` VALUES ('1017', 'Pante Beudari', '60000');
INSERT INTO `kota` VALUES ('1018', 'Peudawa', '60000');
INSERT INTO `kota` VALUES ('1019', 'Peureulak', '60000');
INSERT INTO `kota` VALUES ('1020', 'Peureulak Barat', '60000');
INSERT INTO `kota` VALUES ('1021', 'Peureulak Timur', '60000');
INSERT INTO `kota` VALUES ('1022', 'Rantau Selamat', '60000');
INSERT INTO `kota` VALUES ('1023', 'Ranto Peureulak', '60000');
INSERT INTO `kota` VALUES ('1024', 'Serba Jadi/Lokop', '60000');
INSERT INTO `kota` VALUES ('1025', 'Simpang Jernih', '60000');
INSERT INTO `kota` VALUES ('1026', 'Simpang Ulim', '60000');
INSERT INTO `kota` VALUES ('1027', 'Sungai Raya', '60000');
INSERT INTO `kota` VALUES ('1028', 'Lhoksukon', '48000');
INSERT INTO `kota` VALUES ('1029', 'Baktia', '60000');
INSERT INTO `kota` VALUES ('1030', 'Baktia Barat', '60000');
INSERT INTO `kota` VALUES ('1031', 'Cot Girek', '60000');
INSERT INTO `kota` VALUES ('1032', 'Dewantara', '60000');
INSERT INTO `kota` VALUES ('1033', 'Kuta Makmur', '60000');
INSERT INTO `kota` VALUES ('1034', 'Langkahan', '60000');
INSERT INTO `kota` VALUES ('1035', 'Matang Kuli', '60000');
INSERT INTO `kota` VALUES ('1036', 'Meurah Mulia', '60000');
INSERT INTO `kota` VALUES ('1037', 'Muara Batu', '60000');
INSERT INTO `kota` VALUES ('1038', 'Nibong', '60000');
INSERT INTO `kota` VALUES ('1039', 'Nisam', '60000');
INSERT INTO `kota` VALUES ('1040', 'Paya Bakong', '60000');
INSERT INTO `kota` VALUES ('1041', 'Samudera', '60000');
INSERT INTO `kota` VALUES ('1042', 'Seunuddon', '60000');
INSERT INTO `kota` VALUES ('1043', 'Simpang Keuramat', '60000');
INSERT INTO `kota` VALUES ('1044', 'Syamtalira Aron', '60000');
INSERT INTO `kota` VALUES ('1045', 'Syamtalira Bayu', '60000');
INSERT INTO `kota` VALUES ('1046', 'Tanah Luas', '60000');
INSERT INTO `kota` VALUES ('1047', 'Tanah Jambo Aye', '60000');
INSERT INTO `kota` VALUES ('1048', 'Tanah Pasir', '60000');
INSERT INTO `kota` VALUES ('1049', 'Simpang Tiga Redelon', '48000');
INSERT INTO `kota` VALUES ('1050', 'Bandar', '60000');
INSERT INTO `kota` VALUES ('1051', 'Bukit', '60000');
INSERT INTO `kota` VALUES ('1052', 'Permata', '60000');
INSERT INTO `kota` VALUES ('1053', 'Pintu Rime', '60000');
INSERT INTO `kota` VALUES ('1054', 'Syiah Kuala', '60000');
INSERT INTO `kota` VALUES ('1055', 'Timang Gajah', '60000');
INSERT INTO `kota` VALUES ('1056', 'Wih Pesam', '60000');
INSERT INTO `kota` VALUES ('1057', 'Blang Kejeren', '48000');
INSERT INTO `kota` VALUES ('1058', 'Kuta Panjang', '60000');
INSERT INTO `kota` VALUES ('1059', 'Pining', '60000');
INSERT INTO `kota` VALUES ('1060', 'Rikit Gaib', '60000');
INSERT INTO `kota` VALUES ('1061', 'Terangon', '60000');
INSERT INTO `kota` VALUES ('1062', 'Putri Betung', '60000');
INSERT INTO `kota` VALUES ('1063', 'Blang Pegayon', '60000');
INSERT INTO `kota` VALUES ('1064', 'Dabung Gelang', '60000');
INSERT INTO `kota` VALUES ('1065', 'Blang Jerango', '60000');
INSERT INTO `kota` VALUES ('1066', 'Teripe Jaya', '60000');
INSERT INTO `kota` VALUES ('1067', 'Pantan Jaya', '60000');
INSERT INTO `kota` VALUES ('1068', 'Suka Makmue', '48000');
INSERT INTO `kota` VALUES ('1069', 'Beutong', '60000');
INSERT INTO `kota` VALUES ('1070', 'Darul Makmur', '60000');
INSERT INTO `kota` VALUES ('1071', 'Seunagan', '60000');
INSERT INTO `kota` VALUES ('1072', 'Seunagan Timur', '60000');
INSERT INTO `kota` VALUES ('1073', 'Meureudu', '48000');
INSERT INTO `kota` VALUES ('1074', 'Ulim', '60000');
INSERT INTO `kota` VALUES ('1075', 'Jangka Buya', '60000');
INSERT INTO `kota` VALUES ('1076', 'Bandar Dua', '60000');
INSERT INTO `kota` VALUES ('1077', 'Meurah Dua', '60000');
INSERT INTO `kota` VALUES ('1078', 'Bandar Baru', '60000');
INSERT INTO `kota` VALUES ('1079', 'Panteraja', '60000');
INSERT INTO `kota` VALUES ('1080', 'Trienggading', '60000');
INSERT INTO `kota` VALUES ('1081', 'Sinabang', '90000');
INSERT INTO `kota` VALUES ('1082', 'Alafan', '90000');
INSERT INTO `kota` VALUES ('1083', 'Salang', '90000');
INSERT INTO `kota` VALUES ('1084', 'Simeulue Tengah', '90000');
INSERT INTO `kota` VALUES ('1085', 'Simeulue Timur', '90000');
INSERT INTO `kota` VALUES ('1086', 'Simuelue Barat', '90000');
INSERT INTO `kota` VALUES ('1087', 'Teluk Dalam', '90000');
INSERT INTO `kota` VALUES ('1088', 'Teupah Selatan', '90000');
INSERT INTO `kota` VALUES ('1089', 'Teupah Barat', '90000');
INSERT INTO `kota` VALUES ('1090', 'Subulussalam', '48000');
INSERT INTO `kota` VALUES ('1091', 'Simpang Kiri', '48000');
INSERT INTO `kota` VALUES ('1092', 'Penanggalan', '48000');
INSERT INTO `kota` VALUES ('1093', 'Rundeng', '48000');
INSERT INTO `kota` VALUES ('1094', 'Sultan Daulat', '48000');
INSERT INTO `kota` VALUES ('1095', 'Longkip', '48000');
INSERT INTO `kota` VALUES ('1096', 'Cirebon', '10000');
INSERT INTO `kota` VALUES ('1097', 'Cirebon Barat', '10000');
INSERT INTO `kota` VALUES ('1098', 'Harjamukti', '10000');
INSERT INTO `kota` VALUES ('1099', 'Kejaksan', '10000');
INSERT INTO `kota` VALUES ('1100', 'Kesambi', '10000');
INSERT INTO `kota` VALUES ('1101', 'Lemahwungkuk', '10000');
INSERT INTO `kota` VALUES ('1102', 'Pekalipan', '10000');
INSERT INTO `kota` VALUES ('1103', 'Indramayu', '13000');
INSERT INTO `kota` VALUES ('1104', 'Anjatan', '16000');
INSERT INTO `kota` VALUES ('1105', 'Balongan', '16000');
INSERT INTO `kota` VALUES ('1106', 'Bangodua', '16000');
INSERT INTO `kota` VALUES ('1107', 'Bongas', '16000');
INSERT INTO `kota` VALUES ('1108', 'Cikedung', '16000');
INSERT INTO `kota` VALUES ('1109', 'Gabus Wetan', '16000');
INSERT INTO `kota` VALUES ('1110', 'Haurgeulis', '16000');
INSERT INTO `kota` VALUES ('1111', 'Jatibarang', '13000');
INSERT INTO `kota` VALUES ('1112', 'Juntiyuat', '16000');
INSERT INTO `kota` VALUES ('1113', 'Kandanghaur', '16000');
INSERT INTO `kota` VALUES ('1114', 'Karangampel', '16000');
INSERT INTO `kota` VALUES ('1115', 'Kertasemaya', '16000');
INSERT INTO `kota` VALUES ('1116', 'Krangkeng', '16000');
INSERT INTO `kota` VALUES ('1117', 'Kroya', '16000');
INSERT INTO `kota` VALUES ('1118', 'Lelea', '16000');
INSERT INTO `kota` VALUES ('1119', 'Lohbener', '16000');
INSERT INTO `kota` VALUES ('1120', 'Losarang', '16000');
INSERT INTO `kota` VALUES ('1121', 'Sliyeg', '16000');
INSERT INTO `kota` VALUES ('1122', 'Sukra', '16000');
INSERT INTO `kota` VALUES ('1123', 'Widasari', '16000');
INSERT INTO `kota` VALUES ('1124', 'Arahan', '16000');
INSERT INTO `kota` VALUES ('1125', 'Cantigi', '16000');
INSERT INTO `kota` VALUES ('1126', 'Gantar', '16000');
INSERT INTO `kota` VALUES ('1127', 'Kedokan Bunder', '16000');
INSERT INTO `kota` VALUES ('1128', 'Sindang', '16000');
INSERT INTO `kota` VALUES ('1129', 'Sukagumiwang', '16000');
INSERT INTO `kota` VALUES ('1130', 'Trisi', '16000');
INSERT INTO `kota` VALUES ('1131', 'Kuningan', '13000');
INSERT INTO `kota` VALUES ('1132', 'Ciawi Gebang', '16000');
INSERT INTO `kota` VALUES ('1133', 'Cibingbin', '16000');
INSERT INTO `kota` VALUES ('1134', 'Cibeureum', '16000');
INSERT INTO `kota` VALUES ('1135', 'Cidahu', '16000');
INSERT INTO `kota` VALUES ('1136', 'Cilimus', '16000');
INSERT INTO `kota` VALUES ('1137', 'Cilebak', '16000');
INSERT INTO `kota` VALUES ('1138', 'Cimahi', '16000');
INSERT INTO `kota` VALUES ('1139', 'Ciniru', '16000');
INSERT INTO `kota` VALUES ('1140', 'Cipicung', '16000');
INSERT INTO `kota` VALUES ('1141', 'Darma', '16000');
INSERT INTO `kota` VALUES ('1142', 'Garawangi', '16000');
INSERT INTO `kota` VALUES ('1143', 'Hantara', '16000');
INSERT INTO `kota` VALUES ('1144', 'Jalaksana', '16000');
INSERT INTO `kota` VALUES ('1145', 'Japara', '16000');
INSERT INTO `kota` VALUES ('1146', 'Kadugede', '16000');
INSERT INTO `kota` VALUES ('1147', 'Kalimanggis', '16000');
INSERT INTO `kota` VALUES ('1148', 'Karangkancana', '16000');
INSERT INTO `kota` VALUES ('1149', 'Kramatmulya', '16000');
INSERT INTO `kota` VALUES ('1150', 'Lebakwangi', '16000');
INSERT INTO `kota` VALUES ('1151', 'Luragung', '16000');
INSERT INTO `kota` VALUES ('1152', 'Maleber', '16000');
INSERT INTO `kota` VALUES ('1153', 'Mandirancan', '16000');
INSERT INTO `kota` VALUES ('1154', 'Nusaherang', '16000');
INSERT INTO `kota` VALUES ('1155', 'Pancalang', '16000');
INSERT INTO `kota` VALUES ('1156', 'Selajambe', '16000');
INSERT INTO `kota` VALUES ('1157', 'Sindangagung', '16000');
INSERT INTO `kota` VALUES ('1158', 'Subang', '16000');
INSERT INTO `kota` VALUES ('1159', 'Cigandamekar', '16000');
INSERT INTO `kota` VALUES ('1160', 'Ciwaru', '16000');
INSERT INTO `kota` VALUES ('1161', 'Majalengka', '13000');
INSERT INTO `kota` VALUES ('1162', 'Argapura', '16000');
INSERT INTO `kota` VALUES ('1163', 'Bantarujeg', '16000');
INSERT INTO `kota` VALUES ('1164', 'Cikijing', '16000');
INSERT INTO `kota` VALUES ('1165', 'Dawuan', '16000');
INSERT INTO `kota` VALUES ('1166', 'Jatiwangi', '13000');
INSERT INTO `kota` VALUES ('1167', 'Jatitujuh', '16000');
INSERT INTO `kota` VALUES ('1168', 'Kadipaten', '13000');
INSERT INTO `kota` VALUES ('1169', 'Kertajati', '16000');
INSERT INTO `kota` VALUES ('1170', 'Lemahsugih', '16000');
INSERT INTO `kota` VALUES ('1171', 'Leuwimunding', '16000');
INSERT INTO `kota` VALUES ('1172', 'Ligung', '16000');
INSERT INTO `kota` VALUES ('1173', 'Maja', '16000');
INSERT INTO `kota` VALUES ('1174', 'Palasah', '16000');
INSERT INTO `kota` VALUES ('1175', 'Panyingkiran', '16000');
INSERT INTO `kota` VALUES ('1176', 'Rajagaluh', '16000');
INSERT INTO `kota` VALUES ('1177', 'Sukahaji', '16000');
INSERT INTO `kota` VALUES ('1178', 'Sumber Jaya', '16000');
INSERT INTO `kota` VALUES ('1179', 'Talaga', '16000');
INSERT INTO `kota` VALUES ('1180', 'Cigasong', '16000');
INSERT INTO `kota` VALUES ('1181', 'Cingambul', '16000');
INSERT INTO `kota` VALUES ('1182', 'Sindangwangi', '16000');
INSERT INTO `kota` VALUES ('1183', 'Sumber', '13000');
INSERT INTO `kota` VALUES ('1184', 'Arjawinangun', '16000');
INSERT INTO `kota` VALUES ('1185', 'Astanajapura', '16000');
INSERT INTO `kota` VALUES ('1186', 'Babakan', '16000');
INSERT INTO `kota` VALUES ('1187', 'Beber', '16000');
INSERT INTO `kota` VALUES ('1188', 'Ciledug', '16000');
INSERT INTO `kota` VALUES ('1189', 'Cirebon Utara', '16000');
INSERT INTO `kota` VALUES ('1190', 'Cirebon Selatan', '16000');
INSERT INTO `kota` VALUES ('1191', 'Ciwaringin', '16000');
INSERT INTO `kota` VALUES ('1192', 'Depok', '16000');
INSERT INTO `kota` VALUES ('1193', 'Dukupuntang', '16000');
INSERT INTO `kota` VALUES ('1194', 'Gebang', '16000');
INSERT INTO `kota` VALUES ('1195', 'Gegesik', '16000');
INSERT INTO `kota` VALUES ('1196', 'Gempol', '16000');
INSERT INTO `kota` VALUES ('1197', 'Kaliwedi', '16000');
INSERT INTO `kota` VALUES ('1198', 'Kapetakan', '16000');
INSERT INTO `kota` VALUES ('1199', 'Karangsembung', '16000');
INSERT INTO `kota` VALUES ('1200', 'Karangwareng', '16000');
INSERT INTO `kota` VALUES ('1201', 'Kedawung', '16000');
INSERT INTO `kota` VALUES ('1202', 'Klangenan', '16000');
INSERT INTO `kota` VALUES ('1203', 'Lemahabang', '16000');
INSERT INTO `kota` VALUES ('1204', 'Losari', '13000');
INSERT INTO `kota` VALUES ('1205', 'Mundu', '16000');
INSERT INTO `kota` VALUES ('1206', 'Pabedilan', '16000');
INSERT INTO `kota` VALUES ('1207', 'Susukan', '16000');
INSERT INTO `kota` VALUES ('1208', 'Susukanlebak', '16000');
INSERT INTO `kota` VALUES ('1209', 'Palimanan', '13000');
INSERT INTO `kota` VALUES ('1210', 'Waled', '16000');
INSERT INTO `kota` VALUES ('1211', 'Pangenan', '16000');
INSERT INTO `kota` VALUES ('1212', 'Weru', '16000');
INSERT INTO `kota` VALUES ('1213', 'Panguragan', '16000');
INSERT INTO `kota` VALUES ('1214', 'Pasaleman', '16000');
INSERT INTO `kota` VALUES ('1215', 'Plumbon', '16000');
INSERT INTO `kota` VALUES ('1216', 'Tengah Tani', '16000');
INSERT INTO `kota` VALUES ('1217', 'Sedong', '16000');
INSERT INTO `kota` VALUES ('1218', 'Jakarta', '8000');
INSERT INTO `kota` VALUES ('1219', 'Jakarta Barat', '8000');
INSERT INTO `kota` VALUES ('1220', 'Grogol', '8000');
INSERT INTO `kota` VALUES ('1221', 'Kalideres', '8000');
INSERT INTO `kota` VALUES ('1222', 'Kebon Jeruk', '8000');
INSERT INTO `kota` VALUES ('1223', 'Kembangan', '8000');
INSERT INTO `kota` VALUES ('1224', 'Palmerah', '8000');
INSERT INTO `kota` VALUES ('1225', 'Taman Sari', '8000');
INSERT INTO `kota` VALUES ('1226', 'Tambora', '8000');
INSERT INTO `kota` VALUES ('1227', 'Cengkareng', '8000');
INSERT INTO `kota` VALUES ('1228', 'Jakarta Selatan', '8000');
INSERT INTO `kota` VALUES ('1229', 'Jagakarsa', '8000');
INSERT INTO `kota` VALUES ('1230', 'Kebayoran Baru', '8000');
INSERT INTO `kota` VALUES ('1231', 'Kebayoran Lama', '8000');
INSERT INTO `kota` VALUES ('1232', 'Mampang Prapatan', '8000');
INSERT INTO `kota` VALUES ('1233', 'Pancoran', '8000');
INSERT INTO `kota` VALUES ('1234', 'Pasar Minggu', '8000');
INSERT INTO `kota` VALUES ('1235', 'Pesanggrahan', '8000');
INSERT INTO `kota` VALUES ('1236', 'Setiabudi', '8000');
INSERT INTO `kota` VALUES ('1237', 'Tebet', '8000');
INSERT INTO `kota` VALUES ('1238', 'Cilandak', '8000');
INSERT INTO `kota` VALUES ('1239', 'Jakarta Pusat', '8000');
INSERT INTO `kota` VALUES ('1240', 'Cempaka Putih', '8000');
INSERT INTO `kota` VALUES ('1241', 'Gambir', '8000');
INSERT INTO `kota` VALUES ('1242', 'Johar Baru', '8000');
INSERT INTO `kota` VALUES ('1243', 'Kemayoran', '8000');
INSERT INTO `kota` VALUES ('1244', 'Menteng', '8000');
INSERT INTO `kota` VALUES ('1245', 'Sawah Besar', '8000');
INSERT INTO `kota` VALUES ('1246', 'Senen', '8000');
INSERT INTO `kota` VALUES ('1247', 'Tanah Abang', '8000');
INSERT INTO `kota` VALUES ('1248', 'Jakarta Utara', '8000');
INSERT INTO `kota` VALUES ('1249', 'Kelapa Gading', '8000');
INSERT INTO `kota` VALUES ('1250', 'Koja', '8000');
INSERT INTO `kota` VALUES ('1251', 'Pademangan', '8000');
INSERT INTO `kota` VALUES ('1252', 'Penjaringan', '8000');
INSERT INTO `kota` VALUES ('1253', 'Tanjung Priok', '8000');
INSERT INTO `kota` VALUES ('1254', 'Cilincing', '8000');
INSERT INTO `kota` VALUES ('1255', 'Jakarta Timur', '8000');
INSERT INTO `kota` VALUES ('1256', 'Cakung', '8000');
INSERT INTO `kota` VALUES ('1257', 'Cipayung', '8000');
INSERT INTO `kota` VALUES ('1258', 'Ciracas', '8000');
INSERT INTO `kota` VALUES ('1259', 'Duren Sawit', '8000');
INSERT INTO `kota` VALUES ('1260', 'Jatinegara', '8000');
INSERT INTO `kota` VALUES ('1261', 'Kramat Jati', '8000');
INSERT INTO `kota` VALUES ('1262', 'Makassar', '8000');
INSERT INTO `kota` VALUES ('1263', 'Matraman', '8000');
INSERT INTO `kota` VALUES ('1264', 'Pasar Rebo', '8000');
INSERT INTO `kota` VALUES ('1265', 'Pulo Gadung', '8000');
INSERT INTO `kota` VALUES ('1266', 'Pulau Pramuka', '8000');
INSERT INTO `kota` VALUES ('1267', 'Kepulauan Seribu Selatan', '8000');
INSERT INTO `kota` VALUES ('1268', 'Kepulauan Seribu Utara', '8000');
INSERT INTO `kota` VALUES ('1269', 'Cilegon', '9000');
INSERT INTO `kota` VALUES ('1270', 'Merak', '9000');
INSERT INTO `kota` VALUES ('1271', 'Cibeber', '9000');
INSERT INTO `kota` VALUES ('1272', 'Citangkil', '9000');
INSERT INTO `kota` VALUES ('1273', 'Ciwandan', '9000');
INSERT INTO `kota` VALUES ('1274', 'Gerogol', '9000');
INSERT INTO `kota` VALUES ('1275', 'Jombang', '9000');
INSERT INTO `kota` VALUES ('1276', 'Purwakarta', '9000');
INSERT INTO `kota` VALUES ('1277', 'Pandeglang', '10000');
INSERT INTO `kota` VALUES ('1278', 'Bojong', '13000');
INSERT INTO `kota` VALUES ('1279', 'Cadas Sari', '13000');
INSERT INTO `kota` VALUES ('1280', 'Cibaliung', '13000');
INSERT INTO `kota` VALUES ('1281', 'Cikeusik', '13000');
INSERT INTO `kota` VALUES ('1282', 'Cimanggu', '13000');
INSERT INTO `kota` VALUES ('1283', 'Cimanuk', '13000');
INSERT INTO `kota` VALUES ('1284', 'Jiput', '13000');
INSERT INTO `kota` VALUES ('1285', 'Labuan', '13000');
INSERT INTO `kota` VALUES ('1286', 'Mandalawangi', '13000');
INSERT INTO `kota` VALUES ('1287', 'Menes', '13000');
INSERT INTO `kota` VALUES ('1288', 'Munjul', '13000');
INSERT INTO `kota` VALUES ('1289', 'Pagelaran', '13000');
INSERT INTO `kota` VALUES ('1290', 'Saketi', '13000');
INSERT INTO `kota` VALUES ('1291', 'Sumur', '13000');
INSERT INTO `kota` VALUES ('1292', 'Angsana', '13000');
INSERT INTO `kota` VALUES ('1293', 'Carita', '13000');
INSERT INTO `kota` VALUES ('1294', 'Cibitung', '13000');
INSERT INTO `kota` VALUES ('1295', 'Cigeulis', '13000');
INSERT INTO `kota` VALUES ('1296', 'Cikedal', '13000');
INSERT INTO `kota` VALUES ('1297', 'Cipeucang', '13000');
INSERT INTO `kota` VALUES ('1298', 'Cisata', '13000');
INSERT INTO `kota` VALUES ('1299', 'Kaduhejo', '13000');
INSERT INTO `kota` VALUES ('1300', 'Karangtanjung', '13000');
INSERT INTO `kota` VALUES ('1301', 'Panimbang', '13000');
INSERT INTO `kota` VALUES ('1302', 'Patia', '13000');
INSERT INTO `kota` VALUES ('1303', 'Picung', '13000');
INSERT INTO `kota` VALUES ('1304', 'Sukaresmi', '13000');
INSERT INTO `kota` VALUES ('1305', 'Rangkasbitung', '10000');
INSERT INTO `kota` VALUES ('1306', 'Banjarsari', '13000');
INSERT INTO `kota` VALUES ('1307', 'Bayah', '13000');
INSERT INTO `kota` VALUES ('1308', 'Bojongmanik', '13000');
INSERT INTO `kota` VALUES ('1309', 'Cibadak', '13000');
INSERT INTO `kota` VALUES ('1310', 'Cibeber', '13000');
INSERT INTO `kota` VALUES ('1311', 'Cijaku', '13000');
INSERT INTO `kota` VALUES ('1312', 'Cikulur', '13000');
INSERT INTO `kota` VALUES ('1313', 'Cileles', '13000');
INSERT INTO `kota` VALUES ('1314', 'Cimarga', '13000');
INSERT INTO `kota` VALUES ('1315', 'Cipanas', '13000');
INSERT INTO `kota` VALUES ('1316', 'Gunungkencana', '13000');
INSERT INTO `kota` VALUES ('1317', 'Leuwidamar', '13000');
INSERT INTO `kota` VALUES ('1318', 'Maja', '13000');
INSERT INTO `kota` VALUES ('1319', 'Malingping', '13000');
INSERT INTO `kota` VALUES ('1320', 'Muncang', '13000');
INSERT INTO `kota` VALUES ('1321', 'Panggarangan', '13000');
INSERT INTO `kota` VALUES ('1322', 'Sajira', '13000');
INSERT INTO `kota` VALUES ('1323', 'Wanasalam', '13000');
INSERT INTO `kota` VALUES ('1324', 'Warunggunung', '13000');
INSERT INTO `kota` VALUES ('1325', 'Curugbitung', '13000');
INSERT INTO `kota` VALUES ('1326', 'Sobang', '13000');
INSERT INTO `kota` VALUES ('1327', 'Serang', '9000');
INSERT INTO `kota` VALUES ('1328', 'Curug', '9000');
INSERT INTO `kota` VALUES ('1329', 'Kasemen', '9000');
INSERT INTO `kota` VALUES ('1330', 'Taktakan', '9000');
INSERT INTO `kota` VALUES ('1331', 'Walantaka', '9000');
INSERT INTO `kota` VALUES ('1332', 'Cipocok Jaya', '9000');
INSERT INTO `kota` VALUES ('1333', 'Baros', '10000');
INSERT INTO `kota` VALUES ('1334', 'Anyar', '10000');
INSERT INTO `kota` VALUES ('1335', 'Binuang', '13000');
INSERT INTO `kota` VALUES ('1336', 'Bojonegara', '13000');
INSERT INTO `kota` VALUES ('1337', 'Carenang', '13000');
INSERT INTO `kota` VALUES ('1338', 'Cikande', '13000');
INSERT INTO `kota` VALUES ('1339', 'Cikeusal', '13000');
INSERT INTO `kota` VALUES ('1340', 'Cinangka', '13000');
INSERT INTO `kota` VALUES ('1341', 'Ciomas', '13000');
INSERT INTO `kota` VALUES ('1342', 'Ciruas', '13000');
INSERT INTO `kota` VALUES ('1343', 'Jawilan', '13000');
INSERT INTO `kota` VALUES ('1344', 'Kibin', '13000');
INSERT INTO `kota` VALUES ('1345', 'Kopo', '13000');
INSERT INTO `kota` VALUES ('1346', 'Kragilan', '13000');
INSERT INTO `kota` VALUES ('1347', 'Kramatwatu', '13000');
INSERT INTO `kota` VALUES ('1348', 'Mancak', '13000');
INSERT INTO `kota` VALUES ('1349', 'Pabuaran', '13000');
INSERT INTO `kota` VALUES ('1350', 'Padarincang', '13000');
INSERT INTO `kota` VALUES ('1351', 'Pamarayan', '13000');
INSERT INTO `kota` VALUES ('1352', 'Petir', '13000');
INSERT INTO `kota` VALUES ('1353', 'Pontang', '13000');
INSERT INTO `kota` VALUES ('1354', 'Puloampel', '13000');
INSERT INTO `kota` VALUES ('1355', 'Tanara', '13000');
INSERT INTO `kota` VALUES ('1356', 'Tirtayasa', '13000');
INSERT INTO `kota` VALUES ('1357', 'Tunjung Teja', '13000');
INSERT INTO `kota` VALUES ('1358', 'Waringinkurung', '13000');
INSERT INTO `kota` VALUES ('1359', 'Cilacap', '15000');
INSERT INTO `kota` VALUES ('1360', 'Adipala', '23000');
INSERT INTO `kota` VALUES ('1361', 'Binangun', '23000');
INSERT INTO `kota` VALUES ('1362', 'Cimanggu', '23000');
INSERT INTO `kota` VALUES ('1363', 'Cipari', '23000');
INSERT INTO `kota` VALUES ('1364', 'Dayeuhluhur', '23000');
INSERT INTO `kota` VALUES ('1365', 'Gandrungmangu', '23000');
INSERT INTO `kota` VALUES ('1366', 'Jeruklegi', '23000');
INSERT INTO `kota` VALUES ('1367', 'Karangpucung', '23000');
INSERT INTO `kota` VALUES ('1368', 'Kawunganten', '23000');
INSERT INTO `kota` VALUES ('1369', 'Kedungrejo', '23000');
INSERT INTO `kota` VALUES ('1370', 'Kesugihan', '23000');
INSERT INTO `kota` VALUES ('1371', 'Kroya', '23000');
INSERT INTO `kota` VALUES ('1372', 'Majenang', '17000');
INSERT INTO `kota` VALUES ('1373', 'Maos', '23000');
INSERT INTO `kota` VALUES ('1374', 'Nusawungu', '23000');
INSERT INTO `kota` VALUES ('1375', 'Sampang', '23000');
INSERT INTO `kota` VALUES ('1376', 'Sidareja', '23000');
INSERT INTO `kota` VALUES ('1377', 'Wanar', '23000');
INSERT INTO `kota` VALUES ('1378', 'Cilacap Selatan', '15000');
INSERT INTO `kota` VALUES ('1379', 'Cilacap Tengah', '15000');
INSERT INTO `kota` VALUES ('1380', 'Cilacap Utara', '15000');
INSERT INTO `kota` VALUES ('1381', 'Patimuan', '23000');
INSERT INTO `kota` VALUES ('1382', 'Bantarsari', '23000');
INSERT INTO `kota` VALUES ('1383', 'Kampung Laut', '23000');
INSERT INTO `kota` VALUES ('1384', 'Jambi', '20000');
INSERT INTO `kota` VALUES ('1385', 'Danau Teluk', '20000');
INSERT INTO `kota` VALUES ('1386', 'Jambi Selatan', '20000');
INSERT INTO `kota` VALUES ('1387', 'Jambi Timur', '20000');
INSERT INTO `kota` VALUES ('1388', 'Jelutung', '20000');
INSERT INTO `kota` VALUES ('1389', 'Kota Baru', '20000');
INSERT INTO `kota` VALUES ('1390', 'Pasar Jambi', '20000');
INSERT INTO `kota` VALUES ('1391', 'Pelayangan', '20000');
INSERT INTO `kota` VALUES ('1392', 'Telanaipura', '20000');
INSERT INTO `kota` VALUES ('1393', 'Kualatungkal', '31000');
INSERT INTO `kota` VALUES ('1394', 'Betara', '39000');
INSERT INTO `kota` VALUES ('1395', 'Merlung', '39000');
INSERT INTO `kota` VALUES ('1396', 'Pengabuan', '39000');
INSERT INTO `kota` VALUES ('1397', 'Tungkal Ulu', '31000');
INSERT INTO `kota` VALUES ('1398', 'Tungkal Ilir', '31000');
INSERT INTO `kota` VALUES ('1399', 'Bangko', '31000');
INSERT INTO `kota` VALUES ('1400', 'Jangkat', '59000');
INSERT INTO `kota` VALUES ('1401', 'Muara Siau', '39000');
INSERT INTO `kota` VALUES ('1402', 'Sungai Manau', '59000');
INSERT INTO `kota` VALUES ('1403', 'Tabir', '39000');
INSERT INTO `kota` VALUES ('1404', 'Pamenang', '39000');
INSERT INTO `kota` VALUES ('1405', 'Tabir Ulu', '39000');
INSERT INTO `kota` VALUES ('1406', 'Muara Bulian', '31000');
INSERT INTO `kota` VALUES ('1407', 'Batin XXIV', '39000');
INSERT INTO `kota` VALUES ('1408', 'Maro Sebo Ulu', '39000');
INSERT INTO `kota` VALUES ('1409', 'Mersam', '39000');
INSERT INTO `kota` VALUES ('1410', 'Muara Tembesi', '39000');
INSERT INTO `kota` VALUES ('1411', 'Pemayung', '39000');
INSERT INTO `kota` VALUES ('1412', 'Bajubang', '39000');
INSERT INTO `kota` VALUES ('1413', 'Maro Sebo Ilir', '39000');
INSERT INTO `kota` VALUES ('1414', 'Muara Bungo', '31000');
INSERT INTO `kota` VALUES ('1415', 'Jujuhan', '59000');
INSERT INTO `kota` VALUES ('1416', 'Pelepat', '39000');
INSERT INTO `kota` VALUES ('1417', 'Rantau Pandan', '39000');
INSERT INTO `kota` VALUES ('1418', 'Tanah Sepenggal', '39000');
INSERT INTO `kota` VALUES ('1419', 'Tanah Tumbuh', '39000');
INSERT INTO `kota` VALUES ('1420', 'Bathin II Babeko', '39000');
INSERT INTO `kota` VALUES ('1421', 'Limbur Lubuk Mengkuang', '39000');
INSERT INTO `kota` VALUES ('1422', 'Muko Muko Batin VII', '39000');
INSERT INTO `kota` VALUES ('1423', 'Pelepat Ilir', '39000');
INSERT INTO `kota` VALUES ('1424', 'Sungai Penuh', '31000');
INSERT INTO `kota` VALUES ('1425', 'Air Hangat', '39000');
INSERT INTO `kota` VALUES ('1426', 'Batang Merangin', '39000');
INSERT INTO `kota` VALUES ('1427', 'Danau Kerinci', '39000');
INSERT INTO `kota` VALUES ('1428', 'Gunung Kerinci', '39000');
INSERT INTO `kota` VALUES ('1429', 'Gunung Raya', '59000');
INSERT INTO `kota` VALUES ('1430', 'Hamparan Rawang', '39000');
INSERT INTO `kota` VALUES ('1431', 'Kayu Aro', '59000');
INSERT INTO `kota` VALUES ('1432', 'Keliling Danau', '39000');
INSERT INTO `kota` VALUES ('1433', 'Sitinjau Laut', '39000');
INSERT INTO `kota` VALUES ('1434', 'Air Hangat Timur', '39000');
INSERT INTO `kota` VALUES ('1435', 'Sengeti', '31000');
INSERT INTO `kota` VALUES ('1436', 'Jambi Luar Kota', '39000');
INSERT INTO `kota` VALUES ('1437', 'Kumpeh', '39000');
INSERT INTO `kota` VALUES ('1438', 'Kumpeh Ulu', '39000');
INSERT INTO `kota` VALUES ('1439', 'Maro Sebo', '39000');
INSERT INTO `kota` VALUES ('1440', 'Mestong', '39000');
INSERT INTO `kota` VALUES ('1441', 'Sekernan', '39000');
INSERT INTO `kota` VALUES ('1442', 'Sungai Bahar', '39000');
INSERT INTO `kota` VALUES ('1443', 'Sarolangun', '31000');
INSERT INTO `kota` VALUES ('1444', 'Batang Asai', '59000');
INSERT INTO `kota` VALUES ('1445', 'Muara Limun', '39000');
INSERT INTO `kota` VALUES ('1446', 'Mandiangin', '39000');
INSERT INTO `kota` VALUES ('1447', 'Pauh', '39000');
INSERT INTO `kota` VALUES ('1448', 'Pelawan Singkut', '39000');
INSERT INTO `kota` VALUES ('1449', 'Muara sabak', '31000');
INSERT INTO `kota` VALUES ('1450', 'Dendang', '39000');
INSERT INTO `kota` VALUES ('1451', 'Mendahara', '39000');
INSERT INTO `kota` VALUES ('1452', 'Nipah Panjang', '39000');
INSERT INTO `kota` VALUES ('1453', 'Rantau Rasau', '59000');
INSERT INTO `kota` VALUES ('1454', 'Sadu', '39000');
INSERT INTO `kota` VALUES ('1455', 'Muara Tebo', '31000');
INSERT INTO `kota` VALUES ('1456', 'Rimbo Bujang', '39000');
INSERT INTO `kota` VALUES ('1457', 'Rimbo Ilir', '39000');
INSERT INTO `kota` VALUES ('1458', 'Rimbo Ulu', '39000');
INSERT INTO `kota` VALUES ('1459', 'Sumay', '39000');
INSERT INTO `kota` VALUES ('1460', 'Tebo Ilir', '31000');
INSERT INTO `kota` VALUES ('1461', 'Tebo Tengah', '31000');
INSERT INTO `kota` VALUES ('1462', 'Tebo Ulu', '31000');
INSERT INTO `kota` VALUES ('1463', 'Tengah Ilir', '39000');
INSERT INTO `kota` VALUES ('1464', 'VII Koto', '39000');
INSERT INTO `kota` VALUES ('1465', 'Jayapura', '80000');
INSERT INTO `kota` VALUES ('1466', 'Abepura', '80000');
INSERT INTO `kota` VALUES ('1467', 'Demta', '135000');
INSERT INTO `kota` VALUES ('1468', 'Depapre', '135000');
INSERT INTO `kota` VALUES ('1469', 'Kareuh', '135000');
INSERT INTO `kota` VALUES ('1470', 'Kemtuk Gresie', '135000');
INSERT INTO `kota` VALUES ('1471', 'Nimboran', '135000');
INSERT INTO `kota` VALUES ('1472', 'Sentani', '108000');
INSERT INTO `kota` VALUES ('1473', 'Unurum Guay', '135000');
INSERT INTO `kota` VALUES ('1474', 'Kemtuk', '135000');
INSERT INTO `kota` VALUES ('1475', 'Nimbokrang', '135000');
INSERT INTO `kota` VALUES ('1476', 'Sentani Barat', '135000');
INSERT INTO `kota` VALUES ('1477', 'Sentani Timur', '135000');
INSERT INTO `kota` VALUES ('1478', 'Jayapura Selatan', '80000');
INSERT INTO `kota` VALUES ('1479', 'Jayapura Utara', '80000');
INSERT INTO `kota` VALUES ('1480', 'Muara Tam', '80000');
INSERT INTO `kota` VALUES ('1481', 'Biak Kota', '108000');
INSERT INTO `kota` VALUES ('1482', 'Biak Barat', '135000');
INSERT INTO `kota` VALUES ('1483', 'Biak timur', '135000');
INSERT INTO `kota` VALUES ('1484', 'Biak Utara', '135000');
INSERT INTO `kota` VALUES ('1485', 'Numfor Barat', '135000');
INSERT INTO `kota` VALUES ('1486', 'Numfor Timur', '135000');
INSERT INTO `kota` VALUES ('1487', 'Kepulauan Padaidio', '135000');
INSERT INTO `kota` VALUES ('1488', 'Samofa', '135000');
INSERT INTO `kota` VALUES ('1489', 'Warsa', '135000');
INSERT INTO `kota` VALUES ('1490', 'Yendidori', '135000');
INSERT INTO `kota` VALUES ('1491', 'Merauke', '108000');
INSERT INTO `kota` VALUES ('1492', 'Kimaam', '135000');
INSERT INTO `kota` VALUES ('1493', 'Muting', '135000');
INSERT INTO `kota` VALUES ('1494', 'Okaba', '135000');
INSERT INTO `kota` VALUES ('1495', 'Distrik Ulilin', '135000');
INSERT INTO `kota` VALUES ('1496', 'Eligobel', '135000');
INSERT INTO `kota` VALUES ('1497', 'Jagebob', '135000');
INSERT INTO `kota` VALUES ('1498', 'Kurik', '135000');
INSERT INTO `kota` VALUES ('1499', 'Semangga', '135000');
INSERT INTO `kota` VALUES ('1500', 'Sota', '135000');
INSERT INTO `kota` VALUES ('1501', 'Tanah Miring', '135000');
INSERT INTO `kota` VALUES ('1502', 'Serui', '108000');
INSERT INTO `kota` VALUES ('1503', 'Yapen Barat', '135000');
INSERT INTO `kota` VALUES ('1504', 'Yapen Timur', '135000');
INSERT INTO `kota` VALUES ('1505', 'Angkaisera', '135000');
INSERT INTO `kota` VALUES ('1506', 'Poom', '135000');
INSERT INTO `kota` VALUES ('1507', 'Yapen Selatan', '135000');
INSERT INTO `kota` VALUES ('1508', 'Wamena', '108000');
INSERT INTO `kota` VALUES ('1509', 'Asologaima', '135000');
INSERT INTO `kota` VALUES ('1510', 'Kelila', '135000');
INSERT INTO `kota` VALUES ('1511', 'Kurulu', '135000');
INSERT INTO `kota` VALUES ('1512', 'Maki', '135000');
INSERT INTO `kota` VALUES ('1513', 'Tiom', '135000');
INSERT INTO `kota` VALUES ('1514', 'Abenaho', '135000');
INSERT INTO `kota` VALUES ('1515', 'Apalapsili', '135000');
INSERT INTO `kota` VALUES ('1516', 'Bolakma', '135000');
INSERT INTO `kota` VALUES ('1517', 'Gamelia', '135000');
INSERT INTO `kota` VALUES ('1518', 'Hubikosi', '135000');
INSERT INTO `kota` VALUES ('1519', 'Kenyam', '135000');
INSERT INTO `kota` VALUES ('1520', 'Kobakma', '135000');
INSERT INTO `kota` VALUES ('1521', 'Mapenduma', '135000');
INSERT INTO `kota` VALUES ('1522', 'Pirime', '135000');
INSERT INTO `kota` VALUES ('1523', 'Agats', '108000');
INSERT INTO `kota` VALUES ('1524', 'Akat', '135000');
INSERT INTO `kota` VALUES ('1525', 'Atsy', '135000');
INSERT INTO `kota` VALUES ('1526', 'Fayit', '135000');
INSERT INTO `kota` VALUES ('1527', 'Pantai Kasuari', '135000');
INSERT INTO `kota` VALUES ('1528', 'Sawaerma', '135000');
INSERT INTO `kota` VALUES ('1529', 'Suator', '135000');
INSERT INTO `kota` VALUES ('1530', 'Tanah Merah/ Boven Digoel', '108000');
INSERT INTO `kota` VALUES ('1531', 'Distrik Bomakia', '135000');
INSERT INTO `kota` VALUES ('1532', 'Jair', '135000');
INSERT INTO `kota` VALUES ('1533', 'Kouh', '135000');
INSERT INTO `kota` VALUES ('1534', 'Mandobo', '135000');
INSERT INTO `kota` VALUES ('1535', 'Mindiptana', '135000');
INSERT INTO `kota` VALUES ('1536', 'Waropko', '135000');
INSERT INTO `kota` VALUES ('1537', 'Waris', '108000');
INSERT INTO `kota` VALUES ('1538', 'Arso', '135000');
INSERT INTO `kota` VALUES ('1539', 'Senggi', '135000');
INSERT INTO `kota` VALUES ('1540', 'Skanto', '135000');
INSERT INTO `kota` VALUES ('1541', 'Web', '135000');
INSERT INTO `kota` VALUES ('1542', 'Oksibil', '108000');
INSERT INTO `kota` VALUES ('1543', 'Batom', '135000');
INSERT INTO `kota` VALUES ('1544', 'Borme', '135000');
INSERT INTO `kota` VALUES ('1545', 'Iwur', '135000');
INSERT INTO `kota` VALUES ('1546', 'Kiwirok', '135000');
INSERT INTO `kota` VALUES ('1547', 'Okbibab', '135000');
INSERT INTO `kota` VALUES ('1548', 'Sarmi', '108000');
INSERT INTO `kota` VALUES ('1549', 'Bonggo', '135000');
INSERT INTO `kota` VALUES ('1550', 'Pantai Barat', '135000');
INSERT INTO `kota` VALUES ('1551', 'Pantai Timur', '135000');
INSERT INTO `kota` VALUES ('1552', 'Tor Atas', '135000');
INSERT INTO `kota` VALUES ('1553', 'Sorendiweri', '108000');
INSERT INTO `kota` VALUES ('1554', 'Supiori Selatan', '135000');
INSERT INTO `kota` VALUES ('1555', 'Supiori Timur', '135000');
INSERT INTO `kota` VALUES ('1556', 'Supiori Utara', '135000');
INSERT INTO `kota` VALUES ('1557', 'Karubaga', '108000');
INSERT INTO `kota` VALUES ('1558', 'Bokondini', '135000');
INSERT INTO `kota` VALUES ('1559', 'Kanggime', '203000');
INSERT INTO `kota` VALUES ('1560', 'Kembu', '203000');
INSERT INTO `kota` VALUES ('1561', 'Botawa', '203000');
INSERT INTO `kota` VALUES ('1562', 'Masirei', '203000');
INSERT INTO `kota` VALUES ('1563', 'Waropen Bawah', '203000');
INSERT INTO `kota` VALUES ('1564', 'Sumohai', '203000');
INSERT INTO `kota` VALUES ('1565', 'Anggruk', '203000');
INSERT INTO `kota` VALUES ('1566', 'Kurima', '203000');
INSERT INTO `kota` VALUES ('1567', 'Ninia', '203000');
INSERT INTO `kota` VALUES ('1568', 'Burmeso', '203000');
INSERT INTO `kota` VALUES ('1569', 'Mamberamo Tengah', '203000');
INSERT INTO `kota` VALUES ('1570', 'Mamberamo Ilir', '203000');
INSERT INTO `kota` VALUES ('1571', 'Mamberamo Ulu', '203000');
INSERT INTO `kota` VALUES ('1572', 'Mamberamo Tengah Timur', '203000');
INSERT INTO `kota` VALUES ('1573', 'Rufaer', '203000');
INSERT INTO `kota` VALUES ('1574', 'Waropen Atas', '203000');
INSERT INTO `kota` VALUES ('1575', 'Benuki', '203000');
INSERT INTO `kota` VALUES ('1576', 'Sawai', '203000');
INSERT INTO `kota` VALUES ('1577', 'Depok', '8000');
INSERT INTO `kota` VALUES ('1578', 'Cibubur', '8000');
INSERT INTO `kota` VALUES ('1579', 'Cimanggis', '8000');
INSERT INTO `kota` VALUES ('1580', 'Sawangan', '8000');
INSERT INTO `kota` VALUES ('1581', 'Beji', '8000');
INSERT INTO `kota` VALUES ('1582', 'Limo', '8000');
INSERT INTO `kota` VALUES ('1583', 'Pancoran Mas', '8000');
INSERT INTO `kota` VALUES ('1584', 'Sukmajaya', '8000');
INSERT INTO `kota` VALUES ('1585', 'Denpasar', '20000');
INSERT INTO `kota` VALUES ('1586', 'Denpasar Barat', '20000');
INSERT INTO `kota` VALUES ('1587', 'Denpasar Selatan', '20000');
INSERT INTO `kota` VALUES ('1588', 'Denpasar Timur', '20000');
INSERT INTO `kota` VALUES ('1589', 'Amlapura', '26000');
INSERT INTO `kota` VALUES ('1590', 'Abang', '29000');
INSERT INTO `kota` VALUES ('1591', 'Bebandem', '29000');
INSERT INTO `kota` VALUES ('1592', 'Kubu', '29000');
INSERT INTO `kota` VALUES ('1593', 'Manggis', '29000');
INSERT INTO `kota` VALUES ('1594', 'Rendang', '29000');
INSERT INTO `kota` VALUES ('1595', 'Selat', '29000');
INSERT INTO `kota` VALUES ('1596', 'Sidemen', '29000');
INSERT INTO `kota` VALUES ('1597', 'Karangasem', '26000');
INSERT INTO `kota` VALUES ('1598', 'Bangli', '26000');
INSERT INTO `kota` VALUES ('1599', 'Kintamani', '29000');
INSERT INTO `kota` VALUES ('1600', 'Susut', '29000');
INSERT INTO `kota` VALUES ('1601', 'Tembuku', '29000');
INSERT INTO `kota` VALUES ('1602', 'Gianyar', '26000');
INSERT INTO `kota` VALUES ('1603', 'Blahbatuh', '29000');
INSERT INTO `kota` VALUES ('1604', 'Payangan', '29000');
INSERT INTO `kota` VALUES ('1605', 'Sukawati', '29000');
INSERT INTO `kota` VALUES ('1606', 'Tampaksiring', '29000');
INSERT INTO `kota` VALUES ('1607', 'Tegal Lalang', '29000');
INSERT INTO `kota` VALUES ('1608', 'Ubud', '29000');
INSERT INTO `kota` VALUES ('1609', 'Negara', '26000');
INSERT INTO `kota` VALUES ('1610', 'Melaya', '29000');
INSERT INTO `kota` VALUES ('1611', 'Mendoyo', '29000');
INSERT INTO `kota` VALUES ('1612', 'Pekutatan', '29000');
INSERT INTO `kota` VALUES ('1613', 'Semarapura', '26000');
INSERT INTO `kota` VALUES ('1614', 'Dawan', '29000');
INSERT INTO `kota` VALUES ('1615', 'Klungkung', '26000');
INSERT INTO `kota` VALUES ('1616', 'Nusapenida', '29000');
INSERT INTO `kota` VALUES ('1617', 'Banjarangkan', '29000');
INSERT INTO `kota` VALUES ('1618', 'Singaraja', '26000');
INSERT INTO `kota` VALUES ('1619', 'Banjar', '29000');
INSERT INTO `kota` VALUES ('1620', 'Busung Biu', '29000');
INSERT INTO `kota` VALUES ('1621', 'Gerokgak', '29000');
INSERT INTO `kota` VALUES ('1622', 'Kubutambahan', '29000');
INSERT INTO `kota` VALUES ('1623', 'Sawan', '29000');
INSERT INTO `kota` VALUES ('1624', 'Seririt', '29000');
INSERT INTO `kota` VALUES ('1625', 'Sukasada', '29000');
INSERT INTO `kota` VALUES ('1626', 'Tejakula', '29000');
INSERT INTO `kota` VALUES ('1627', 'Buleleng', '29000');
INSERT INTO `kota` VALUES ('1628', 'Tabanan', '26000');
INSERT INTO `kota` VALUES ('1629', 'Baturiti', '29000');
INSERT INTO `kota` VALUES ('1630', 'Kediri', '29000');
INSERT INTO `kota` VALUES ('1631', 'Kerambitan', '29000');
INSERT INTO `kota` VALUES ('1632', 'Marga', '29000');
INSERT INTO `kota` VALUES ('1633', 'Pupuan', '29000');
INSERT INTO `kota` VALUES ('1634', 'Penebel', '29000');
INSERT INTO `kota` VALUES ('1635', 'Selemadeg', '29000');
INSERT INTO `kota` VALUES ('1636', 'Selemadeg Barat', '29000');
INSERT INTO `kota` VALUES ('1637', 'Selemadeg Timur', '29000');
INSERT INTO `kota` VALUES ('1638', 'Menguwi', '26000');
INSERT INTO `kota` VALUES ('1639', 'Abiansemal', '29000');
INSERT INTO `kota` VALUES ('1640', 'Kuta', '20000');
INSERT INTO `kota` VALUES ('1641', 'Legian', '20000');
INSERT INTO `kota` VALUES ('1642', 'Ngurah Rai', '20000');
INSERT INTO `kota` VALUES ('1643', 'Sanur', '20000');
INSERT INTO `kota` VALUES ('1644', 'Jimbaran', '20000');
INSERT INTO `kota` VALUES ('1645', 'Nusa Dua', '20000');
INSERT INTO `kota` VALUES ('1646', 'Petang', '29000');
INSERT INTO `kota` VALUES ('1647', 'Gorontalo', '45000');
INSERT INTO `kota` VALUES ('1648', 'Dungingi', '45000');
INSERT INTO `kota` VALUES ('1649', 'Kota Barat', '45000');
INSERT INTO `kota` VALUES ('1650', 'Kota Selatan', '45000');
INSERT INTO `kota` VALUES ('1651', 'Kota Timur', '45000');
INSERT INTO `kota` VALUES ('1652', 'Kota Utara', '45000');
INSERT INTO `kota` VALUES ('1653', 'Limboto', '53000');
INSERT INTO `kota` VALUES ('1654', 'Atinggola', '67000');
INSERT INTO `kota` VALUES ('1655', 'Batudaa', '67000');
INSERT INTO `kota` VALUES ('1656', 'Sumalata', '67000');
INSERT INTO `kota` VALUES ('1657', 'Tibawa', '67000');
INSERT INTO `kota` VALUES ('1658', 'Anggrek', '67000');
INSERT INTO `kota` VALUES ('1659', 'Boliyohuto', '67000');
INSERT INTO `kota` VALUES ('1660', 'Bongomeme', '67000');
INSERT INTO `kota` VALUES ('1661', 'Limboto Barat', '53000');
INSERT INTO `kota` VALUES ('1662', 'Mootilango', '67000');
INSERT INTO `kota` VALUES ('1663', 'Pulubala', '67000');
INSERT INTO `kota` VALUES ('1664', 'Telaga', '67000');
INSERT INTO `kota` VALUES ('1665', 'Tolangohula', '67000');
INSERT INTO `kota` VALUES ('1666', 'Tolinggula', '67000');
INSERT INTO `kota` VALUES ('1667', 'Tilamuta', '53000');
INSERT INTO `kota` VALUES ('1668', 'Botumoito', '67000');
INSERT INTO `kota` VALUES ('1669', 'Dulupi', '67000');
INSERT INTO `kota` VALUES ('1670', 'Mananggu', '67000');
INSERT INTO `kota` VALUES ('1671', 'Paguyaman', '67000');
INSERT INTO `kota` VALUES ('1672', 'Wonosari', '67000');
INSERT INTO `kota` VALUES ('1673', 'Suwawa', '53000');
INSERT INTO `kota` VALUES ('1674', 'Bone Panta', '67000');
INSERT INTO `kota` VALUES ('1675', 'Kabila', '67000');
INSERT INTO `kota` VALUES ('1676', 'Tapa', '67000');
INSERT INTO `kota` VALUES ('1677', 'Kwandang', '53000');
INSERT INTO `kota` VALUES ('1678', 'Atinggota', '67000');
INSERT INTO `kota` VALUES ('1679', 'Tolingula', '67000');
INSERT INTO `kota` VALUES ('1680', 'Marisa', '53000');
INSERT INTO `kota` VALUES ('1681', 'Lemito', '67000');
INSERT INTO `kota` VALUES ('1682', 'Paguat', '67000');
INSERT INTO `kota` VALUES ('1683', 'Patilanggio', '67000');
INSERT INTO `kota` VALUES ('1684', 'Popayato', '67000');
INSERT INTO `kota` VALUES ('1685', 'Randangan', '67000');
INSERT INTO `kota` VALUES ('1686', 'Taluditi', '67000');
INSERT INTO `kota` VALUES ('1687', 'Jember', '20000');
INSERT INTO `kota` VALUES ('1688', 'Ambulu', '29000');
INSERT INTO `kota` VALUES ('1689', 'Arjasa', '29000');
INSERT INTO `kota` VALUES ('1690', 'Balung', '29000');
INSERT INTO `kota` VALUES ('1691', 'Bangsalsari', '29000');
INSERT INTO `kota` VALUES ('1692', 'Gumukmas', '29000');
INSERT INTO `kota` VALUES ('1693', 'Jelbuk', '29000');
INSERT INTO `kota` VALUES ('1694', 'Jenggawah', '29000');
INSERT INTO `kota` VALUES ('1695', 'Kalisat', '29000');
INSERT INTO `kota` VALUES ('1696', 'Kencong', '29000');
INSERT INTO `kota` VALUES ('1697', 'Ledokombo', '29000');
INSERT INTO `kota` VALUES ('1698', 'Mayang', '29000');
INSERT INTO `kota` VALUES ('1699', 'Mumbulsari', '29000');
INSERT INTO `kota` VALUES ('1700', 'Pakusari', '29000');
INSERT INTO `kota` VALUES ('1701', 'Panti', '29000');
INSERT INTO `kota` VALUES ('1702', 'Puger', '29000');
INSERT INTO `kota` VALUES ('1703', 'Rambipuji', '29000');
INSERT INTO `kota` VALUES ('1704', 'Silo', '29000');
INSERT INTO `kota` VALUES ('1705', 'Sukorambi', '29000');
INSERT INTO `kota` VALUES ('1706', 'Sukowono', '29000');
INSERT INTO `kota` VALUES ('1707', 'Sumberbaru', '29000');
INSERT INTO `kota` VALUES ('1708', 'Sumberjambe', '29000');
INSERT INTO `kota` VALUES ('1709', 'Tanggul', '29000');
INSERT INTO `kota` VALUES ('1710', 'Tempurejo', '29000');
INSERT INTO `kota` VALUES ('1711', 'Umbulsari', '29000');
INSERT INTO `kota` VALUES ('1712', 'Wuluhan', '29000');
INSERT INTO `kota` VALUES ('1713', 'Ajung', '29000');
INSERT INTO `kota` VALUES ('1714', 'Jombang', '29000');
INSERT INTO `kota` VALUES ('1715', 'Kaliwates', '29000');
INSERT INTO `kota` VALUES ('1716', 'Patrang', '29000');
INSERT INTO `kota` VALUES ('1717', 'Semboro', '29000');
INSERT INTO `kota` VALUES ('1718', 'Sumbersari', '29000');
INSERT INTO `kota` VALUES ('1719', 'Banyuwangi', '24000');
INSERT INTO `kota` VALUES ('1720', 'Bangorejo', '29000');
INSERT INTO `kota` VALUES ('1721', 'Cluring', '29000');
INSERT INTO `kota` VALUES ('1722', 'Gambiran', '29000');
INSERT INTO `kota` VALUES ('1723', 'Genteng', '29000');
INSERT INTO `kota` VALUES ('1724', 'Glenmore', '29000');
INSERT INTO `kota` VALUES ('1725', 'Kabat', '29000');
INSERT INTO `kota` VALUES ('1726', 'Kalibaru', '29000');
INSERT INTO `kota` VALUES ('1727', 'Muncar', '29000');
INSERT INTO `kota` VALUES ('1728', 'Pesanggaran', '29000');
INSERT INTO `kota` VALUES ('1729', 'Purwoharjo', '29000');
INSERT INTO `kota` VALUES ('1730', 'Rogojampi', '29000');
INSERT INTO `kota` VALUES ('1731', 'Singojuruh', '29000');
INSERT INTO `kota` VALUES ('1732', 'Songgon', '29000');
INSERT INTO `kota` VALUES ('1733', 'Srono', '29000');
INSERT INTO `kota` VALUES ('1734', 'Tegaldlimo', '29000');
INSERT INTO `kota` VALUES ('1735', 'Wongsorejo', '29000');
INSERT INTO `kota` VALUES ('1736', 'Glagah', '29000');
INSERT INTO `kota` VALUES ('1737', 'Giri', '29000');
INSERT INTO `kota` VALUES ('1738', 'Kalipuro', '29000');
INSERT INTO `kota` VALUES ('1739', 'Licin', '29000');
INSERT INTO `kota` VALUES ('1740', 'Sempu', '29000');
INSERT INTO `kota` VALUES ('1741', 'Siliragung', '29000');
INSERT INTO `kota` VALUES ('1742', 'Tegalsari', '29000');
INSERT INTO `kota` VALUES ('1743', 'Bondowoso', '24000');
INSERT INTO `kota` VALUES ('1744', 'Cermee', '29000');
INSERT INTO `kota` VALUES ('1745', 'Curahdami', '29000');
INSERT INTO `kota` VALUES ('1746', 'Grujugan', '29000');
INSERT INTO `kota` VALUES ('1747', 'Klabang', '29000');
INSERT INTO `kota` VALUES ('1748', 'Maesan', '29000');
INSERT INTO `kota` VALUES ('1749', 'Pakem', '29000');
INSERT INTO `kota` VALUES ('1750', 'Prajekan', '29000');
INSERT INTO `kota` VALUES ('1751', 'Pujer', '29000');
INSERT INTO `kota` VALUES ('1752', 'Sempol', '29000');
INSERT INTO `kota` VALUES ('1753', 'Sukosari', '29000');
INSERT INTO `kota` VALUES ('1754', 'Tamanan', '29000');
INSERT INTO `kota` VALUES ('1755', 'Tapen', '29000');
INSERT INTO `kota` VALUES ('1756', 'Tegalampel', '29000');
INSERT INTO `kota` VALUES ('1757', 'Tenggarang', '29000');
INSERT INTO `kota` VALUES ('1758', 'Tlogosari', '29000');
INSERT INTO `kota` VALUES ('1759', 'Wonosari', '29000');
INSERT INTO `kota` VALUES ('1760', 'Wringin', '29000');
INSERT INTO `kota` VALUES ('1761', 'Binakal', '29000');
INSERT INTO `kota` VALUES ('1762', 'Sumberwringin', '29000');
INSERT INTO `kota` VALUES ('1763', 'Yogyakarta', '16000');
INSERT INTO `kota` VALUES ('1764', 'Tegalrejo', '16000');
INSERT INTO `kota` VALUES ('1765', 'Jetis', '16000');
INSERT INTO `kota` VALUES ('1766', 'Danurejan', '16000');
INSERT INTO `kota` VALUES ('1767', 'Gedongtengen', '16000');
INSERT INTO `kota` VALUES ('1768', 'Gondokusuman', '16000');
INSERT INTO `kota` VALUES ('1769', 'Gondomanan', '16000');
INSERT INTO `kota` VALUES ('1770', 'Kotagede', '16000');
INSERT INTO `kota` VALUES ('1771', 'Kraton', '16000');
INSERT INTO `kota` VALUES ('1772', 'Mantrijeron', '16000');
INSERT INTO `kota` VALUES ('1773', 'Mergangsan', '16000');
INSERT INTO `kota` VALUES ('1774', 'Ngampilan', '16000');
INSERT INTO `kota` VALUES ('1775', 'Pakualaman', '16000');
INSERT INTO `kota` VALUES ('1776', 'Umbulharjo', '16000');
INSERT INTO `kota` VALUES ('1777', 'Wirobrajan', '16000');
INSERT INTO `kota` VALUES ('1778', 'Bantul', '16000');
INSERT INTO `kota` VALUES ('1779', 'Bambanglipuro', '25000');
INSERT INTO `kota` VALUES ('1780', 'Dlingo', '25000');
INSERT INTO `kota` VALUES ('1781', 'Imogiri', '25000');
INSERT INTO `kota` VALUES ('1782', 'Jetis', '25000');
INSERT INTO `kota` VALUES ('1783', 'Kretek', '25000');
INSERT INTO `kota` VALUES ('1784', 'Pajangan', '25000');
INSERT INTO `kota` VALUES ('1785', 'Pandak', '25000');
INSERT INTO `kota` VALUES ('1786', 'Piyungan', '25000');
INSERT INTO `kota` VALUES ('1787', 'Pleret', '25000');
INSERT INTO `kota` VALUES ('1788', 'Pundong', '25000');
INSERT INTO `kota` VALUES ('1789', 'Sanden', '25000');
INSERT INTO `kota` VALUES ('1790', 'Sedayu', '25000');
INSERT INTO `kota` VALUES ('1791', 'Srandakan', '25000');
INSERT INTO `kota` VALUES ('1792', 'Banguntapan', '25000');
INSERT INTO `kota` VALUES ('1793', 'Kasihan', '25000');
INSERT INTO `kota` VALUES ('1794', 'Sewon', '25000');
INSERT INTO `kota` VALUES ('1795', 'Sleman', '16000');
INSERT INTO `kota` VALUES ('1796', 'Berbah', '25000');
INSERT INTO `kota` VALUES ('1797', 'Cangkringan', '25000');
INSERT INTO `kota` VALUES ('1798', 'Godean', '25000');
INSERT INTO `kota` VALUES ('1799', 'Kalasan', '25000');
INSERT INTO `kota` VALUES ('1800', 'Minggir', '25000');
INSERT INTO `kota` VALUES ('1801', 'Moyudan', '25000');
INSERT INTO `kota` VALUES ('1802', 'Ngaglik', '25000');
INSERT INTO `kota` VALUES ('1803', 'Ngemplak', '25000');
INSERT INTO `kota` VALUES ('1804', 'Pakem', '25000');
INSERT INTO `kota` VALUES ('1805', 'Prambanan', '16000');
INSERT INTO `kota` VALUES ('1806', 'Seyegan', '25000');
INSERT INTO `kota` VALUES ('1807', 'Tempel', '25000');
INSERT INTO `kota` VALUES ('1808', 'Turi', '25000');
INSERT INTO `kota` VALUES ('1809', 'Depok', '25000');
INSERT INTO `kota` VALUES ('1810', 'Gamping', '25000');
INSERT INTO `kota` VALUES ('1811', 'Mlati', '25000');
INSERT INTO `kota` VALUES ('1812', 'Wates', '20000');
INSERT INTO `kota` VALUES ('1813', 'Galur', '25000');
INSERT INTO `kota` VALUES ('1814', 'Girimulyo', '25000');
INSERT INTO `kota` VALUES ('1815', 'Kalibawang', '25000');
INSERT INTO `kota` VALUES ('1816', 'Kokap', '25000');
INSERT INTO `kota` VALUES ('1817', 'Lendah', '25000');
INSERT INTO `kota` VALUES ('1818', 'Nanggulan', '25000');
INSERT INTO `kota` VALUES ('1819', 'Panjatan', '25000');
INSERT INTO `kota` VALUES ('1820', 'Pengasih', '25000');
INSERT INTO `kota` VALUES ('1821', 'Samigaluh', '25000');
INSERT INTO `kota` VALUES ('1822', 'Sentolo', '25000');
INSERT INTO `kota` VALUES ('1823', 'Temon', '25000');
INSERT INTO `kota` VALUES ('1824', 'Wonosari', '20000');
INSERT INTO `kota` VALUES ('1825', 'Karangmojo', '25000');
INSERT INTO `kota` VALUES ('1826', 'Ngawen', '25000');
INSERT INTO `kota` VALUES ('1827', 'Nglipar', '25000');
INSERT INTO `kota` VALUES ('1828', 'Paliyan', '25000');
INSERT INTO `kota` VALUES ('1829', 'Panggang', '25000');
INSERT INTO `kota` VALUES ('1830', 'Patuk', '25000');
INSERT INTO `kota` VALUES ('1831', 'Playen', '25000');
INSERT INTO `kota` VALUES ('1832', 'Ponjong', '25000');
INSERT INTO `kota` VALUES ('1833', 'Rongkop', '25000');
INSERT INTO `kota` VALUES ('1834', 'Semin', '25000');
INSERT INTO `kota` VALUES ('1835', 'Semanu', '25000');
INSERT INTO `kota` VALUES ('1836', 'Tepus', '25000');
INSERT INTO `kota` VALUES ('1837', 'Gedangsari', '25000');
INSERT INTO `kota` VALUES ('1838', 'Girisubo', '25000');
INSERT INTO `kota` VALUES ('1839', 'Purwosari', '25000');
INSERT INTO `kota` VALUES ('1840', 'Saptosari', '25000');
INSERT INTO `kota` VALUES ('1841', 'Tanjungsari', '25000');
INSERT INTO `kota` VALUES ('1842', 'Kendari', '45000');
INSERT INTO `kota` VALUES ('1843', 'Abeli', '45000');
INSERT INTO `kota` VALUES ('1844', 'Baruga', '45000');
INSERT INTO `kota` VALUES ('1845', 'Kendar', '45000');
INSERT INTO `kota` VALUES ('1846', 'Barat', '45000');
INSERT INTO `kota` VALUES ('1847', 'Mandonga', '45000');
INSERT INTO `kota` VALUES ('1848', 'Poasia', '45000');
INSERT INTO `kota` VALUES ('1849', 'Bau - Bau', '62000');
INSERT INTO `kota` VALUES ('1850', 'Bungi', '62000');
INSERT INTO `kota` VALUES ('1851', 'Betoambari', '62000');
INSERT INTO `kota` VALUES ('1852', 'Kokalukuna', '62000');
INSERT INTO `kota` VALUES ('1853', 'Murhum', '62000');
INSERT INTO `kota` VALUES ('1854', 'Sorowalio', '62000');
INSERT INTO `kota` VALUES ('1855', 'Wolio', '62000');
INSERT INTO `kota` VALUES ('1856', 'Kolaka', '62000');
INSERT INTO `kota` VALUES ('1857', 'Ladongi', '78000');
INSERT INTO `kota` VALUES ('1858', 'Mowewe', '78000');
INSERT INTO `kota` VALUES ('1859', 'Pomalaa', '78000');
INSERT INTO `kota` VALUES ('1860', 'Tirawuta', '78000');
INSERT INTO `kota` VALUES ('1861', 'Watubangga', '78000');
INSERT INTO `kota` VALUES ('1862', 'Wolo', '78000');
INSERT INTO `kota` VALUES ('1863', 'Wundulako', '78000');
INSERT INTO `kota` VALUES ('1864', 'Baula', '78000');
INSERT INTO `kota` VALUES ('1865', 'Lambadia', '78000');
INSERT INTO `kota` VALUES ('1866', 'Latambaga', '78000');
INSERT INTO `kota` VALUES ('1867', 'Samaturu', '78000');
INSERT INTO `kota` VALUES ('1868', 'Tanggetada', '78000');
INSERT INTO `kota` VALUES ('1869', 'Uluiwoi', '117000');
INSERT INTO `kota` VALUES ('1870', 'Raha', '62000');
INSERT INTO `kota` VALUES ('1871', 'Bonegunu', '78000');
INSERT INTO `kota` VALUES ('1872', 'Duruka Bone', '78000');
INSERT INTO `kota` VALUES ('1873', 'Kabangka', '78000');
INSERT INTO `kota` VALUES ('1874', 'Kabawo', '78000');
INSERT INTO `kota` VALUES ('1875', 'Kulisusu', '78000');
INSERT INTO `kota` VALUES ('1876', 'Lawa', '78000');
INSERT INTO `kota` VALUES ('1877', 'Lohia', '78000');
INSERT INTO `kota` VALUES ('1878', 'Napabalano', '78000');
INSERT INTO `kota` VALUES ('1879', 'Parigi', '78000');
INSERT INTO `kota` VALUES ('1880', 'Sawerigadi', '78000');
INSERT INTO `kota` VALUES ('1881', 'Tongkuno', '78000');
INSERT INTO `kota` VALUES ('1882', 'Wakorumba Selatan', '117000');
INSERT INTO `kota` VALUES ('1883', 'Batalaiworu', '78000');
INSERT INTO `kota` VALUES ('1884', 'Katobu', '78000');
INSERT INTO `kota` VALUES ('1885', 'Kontunaga', '78000');
INSERT INTO `kota` VALUES ('1886', 'Kulisusu Barat', '78000');
INSERT INTO `kota` VALUES ('1887', 'Kulisusu Utara', '78000');
INSERT INTO `kota` VALUES ('1888', 'Kusambi', '78000');
INSERT INTO `kota` VALUES ('1889', 'Lasalepa', '78000');
INSERT INTO `kota` VALUES ('1890', 'Maginti', '78000');
INSERT INTO `kota` VALUES ('1891', 'Maligano', '78000');
INSERT INTO `kota` VALUES ('1892', 'Pasir Putih', '78000');
INSERT INTO `kota` VALUES ('1893', 'Tikep', '78000');
INSERT INTO `kota` VALUES ('1894', 'Tiworo Tengah', '78000');
INSERT INTO `kota` VALUES ('1895', 'Wakorumba', '78000');
INSERT INTO `kota` VALUES ('1896', 'Barangka', '78000');
INSERT INTO `kota` VALUES ('1897', 'Kambowa', '78000');
INSERT INTO `kota` VALUES ('1898', 'Watopute', '78000');
INSERT INTO `kota` VALUES ('1899', 'Unaaha', '62000');
INSERT INTO `kota` VALUES ('1900', 'Abuki', '78000');
INSERT INTO `kota` VALUES ('1901', 'Lambuya', '78000');
INSERT INTO `kota` VALUES ('1902', 'Pondidaha', '78000');
INSERT INTO `kota` VALUES ('1903', 'Wawotobi', '78000');
INSERT INTO `kota` VALUES ('1904', 'Asera', '78000');
INSERT INTO `kota` VALUES ('1905', 'Lasolo', '78000');
INSERT INTO `kota` VALUES ('1906', 'Soropia', '78000');
INSERT INTO `kota` VALUES ('1907', 'Wawonii', '117000');
INSERT INTO `kota` VALUES ('1908', 'Waworete', '78000');
INSERT INTO `kota` VALUES ('1909', 'Bondoala Sampara', '78000');
INSERT INTO `kota` VALUES ('1910', 'Latoma', '78000');
INSERT INTO `kota` VALUES ('1911', 'Sawa', '78000');
INSERT INTO `kota` VALUES ('1912', 'Tongauna', '78000');
INSERT INTO `kota` VALUES ('1913', 'Uepai', '78000');
INSERT INTO `kota` VALUES ('1914', 'Wonggeduku', '78000');
INSERT INTO `kota` VALUES ('1915', 'Rumbia', '62000');
INSERT INTO `kota` VALUES ('1916', 'Kabaena', '78000');
INSERT INTO `kota` VALUES ('1917', 'Kabaena Timur', '78000');
INSERT INTO `kota` VALUES ('1918', 'Poleang', '78000');
INSERT INTO `kota` VALUES ('1919', 'Poleang Barat', '78000');
INSERT INTO `kota` VALUES ('1920', 'Poleang Timur', '78000');
INSERT INTO `kota` VALUES ('1921', 'Rarowatu', '78000');
INSERT INTO `kota` VALUES ('1922', 'Pasar Wajo', '62000');
INSERT INTO `kota` VALUES ('1923', 'Batauga', '78000');
INSERT INTO `kota` VALUES ('1924', 'Batu Atas', '117000');
INSERT INTO `kota` VALUES ('1925', 'E', '117000');
INSERT INTO `kota` VALUES ('1926', 'Kadatua', '117000');
INSERT INTO `kota` VALUES ('1927', 'Kapontori', '78000');
INSERT INTO `kota` VALUES ('1928', 'Lakudo', '78000');
INSERT INTO `kota` VALUES ('1929', 'Lasalimu', '117000');
INSERT INTO `kota` VALUES ('1930', 'Lasalimu Selatan', '117000');
INSERT INTO `kota` VALUES ('1931', 'Mawasangka', '117000');
INSERT INTO `kota` VALUES ('1932', 'Mawasangka Timur', '78000');
INSERT INTO `kota` VALUES ('1933', 'Sampolawa', '78000');
INSERT INTO `kota` VALUES ('1934', 'Siompu', '78000');
INSERT INTO `kota` VALUES ('1935', 'Talaga Raya', '117000');
INSERT INTO `kota` VALUES ('1936', 'Buranga', '78000');
INSERT INTO `kota` VALUES ('1937', 'Lasusua', '62000');
INSERT INTO `kota` VALUES ('1938', 'Batu Putih', '117000');
INSERT INTO `kota` VALUES ('1939', 'Kodeoha', '78000');
INSERT INTO `kota` VALUES ('1940', 'Ngapa', '78000');
INSERT INTO `kota` VALUES ('1941', 'Pakue', '78000');
INSERT INTO `kota` VALUES ('1942', 'Ranteangin', '78000');
INSERT INTO `kota` VALUES ('1943', 'Andolo/Wanggodo', '62000');
INSERT INTO `kota` VALUES ('1944', 'Angata', '78000');
INSERT INTO `kota` VALUES ('1945', 'Kolono', '78000');
INSERT INTO `kota` VALUES ('1946', 'Konda', '78000');
INSERT INTO `kota` VALUES ('1947', 'Lainea', '78000');
INSERT INTO `kota` VALUES ('1948', 'Landono', '78000');
INSERT INTO `kota` VALUES ('1949', 'Laonti', '78000');
INSERT INTO `kota` VALUES ('1950', 'Moramo', '78000');
INSERT INTO `kota` VALUES ('1951', 'Palangga', '78000');
INSERT INTO `kota` VALUES ('1952', 'Ranomeeto', '78000');
INSERT INTO `kota` VALUES ('1953', 'Tinanggea', '78000');
INSERT INTO `kota` VALUES ('1954', 'Wangi-Wangi', '62000');
INSERT INTO `kota` VALUES ('1955', 'Wangi-Wangi Selatan', '78000');
INSERT INTO `kota` VALUES ('1956', 'Kaledupa', '78000');
INSERT INTO `kota` VALUES ('1957', 'Tomia', '117000');
INSERT INTO `kota` VALUES ('1958', 'Binongko', '117000');
INSERT INTO `kota` VALUES ('1959', 'Kediri', '20000');
INSERT INTO `kota` VALUES ('1960', 'Gampengrejo', '24000');
INSERT INTO `kota` VALUES ('1961', 'Grogol', '24000');
INSERT INTO `kota` VALUES ('1962', 'Gurah', '24000');
INSERT INTO `kota` VALUES ('1963', 'Kandat', '24000');
INSERT INTO `kota` VALUES ('1964', 'Kras', '24000');
INSERT INTO `kota` VALUES ('1965', 'Kunjang', '24000');
INSERT INTO `kota` VALUES ('1966', 'Mojo', '24000');
INSERT INTO `kota` VALUES ('1967', 'Ngadiluwih', '24000');
INSERT INTO `kota` VALUES ('1968', 'Pagu', '24000');
INSERT INTO `kota` VALUES ('1969', 'Papar', '24000');
INSERT INTO `kota` VALUES ('1970', 'Plemahan', '24000');
INSERT INTO `kota` VALUES ('1971', 'Plosoklaten', '24000');
INSERT INTO `kota` VALUES ('1972', 'Purwoasri', '24000');
INSERT INTO `kota` VALUES ('1973', 'Semen', '24000');
INSERT INTO `kota` VALUES ('1974', 'Tarokan', '24000');
INSERT INTO `kota` VALUES ('1975', 'Wates', '24000');
INSERT INTO `kota` VALUES ('1976', 'Pare', '24000');
INSERT INTO `kota` VALUES ('1977', 'Kandangan', '24000');
INSERT INTO `kota` VALUES ('1978', 'Kepung', '24000');
INSERT INTO `kota` VALUES ('1979', 'Ngancar', '24000');
INSERT INTO `kota` VALUES ('1980', 'Puncu', '24000');
INSERT INTO `kota` VALUES ('1981', 'Banyakan', '24000');
INSERT INTO `kota` VALUES ('1982', 'Kayen Kidul', '24000');
INSERT INTO `kota` VALUES ('1983', 'Ringinrejo', '24000');
INSERT INTO `kota` VALUES ('1984', 'Mojoroto', '20000');
INSERT INTO `kota` VALUES ('1985', 'Pesantren', '20000');
INSERT INTO `kota` VALUES ('1986', 'Kupang', '50000');
INSERT INTO `kota` VALUES ('1987', 'Alak', '50000');
INSERT INTO `kota` VALUES ('1988', 'Kelapa Lima', '50000');
INSERT INTO `kota` VALUES ('1989', 'Mawlapa', '50000');
INSERT INTO `kota` VALUES ('1990', 'Oebobo', '50000');
INSERT INTO `kota` VALUES ('1991', 'Waibakul', '123000');
INSERT INTO `kota` VALUES ('1992', 'Mamboro', '123000');
INSERT INTO `kota` VALUES ('1993', 'Umbu Ratu Nggay', '123000');
INSERT INTO `kota` VALUES ('1994', 'Umbu Ratu Nggay Barat', '123000');
INSERT INTO `kota` VALUES ('1995', 'Katikutana', '123000');
INSERT INTO `kota` VALUES ('1996', 'Atambua', '65000');
INSERT INTO `kota` VALUES ('1997', 'Kobalima', '123000');
INSERT INTO `kota` VALUES ('1998', 'Lamakmen', '82000');
INSERT INTO `kota` VALUES ('1999', 'Malaka Timur', '123000');
INSERT INTO `kota` VALUES ('2000', 'Malaka Tengah', '82000');
INSERT INTO `kota` VALUES ('2001', 'Malaka Barat', '123000');
INSERT INTO `kota` VALUES ('2002', 'Tasefeto Barat', '82000');
INSERT INTO `kota` VALUES ('2003', 'Tasifeto Timur', '123000');
INSERT INTO `kota` VALUES ('2004', 'Kakuluk Mesak', '123000');
INSERT INTO `kota` VALUES ('2005', 'Raihat', '123000');
INSERT INTO `kota` VALUES ('2006', 'Rinhat', '123000');
INSERT INTO `kota` VALUES ('2007', 'Sasita Mean', '123000');
INSERT INTO `kota` VALUES ('2008', 'Kalabahi', '65000');
INSERT INTO `kota` VALUES ('2009', 'Alor Timur', '123000');
INSERT INTO `kota` VALUES ('2010', 'Pantar', '123000');
INSERT INTO `kota` VALUES ('2011', 'Alor Selatan', '123000');
INSERT INTO `kota` VALUES ('2012', 'Alor Barat Daya', '123000');
INSERT INTO `kota` VALUES ('2013', 'Alor Barat Laut', '123000');
INSERT INTO `kota` VALUES ('2014', 'Alor Tengah Utara', '123000');
INSERT INTO `kota` VALUES ('2015', 'Alor Timur Laut', '123000');
INSERT INTO `kota` VALUES ('2016', 'Pantar Barat', '123000');
INSERT INTO `kota` VALUES ('2017', 'Teluk Mutiara', '82000');
INSERT INTO `kota` VALUES ('2018', 'Kefamenanu', '65000');
INSERT INTO `kota` VALUES ('2019', 'Biboki Selatan', '82000');
INSERT INTO `kota` VALUES ('2020', 'Biboki Utara', '82000');
INSERT INTO `kota` VALUES ('2021', 'Insana', '82000');
INSERT INTO `kota` VALUES ('2022', 'Miomafo Timur', '82000');
INSERT INTO `kota` VALUES ('2023', 'Miomafo Barat', '82000');
INSERT INTO `kota` VALUES ('2024', 'Biboki Anleu', '82000');
INSERT INTO `kota` VALUES ('2025', 'Insana Utara', '82000');
INSERT INTO `kota` VALUES ('2026', 'Neomuti', '82000');
INSERT INTO `kota` VALUES ('2027', 'Larantuka', '65000');
INSERT INTO `kota` VALUES ('2028', 'Adonara Barat', '123000');
INSERT INTO `kota` VALUES ('2029', 'Adonara Timur', '123000');
INSERT INTO `kota` VALUES ('2030', 'Solor Barat', '123000');
INSERT INTO `kota` VALUES ('2031', 'Solor Timur', '123000');
INSERT INTO `kota` VALUES ('2032', 'Tanjung Bunga', '82000');
INSERT INTO `kota` VALUES ('2033', 'Wulanggitan', '82000');
INSERT INTO `kota` VALUES ('2034', 'Ile Boleng', '82000');
INSERT INTO `kota` VALUES ('2035', 'Ile Mandiri', '82000');
INSERT INTO `kota` VALUES ('2036', 'Kelubagolit', '82000');
INSERT INTO `kota` VALUES ('2037', 'Titihena', '82000');
INSERT INTO `kota` VALUES ('2038', 'Witihama', '82000');
INSERT INTO `kota` VALUES ('2039', 'Wotan Ulu mado', '82000');
INSERT INTO `kota` VALUES ('2040', 'Maumere', '65000');
INSERT INTO `kota` VALUES ('2041', 'Bola', '123000');
INSERT INTO `kota` VALUES ('2042', 'Kewapante', '123000');
INSERT INTO `kota` VALUES ('2043', 'Lela', '123000');
INSERT INTO `kota` VALUES ('2044', 'Nitta', '82000');
INSERT INTO `kota` VALUES ('2045', 'Paga', '123000');
INSERT INTO `kota` VALUES ('2046', 'Talibura', '123000');
INSERT INTO `kota` VALUES ('2047', 'Alok', '82000');
INSERT INTO `kota` VALUES ('2048', 'Mego', '123000');
INSERT INTO `kota` VALUES ('2049', 'Palue', '123000');
INSERT INTO `kota` VALUES ('2050', 'Waigete', '123000');
INSERT INTO `kota` VALUES ('2051', 'Ruteng', '65000');
INSERT INTO `kota` VALUES ('2052', 'Cibal', '123000');
INSERT INTO `kota` VALUES ('2053', 'Lambaleda', '123000');
INSERT INTO `kota` VALUES ('2054', 'Reo', '123000');
INSERT INTO `kota` VALUES ('2055', 'Satarmese', '123000');
INSERT INTO `kota` VALUES ('2056', 'Komba', '123000');
INSERT INTO `kota` VALUES ('2057', 'Mborong', '123000');
INSERT INTO `kota` VALUES ('2058', 'Ponco Ranaka', '123000');
INSERT INTO `kota` VALUES ('2059', 'Sambi Rambas', '123000');
INSERT INTO `kota` VALUES ('2060', 'Wae Rii', '123000');
INSERT INTO `kota` VALUES ('2061', 'Soe', '65000');
INSERT INTO `kota` VALUES ('2062', 'Amanatun Utara', '82000');
INSERT INTO `kota` VALUES ('2063', 'Amanatun Selatan', '82000');
INSERT INTO `kota` VALUES ('2064', 'Amanuban Selatan', '82000');
INSERT INTO `kota` VALUES ('2065', 'Amanuban Barat', '123000');
INSERT INTO `kota` VALUES ('2066', 'Mollo Utara', '123000');
INSERT INTO `kota` VALUES ('2067', 'Mollo Selatan', '123000');
INSERT INTO `kota` VALUES ('2068', 'Amanatun Tengah', '82000');
INSERT INTO `kota` VALUES ('2069', 'Amanatun Timur', '82000');
INSERT INTO `kota` VALUES ('2070', 'Batu Putih', '123000');
INSERT INTO `kota` VALUES ('2071', 'Boking', '82000');
INSERT INTO `kota` VALUES ('2072', 'Fatumnasi', '82000');
INSERT INTO `kota` VALUES ('2073', 'Kalbano', '82000');
INSERT INTO `kota` VALUES ('2074', 'Kie', '82000');
INSERT INTO `kota` VALUES ('2075', 'Kot\'olin', '82000');
INSERT INTO `kota` VALUES ('2076', 'Kualin', '82000');
INSERT INTO `kota` VALUES ('2077', 'Kuan Fatu', '82000');
INSERT INTO `kota` VALUES ('2078', 'Nunkolo', '82000');
INSERT INTO `kota` VALUES ('2079', 'Oenino', '123000');
INSERT INTO `kota` VALUES ('2080', 'Polen', '123000');
INSERT INTO `kota` VALUES ('2081', 'Tionas', '82000');
INSERT INTO `kota` VALUES ('2082', 'Ende', '65000');
INSERT INTO `kota` VALUES ('2083', 'Detusoko', '82000');
INSERT INTO `kota` VALUES ('2084', 'Nanga Panda', '82000');
INSERT INTO `kota` VALUES ('2085', 'Ndona', '82000');
INSERT INTO `kota` VALUES ('2086', 'Wolo Waru', '82000');
INSERT INTO `kota` VALUES ('2087', 'Detukeli', '82000');
INSERT INTO `kota` VALUES ('2088', 'Ende Selatan', '65000');
INSERT INTO `kota` VALUES ('2089', 'Ende Tengah', '65000');
INSERT INTO `kota` VALUES ('2090', 'Ende Timur', '65000');
INSERT INTO `kota` VALUES ('2091', 'Ende Utara', '65000');
INSERT INTO `kota` VALUES ('2092', 'Kelimutu', '82000');
INSERT INTO `kota` VALUES ('2093', 'Kotabaru', '82000');
INSERT INTO `kota` VALUES ('2094', 'Lio Timur', '82000');
INSERT INTO `kota` VALUES ('2095', 'Maukaro', '82000');
INSERT INTO `kota` VALUES ('2096', 'Ndona Timur', '82000');
INSERT INTO `kota` VALUES ('2097', 'Pulau Ende', '123000');
INSERT INTO `kota` VALUES ('2098', 'Wewaria', '123000');
INSERT INTO `kota` VALUES ('2099', 'Wolojita', '123000');
INSERT INTO `kota` VALUES ('2100', 'Magekoba/Maurole', '82000');
INSERT INTO `kota` VALUES ('2101', 'Bajawa', '123000');
INSERT INTO `kota` VALUES ('2102', 'Aimere', '123000');
INSERT INTO `kota` VALUES ('2103', 'Riung', '123000');
INSERT INTO `kota` VALUES ('2104', 'Jere Buu', '82000');
INSERT INTO `kota` VALUES ('2105', 'Ngada Bawa', '82000');
INSERT INTO `kota` VALUES ('2106', 'Riung Barat', '123000');
INSERT INTO `kota` VALUES ('2107', 'Soa', '123000');
INSERT INTO `kota` VALUES ('2108', 'Wogomang Ulewa', '82000');
INSERT INTO `kota` VALUES ('2109', 'Golewa', '123000');
INSERT INTO `kota` VALUES ('2110', 'Waingapu', '65000');
INSERT INTO `kota` VALUES ('2111', 'Lewa', '123000');
INSERT INTO `kota` VALUES ('2112', 'Paberiwai', '123000');
INSERT INTO `kota` VALUES ('2113', 'Pahunga Lodu', '123000');
INSERT INTO `kota` VALUES ('2114', 'Tabundung', '123000');
INSERT INTO `kota` VALUES ('2115', 'Haharu', '123000');
INSERT INTO `kota` VALUES ('2116', 'Kahaungu Eti', '123000');
INSERT INTO `kota` VALUES ('2117', 'Karera', '123000');
INSERT INTO `kota` VALUES ('2118', 'Matawai Lapau', '123000');
INSERT INTO `kota` VALUES ('2119', 'Nggaha Oriangu', '123000');
INSERT INTO `kota` VALUES ('2120', 'Pandawai', '123000');
INSERT INTO `kota` VALUES ('2121', 'Pinu Pahar', '123000');
INSERT INTO `kota` VALUES ('2122', 'Rindi', '123000');
INSERT INTO `kota` VALUES ('2123', 'Umalulu', '123000');
INSERT INTO `kota` VALUES ('2124', 'Wulla Waijelu', '123000');
INSERT INTO `kota` VALUES ('2125', 'Waikabubak', '65000');
INSERT INTO `kota` VALUES ('2126', 'Laratama', '123000');
INSERT INTO `kota` VALUES ('2127', 'Walakaka', '123000');
INSERT INTO `kota` VALUES ('2128', 'Labuan Bajo', '65000');
INSERT INTO `kota` VALUES ('2129', 'Komodo', '123000');
INSERT INTO `kota` VALUES ('2130', 'Kuwus', '123000');
INSERT INTO `kota` VALUES ('2131', 'Lembor', '123000');
INSERT INTO `kota` VALUES ('2132', 'Macang Pacar', '123000');
INSERT INTO `kota` VALUES ('2133', 'Sanonggoang', '123000');
INSERT INTO `kota` VALUES ('2134', 'Borong', '123000');
INSERT INTO `kota` VALUES ('2135', 'Elar', '123000');
INSERT INTO `kota` VALUES ('2136', 'Lamba Leda', '123000');
INSERT INTO `kota` VALUES ('2137', 'Poco Ranaka', '123000');
INSERT INTO `kota` VALUES ('2138', 'Lomba', '123000');
INSERT INTO `kota` VALUES ('2139', 'Sambi Rampas', '123000');
INSERT INTO `kota` VALUES ('2140', 'Mbay', '123000');
INSERT INTO `kota` VALUES ('2141', 'Aesesa', '123000');
INSERT INTO `kota` VALUES ('2142', 'Boawae', '123000');
INSERT INTO `kota` VALUES ('2143', 'Mauponggo', '123000');
INSERT INTO `kota` VALUES ('2144', 'Nangaroro', '123000');
INSERT INTO `kota` VALUES ('2145', 'Keo Tengah', '123000');
INSERT INTO `kota` VALUES ('2146', 'Wolo Wae', '123000');
INSERT INTO `kota` VALUES ('2147', 'Aesesa Selatan', '123000');
INSERT INTO `kota` VALUES ('2148', 'Baa', '65000');
INSERT INTO `kota` VALUES ('2149', 'Lobalain', '123000');
INSERT INTO `kota` VALUES ('2150', 'Pantai Baru', '123000');
INSERT INTO `kota` VALUES ('2151', 'Rote Barat Daya', '123000');
INSERT INTO `kota` VALUES ('2152', 'Rote Barat Laut', '123000');
INSERT INTO `kota` VALUES ('2153', 'Rote Tengah', '123000');
INSERT INTO `kota` VALUES ('2154', 'Rote Timur', '123000');
INSERT INTO `kota` VALUES ('2155', 'Tambolaka', '65000');
INSERT INTO `kota` VALUES ('2156', 'Kodi', '123000');
INSERT INTO `kota` VALUES ('2157', 'Wewewa Barat', '123000');
INSERT INTO `kota` VALUES ('2158', 'Wewewa Timur', '123000');
INSERT INTO `kota` VALUES ('2159', 'Kodi Bangedo', '123000');
INSERT INTO `kota` VALUES ('2160', 'Kodi Utara', '123000');
INSERT INTO `kota` VALUES ('2161', 'Laura', '123000');
INSERT INTO `kota` VALUES ('2162', 'Wewewa Selatan', '123000');
INSERT INTO `kota` VALUES ('2163', 'Wewewa Utara', '123000');
INSERT INTO `kota` VALUES ('2164', 'Lembata', '65000');
INSERT INTO `kota` VALUES ('2165', 'Buyasuri', '123000');
INSERT INTO `kota` VALUES ('2166', 'Omesuri', '123000');
INSERT INTO `kota` VALUES ('2167', 'Lebatukan', '123000');
INSERT INTO `kota` VALUES ('2168', 'Ile Ape', '123000');
INSERT INTO `kota` VALUES ('2169', 'Nubatukan', '123000');
INSERT INTO `kota` VALUES ('2170', 'Atadei', '123000');
INSERT INTO `kota` VALUES ('2171', 'Nagawutung', '123000');
INSERT INTO `kota` VALUES ('2172', 'Wulandoni', '123000');
INSERT INTO `kota` VALUES ('2173', 'Oelamasi', '65000');
INSERT INTO `kota` VALUES ('2174', 'Amabioefeto Timur', '123000');
INSERT INTO `kota` VALUES ('2175', 'Amarasi Barat', '123000');
INSERT INTO `kota` VALUES ('2176', 'Amarasi Selatan', '123000');
INSERT INTO `kota` VALUES ('2177', 'Amarasi Timur', '123000');
INSERT INTO `kota` VALUES ('2178', 'Amarasi', '123000');
INSERT INTO `kota` VALUES ('2179', 'Amfoang Barat Daya', '123000');
INSERT INTO `kota` VALUES ('2180', 'Amfoang Barat Laut', '123000');
INSERT INTO `kota` VALUES ('2181', 'Amfoang Selatan', '123000');
INSERT INTO `kota` VALUES ('2182', 'Amfoang Utara', '123000');
INSERT INTO `kota` VALUES ('2183', 'Fatuleu', '123000');
INSERT INTO `kota` VALUES ('2184', 'Fatuleu Barat', '123000');
INSERT INTO `kota` VALUES ('2185', 'Fatuleu Tengah', '123000');
INSERT INTO `kota` VALUES ('2186', 'Hawu Mehara', '123000');
INSERT INTO `kota` VALUES ('2187', 'Kupang Barat', '65000');
INSERT INTO `kota` VALUES ('2188', 'Kupang Tengah', '65000');
INSERT INTO `kota` VALUES ('2189', 'Kupang Timur', '65000');
INSERT INTO `kota` VALUES ('2190', 'Nekemese', '123000');
INSERT INTO `kota` VALUES ('2191', 'Raijua', '123000');
INSERT INTO `kota` VALUES ('2192', 'Sabu Barat', '123000');
INSERT INTO `kota` VALUES ('2193', 'Sabu Liae', '123000');
INSERT INTO `kota` VALUES ('2194', 'Sabu Timur', '123000');
INSERT INTO `kota` VALUES ('2195', 'Semau', '123000');
INSERT INTO `kota` VALUES ('2196', 'Semau Selatan', '123000');
INSERT INTO `kota` VALUES ('2197', 'Sulamu', '123000');
INSERT INTO `kota` VALUES ('2198', 'Taebenu', '123000');
INSERT INTO `kota` VALUES ('2199', 'Takari', '123000');
INSERT INTO `kota` VALUES ('2200', 'Karawang', '9000');
INSERT INTO `kota` VALUES ('2201', 'Batujaya', '12000');
INSERT INTO `kota` VALUES ('2202', 'Cibuaya', '12000');
INSERT INTO `kota` VALUES ('2203', 'Cikampek', '9000');
INSERT INTO `kota` VALUES ('2204', 'Cilamaya Kulon', '12000');
INSERT INTO `kota` VALUES ('2205', 'Jatisari', '9000');
INSERT INTO `kota` VALUES ('2206', 'Klari', '9000');
INSERT INTO `kota` VALUES ('2207', 'LEMAHABANG WADAS', '9000');
INSERT INTO `kota` VALUES ('2208', 'Pakisjaya', '12000');
INSERT INTO `kota` VALUES ('2209', 'Pangkalan', '12000');
INSERT INTO `kota` VALUES ('2210', 'Pedes', '12000');
INSERT INTO `kota` VALUES ('2211', 'Rawamerta', '9000');
INSERT INTO `kota` VALUES ('2212', 'Rengasdengklok', '9000');
INSERT INTO `kota` VALUES ('2213', 'Talagasari', '9000');
INSERT INTO `kota` VALUES ('2214', 'Telukjambe Barat', '9000');
INSERT INTO `kota` VALUES ('2215', 'Tempuran', '12000');
INSERT INTO `kota` VALUES ('2216', 'Tirtamulya', '9000');
INSERT INTO `kota` VALUES ('2217', 'Tegalwaru', '12000');
INSERT INTO `kota` VALUES ('2218', 'Banyusari', '12000');
INSERT INTO `kota` VALUES ('2219', 'Ciampel', '9000');
INSERT INTO `kota` VALUES ('2220', 'Cilamaya Wetan', '12000');
INSERT INTO `kota` VALUES ('2221', 'Cilebar', '12000');
INSERT INTO `kota` VALUES ('2222', 'Jayakerta', '12000');
INSERT INTO `kota` VALUES ('2223', 'Karawang Barat', '9000');
INSERT INTO `kota` VALUES ('2224', 'Karawang Timur', '9000');
INSERT INTO `kota` VALUES ('2225', 'Kotabaru', '9000');
INSERT INTO `kota` VALUES ('2226', 'Kutawaluya', '12000');
INSERT INTO `kota` VALUES ('2227', 'Majalaya', '9000');
INSERT INTO `kota` VALUES ('2228', 'Purwasari', '9000');
INSERT INTO `kota` VALUES ('2229', 'Telukjambe Timur', '9000');
INSERT INTO `kota` VALUES ('2230', 'Tirtajaya', '12000');
INSERT INTO `kota` VALUES ('2231', 'Manado', '42000');
INSERT INTO `kota` VALUES ('2232', 'Bunaken', '42000');
INSERT INTO `kota` VALUES ('2233', 'Malalayang', '42000');
INSERT INTO `kota` VALUES ('2234', 'Mapanget', '42000');
INSERT INTO `kota` VALUES ('2235', 'Sario', '42000');
INSERT INTO `kota` VALUES ('2236', 'Singkil', '42000');
INSERT INTO `kota` VALUES ('2237', 'Tikala', '42000');
INSERT INTO `kota` VALUES ('2238', 'Tuminting', '42000');
INSERT INTO `kota` VALUES ('2239', 'Wanea', '42000');
INSERT INTO `kota` VALUES ('2240', 'Wenang', '42000');
INSERT INTO `kota` VALUES ('2241', 'Kotamobagu', '58000');
INSERT INTO `kota` VALUES ('2242', 'Bintauna', '73000');
INSERT INTO `kota` VALUES ('2243', 'Bolaang', '73000');
INSERT INTO `kota` VALUES ('2244', 'BOLAANG ITANG', '73000');
INSERT INTO `kota` VALUES ('2245', 'BOLAANG UKI', '73000');
INSERT INTO `kota` VALUES ('2246', 'Kaidipang', '73000');
INSERT INTO `kota` VALUES ('2247', 'Kotabunan', '73000');
INSERT INTO `kota` VALUES ('2248', 'Lolayan', '73000');
INSERT INTO `kota` VALUES ('2249', 'Lolak', '73000');
INSERT INTO `kota` VALUES ('2250', 'Modayag', '73000');
INSERT INTO `kota` VALUES ('2251', 'Passi', '73000');
INSERT INTO `kota` VALUES ('2252', 'Pinolosian', '73000');
INSERT INTO `kota` VALUES ('2253', 'Poigar', '73000');
INSERT INTO `kota` VALUES ('2254', 'Sangtombolang', '73000');
INSERT INTO `kota` VALUES ('2255', 'Dumoga Barat', '73000');
INSERT INTO `kota` VALUES ('2256', 'Dumoga Timur', '73000');
INSERT INTO `kota` VALUES ('2257', 'Dumoga Utara', '73000');
INSERT INTO `kota` VALUES ('2258', 'Nuangan', '73000');
INSERT INTO `kota` VALUES ('2259', 'Pinogaluman', '73000');
INSERT INTO `kota` VALUES ('2260', 'Posigadan', '73000');
INSERT INTO `kota` VALUES ('2261', 'Tahuna', '58000');
INSERT INTO `kota` VALUES ('2262', 'Kendahe', '73000');
INSERT INTO `kota` VALUES ('2263', 'Manganitu', '73000');
INSERT INTO `kota` VALUES ('2264', 'Siau Timur', '73000');
INSERT INTO `kota` VALUES ('2265', 'Siau Barat', '73000');
INSERT INTO `kota` VALUES ('2266', 'Tabukan Utara', '73000');
INSERT INTO `kota` VALUES ('2267', 'Tabukan Selatan', '73000');
INSERT INTO `kota` VALUES ('2268', 'Tabukan Tengah', '73000');
INSERT INTO `kota` VALUES ('2269', 'Tagulandang', '73000');
INSERT INTO `kota` VALUES ('2270', 'Tamako', '73000');
INSERT INTO `kota` VALUES ('2271', 'Biaro', '73000');
INSERT INTO `kota` VALUES ('2272', 'Manganitu Selatan', '73000');
INSERT INTO `kota` VALUES ('2273', 'Nusa Tabukan', '73000');
INSERT INTO `kota` VALUES ('2274', 'Siau Barat Selatan', '73000');
INSERT INTO `kota` VALUES ('2275', 'Siau Timur Selatan', '73000');
INSERT INTO `kota` VALUES ('2276', 'Tagulandang Utara', '73000');
INSERT INTO `kota` VALUES ('2277', 'Tatoareng', '73000');
INSERT INTO `kota` VALUES ('2278', 'Tondano', '58000');
INSERT INTO `kota` VALUES ('2279', 'Eris', '73000');
INSERT INTO `kota` VALUES ('2280', 'Kakas', '73000');
INSERT INTO `kota` VALUES ('2281', 'Kawangkoan', '73000');
INSERT INTO `kota` VALUES ('2282', 'Kombi', '73000');
INSERT INTO `kota` VALUES ('2283', 'Remboken', '73000');
INSERT INTO `kota` VALUES ('2284', 'Sonder', '73000');
INSERT INTO `kota` VALUES ('2285', 'Tompaso', '73000');
INSERT INTO `kota` VALUES ('2286', 'Langowan Barat', '73000');
INSERT INTO `kota` VALUES ('2287', 'Langowan Selatan', '73000');
INSERT INTO `kota` VALUES ('2288', 'Langowan Timur', '73000');
INSERT INTO `kota` VALUES ('2289', 'Lembean Timur', '73000');
INSERT INTO `kota` VALUES ('2290', 'Pineleng', '73000');
INSERT INTO `kota` VALUES ('2291', 'Tombariri', '73000');
INSERT INTO `kota` VALUES ('2292', 'Tombulu', '73000');
INSERT INTO `kota` VALUES ('2293', 'Tondano Barat', '73000');
INSERT INTO `kota` VALUES ('2294', 'Tondano Selatan', '73000');
INSERT INTO `kota` VALUES ('2295', 'Tondano Timur', '73000');
INSERT INTO `kota` VALUES ('2296', 'Tondano Utara', '73000');
INSERT INTO `kota` VALUES ('2297', 'Bitung', '58000');
INSERT INTO `kota` VALUES ('2298', 'Bitung Barat', '58000');
INSERT INTO `kota` VALUES ('2299', 'Bitung Selatan', '58000');
INSERT INTO `kota` VALUES ('2300', 'Bitung Tengah', '58000');
INSERT INTO `kota` VALUES ('2301', 'Bitung Timur', '58000');
INSERT INTO `kota` VALUES ('2302', 'Bitung Utara', '58000');
INSERT INTO `kota` VALUES ('2303', 'Boroko', '73000');
INSERT INTO `kota` VALUES ('2304', 'Bolaang Itang Barat', '73000');
INSERT INTO `kota` VALUES ('2305', 'Bolaang Itang Timur', '73000');
INSERT INTO `kota` VALUES ('2306', 'Sangkub', '73000');
INSERT INTO `kota` VALUES ('2307', 'Melonguane', '73000');
INSERT INTO `kota` VALUES ('2308', 'Beo', '73000');
INSERT INTO `kota` VALUES ('2309', 'Essang', '73000');
INSERT INTO `kota` VALUES ('2310', 'Gemeh', '73000');
INSERT INTO `kota` VALUES ('2311', 'Kabaruan', '73000');
INSERT INTO `kota` VALUES ('2312', 'Lirung', '73000');
INSERT INTO `kota` VALUES ('2313', 'Nanusa', '73000');
INSERT INTO `kota` VALUES ('2314', 'Rainis', '73000');
INSERT INTO `kota` VALUES ('2315', 'Airmadidi', '73000');
INSERT INTO `kota` VALUES ('2316', 'Dimembe', '73000');
INSERT INTO `kota` VALUES ('2317', 'Kalawat', '73000');
INSERT INTO `kota` VALUES ('2318', 'Kauditan', '73000');
INSERT INTO `kota` VALUES ('2319', 'Kema', '73000');
INSERT INTO `kota` VALUES ('2320', 'Likupang Barat', '73000');
INSERT INTO `kota` VALUES ('2321', 'Likupang Timur', '73000');
INSERT INTO `kota` VALUES ('2322', 'Wori', '73000');
INSERT INTO `kota` VALUES ('2323', 'Amurang', '73000');
INSERT INTO `kota` VALUES ('2324', 'Modoinding', '73000');
INSERT INTO `kota` VALUES ('2325', 'Motoling', '73000');
INSERT INTO `kota` VALUES ('2326', 'Ranoyapo', '73000');
INSERT INTO `kota` VALUES ('2327', 'Sinon Sayang', '73000');
INSERT INTO `kota` VALUES ('2328', 'Tareran', '73000');
INSERT INTO `kota` VALUES ('2329', 'Tenga', '73000');
INSERT INTO `kota` VALUES ('2330', 'Tombasian', '73000');
INSERT INTO `kota` VALUES ('2331', 'Tompaso Baru', '73000');
INSERT INTO `kota` VALUES ('2332', 'Tumpaan', '73000');
INSERT INTO `kota` VALUES ('2333', 'Ratahan', '58000');
INSERT INTO `kota` VALUES ('2334', 'Belang', '73000');
INSERT INTO `kota` VALUES ('2335', 'Tombatu', '73000');
INSERT INTO `kota` VALUES ('2336', 'Touluaan', '73000');
INSERT INTO `kota` VALUES ('2337', 'Ratatotok', '73000');
INSERT INTO `kota` VALUES ('2338', 'Pusomaen', '73000');
INSERT INTO `kota` VALUES ('2339', 'Tomohon', '58000');
INSERT INTO `kota` VALUES ('2340', 'Tomohon Barat', '58000');
INSERT INTO `kota` VALUES ('2341', 'Tomohon Selatan', '58000');
INSERT INTO `kota` VALUES ('2342', 'Tomohon Tengah', '58000');
INSERT INTO `kota` VALUES ('2343', 'Tomohon Timur', '58000');
INSERT INTO `kota` VALUES ('2344', 'Tomohon Utara', '58000');
INSERT INTO `kota` VALUES ('2345', 'Madiun', '20000');
INSERT INTO `kota` VALUES ('2346', 'Kartoharjo', '20000');
INSERT INTO `kota` VALUES ('2347', 'Manguharjo', '20000');
INSERT INTO `kota` VALUES ('2348', 'Taman', '20000');
INSERT INTO `kota` VALUES ('2349', 'Caruban', '24000');
INSERT INTO `kota` VALUES ('2350', 'Balerejo', '29000');
INSERT INTO `kota` VALUES ('2351', 'Dagangan', '29000');
INSERT INTO `kota` VALUES ('2352', 'Dolopo', '29000');
INSERT INTO `kota` VALUES ('2353', 'Geger', '29000');
INSERT INTO `kota` VALUES ('2354', 'Gemarang', '29000');
INSERT INTO `kota` VALUES ('2355', 'Jiwan', '29000');
INSERT INTO `kota` VALUES ('2356', 'Kare', '29000');
INSERT INTO `kota` VALUES ('2357', 'Kebonsari', '29000');
INSERT INTO `kota` VALUES ('2358', 'Madiun', '29000');
INSERT INTO `kota` VALUES ('2359', 'Mejayan', '29000');
INSERT INTO `kota` VALUES ('2360', 'Pilangkenceng', '29000');
INSERT INTO `kota` VALUES ('2361', 'Saradan', '29000');
INSERT INTO `kota` VALUES ('2362', 'Sawahan', '29000');
INSERT INTO `kota` VALUES ('2363', 'Wonoasri', '29000');
INSERT INTO `kota` VALUES ('2364', 'Wungu', '29000');
INSERT INTO `kota` VALUES ('2365', 'Magetan', '24000');
INSERT INTO `kota` VALUES ('2366', 'Bendo', '29000');
INSERT INTO `kota` VALUES ('2367', 'Karangrejo', '29000');
INSERT INTO `kota` VALUES ('2368', 'Kawedanan', '29000');
INSERT INTO `kota` VALUES ('2369', 'Lembeyan', '29000');
INSERT INTO `kota` VALUES ('2370', 'Maospati', '29000');
INSERT INTO `kota` VALUES ('2371', 'Panekan', '29000');
INSERT INTO `kota` VALUES ('2372', 'Parang', '29000');
INSERT INTO `kota` VALUES ('2373', 'Plaosan', '29000');
INSERT INTO `kota` VALUES ('2374', 'Poncol', '29000');
INSERT INTO `kota` VALUES ('2375', 'Sukomoro', '29000');
INSERT INTO `kota` VALUES ('2376', 'Takeran', '29000');
INSERT INTO `kota` VALUES ('2377', 'Barat', '29000');
INSERT INTO `kota` VALUES ('2378', 'Karas', '29000');
INSERT INTO `kota` VALUES ('2379', 'Kartoharjo', '29000');
INSERT INTO `kota` VALUES ('2380', 'Ngariboyo', '29000');
INSERT INTO `kota` VALUES ('2381', 'Nguntoronadi', '29000');
INSERT INTO `kota` VALUES ('2382', 'Ngawi', '24000');
INSERT INTO `kota` VALUES ('2383', 'Bringin', '29000');
INSERT INTO `kota` VALUES ('2384', 'Geneng', '29000');
INSERT INTO `kota` VALUES ('2385', 'Jogorogo', '29000');
INSERT INTO `kota` VALUES ('2386', 'Karangjati', '29000');
INSERT INTO `kota` VALUES ('2387', 'Kedunggalar', '29000');
INSERT INTO `kota` VALUES ('2388', 'Kendal', '29000');
INSERT INTO `kota` VALUES ('2389', 'Kwadungan', '29000');
INSERT INTO `kota` VALUES ('2390', 'Mantingan', '29000');
INSERT INTO `kota` VALUES ('2391', 'Ngrambe', '29000');
INSERT INTO `kota` VALUES ('2392', 'Padas', '29000');
INSERT INTO `kota` VALUES ('2393', 'Pangkur', '29000');
INSERT INTO `kota` VALUES ('2394', 'Paron', '29000');
INSERT INTO `kota` VALUES ('2395', 'Pitu', '29000');
INSERT INTO `kota` VALUES ('2396', 'Sine', '29000');
INSERT INTO `kota` VALUES ('2397', 'Widodaren', '29000');
INSERT INTO `kota` VALUES ('2398', 'Karanganyar', '29000');
INSERT INTO `kota` VALUES ('2399', 'Kendungan', '29000');
INSERT INTO `kota` VALUES ('2400', 'Pacitan', '24000');
INSERT INTO `kota` VALUES ('2401', 'Arjosari', '29000');
INSERT INTO `kota` VALUES ('2402', 'Bandar', '29000');
INSERT INTO `kota` VALUES ('2403', 'Donorojo', '29000');
INSERT INTO `kota` VALUES ('2404', 'Kebonagung', '29000');
INSERT INTO `kota` VALUES ('2405', 'Nawangan', '29000');
INSERT INTO `kota` VALUES ('2406', 'Ngadirojo', '29000');
INSERT INTO `kota` VALUES ('2407', 'Pringkuku', '29000');
INSERT INTO `kota` VALUES ('2408', 'Punung', '29000');
INSERT INTO `kota` VALUES ('2409', 'Sudimoro', '29000');
INSERT INTO `kota` VALUES ('2410', 'Tegalombo', '29000');
INSERT INTO `kota` VALUES ('2411', 'Tulakan', '29000');
INSERT INTO `kota` VALUES ('2412', 'Ponorogo', '24000');
INSERT INTO `kota` VALUES ('2413', 'Babadan', '29000');
INSERT INTO `kota` VALUES ('2414', 'Badegan', '29000');
INSERT INTO `kota` VALUES ('2415', 'Balong', '29000');
INSERT INTO `kota` VALUES ('2416', 'Bungkal', '29000');
INSERT INTO `kota` VALUES ('2417', 'Jenangan', '29000');
INSERT INTO `kota` VALUES ('2418', 'Jetis', '29000');
INSERT INTO `kota` VALUES ('2419', 'Kauman', '29000');
INSERT INTO `kota` VALUES ('2420', 'Mlarak', '29000');
INSERT INTO `kota` VALUES ('2421', 'Ngebel', '29000');
INSERT INTO `kota` VALUES ('2422', 'Ngrayun', '29000');
INSERT INTO `kota` VALUES ('2423', 'Pulung', '29000');
INSERT INTO `kota` VALUES ('2424', 'Sambit', '29000');
INSERT INTO `kota` VALUES ('2425', 'Sampung', '29000');
INSERT INTO `kota` VALUES ('2426', 'Sawoo', '29000');
INSERT INTO `kota` VALUES ('2427', 'Siman', '29000');
INSERT INTO `kota` VALUES ('2428', 'Slahung', '29000');
INSERT INTO `kota` VALUES ('2429', 'Sooko', '29000');
INSERT INTO `kota` VALUES ('2430', 'Sukorejo', '29000');
INSERT INTO `kota` VALUES ('2431', 'Jambon', '29000');
INSERT INTO `kota` VALUES ('2432', 'Pudak', '29000');
INSERT INTO `kota` VALUES ('2433', 'Medan', '27000');
INSERT INTO `kota` VALUES ('2434', 'Medan Amplas', '27000');
INSERT INTO `kota` VALUES ('2435', 'Medan Area', '27000');
INSERT INTO `kota` VALUES ('2436', 'Medan Barat', '27000');
INSERT INTO `kota` VALUES ('2437', 'Medan Baru', '27000');
INSERT INTO `kota` VALUES ('2438', 'Medan Deli', '27000');
INSERT INTO `kota` VALUES ('2439', 'Medan Denai', '27000');
INSERT INTO `kota` VALUES ('2440', 'Medan Helvetia', '27000');
INSERT INTO `kota` VALUES ('2441', 'Medan Johor', '27000');
INSERT INTO `kota` VALUES ('2442', 'Medan Kota', '27000');
INSERT INTO `kota` VALUES ('2443', 'Medan Labuhan', '27000');
INSERT INTO `kota` VALUES ('2444', 'Medan Maimun', '27000');
INSERT INTO `kota` VALUES ('2445', 'Medan Marelan', '27000');
INSERT INTO `kota` VALUES ('2446', 'Medan Perjuangan', '27000');
INSERT INTO `kota` VALUES ('2447', 'Medan Petisah', '27000');
INSERT INTO `kota` VALUES ('2448', 'Medan Polonia', '27000');
INSERT INTO `kota` VALUES ('2449', 'Medan Selayang', '27000');
INSERT INTO `kota` VALUES ('2450', 'Medan Tembung', '27000');
INSERT INTO `kota` VALUES ('2451', 'Medan Timur', '27000');
INSERT INTO `kota` VALUES ('2452', 'Medan Tuntungan', '27000');
INSERT INTO `kota` VALUES ('2453', 'Medan Belawan', '27000');
INSERT INTO `kota` VALUES ('2454', 'Medan Sunggal', '27000');
INSERT INTO `kota` VALUES ('2455', 'Kisaran', '38000');
INSERT INTO `kota` VALUES ('2456', 'Air Joman', '48000');
INSERT INTO `kota` VALUES ('2457', 'Air Batu', '48000');
INSERT INTO `kota` VALUES ('2458', 'Bandar Pasir Mandoge', '48000');
INSERT INTO `kota` VALUES ('2459', 'Bandar Pulau', '48000');
INSERT INTO `kota` VALUES ('2460', 'Buntu Pane', '48000');
INSERT INTO `kota` VALUES ('2461', 'Meranti', '48000');
INSERT INTO `kota` VALUES ('2462', 'Pulau Rakyat', '48000');
INSERT INTO `kota` VALUES ('2463', 'Simpang Empat', '48000');
INSERT INTO `kota` VALUES ('2464', 'Tanjung Balai Asahan', '38000');
INSERT INTO `kota` VALUES ('2465', 'Aek Kuasan', '48000');
INSERT INTO `kota` VALUES ('2466', 'Sei Kepayang', '48000');
INSERT INTO `kota` VALUES ('2467', 'Kisaran Barat', '48000');
INSERT INTO `kota` VALUES ('2468', 'Kisaran Timur', '48000');
INSERT INTO `kota` VALUES ('2469', 'Sibolga', '38000');
INSERT INTO `kota` VALUES ('2470', 'Barus', '48000');
INSERT INTO `kota` VALUES ('2471', 'Kolang', '48000');
INSERT INTO `kota` VALUES ('2472', 'Manduamas', '48000');
INSERT INTO `kota` VALUES ('2473', 'Sorkam', '48000');
INSERT INTO `kota` VALUES ('2474', 'Adman Dewi', '48000');
INSERT INTO `kota` VALUES ('2475', 'Badiri', '48000');
INSERT INTO `kota` VALUES ('2476', 'Lumut', '48000');
INSERT INTO `kota` VALUES ('2477', 'Sibabangun', '48000');
INSERT INTO `kota` VALUES ('2478', 'Sirandorung', '48000');
INSERT INTO `kota` VALUES ('2479', 'Sitahuis', '48000');
INSERT INTO `kota` VALUES ('2480', 'Sorkam Barat', '48000');
INSERT INTO `kota` VALUES ('2481', 'Sosor Gadong', '48000');
INSERT INTO `kota` VALUES ('2482', 'Tapian Nauli', '48000');
INSERT INTO `kota` VALUES ('2483', 'Tukka', '48000');
INSERT INTO `kota` VALUES ('2484', 'Sibolga Sambas', '38000');
INSERT INTO `kota` VALUES ('2485', 'Sibolga Selatan', '38000');
INSERT INTO `kota` VALUES ('2486', 'Sibolga Utara', '38000');
INSERT INTO `kota` VALUES ('2487', 'Sibolga Kota', '38000');
INSERT INTO `kota` VALUES ('2488', 'Sidikalang', '38000');
INSERT INTO `kota` VALUES ('2489', 'Parbuluan', '48000');
INSERT INTO `kota` VALUES ('2490', 'Siempat Nempu', '48000');
INSERT INTO `kota` VALUES ('2491', 'Siempat Nempu Hilir', '48000');
INSERT INTO `kota` VALUES ('2492', 'Silima Pungga-Pungga', '48000');
INSERT INTO `kota` VALUES ('2493', 'Sumbul', '48000');
INSERT INTO `kota` VALUES ('2494', 'Tanah Pinem', '48000');
INSERT INTO `kota` VALUES ('2495', 'Tiga Lingga', '48000');
INSERT INTO `kota` VALUES ('2496', 'Pegagan Hilir', '48000');
INSERT INTO `kota` VALUES ('2497', 'Siempat Nempu Hulu', '48000');
INSERT INTO `kota` VALUES ('2498', 'Berampu', '48000');
INSERT INTO `kota` VALUES ('2499', 'Gunung Sitember', '48000');
INSERT INTO `kota` VALUES ('2500', 'Lae Parira', '48000');
INSERT INTO `kota` VALUES ('2501', 'Lubuk Pakam', '38000');
INSERT INTO `kota` VALUES ('2502', 'Deli Tua', '48000');
INSERT INTO `kota` VALUES ('2503', 'Hamparan Perak', '48000');
INSERT INTO `kota` VALUES ('2504', 'Kutalimbaru', '48000');
INSERT INTO `kota` VALUES ('2505', 'Labuhan Deli', '48000');
INSERT INTO `kota` VALUES ('2506', 'Batang Kuis', '48000');
INSERT INTO `kota` VALUES ('2507', 'Pancur Batu', '48000');
INSERT INTO `kota` VALUES ('2508', 'Percut Sei Tuan', '48000');
INSERT INTO `kota` VALUES ('2509', 'Petumbak', '48000');
INSERT INTO `kota` VALUES ('2510', 'Sibolangit', '48000');
INSERT INTO `kota` VALUES ('2511', 'Biru-Biru', '48000');
INSERT INTO `kota` VALUES ('2512', 'Sinembah Tanjungmuda Hilir', '48000');
INSERT INTO `kota` VALUES ('2513', 'Sunggal', '48000');
INSERT INTO `kota` VALUES ('2514', 'Tanjung Morawa', '38000');
INSERT INTO `kota` VALUES ('2515', 'Pantai Labu', '48000');
INSERT INTO `kota` VALUES ('2516', 'Bangun Purba', '48000');
INSERT INTO `kota` VALUES ('2517', 'Beringin', '48000');
INSERT INTO `kota` VALUES ('2518', 'Galang', '48000');
INSERT INTO `kota` VALUES ('2519', 'Gunung Meriah', '48000');
INSERT INTO `kota` VALUES ('2520', 'Namo Rambe', '48000');
INSERT INTO `kota` VALUES ('2521', 'Pagar Marbau', '48000');
INSERT INTO `kota` VALUES ('2522', 'Sinembah Tanjungmuda Hulu', '48000');
INSERT INTO `kota` VALUES ('2523', 'Balige', '38000');
INSERT INTO `kota` VALUES ('2524', 'Habinsaran', '48000');
INSERT INTO `kota` VALUES ('2525', 'Lagu Boti', '48000');
INSERT INTO `kota` VALUES ('2526', 'Lumban Julu', '48000');
INSERT INTO `kota` VALUES ('2527', 'Porsea', '48000');
INSERT INTO `kota` VALUES ('2528', 'Silaen', '48000');
INSERT INTO `kota` VALUES ('2529', 'Ajibata', '48000');
INSERT INTO `kota` VALUES ('2530', 'Bor Bor', '48000');
INSERT INTO `kota` VALUES ('2531', 'Nassau', '48000');
INSERT INTO `kota` VALUES ('2532', 'Pintu Pohan Meranti', '48000');
INSERT INTO `kota` VALUES ('2533', 'Siantar Narumonda', '48000');
INSERT INTO `kota` VALUES ('2534', 'Sigumpar', '48000');
INSERT INTO `kota` VALUES ('2535', 'Tampahan', '48000');
INSERT INTO `kota` VALUES ('2536', 'Uluan', '48000');
INSERT INTO `kota` VALUES ('2537', 'Binjai Kota', '38000');
INSERT INTO `kota` VALUES ('2538', 'Binjai', '38000');
INSERT INTO `kota` VALUES ('2539', 'Binjai Barat', '38000');
INSERT INTO `kota` VALUES ('2540', 'Binjai Selatan', '38000');
INSERT INTO `kota` VALUES ('2541', 'Binjai Timur', '38000');
INSERT INTO `kota` VALUES ('2542', 'Binjai Utara', '38000');
INSERT INTO `kota` VALUES ('2543', 'Gunung Sitoli', '38000');
INSERT INTO `kota` VALUES ('2544', 'Afulu', '48000');
INSERT INTO `kota` VALUES ('2545', 'Alasa', '72000');
INSERT INTO `kota` VALUES ('2546', 'Bawolato', '72000');
INSERT INTO `kota` VALUES ('2547', 'Gido', '72000');
INSERT INTO `kota` VALUES ('2548', 'Hiliduho', '72000');
INSERT INTO `kota` VALUES ('2549', 'Idano Gawo', '72000');
INSERT INTO `kota` VALUES ('2550', 'Lahewa', '72000');
INSERT INTO `kota` VALUES ('2551', 'Lotu', '72000');
INSERT INTO `kota` VALUES ('2552', 'Mandrehe', '72000');
INSERT INTO `kota` VALUES ('2553', 'Sirombo', '72000');
INSERT INTO `kota` VALUES ('2554', 'Tuhemberua', '72000');
INSERT INTO `kota` VALUES ('2555', 'Lolofitu Moi', '72000');
INSERT INTO `kota` VALUES ('2556', 'Padang Sidempuan', '38000');
INSERT INTO `kota` VALUES ('2557', 'Padang Sidempuan Batu Nadua', '38000');
INSERT INTO `kota` VALUES ('2558', 'Padang Sidempuan Hutaimbaru', '38000');
INSERT INTO `kota` VALUES ('2559', 'Padang Sidempuan Selatan', '38000');
INSERT INTO `kota` VALUES ('2560', 'Padang Sidempuan Tenggara', '38000');
INSERT INTO `kota` VALUES ('2561', 'Padang Sidempuan Utara', '38000');
INSERT INTO `kota` VALUES ('2562', 'Pematang Raya', '38000');
INSERT INTO `kota` VALUES ('2563', 'Bandar', '48000');
INSERT INTO `kota` VALUES ('2564', 'Bosar Maligas', '48000');
INSERT INTO `kota` VALUES ('2565', 'Dolok Silau', '48000');
INSERT INTO `kota` VALUES ('2566', 'Dolok Pardamean', '48000');
INSERT INTO `kota` VALUES ('2567', 'Dolok Panribuan', '48000');
INSERT INTO `kota` VALUES ('2568', 'Dolok Batunanggar', '48000');
INSERT INTO `kota` VALUES ('2569', 'Girsang Sipangan Bolon', '48000');
INSERT INTO `kota` VALUES ('2570', 'Hutabayu Raja', '48000');
INSERT INTO `kota` VALUES ('2571', 'Jorlang Hataran', '48000');
INSERT INTO `kota` VALUES ('2572', 'Panei', '48000');
INSERT INTO `kota` VALUES ('2573', 'Pematang Bandar', '48000');
INSERT INTO `kota` VALUES ('2574', 'Purba', '48000');
INSERT INTO `kota` VALUES ('2575', 'Raya', '48000');
INSERT INTO `kota` VALUES ('2576', 'Raya Kahean', '48000');
INSERT INTO `kota` VALUES ('2577', 'Siantar', '48000');
INSERT INTO `kota` VALUES ('2578', 'Sidamanik', '48000');
INSERT INTO `kota` VALUES ('2579', 'Silau Kahean', '48000');
INSERT INTO `kota` VALUES ('2580', 'Silimakuta', '48000');
INSERT INTO `kota` VALUES ('2581', 'Tanah Jawa', '48000');
INSERT INTO `kota` VALUES ('2582', 'Tapian Dolok', '48000');
INSERT INTO `kota` VALUES ('2583', 'Ujung Padang', '48000');
INSERT INTO `kota` VALUES ('2584', 'Bandar Huluan', '48000');
INSERT INTO `kota` VALUES ('2585', 'Bandar Masilam', '48000');
INSERT INTO `kota` VALUES ('2586', 'Gunung Malela', '48000');
INSERT INTO `kota` VALUES ('2587', 'Gunung Maligas', '48000');
INSERT INTO `kota` VALUES ('2588', 'Haranggaol Horisanz', '48000');
INSERT INTO `kota` VALUES ('2589', 'Hatonduhan', '48000');
INSERT INTO `kota` VALUES ('2590', 'Jawa Maraja Bah Jambi', '48000');
INSERT INTO `kota` VALUES ('2591', 'Panombeian Pane', '48000');
INSERT INTO `kota` VALUES ('2592', 'Pematang Sidamanik', '48000');
INSERT INTO `kota` VALUES ('2593', 'Rantau Prapat', '38000');
INSERT INTO `kota` VALUES ('2594', 'Aek Natas', '48000');
INSERT INTO `kota` VALUES ('2595', 'Bilah Hilir', '48000');
INSERT INTO `kota` VALUES ('2596', 'Kampung Rakyat', '48000');
INSERT INTO `kota` VALUES ('2597', 'Kota Pinang', '48000');
INSERT INTO `kota` VALUES ('2598', 'Kualuh Hulu', '48000');
INSERT INTO `kota` VALUES ('2599', 'Kualuh Hilir', '48000');
INSERT INTO `kota` VALUES ('2600', 'Marbau', '48000');
INSERT INTO `kota` VALUES ('2601', 'Na IX-X', '48000');
INSERT INTO `kota` VALUES ('2602', 'Panai Hilir', '72000');
INSERT INTO `kota` VALUES ('2603', 'Panai Tengah', '72000');
INSERT INTO `kota` VALUES ('2604', 'Aek Kuo', '48000');
INSERT INTO `kota` VALUES ('2605', 'Bilah Barat', '48000');
INSERT INTO `kota` VALUES ('2606', 'Bilah Hulu', '48000');
INSERT INTO `kota` VALUES ('2607', 'Kualuh Leidong', '48000');
INSERT INTO `kota` VALUES ('2608', 'Kualuh Selatan', '48000');
INSERT INTO `kota` VALUES ('2609', 'Panai Hulu', '72000');
INSERT INTO `kota` VALUES ('2610', 'Pangkatan', '48000');
INSERT INTO `kota` VALUES ('2611', 'Rantau Selatan', '48000');
INSERT INTO `kota` VALUES ('2612', 'Rantau Utara', '48000');
INSERT INTO `kota` VALUES ('2613', 'Silangkitang', '48000');
INSERT INTO `kota` VALUES ('2614', 'Sungai Kanan', '48000');
INSERT INTO `kota` VALUES ('2615', 'Torgamba', '48000');
INSERT INTO `kota` VALUES ('2616', 'Kabanjahe', '38000');
INSERT INTO `kota` VALUES ('2617', 'Barusjahe', '48000');
INSERT INTO `kota` VALUES ('2618', 'Berastagi', '48000');
INSERT INTO `kota` VALUES ('2619', 'Juhar', '48000');
INSERT INTO `kota` VALUES ('2620', 'Kuta Buluh', '48000');
INSERT INTO `kota` VALUES ('2621', 'Laubaleng', '48000');
INSERT INTO `kota` VALUES ('2622', 'Mardinding', '48000');
INSERT INTO `kota` VALUES ('2623', 'Merek', '48000');
INSERT INTO `kota` VALUES ('2624', 'Munte', '48000');
INSERT INTO `kota` VALUES ('2625', 'Payung', '48000');
INSERT INTO `kota` VALUES ('2626', 'Tiga Binanga', '48000');
INSERT INTO `kota` VALUES ('2627', 'Tiga Panah', '48000');
INSERT INTO `kota` VALUES ('2628', 'Stabat', '38000');
INSERT INTO `kota` VALUES ('2629', 'Babalan', '38000');
INSERT INTO `kota` VALUES ('2630', 'Besitang', '48000');
INSERT INTO `kota` VALUES ('2631', 'Gebang', '48000');
INSERT INTO `kota` VALUES ('2632', 'Hinai', '48000');
INSERT INTO `kota` VALUES ('2633', 'Padang Tualang', '48000');
INSERT INTO `kota` VALUES ('2634', 'Pangkalan Susu', '48000');
INSERT INTO `kota` VALUES ('2635', 'Secanggang', '48000');
INSERT INTO `kota` VALUES ('2636', 'Tanjung Pura', '48000');
INSERT INTO `kota` VALUES ('2637', 'Batang Serangan', '48000');
INSERT INTO `kota` VALUES ('2638', 'Brandan Barat', '48000');
INSERT INTO `kota` VALUES ('2639', 'Salapian', '48000');
INSERT INTO `kota` VALUES ('2640', 'Sawit Seberang', '48000');
INSERT INTO `kota` VALUES ('2641', 'Sei Lepan', '48000');
INSERT INTO `kota` VALUES ('2642', 'Wampu', '48000');
INSERT INTO `kota` VALUES ('2643', 'Bohorok', '48000');
INSERT INTO `kota` VALUES ('2644', 'Kuala', '48000');
INSERT INTO `kota` VALUES ('2645', 'Sei Bingai', '48000');
INSERT INTO `kota` VALUES ('2646', 'Selesai', '48000');
INSERT INTO `kota` VALUES ('2647', 'Tarutung', '38000');
INSERT INTO `kota` VALUES ('2648', 'Adiankoting', '48000');
INSERT INTO `kota` VALUES ('2649', 'Garoga', '48000');
INSERT INTO `kota` VALUES ('2650', 'Pagaran', '48000');
INSERT INTO `kota` VALUES ('2651', 'Pahae Julu', '48000');
INSERT INTO `kota` VALUES ('2652', 'Pahae Jae', '48000');
INSERT INTO `kota` VALUES ('2653', 'Pangaribuan', '48000');
INSERT INTO `kota` VALUES ('2654', 'Parmonangan', '48000');
INSERT INTO `kota` VALUES ('2655', 'Siborong-Borong', '38000');
INSERT INTO `kota` VALUES ('2656', 'Sipoholon', '48000');
INSERT INTO `kota` VALUES ('2657', 'Sipahutar', '48000');
INSERT INTO `kota` VALUES ('2658', 'Muara', '48000');
INSERT INTO `kota` VALUES ('2659', 'Purbatua', '48000');
INSERT INTO `kota` VALUES ('2660', 'Siatas Barita', '48000');
INSERT INTO `kota` VALUES ('2661', 'Simangumban', '48000');
INSERT INTO `kota` VALUES ('2662', 'Tebing Tinggi', '38000');
INSERT INTO `kota` VALUES ('2663', 'Padang Hilir', '48000');
INSERT INTO `kota` VALUES ('2664', 'Padang Hulu', '48000');
INSERT INTO `kota` VALUES ('2665', 'Rambutan', '48000');
INSERT INTO `kota` VALUES ('2666', 'Gunung Tua', '38000');
INSERT INTO `kota` VALUES ('2667', 'Batang Onang', '48000');
INSERT INTO `kota` VALUES ('2668', 'Dolok', '48000');
INSERT INTO `kota` VALUES ('2669', 'Dolok Sigompulon', '48000');
INSERT INTO `kota` VALUES ('2670', 'Halongonan', '48000');
INSERT INTO `kota` VALUES ('2671', 'Padang Bolak', '48000');
INSERT INTO `kota` VALUES ('2672', 'Padang Bolak Julu', '48000');
INSERT INTO `kota` VALUES ('2673', 'Poribi', '48000');
INSERT INTO `kota` VALUES ('2674', 'Simangambat', '48000');
INSERT INTO `kota` VALUES ('2675', 'Limapuluh', '38000');
INSERT INTO `kota` VALUES ('2676', 'Medang Deras', '48000');
INSERT INTO `kota` VALUES ('2677', 'Air Putih', '48000');
INSERT INTO `kota` VALUES ('2678', 'Talawi', '48000');
INSERT INTO `kota` VALUES ('2679', 'Tanjung Tiram', '48000');
INSERT INTO `kota` VALUES ('2680', 'Sei Balai', '48000');
INSERT INTO `kota` VALUES ('2681', 'Sei Suka', '48000');
INSERT INTO `kota` VALUES ('2682', 'Dolok Sanggul', '38000');
INSERT INTO `kota` VALUES ('2683', 'Baktiraja', '48000');
INSERT INTO `kota` VALUES ('2684', 'Lintong Nihuta', '48000');
INSERT INTO `kota` VALUES ('2685', 'Onan Ganjang', '48000');
INSERT INTO `kota` VALUES ('2686', 'Pakkat', '48000');
INSERT INTO `kota` VALUES ('2687', 'Paranginan', '48000');
INSERT INTO `kota` VALUES ('2688', 'Parlilitan', '48000');
INSERT INTO `kota` VALUES ('2689', 'Pollung', '48000');
INSERT INTO `kota` VALUES ('2690', 'Sijama Polang', '48000');
INSERT INTO `kota` VALUES ('2691', 'Tarabintang', '48000');
INSERT INTO `kota` VALUES ('2692', 'Panyabungan', '38000');
INSERT INTO `kota` VALUES ('2693', 'Batahan', '48000');
INSERT INTO `kota` VALUES ('2694', 'Batang Natal', '48000');
INSERT INTO `kota` VALUES ('2695', 'Bukit Malintang', '48000');
INSERT INTO `kota` VALUES ('2696', 'Kotanopan', '48000');
INSERT INTO `kota` VALUES ('2697', 'Lembah Sorik Merapi', '48000');
INSERT INTO `kota` VALUES ('2698', 'Lingga Bayu', '48000');
INSERT INTO `kota` VALUES ('2699', 'Muara Batang Gadis', '48000');
INSERT INTO `kota` VALUES ('2700', 'Muara Sipongi', '48000');
INSERT INTO `kota` VALUES ('2701', 'Natal', '48000');
INSERT INTO `kota` VALUES ('2702', 'Panyabungan Barat', '48000');
INSERT INTO `kota` VALUES ('2703', 'Panyabungan Kota', '48000');
INSERT INTO `kota` VALUES ('2704', 'Panyabungan Selatan', '48000');
INSERT INTO `kota` VALUES ('2705', 'Panyabungan Timur', '48000');
INSERT INTO `kota` VALUES ('2706', 'Panyabungan Utara', '48000');
INSERT INTO `kota` VALUES ('2707', 'Siabu', '48000');
INSERT INTO `kota` VALUES ('2708', 'Tambangan', '48000');
INSERT INTO `kota` VALUES ('2709', 'Ulu Pungkut', '48000');
INSERT INTO `kota` VALUES ('2710', 'Teluk Dalam', '38000');
INSERT INTO `kota` VALUES ('2711', 'Amandraya', '72000');
INSERT INTO `kota` VALUES ('2712', 'Gomo', '72000');
INSERT INTO `kota` VALUES ('2713', 'Hibala', '72000');
INSERT INTO `kota` VALUES ('2714', 'Lahusa', '72000');
INSERT INTO `kota` VALUES ('2715', 'Lolo Wa\'u', '72000');
INSERT INTO `kota` VALUES ('2716', 'Lolomatua', '72000');
INSERT INTO `kota` VALUES ('2717', 'Pulau-Pulau Batu', '72000');
INSERT INTO `kota` VALUES ('2718', 'Sibuhuan', '38000');
INSERT INTO `kota` VALUES ('2719', 'Barumun', '48000');
INSERT INTO `kota` VALUES ('2720', 'Barumun Tengah', '48000');
INSERT INTO `kota` VALUES ('2721', 'Batang Bulu Sutam', '48000');
INSERT INTO `kota` VALUES ('2722', 'Huristak', '48000');
INSERT INTO `kota` VALUES ('2723', 'Huta Raja Tinggi', '48000');
INSERT INTO `kota` VALUES ('2724', 'Lubuk Barumun', '48000');
INSERT INTO `kota` VALUES ('2725', 'Sosa', '48000');
INSERT INTO `kota` VALUES ('2726', 'Sosopan', '48000');
INSERT INTO `kota` VALUES ('2727', 'Ulu Barumun', '48000');
INSERT INTO `kota` VALUES ('2728', 'Salak', '38000');
INSERT INTO `kota` VALUES ('2729', 'Kerajaan', '48000');
INSERT INTO `kota` VALUES ('2730', 'Sitellu Tai Urang Jehe', '48000');
INSERT INTO `kota` VALUES ('2731', 'Sitellu Tai Urang Julu', '48000');
INSERT INTO `kota` VALUES ('2732', 'Pergetteng-getteng Sengkut', '48000');
INSERT INTO `kota` VALUES ('2733', 'Pagindar', '48000');
INSERT INTO `kota` VALUES ('2734', 'Siempat Rube', '48000');
INSERT INTO `kota` VALUES ('2735', 'Tinada', '48000');
INSERT INTO `kota` VALUES ('2736', 'Pangururan', '38000');
INSERT INTO `kota` VALUES ('2737', 'Harian', '48000');
INSERT INTO `kota` VALUES ('2738', 'Nainggolan', '48000');
INSERT INTO `kota` VALUES ('2739', 'Onan Runggu', '48000');
INSERT INTO `kota` VALUES ('2740', 'Palipi', '48000');
INSERT INTO `kota` VALUES ('2741', 'Ronggur Nihuta', '48000');
INSERT INTO `kota` VALUES ('2742', 'Sianjur Mula Mula', '48000');
INSERT INTO `kota` VALUES ('2743', 'Simanindo', '48000');
INSERT INTO `kota` VALUES ('2744', 'Sitiotio', '48000');
INSERT INTO `kota` VALUES ('2745', 'Sei Rampah', '38000');
INSERT INTO `kota` VALUES ('2746', 'Bandar Khalipah', '48000');
INSERT INTO `kota` VALUES ('2747', 'Dolok Masihul', '48000');
INSERT INTO `kota` VALUES ('2748', 'Dolok Merawan', '48000');
INSERT INTO `kota` VALUES ('2749', 'Kotarih', '48000');
INSERT INTO `kota` VALUES ('2750', 'Pantai Cermin', '48000');
INSERT INTO `kota` VALUES ('2751', 'Perbaungan', '48000');
INSERT INTO `kota` VALUES ('2752', 'Sipispis', '48000');
INSERT INTO `kota` VALUES ('2753', 'Tanjung Beringin', '48000');
INSERT INTO `kota` VALUES ('2754', 'Tebingtinggi', '48000');
INSERT INTO `kota` VALUES ('2755', 'Teluk Mengkudu', '48000');
INSERT INTO `kota` VALUES ('2756', 'Sipirok', '38000');
INSERT INTO `kota` VALUES ('2757', 'Aek Bilah', '48000');
INSERT INTO `kota` VALUES ('2758', 'Arse', '48000');
INSERT INTO `kota` VALUES ('2759', 'Batang Angkola', '48000');
INSERT INTO `kota` VALUES ('2760', 'Batang Lubu Sutam', '48000');
INSERT INTO `kota` VALUES ('2761', 'Batang Toru', '48000');
INSERT INTO `kota` VALUES ('2762', 'Marancar', '48000');
INSERT INTO `kota` VALUES ('2763', 'Padang Sidempuan Barat', '48000');
INSERT INTO `kota` VALUES ('2764', 'Padang Sidempuan Timur', '48000');
INSERT INTO `kota` VALUES ('2765', 'Portibi', '48000');
INSERT INTO `kota` VALUES ('2766', 'Saipar Dolok Hole', '48000');
INSERT INTO `kota` VALUES ('2767', 'Sayur Matinggi', '48000');
INSERT INTO `kota` VALUES ('2768', 'Siais', '48000');
INSERT INTO `kota` VALUES ('2769', 'Tanjung Balai', '38000');
INSERT INTO `kota` VALUES ('2770', 'Datuk Bandar', '38000');
INSERT INTO `kota` VALUES ('2771', 'Sei Tualang Raso', '38000');
INSERT INTO `kota` VALUES ('2772', 'Tanjung Balai Selatan', '38000');
INSERT INTO `kota` VALUES ('2773', 'Tanjung Balai Utara', '38000');
INSERT INTO `kota` VALUES ('2774', 'Teluk Nibung', '38000');
INSERT INTO `kota` VALUES ('2775', 'Pematang Siantar', '38000');
INSERT INTO `kota` VALUES ('2776', 'Siantar Barat', '38000');
INSERT INTO `kota` VALUES ('2777', 'Siantar Marihat', '38000');
INSERT INTO `kota` VALUES ('2778', 'Siantar Martoba', '38000');
INSERT INTO `kota` VALUES ('2779', 'Siantar Selatan', '38000');
INSERT INTO `kota` VALUES ('2780', 'Siantar Timur', '38000');
INSERT INTO `kota` VALUES ('2781', 'Siantar Utara', '38000');
INSERT INTO `kota` VALUES ('2782', 'Magelang', '18000');
INSERT INTO `kota` VALUES ('2783', 'Magelang Selatan', '18000');
INSERT INTO `kota` VALUES ('2784', 'Magelang Tengah', '18000');
INSERT INTO `kota` VALUES ('2785', 'Magelang Utara', '18000');
INSERT INTO `kota` VALUES ('2786', 'Kebumen', '22000');
INSERT INTO `kota` VALUES ('2787', 'Adimulyo', '23000');
INSERT INTO `kota` VALUES ('2788', 'Aliyan', '23000');
INSERT INTO `kota` VALUES ('2789', 'Ambal', '23000');
INSERT INTO `kota` VALUES ('2790', 'Bulupesantren', '23000');
INSERT INTO `kota` VALUES ('2791', 'Karanganyar', '23000');
INSERT INTO `kota` VALUES ('2792', 'Karanggayam', '23000');
INSERT INTO `kota` VALUES ('2793', 'Klirong', '23000');
INSERT INTO `kota` VALUES ('2794', 'Kutowinangun', '23000');
INSERT INTO `kota` VALUES ('2795', 'Kuwarasan', '23000');
INSERT INTO `kota` VALUES ('2796', 'Mirit', '23000');
INSERT INTO `kota` VALUES ('2797', 'Pejagoan', '23000');
INSERT INTO `kota` VALUES ('2798', 'Petanahan', '23000');
INSERT INTO `kota` VALUES ('2799', 'Prembun', '23000');
INSERT INTO `kota` VALUES ('2800', 'Puring', '23000');
INSERT INTO `kota` VALUES ('2801', 'Sadang', '23000');
INSERT INTO `kota` VALUES ('2802', 'Sruweng', '23000');
INSERT INTO `kota` VALUES ('2803', 'Gombong', '23000');
INSERT INTO `kota` VALUES ('2804', 'Ayah', '23000');
INSERT INTO `kota` VALUES ('2805', 'Buayan', '23000');
INSERT INTO `kota` VALUES ('2806', 'Rowokele', '23000');
INSERT INTO `kota` VALUES ('2807', 'Bonorowo', '23000');
INSERT INTO `kota` VALUES ('2808', 'Karangsambung', '23000');
INSERT INTO `kota` VALUES ('2809', 'Padureso', '23000');
INSERT INTO `kota` VALUES ('2810', 'Poncowarno', '23000');
INSERT INTO `kota` VALUES ('2811', 'Sempor', '23000');
INSERT INTO `kota` VALUES ('2812', 'Wonosobo', '22000');
INSERT INTO `kota` VALUES ('2813', 'Garung', '23000');
INSERT INTO `kota` VALUES ('2814', 'Kalikajar', '23000');
INSERT INTO `kota` VALUES ('2815', 'Kaliwiro', '23000');
INSERT INTO `kota` VALUES ('2816', 'Kejajar', '23000');
INSERT INTO `kota` VALUES ('2817', 'Kepil', '23000');
INSERT INTO `kota` VALUES ('2818', 'Kertek', '23000');
INSERT INTO `kota` VALUES ('2819', 'Leksono', '23000');
INSERT INTO `kota` VALUES ('2820', 'Mojotengah', '23000');
INSERT INTO `kota` VALUES ('2821', 'Sapuran', '23000');
INSERT INTO `kota` VALUES ('2822', 'Selomerto', '23000');
INSERT INTO `kota` VALUES ('2823', 'Wadaslintang', '23000');
INSERT INTO `kota` VALUES ('2824', 'Watumalang', '23000');
INSERT INTO `kota` VALUES ('2825', 'Kalibawang', '23000');
INSERT INTO `kota` VALUES ('2826', 'Sukoharjo', '23000');
INSERT INTO `kota` VALUES ('2827', 'Purworejo', '22000');
INSERT INTO `kota` VALUES ('2828', 'Bagelen', '23000');
INSERT INTO `kota` VALUES ('2829', 'Banyuurip', '23000');
INSERT INTO `kota` VALUES ('2830', 'Bener', '23000');
INSERT INTO `kota` VALUES ('2831', 'Gebang', '23000');
INSERT INTO `kota` VALUES ('2832', 'Kaligesing', '23000');
INSERT INTO `kota` VALUES ('2833', 'Loano', '23000');
INSERT INTO `kota` VALUES ('2834', 'Ngombol', '23000');
INSERT INTO `kota` VALUES ('2835', 'Purwodadi', '22000');
INSERT INTO `kota` VALUES ('2836', 'Kutoarjo', '23000');
INSERT INTO `kota` VALUES ('2837', 'Kemiri', '23000');
INSERT INTO `kota` VALUES ('2838', 'Pituruh', '23000');
INSERT INTO `kota` VALUES ('2839', 'Butuh', '23000');
INSERT INTO `kota` VALUES ('2840', 'Bruno', '23000');
INSERT INTO `kota` VALUES ('2841', 'Grabag', '23000');
INSERT INTO `kota` VALUES ('2842', 'Bayan', '23000');
INSERT INTO `kota` VALUES ('2843', 'Temanggung', '22000');
INSERT INTO `kota` VALUES ('2844', 'Bulu', '23000');
INSERT INTO `kota` VALUES ('2845', 'Candiroto', '23000');
INSERT INTO `kota` VALUES ('2846', 'Jumo', '23000');
INSERT INTO `kota` VALUES ('2847', 'Kaloran', '23000');
INSERT INTO `kota` VALUES ('2848', 'Kandangan', '23000');
INSERT INTO `kota` VALUES ('2849', 'Kedu', '23000');
INSERT INTO `kota` VALUES ('2850', 'Kranggan', '23000');
INSERT INTO `kota` VALUES ('2851', 'Ngadirejo', '23000');
INSERT INTO `kota` VALUES ('2852', 'Parakan', '23000');
INSERT INTO `kota` VALUES ('2853', 'Pringsurat', '23000');
INSERT INTO `kota` VALUES ('2854', 'Tembarak', '23000');
INSERT INTO `kota` VALUES ('2855', 'Tretep', '23000');
INSERT INTO `kota` VALUES ('2856', 'Bejen', '23000');
INSERT INTO `kota` VALUES ('2857', 'Tlogomulyo', '23000');
INSERT INTO `kota` VALUES ('2858', 'Kledung', '23000');
INSERT INTO `kota` VALUES ('2859', 'Wonoboyo', '23000');
INSERT INTO `kota` VALUES ('2860', 'Gemawang', '23000');
INSERT INTO `kota` VALUES ('2861', 'Bansari', '23000');
INSERT INTO `kota` VALUES ('2862', 'Selopampang', '23000');
INSERT INTO `kota` VALUES ('2863', 'Mungkid', '22000');
INSERT INTO `kota` VALUES ('2864', 'Salam', '23000');
INSERT INTO `kota` VALUES ('2865', 'Bandongan', '23000');
INSERT INTO `kota` VALUES ('2866', 'Candimulyo', '23000');
INSERT INTO `kota` VALUES ('2867', 'Kajoran', '23000');
INSERT INTO `kota` VALUES ('2868', 'Kaliangkrik', '23000');
INSERT INTO `kota` VALUES ('2869', 'MERTOYUDAN', '23000');
INSERT INTO `kota` VALUES ('2870', 'Ngablak', '23000');
INSERT INTO `kota` VALUES ('2871', 'Pakis', '23000');
INSERT INTO `kota` VALUES ('2872', 'Salaman', '23000');
INSERT INTO `kota` VALUES ('2873', 'Secang', '23000');
INSERT INTO `kota` VALUES ('2874', 'Tegalrejo', '23000');
INSERT INTO `kota` VALUES ('2875', 'Tempuran', '23000');
INSERT INTO `kota` VALUES ('2876', 'WINDUSARI', '23000');
INSERT INTO `kota` VALUES ('2877', 'Srumbung', '23000');
INSERT INTO `kota` VALUES ('2878', 'Dukun', '23000');
INSERT INTO `kota` VALUES ('2879', 'Sawangan', '23000');
INSERT INTO `kota` VALUES ('2880', 'Muntilan', '23000');
INSERT INTO `kota` VALUES ('2881', 'Ngluwar', '23000');
INSERT INTO `kota` VALUES ('2882', 'Borobudur', '23000');
INSERT INTO `kota` VALUES ('2883', 'Mojokerto', '20000');
INSERT INTO `kota` VALUES ('2884', 'Bangsal', '20000');
INSERT INTO `kota` VALUES ('2885', 'Dawarblandong', '20000');
INSERT INTO `kota` VALUES ('2886', 'Dlanggu', '20000');
INSERT INTO `kota` VALUES ('2887', 'Gedeg', '20000');
INSERT INTO `kota` VALUES ('2888', 'Gondang', '20000');
INSERT INTO `kota` VALUES ('2889', 'Jatirejo', '20000');
INSERT INTO `kota` VALUES ('2890', 'Jetis', '20000');
INSERT INTO `kota` VALUES ('2891', 'Kemlagi', '20000');
INSERT INTO `kota` VALUES ('2892', 'Kutorejo', '20000');
INSERT INTO `kota` VALUES ('2893', 'Mojosari', '20000');
INSERT INTO `kota` VALUES ('2894', 'Ngoro', '20000');
INSERT INTO `kota` VALUES ('2895', 'Pacet', '20000');
INSERT INTO `kota` VALUES ('2896', 'Pungging', '20000');
INSERT INTO `kota` VALUES ('2897', 'Puri', '20000');
INSERT INTO `kota` VALUES ('2898', 'Sooko', '20000');
INSERT INTO `kota` VALUES ('2899', 'Trawas', '20000');
INSERT INTO `kota` VALUES ('2900', 'Trowulan', '20000');
INSERT INTO `kota` VALUES ('2901', 'Balongbendo', '20000');
INSERT INTO `kota` VALUES ('2902', 'Mojoanyar', '20000');
INSERT INTO `kota` VALUES ('2903', 'Magersari', '20000');
INSERT INTO `kota` VALUES ('2904', 'Parajurit Kulon', '20000');
INSERT INTO `kota` VALUES ('2905', 'Tarik', '20000');
INSERT INTO `kota` VALUES ('2906', 'Prambon', '20000');
INSERT INTO `kota` VALUES ('2907', 'Malang', '20000');
INSERT INTO `kota` VALUES ('2908', 'Blimbing', '20000');
INSERT INTO `kota` VALUES ('2909', 'Kedungkandang', '20000');
INSERT INTO `kota` VALUES ('2910', 'Klojen', '20000');
INSERT INTO `kota` VALUES ('2911', 'Lowokwaru', '20000');
INSERT INTO `kota` VALUES ('2912', 'Sukun', '20000');
INSERT INTO `kota` VALUES ('2913', 'Blitar', '24000');
INSERT INTO `kota` VALUES ('2914', 'Bakung', '29000');
INSERT INTO `kota` VALUES ('2915', 'Binangun', '29000');
INSERT INTO `kota` VALUES ('2916', 'Doko', '29000');
INSERT INTO `kota` VALUES ('2917', 'Gandusari', '29000');
INSERT INTO `kota` VALUES ('2918', 'Garum', '29000');
INSERT INTO `kota` VALUES ('2919', 'Kademangan', '29000');
INSERT INTO `kota` VALUES ('2920', 'Kanigoro', '29000');
INSERT INTO `kota` VALUES ('2921', 'Kesamben', '29000');
INSERT INTO `kota` VALUES ('2922', 'Nglegok', '29000');
INSERT INTO `kota` VALUES ('2923', 'Panggungrejo', '29000');
INSERT INTO `kota` VALUES ('2924', 'Ponggok', '29000');
INSERT INTO `kota` VALUES ('2925', 'Sanankulon', '29000');
INSERT INTO `kota` VALUES ('2926', 'Selorejo', '29000');
INSERT INTO `kota` VALUES ('2927', 'Srengat', '29000');
INSERT INTO `kota` VALUES ('2928', 'Sutojayan', '29000');
INSERT INTO `kota` VALUES ('2929', 'Talun', '29000');
INSERT INTO `kota` VALUES ('2930', 'Udanawu', '29000');
INSERT INTO `kota` VALUES ('2931', 'Wates', '29000');
INSERT INTO `kota` VALUES ('2932', 'Wlingi', '24000');
INSERT INTO `kota` VALUES ('2933', 'Wonodadi', '29000');
INSERT INTO `kota` VALUES ('2934', 'Wonotirto', '29000');
INSERT INTO `kota` VALUES ('2935', 'Selopuro', '29000');
INSERT INTO `kota` VALUES ('2936', 'Kepanjenkidul', '29000');
INSERT INTO `kota` VALUES ('2937', 'Sananwetan', '29000');
INSERT INTO `kota` VALUES ('2938', 'Batu', '24000');
INSERT INTO `kota` VALUES ('2939', 'Bumiaji', '29000');
INSERT INTO `kota` VALUES ('2940', 'Junrejo', '29000');
INSERT INTO `kota` VALUES ('2941', 'Kepanjen', '24000');
INSERT INTO `kota` VALUES ('2942', 'Ampelgading', '29000');
INSERT INTO `kota` VALUES ('2943', 'Bantur', '29000');
INSERT INTO `kota` VALUES ('2944', 'Bululawang', '29000');
INSERT INTO `kota` VALUES ('2945', 'Dampit', '29000');
INSERT INTO `kota` VALUES ('2946', 'Dau', '29000');
INSERT INTO `kota` VALUES ('2947', 'Donomulyo', '29000');
INSERT INTO `kota` VALUES ('2948', 'Gedangan', '29000');
INSERT INTO `kota` VALUES ('2949', 'Gondanglegi', '29000');
INSERT INTO `kota` VALUES ('2950', 'Jabung', '29000');
INSERT INTO `kota` VALUES ('2951', 'Kalipare', '29000');
INSERT INTO `kota` VALUES ('2952', 'Karangploso', '29000');
INSERT INTO `kota` VALUES ('2953', 'Kromengan', '29000');
INSERT INTO `kota` VALUES ('2954', 'Ngajum', '29000');
INSERT INTO `kota` VALUES ('2955', 'Pagak', '29000');
INSERT INTO `kota` VALUES ('2956', 'Pakis', '29000');
INSERT INTO `kota` VALUES ('2957', 'Pakisaji', '29000');
INSERT INTO `kota` VALUES ('2958', 'Poncokusumo', '29000');
INSERT INTO `kota` VALUES ('2959', 'Singosari', '29000');
INSERT INTO `kota` VALUES ('2960', 'Sumberpucung', '29000');
INSERT INTO `kota` VALUES ('2961', 'Sumbermanjing Wetan', '29000');
INSERT INTO `kota` VALUES ('2962', 'Tajinan', '29000');
INSERT INTO `kota` VALUES ('2963', 'Tirtoyudo', '29000');
INSERT INTO `kota` VALUES ('2964', 'Turen', '29000');
INSERT INTO `kota` VALUES ('2965', 'Tumpang', '29000');
INSERT INTO `kota` VALUES ('2966', 'Wagir', '29000');
INSERT INTO `kota` VALUES ('2967', 'Wajak', '29000');
INSERT INTO `kota` VALUES ('2968', 'Ngantang', '29000');
INSERT INTO `kota` VALUES ('2969', 'Pujon', '29000');
INSERT INTO `kota` VALUES ('2970', 'Kasembon', '29000');
INSERT INTO `kota` VALUES ('2971', 'Lawang', '29000');
INSERT INTO `kota` VALUES ('2972', 'Pagelaran', '29000');
INSERT INTO `kota` VALUES ('2973', 'Nabire', '98000');
INSERT INTO `kota` VALUES ('2974', 'Dipa', '157000');
INSERT INTO `kota` VALUES ('2975', 'Makimi', '157000');
INSERT INTO `kota` VALUES ('2976', 'Mapia', '157000');
INSERT INTO `kota` VALUES ('2977', 'Menou', '157000');
INSERT INTO `kota` VALUES ('2978', 'Nabire barat', '157000');
INSERT INTO `kota` VALUES ('2979', 'Napan', '157000');
INSERT INTO `kota` VALUES ('2980', 'Obano', '157000');
INSERT INTO `kota` VALUES ('2981', 'Siriwo', '157000');
INSERT INTO `kota` VALUES ('2982', 'Teluk Kimi', '157000');
INSERT INTO `kota` VALUES ('2983', 'Teluk Umar', '157000');
INSERT INTO `kota` VALUES ('2984', 'Uwapa', '157000');
INSERT INTO `kota` VALUES ('2985', 'Wanggar', '157000');
INSERT INTO `kota` VALUES ('2986', 'Wapoga', '157000');
INSERT INTO `kota` VALUES ('2987', 'Yaro', '157000');
INSERT INTO `kota` VALUES ('2988', 'Yaur', '157000');
INSERT INTO `kota` VALUES ('2989', 'Kamu', '125000');
INSERT INTO `kota` VALUES ('2990', 'Kamu Selatan', '157000');
INSERT INTO `kota` VALUES ('2991', 'Kamu Timur', '157000');
INSERT INTO `kota` VALUES ('2992', 'Kamu Utara', '157000');
INSERT INTO `kota` VALUES ('2993', 'Sukikai', '157000');
INSERT INTO `kota` VALUES ('2994', 'Sukikai Selatan', '157000');
INSERT INTO `kota` VALUES ('2995', 'Enarotali', '125000');
INSERT INTO `kota` VALUES ('2996', 'Agisiga', '157000');
INSERT INTO `kota` VALUES ('2997', 'Aradide', '157000');
INSERT INTO `kota` VALUES ('2998', 'Biandoga', '157000');
INSERT INTO `kota` VALUES ('2999', 'Bibida', '157000');
INSERT INTO `kota` VALUES ('3000', 'Bogoboida', '157000');
INSERT INTO `kota` VALUES ('3001', 'Homeyo', '157000');
INSERT INTO `kota` VALUES ('3002', 'Paniai Barat', '157000');
INSERT INTO `kota` VALUES ('3003', 'Mulia', '125000');
INSERT INTO `kota` VALUES ('3004', 'Beoga', '157000');
INSERT INTO `kota` VALUES ('3005', 'Fawi', '157000');
INSERT INTO `kota` VALUES ('3006', 'Ilaga', '157000');
INSERT INTO `kota` VALUES ('3007', 'Ilu', '157000');
INSERT INTO `kota` VALUES ('3008', 'Sinak', '157000');
INSERT INTO `kota` VALUES ('3009', 'Kepi', '125000');
INSERT INTO `kota` VALUES ('3010', 'Assue', '157000');
INSERT INTO `kota` VALUES ('3011', 'Citak Mitak', '157000');
INSERT INTO `kota` VALUES ('3012', 'Edera', '157000');
INSERT INTO `kota` VALUES ('3013', 'Haju', '157000');
INSERT INTO `kota` VALUES ('3014', 'Nambioman Bapai', '157000');
INSERT INTO `kota` VALUES ('3015', 'Obaa', '157000');
INSERT INTO `kota` VALUES ('3016', 'Sugapa', '125000');
INSERT INTO `kota` VALUES ('3017', 'Hitadipa', '157000');
INSERT INTO `kota` VALUES ('3018', 'Intan Jaya', '157000');
INSERT INTO `kota` VALUES ('3019', 'Wandai', '157000');
INSERT INTO `kota` VALUES ('3020', 'Tigi', '125000');
INSERT INTO `kota` VALUES ('3021', 'Bowobado', '157000');
INSERT INTO `kota` VALUES ('3022', 'Kapiraya', '157000');
INSERT INTO `kota` VALUES ('3023', 'Tigi Timur', '157000');
INSERT INTO `kota` VALUES ('3024', 'Tigi Barat', '157000');
INSERT INTO `kota` VALUES ('3025', 'Probolinggo', '20000');
INSERT INTO `kota` VALUES ('3026', 'Banyuanyar', '29000');
INSERT INTO `kota` VALUES ('3027', 'Bantaran', '29000');
INSERT INTO `kota` VALUES ('3028', 'Besuk', '29000');
INSERT INTO `kota` VALUES ('3029', 'Dringu', '29000');
INSERT INTO `kota` VALUES ('3030', 'Gending', '29000');
INSERT INTO `kota` VALUES ('3031', 'Kotaanyar', '29000');
INSERT INTO `kota` VALUES ('3032', 'Kraksaan', '24000');
INSERT INTO `kota` VALUES ('3033', 'Krejengan', '29000');
INSERT INTO `kota` VALUES ('3034', 'Krucil', '29000');
INSERT INTO `kota` VALUES ('3035', 'Kuripan', '29000');
INSERT INTO `kota` VALUES ('3036', 'Leces', '29000');
INSERT INTO `kota` VALUES ('3037', 'Lumbang', '29000');
INSERT INTO `kota` VALUES ('3038', 'Maron', '29000');
INSERT INTO `kota` VALUES ('3039', 'Paiton', '24000');
INSERT INTO `kota` VALUES ('3040', 'Pajarakan', '29000');
INSERT INTO `kota` VALUES ('3041', 'Pakuniran', '29000');
INSERT INTO `kota` VALUES ('3042', 'Sukapura', '29000');
INSERT INTO `kota` VALUES ('3043', 'Sumber', '29000');
INSERT INTO `kota` VALUES ('3044', 'Sumberasih', '29000');
INSERT INTO `kota` VALUES ('3045', 'Tegalsiwalan', '29000');
INSERT INTO `kota` VALUES ('3046', 'Tiris', '29000');
INSERT INTO `kota` VALUES ('3047', 'Tongas', '29000');
INSERT INTO `kota` VALUES ('3048', 'Wonomerto', '29000');
INSERT INTO `kota` VALUES ('3049', 'Kademangan', '24000');
INSERT INTO `kota` VALUES ('3050', 'Mayangan', '24000');
INSERT INTO `kota` VALUES ('3051', 'Gading', '29000');
INSERT INTO `kota` VALUES ('3052', 'Wonoasih', '24000');
INSERT INTO `kota` VALUES ('3053', 'Kedopok', '24000');
INSERT INTO `kota` VALUES ('3054', 'Kanigaran', '24000');
INSERT INTO `kota` VALUES ('3055', 'Lumajang', '24000');
INSERT INTO `kota` VALUES ('3056', 'Candipuro', '29000');
INSERT INTO `kota` VALUES ('3057', 'Gucialit', '29000');
INSERT INTO `kota` VALUES ('3058', 'Jatiroto', '29000');
INSERT INTO `kota` VALUES ('3059', 'Klakah', '29000');
INSERT INTO `kota` VALUES ('3060', 'Kedungjajang', '29000');
INSERT INTO `kota` VALUES ('3061', 'Kunir', '29000');
INSERT INTO `kota` VALUES ('3062', 'Pasirian', '29000');
INSERT INTO `kota` VALUES ('3063', 'Pronojiwo', '29000');
INSERT INTO `kota` VALUES ('3064', 'Randuagung', '29000');
INSERT INTO `kota` VALUES ('3065', 'Ranuyoso', '29000');
INSERT INTO `kota` VALUES ('3066', 'Rowokangkung', '29000');
INSERT INTO `kota` VALUES ('3067', 'Senduro', '29000');
INSERT INTO `kota` VALUES ('3068', 'Sukodono', '29000');
INSERT INTO `kota` VALUES ('3069', 'Tekung', '29000');
INSERT INTO `kota` VALUES ('3070', 'Tempursari', '29000');
INSERT INTO `kota` VALUES ('3071', 'Tempeh', '29000');
INSERT INTO `kota` VALUES ('3072', 'Yosowilangun', '29000');
INSERT INTO `kota` VALUES ('3073', 'Padang', '29000');
INSERT INTO `kota` VALUES ('3074', 'Pasrujambe', '29000');
INSERT INTO `kota` VALUES ('3075', 'Sumbersoko', '29000');
INSERT INTO `kota` VALUES ('3076', 'Situbondo', '24000');
INSERT INTO `kota` VALUES ('3077', 'Asembagus', '29000');
INSERT INTO `kota` VALUES ('3078', 'Banyuputih', '29000');
INSERT INTO `kota` VALUES ('3079', 'Banyuglugur', '29000');
INSERT INTO `kota` VALUES ('3080', 'Besuki', '29000');
INSERT INTO `kota` VALUES ('3081', 'Bungatan', '29000');
INSERT INTO `kota` VALUES ('3082', 'Jangkar', '29000');
INSERT INTO `kota` VALUES ('3083', 'Jatibanteng', '29000');
INSERT INTO `kota` VALUES ('3084', 'Kapongan', '29000');
INSERT INTO `kota` VALUES ('3085', 'Kendit', '29000');
INSERT INTO `kota` VALUES ('3086', 'Mangaran', '29000');
INSERT INTO `kota` VALUES ('3087', 'Mlandingan', '29000');
INSERT INTO `kota` VALUES ('3088', 'Panarukan', '29000');
INSERT INTO `kota` VALUES ('3089', 'Suboh', '29000');
INSERT INTO `kota` VALUES ('3090', 'Sumber Malang', '29000');
INSERT INTO `kota` VALUES ('3091', 'Panji', '29000');
INSERT INTO `kota` VALUES ('3092', 'Padang', '25000');
INSERT INTO `kota` VALUES ('3093', 'Bungus Teluk Kabung', '25000');
INSERT INTO `kota` VALUES ('3094', 'Koto Tangah', '25000');
INSERT INTO `kota` VALUES ('3095', 'Kuranji', '25000');
INSERT INTO `kota` VALUES ('3096', 'Lubuk Begalung', '25000');
INSERT INTO `kota` VALUES ('3097', 'Lubuk Kilangan', '25000');
INSERT INTO `kota` VALUES ('3098', 'Nanggalo', '25000');
INSERT INTO `kota` VALUES ('3099', 'Padang Barat', '25000');
INSERT INTO `kota` VALUES ('3100', 'Padang Selatan', '25000');
INSERT INTO `kota` VALUES ('3101', 'Padang Timur', '25000');
INSERT INTO `kota` VALUES ('3102', 'Padang Utara', '25000');
INSERT INTO `kota` VALUES ('3103', 'Pauh', '25000');
INSERT INTO `kota` VALUES ('3104', 'Batu Sangkar', '34000');
INSERT INTO `kota` VALUES ('3105', 'Batipuh', '43000');
INSERT INTO `kota` VALUES ('3106', 'Lintau Buo', '43000');
INSERT INTO `kota` VALUES ('3107', 'Pariangan', '43000');
INSERT INTO `kota` VALUES ('3108', 'Rambatan', '43000');
INSERT INTO `kota` VALUES ('3109', 'Salimpaung', '43000');
INSERT INTO `kota` VALUES ('3110', 'Sungai Tarab', '43000');
INSERT INTO `kota` VALUES ('3111', 'Sungayang', '43000');
INSERT INTO `kota` VALUES ('3112', 'Tanjung Emas', '43000');
INSERT INTO `kota` VALUES ('3113', 'Batipuh Selatan', '43000');
INSERT INTO `kota` VALUES ('3114', 'Lima Kaum', '43000');
INSERT INTO `kota` VALUES ('3115', 'Lintau Buo Utara', '43000');
INSERT INTO `kota` VALUES ('3116', 'Padang Ganting', '43000');
INSERT INTO `kota` VALUES ('3117', 'Sepuluh Koto', '43000');
INSERT INTO `kota` VALUES ('3118', 'Tanjung Baru', '43000');
INSERT INTO `kota` VALUES ('3119', 'Bukit Tinggi', '34000');
INSERT INTO `kota` VALUES ('3120', 'Aur Birugo Tigo Baleh', '34000');
INSERT INTO `kota` VALUES ('3121', 'Mandiangin Koto Selayan', '34000');
INSERT INTO `kota` VALUES ('3122', 'Guguk Panjang', '34000');
INSERT INTO `kota` VALUES ('3123', 'Lubuk Sikaping', '34000');
INSERT INTO `kota` VALUES ('3124', 'Bonjol', '43000');
INSERT INTO `kota` VALUES ('3125', 'Panti', '43000');
INSERT INTO `kota` VALUES ('3126', 'RAO MAPAT TUNGGUL', '43000');
INSERT INTO `kota` VALUES ('3127', 'III Nagari', '43000');
INSERT INTO `kota` VALUES ('3128', 'Mapat Tunggul Selatan', '43000');
INSERT INTO `kota` VALUES ('3129', 'II Koto', '43000');
INSERT INTO `kota` VALUES ('3130', 'Mapat Tunggul', '43000');
INSERT INTO `kota` VALUES ('3131', 'Painan', '34000');
INSERT INTO `kota` VALUES ('3132', 'Batang Kapas', '43000');
INSERT INTO `kota` VALUES ('3133', 'Bayang', '43000');
INSERT INTO `kota` VALUES ('3134', 'Koto XI Tarusan', '43000');
INSERT INTO `kota` VALUES ('3135', 'Lengayang', '43000');
INSERT INTO `kota` VALUES ('3136', 'Pancung Soal', '43000');
INSERT INTO `kota` VALUES ('3137', 'Ranah Pesisir', '43000');
INSERT INTO `kota` VALUES ('3138', 'Basa IV Balai Tapan', '43000');
INSERT INTO `kota` VALUES ('3139', 'Bayang Utara', '43000');
INSERT INTO `kota` VALUES ('3140', 'Linggo Sari Baganti', '43000');
INSERT INTO `kota` VALUES ('3141', 'Lunang Silaut', '43000');
INSERT INTO `kota` VALUES ('3142', 'Sutera', '43000');
INSERT INTO `kota` VALUES ('3143', 'IV Jurai', '43000');
INSERT INTO `kota` VALUES ('3144', 'Pariaman', '34000');
INSERT INTO `kota` VALUES ('3145', 'Batang Anai', '43000');
INSERT INTO `kota` VALUES ('3146', 'II.X.XI.VI Lingkung', '43000');
INSERT INTO `kota` VALUES ('3147', 'V Koto Kp Dalam', '43000');
INSERT INTO `kota` VALUES ('3148', 'Lubuk Alung', '34000');
INSERT INTO `kota` VALUES ('3149', 'Nan Sabaris', '43000');
INSERT INTO `kota` VALUES ('3150', 'Sungai Limau', '43000');
INSERT INTO `kota` VALUES ('3151', 'Sungai Geringging', '43000');
INSERT INTO `kota` VALUES ('3152', 'VII Koto Sungai Sarik', '43000');
INSERT INTO `kota` VALUES ('3153', 'Batang Gasan', '43000');
INSERT INTO `kota` VALUES ('3154', 'Padang Sago', '43000');
INSERT INTO `kota` VALUES ('3155', 'Patamuan', '43000');
INSERT INTO `kota` VALUES ('3156', 'Sintuk Toboh Gadang', '43000');
INSERT INTO `kota` VALUES ('3157', 'Ulakan Tapakis', '43000');
INSERT INTO `kota` VALUES ('3158', 'Pariaman Selatan', '34000');
INSERT INTO `kota` VALUES ('3159', 'Pariaman Tengah', '34000');
INSERT INTO `kota` VALUES ('3160', 'Pariaman Utara', '34000');
INSERT INTO `kota` VALUES ('3161', 'IV Koto Aur Malintang', '43000');
INSERT INTO `kota` VALUES ('3162', 'V Koto Timur', '43000');
INSERT INTO `kota` VALUES ('3163', 'VI Lingkung', '43000');
INSERT INTO `kota` VALUES ('3164', '2 X 11 Kayu Tanam', '43000');
INSERT INTO `kota` VALUES ('3165', 'Payakumbuh', '34000');
INSERT INTO `kota` VALUES ('3166', 'Payakumbuh Barat', '34000');
INSERT INTO `kota` VALUES ('3167', 'Payakumbuh Timur', '34000');
INSERT INTO `kota` VALUES ('3168', 'Payakumbuh Utara', '34000');
INSERT INTO `kota` VALUES ('3169', 'Sawahlunto', '34000');
INSERT INTO `kota` VALUES ('3170', 'Barangin', '34000');
INSERT INTO `kota` VALUES ('3171', 'Lembah Segar', '34000');
INSERT INTO `kota` VALUES ('3172', 'Silungkang', '34000');
INSERT INTO `kota` VALUES ('3173', 'Talawi', '34000');
INSERT INTO `kota` VALUES ('3174', 'Solok', '34000');
INSERT INTO `kota` VALUES ('3175', 'Lubuk Sikarah', '34000');
INSERT INTO `kota` VALUES ('3176', 'Tanjung Harapan', '34000');
INSERT INTO `kota` VALUES ('3177', 'Padang Panjang', '34000');
INSERT INTO `kota` VALUES ('3178', 'Padang Panjang Barat', '34000');
INSERT INTO `kota` VALUES ('3179', 'Padang Panjang Timur', '34000');
INSERT INTO `kota` VALUES ('3180', 'Pulau Punjung', '34000');
INSERT INTO `kota` VALUES ('3181', 'Koto Baru', '43000');
INSERT INTO `kota` VALUES ('3182', 'Sitiung', '43000');
INSERT INTO `kota` VALUES ('3183', 'Sungai Rumbai', '43000');
INSERT INTO `kota` VALUES ('3184', 'Sarilamak', '34000');
INSERT INTO `kota` VALUES ('3185', 'Akabiluru', '43000');
INSERT INTO `kota` VALUES ('3186', 'Bukit Barisan', '43000');
INSERT INTO `kota` VALUES ('3187', 'Guguk', '43000');
INSERT INTO `kota` VALUES ('3188', 'Gunung Mas', '43000');
INSERT INTO `kota` VALUES ('3189', 'Harau', '43000');
INSERT INTO `kota` VALUES ('3190', 'Kapur IX', '43000');
INSERT INTO `kota` VALUES ('3191', 'Lareh Sago Halaban', '43000');
INSERT INTO `kota` VALUES ('3192', 'Mungka', '43000');
INSERT INTO `kota` VALUES ('3193', 'Pangkalan Koto Baru', '43000');
INSERT INTO `kota` VALUES ('3194', 'Payakumbuh', '43000');
INSERT INTO `kota` VALUES ('3195', 'Situjuh Lima Nagari', '43000');
INSERT INTO `kota` VALUES ('3196', 'Suliki Gunung Mas', '43000');
INSERT INTO `kota` VALUES ('3197', 'Luhak', '43000');
INSERT INTO `kota` VALUES ('3198', 'Tuapejat', '34000');
INSERT INTO `kota` VALUES ('3199', 'Pagai Selatan', '34000');
INSERT INTO `kota` VALUES ('3200', 'Pagai Utara', '34000');
INSERT INTO `kota` VALUES ('3201', 'Siberut Selatan', '43000');
INSERT INTO `kota` VALUES ('3202', 'Siberut Utara', '43000');
INSERT INTO `kota` VALUES ('3203', 'Sipora', '43000');
INSERT INTO `kota` VALUES ('3204', 'Simpang Empat', '34000');
INSERT INTO `kota` VALUES ('3205', 'Gunung Tuleh', '43000');
INSERT INTO `kota` VALUES ('3206', 'Kinali', '43000');
INSERT INTO `kota` VALUES ('3207', 'Lembah Melintang', '43000');
INSERT INTO `kota` VALUES ('3208', 'Luhak Nan Duo', '43000');
INSERT INTO `kota` VALUES ('3209', 'Pasaman', '43000');
INSERT INTO `kota` VALUES ('3210', 'Ranah Balingka', '43000');
INSERT INTO `kota` VALUES ('3211', 'Ranah Batahan', '43000');
INSERT INTO `kota` VALUES ('3212', 'Sungai Aur', '43000');
INSERT INTO `kota` VALUES ('3213', 'Sungai Beremas', '43000');
INSERT INTO `kota` VALUES ('3214', 'Talamau', '43000');
INSERT INTO `kota` VALUES ('3215', 'Arosuka', '34000');
INSERT INTO `kota` VALUES ('3216', 'IX Koto Sungai Lasi', '43000');
INSERT INTO `kota` VALUES ('3217', 'X Koto Diatas', '43000');
INSERT INTO `kota` VALUES ('3218', 'X Koto Singkarak', '43000');
INSERT INTO `kota` VALUES ('3219', 'Bukit Sundi', '43000');
INSERT INTO `kota` VALUES ('3220', 'Danau Kembar', '43000');
INSERT INTO `kota` VALUES ('3221', 'Gunung Talang', '43000');
INSERT INTO `kota` VALUES ('3222', 'Hiliran Gumanti', '43000');
INSERT INTO `kota` VALUES ('3223', 'Junjung Sirih', '43000');
INSERT INTO `kota` VALUES ('3224', 'Kubung', '43000');
INSERT INTO `kota` VALUES ('3225', 'Lembah Gumanti', '43000');
INSERT INTO `kota` VALUES ('3226', 'Lembang Jaya', '43000');
INSERT INTO `kota` VALUES ('3227', 'Pantai Cermin', '43000');
INSERT INTO `kota` VALUES ('3228', 'Payung Sekaki', '43000');
INSERT INTO `kota` VALUES ('3229', 'Tigo Lurah', '43000');
INSERT INTO `kota` VALUES ('3230', 'Padang Aro', '34000');
INSERT INTO `kota` VALUES ('3231', 'Koto Parik Gadang Diateh', '43000');
INSERT INTO `kota` VALUES ('3232', 'Sangir', '43000');
INSERT INTO `kota` VALUES ('3233', 'Sangir Batanghari', '43000');
INSERT INTO `kota` VALUES ('3234', 'Sangir Jujuan', '43000');
INSERT INTO `kota` VALUES ('3235', 'Sungai Pagu', '43000');
INSERT INTO `kota` VALUES ('3236', 'Muaro Sijunjung', '34000');
INSERT INTO `kota` VALUES ('3237', 'Koto Tujuh', '43000');
INSERT INTO `kota` VALUES ('3238', 'IV Nagari', '43000');
INSERT INTO `kota` VALUES ('3239', 'Kamang Baru', '43000');
INSERT INTO `kota` VALUES ('3240', 'Kupitan', '43000');
INSERT INTO `kota` VALUES ('3241', 'Lubuk Tarok', '43000');
INSERT INTO `kota` VALUES ('3242', 'Sumpur Kudus', '43000');
INSERT INTO `kota` VALUES ('3243', 'Tanjung Gadang', '43000');
INSERT INTO `kota` VALUES ('3244', 'Lubuk Basung', '34000');
INSERT INTO `kota` VALUES ('3245', 'Palupuh', '43000');
INSERT INTO `kota` VALUES ('3246', 'Tanjung Mutiara', '43000');
INSERT INTO `kota` VALUES ('3247', 'Tanjung Raya', '43000');
INSERT INTO `kota` VALUES ('3248', 'IV Angkat Canduang', '43000');
INSERT INTO `kota` VALUES ('3249', 'Banuhampu', '43000');
INSERT INTO `kota` VALUES ('3250', 'Baso', '43000');
INSERT INTO `kota` VALUES ('3251', 'IV Koto', '43000');
INSERT INTO `kota` VALUES ('3252', 'Candung', '43000');
INSERT INTO `kota` VALUES ('3253', 'Matur', '43000');
INSERT INTO `kota` VALUES ('3254', 'Palembayan', '43000');
INSERT INTO `kota` VALUES ('3255', 'Tilatang Kamang', '43000');
INSERT INTO `kota` VALUES ('3256', 'Ampek Nagari', '43000');
INSERT INTO `kota` VALUES ('3257', 'Kamang Magek', '43000');
INSERT INTO `kota` VALUES ('3258', 'Sungai Puar', '43000');
INSERT INTO `kota` VALUES ('3259', 'Pandaan', '20000');
INSERT INTO `kota` VALUES ('3260', 'Bangil', '29000');
INSERT INTO `kota` VALUES ('3261', 'Beji', '29000');
INSERT INTO `kota` VALUES ('3262', 'Gempol', '29000');
INSERT INTO `kota` VALUES ('3263', 'Gondang Wetan', '29000');
INSERT INTO `kota` VALUES ('3264', 'Grati', '29000');
INSERT INTO `kota` VALUES ('3265', 'Kejayan', '29000');
INSERT INTO `kota` VALUES ('3266', 'Kraton', '29000');
INSERT INTO `kota` VALUES ('3267', 'Lekok', '29000');
INSERT INTO `kota` VALUES ('3268', 'Nguling', '29000');
INSERT INTO `kota` VALUES ('3269', 'Pasrepan', '29000');
INSERT INTO `kota` VALUES ('3270', 'Pohjentrek', '29000');
INSERT INTO `kota` VALUES ('3271', 'Prigen', '29000');
INSERT INTO `kota` VALUES ('3272', 'Purwodadi', '29000');
INSERT INTO `kota` VALUES ('3273', 'Purwosari', '29000');
INSERT INTO `kota` VALUES ('3274', 'Puspo', '29000');
INSERT INTO `kota` VALUES ('3275', 'Rejoso', '29000');
INSERT INTO `kota` VALUES ('3276', 'Rembang', '29000');
INSERT INTO `kota` VALUES ('3277', 'Tosari', '29000');
INSERT INTO `kota` VALUES ('3278', 'Tutur', '29000');
INSERT INTO `kota` VALUES ('3279', 'Winongan', '29000');
INSERT INTO `kota` VALUES ('3280', 'Wonorejo', '29000');
INSERT INTO `kota` VALUES ('3281', 'Kedawung', '29000');
INSERT INTO `kota` VALUES ('3282', 'Nongko Jajar', '29000');
INSERT INTO `kota` VALUES ('3283', 'Pasuruan', '24000');
INSERT INTO `kota` VALUES ('3284', 'Bugulkidul', '24000');
INSERT INTO `kota` VALUES ('3285', 'Gadingrejo', '24000');
INSERT INTO `kota` VALUES ('3286', 'Purworejo', '24000');
INSERT INTO `kota` VALUES ('3287', 'Pangkal Pinang', '20000');
INSERT INTO `kota` VALUES ('3288', 'Rangkui', '20000');
INSERT INTO `kota` VALUES ('3289', 'Bukit Intan', '20000');
INSERT INTO `kota` VALUES ('3290', 'Pangkal Balam', '20000');
INSERT INTO `kota` VALUES ('3291', 'Gerunggang', '20000');
INSERT INTO `kota` VALUES ('3292', 'Sungai liat', '32000');
INSERT INTO `kota` VALUES ('3293', 'Belinyu', '32000');
INSERT INTO `kota` VALUES ('3294', 'Riau Silip', '40000');
INSERT INTO `kota` VALUES ('3295', 'Bakam', '40000');
INSERT INTO `kota` VALUES ('3296', 'Pemali', '40000');
INSERT INTO `kota` VALUES ('3297', 'Mendo Barat', '40000');
INSERT INTO `kota` VALUES ('3298', 'Merawang', '40000');
INSERT INTO `kota` VALUES ('3299', 'Puding Besar', '40000');
INSERT INTO `kota` VALUES ('3300', 'Kelapa', '32000');
INSERT INTO `kota` VALUES ('3301', 'Mentok', '32000');
INSERT INTO `kota` VALUES ('3302', 'Tempilang', '40000');
INSERT INTO `kota` VALUES ('3303', 'Simpang Teritip', '40000');
INSERT INTO `kota` VALUES ('3304', 'Jebus', '32000');
INSERT INTO `kota` VALUES ('3305', 'Koba', '32000');
INSERT INTO `kota` VALUES ('3306', 'Sungai Selan', '40000');
INSERT INTO `kota` VALUES ('3307', 'Simpang Katis', '40000');
INSERT INTO `kota` VALUES ('3308', 'Pangkalan Baru', '40000');
INSERT INTO `kota` VALUES ('3309', 'Toboali', '32000');
INSERT INTO `kota` VALUES ('3310', 'Lepar Pongok', '40000');
INSERT INTO `kota` VALUES ('3311', 'Payung', '40000');
INSERT INTO `kota` VALUES ('3312', 'Air Gegas', '40000');
INSERT INTO `kota` VALUES ('3313', 'Simpang Rima', '40000');
INSERT INTO `kota` VALUES ('3314', 'Pekanbaru', '25000');
INSERT INTO `kota` VALUES ('3315', 'Payung', '25000');
INSERT INTO `kota` VALUES ('3316', 'Lima Puluh', '25000');
INSERT INTO `kota` VALUES ('3317', 'Marpoyan Damai', '25000');
INSERT INTO `kota` VALUES ('3318', 'Sail', '25000');
INSERT INTO `kota` VALUES ('3319', 'Senapelan', '25000');
INSERT INTO `kota` VALUES ('3320', 'Sukajadi', '25000');
INSERT INTO `kota` VALUES ('3321', 'Bukit Raya', '25000');
INSERT INTO `kota` VALUES ('3322', 'Tampan', '25000');
INSERT INTO `kota` VALUES ('3323', 'Rumbai Pesisir', '25000');
INSERT INTO `kota` VALUES ('3324', 'Tenayan Raya', '25000');
INSERT INTO `kota` VALUES ('3325', 'Rumbai', '37000');
INSERT INTO `kota` VALUES ('3326', 'Dumai', '37000');
INSERT INTO `kota` VALUES ('3327', 'Bukit Kapur', '37000');
INSERT INTO `kota` VALUES ('3328', 'Dumai Barat', '37000');
INSERT INTO `kota` VALUES ('3329', 'Dumai Timur', '37000');
INSERT INTO `kota` VALUES ('3330', 'Medang Kampai', '37000');
INSERT INTO `kota` VALUES ('3331', 'Sungai Sembilan', '37000');
INSERT INTO `kota` VALUES ('3332', 'Bangkinang', '37000');
INSERT INTO `kota` VALUES ('3333', 'Kampar', '47000');
INSERT INTO `kota` VALUES ('3334', 'Siak Hulu', '47000');
INSERT INTO `kota` VALUES ('3335', 'Kampar Kiri', '47000');
INSERT INTO `kota` VALUES ('3336', 'Bangkinang Barat', '47000');
INSERT INTO `kota` VALUES ('3337', 'Bangkinang Seberang', '47000');
INSERT INTO `kota` VALUES ('3338', 'Gunung Sahilan', '47000');
INSERT INTO `kota` VALUES ('3339', 'Kampar Kiri Hilir', '47000');
INSERT INTO `kota` VALUES ('3340', 'Kampar Kiri Hulu', '47000');
INSERT INTO `kota` VALUES ('3341', 'Kampar Timur', '47000');
INSERT INTO `kota` VALUES ('3342', 'Kampar Utara', '47000');
INSERT INTO `kota` VALUES ('3343', 'Perhentian Raja', '47000');
INSERT INTO `kota` VALUES ('3344', 'Rumbio Jaya', '47000');
INSERT INTO `kota` VALUES ('3345', 'Salo', '47000');
INSERT INTO `kota` VALUES ('3346', 'Tambang', '47000');
INSERT INTO `kota` VALUES ('3347', 'Tapung', '47000');
INSERT INTO `kota` VALUES ('3348', 'Tapung Hilir', '47000');
INSERT INTO `kota` VALUES ('3349', 'Tapung Hulu', '47000');
INSERT INTO `kota` VALUES ('3350', 'XIII Koto Kampar', '71000');
INSERT INTO `kota` VALUES ('3351', 'Bengkalis', '37000');
INSERT INTO `kota` VALUES ('3352', 'Bukit Batu', '47000');
INSERT INTO `kota` VALUES ('3353', 'Mandau', '47000');
INSERT INTO `kota` VALUES ('3354', 'Rupat', '71000');
INSERT INTO `kota` VALUES ('3355', 'Bantan', '47000');
INSERT INTO `kota` VALUES ('3356', 'Pinggir', '47000');
INSERT INTO `kota` VALUES ('3357', 'Rupat Utara', '71000');
INSERT INTO `kota` VALUES ('3358', 'Siak Kecil', '47000');
INSERT INTO `kota` VALUES ('3359', 'Duri Mandau', '37000');
INSERT INTO `kota` VALUES ('3360', 'Rengat', '37000');
INSERT INTO `kota` VALUES ('3361', 'Pasir Penyu', '47000');
INSERT INTO `kota` VALUES ('3362', 'Peranap', '47000');
INSERT INTO `kota` VALUES ('3363', 'Seberida', '47000');
INSERT INTO `kota` VALUES ('3364', 'Lirik', '47000');
INSERT INTO `kota` VALUES ('3365', 'Batang Cenaku', '47000');
INSERT INTO `kota` VALUES ('3366', 'Batang Gansal', '47000');
INSERT INTO `kota` VALUES ('3367', 'Kelayang', '47000');
INSERT INTO `kota` VALUES ('3368', 'Rengat Barat', '47000');
INSERT INTO `kota` VALUES ('3369', 'Tembilahan', '37000');
INSERT INTO `kota` VALUES ('3370', 'Batang Tuaka', '71000');
INSERT INTO `kota` VALUES ('3371', 'Enok', '71000');
INSERT INTO `kota` VALUES ('3372', 'Gaung Anak Serka', '71000');
INSERT INTO `kota` VALUES ('3373', 'Kateman', '71000');
INSERT INTO `kota` VALUES ('3374', 'Keritang', '71000');
INSERT INTO `kota` VALUES ('3375', 'Kuala Indragiri', '71000');
INSERT INTO `kota` VALUES ('3376', 'Mandah', '71000');
INSERT INTO `kota` VALUES ('3377', 'Reteh', '71000');
INSERT INTO `kota` VALUES ('3378', 'Tanah Merah', '71000');
INSERT INTO `kota` VALUES ('3379', 'Tempuling', '71000');
INSERT INTO `kota` VALUES ('3380', 'Gaung', '71000');
INSERT INTO `kota` VALUES ('3381', 'Kemuning', '71000');
INSERT INTO `kota` VALUES ('3382', 'Pelangiran', '71000');
INSERT INTO `kota` VALUES ('3383', 'Pulau Burung', '47000');
INSERT INTO `kota` VALUES ('3384', 'Teluk Balengkong', '47000');
INSERT INTO `kota` VALUES ('3385', 'Tembilahan Hulu', '47000');
INSERT INTO `kota` VALUES ('3386', 'Bagan Siapi-api', '37000');
INSERT INTO `kota` VALUES ('3387', 'Kubu', '71000');
INSERT INTO `kota` VALUES ('3388', 'Rimba Melintang', '71000');
INSERT INTO `kota` VALUES ('3389', 'Tanah Putih', '47000');
INSERT INTO `kota` VALUES ('3390', 'Bagan Sinembah', '47000');
INSERT INTO `kota` VALUES ('3391', 'Bangko', '47000');
INSERT INTO `kota` VALUES ('3392', 'Bangko Pusako', '47000');
INSERT INTO `kota` VALUES ('3393', 'Batu Hampar', '47000');
INSERT INTO `kota` VALUES ('3394', 'Pasir Limau Kapas', '71000');
INSERT INTO `kota` VALUES ('3395', 'Pujud', '71000');
INSERT INTO `kota` VALUES ('3396', 'Rantau Kopar', '71000');
INSERT INTO `kota` VALUES ('3397', 'Simpang Kanan', '71000');
INSERT INTO `kota` VALUES ('3398', 'Sinaboi', '71000');
INSERT INTO `kota` VALUES ('3399', 'Tanah Putih Tanjung Melawan', '47000');
INSERT INTO `kota` VALUES ('3400', 'Teluk Kuantan', '37000');
INSERT INTO `kota` VALUES ('3401', 'Kuantan Hilir', '47000');
INSERT INTO `kota` VALUES ('3402', 'Kuantan Mudik', '47000');
INSERT INTO `kota` VALUES ('3403', 'Benai', '47000');
INSERT INTO `kota` VALUES ('3404', 'Cerenti', '47000');
INSERT INTO `kota` VALUES ('3405', 'Gunung Toar', '47000');
INSERT INTO `kota` VALUES ('3406', 'Hulu Kuantan', '47000');
INSERT INTO `kota` VALUES ('3407', 'Inuman', '47000');
INSERT INTO `kota` VALUES ('3408', 'Kuantan Tengah', '47000');
INSERT INTO `kota` VALUES ('3409', 'Logas Tanah Darat', '47000');
INSERT INTO `kota` VALUES ('3410', 'Pangean', '47000');
INSERT INTO `kota` VALUES ('3411', 'Singingi', '47000');
INSERT INTO `kota` VALUES ('3412', 'Singingi Hilir', '47000');
INSERT INTO `kota` VALUES ('3413', 'Pangkalan Kerinci', '37000');
INSERT INTO `kota` VALUES ('3414', 'Bunut', '47000');
INSERT INTO `kota` VALUES ('3415', 'Kerumutan', '47000');
INSERT INTO `kota` VALUES ('3416', 'Kuala Kampar', '47000');
INSERT INTO `kota` VALUES ('3417', 'Langgam', '71000');
INSERT INTO `kota` VALUES ('3418', 'Pangkalan Kuras', '47000');
INSERT INTO `kota` VALUES ('3419', 'Pangkalan Lesung', '47000');
INSERT INTO `kota` VALUES ('3420', 'Pelalawan', '47000');
INSERT INTO `kota` VALUES ('3421', 'Teluk Meranti', '47000');
INSERT INTO `kota` VALUES ('3422', 'Ukui', '47000');
INSERT INTO `kota` VALUES ('3423', 'Sorek', '47000');
INSERT INTO `kota` VALUES ('3424', 'Pasir Pangaraian', '37000');
INSERT INTO `kota` VALUES ('3425', 'Bangun Purba', '47000');
INSERT INTO `kota` VALUES ('3426', 'Kabun', '47000');
INSERT INTO `kota` VALUES ('3427', 'Kepenuhan', '47000');
INSERT INTO `kota` VALUES ('3428', 'Kuntodarussalam', '71000');
INSERT INTO `kota` VALUES ('3429', 'Rambah', '47000');
INSERT INTO `kota` VALUES ('3430', 'Rambah Hilir', '47000');
INSERT INTO `kota` VALUES ('3431', 'Rambah Samo', '47000');
INSERT INTO `kota` VALUES ('3432', 'Rokan IV Koto', '47000');
INSERT INTO `kota` VALUES ('3433', 'Tandun', '47000');
INSERT INTO `kota` VALUES ('3434', 'Tembusai', '47000');
INSERT INTO `kota` VALUES ('3435', 'Tembusai Utara', '47000');
INSERT INTO `kota` VALUES ('3436', 'Ujung Batu', '37000');
INSERT INTO `kota` VALUES ('3437', 'Siak Indrapura', '37000');
INSERT INTO `kota` VALUES ('3438', 'Bunga Raya', '47000');
INSERT INTO `kota` VALUES ('3439', 'Dayun', '47000');
INSERT INTO `kota` VALUES ('3440', 'Kandis', '47000');
INSERT INTO `kota` VALUES ('3441', 'Kerinci Kanan', '47000');
INSERT INTO `kota` VALUES ('3442', 'Koto Gasip', '47000');
INSERT INTO `kota` VALUES ('3443', 'Lubuk Dalam', '47000');
INSERT INTO `kota` VALUES ('3444', 'Minas', '37000');
INSERT INTO `kota` VALUES ('3445', 'Siak', '47000');
INSERT INTO `kota` VALUES ('3446', 'Sungai Apit', '47000');
INSERT INTO `kota` VALUES ('3447', 'Sungai Mandau', '47000');
INSERT INTO `kota` VALUES ('3448', 'Tualang', '47000');
INSERT INTO `kota` VALUES ('3449', 'Meranti', '37000');
INSERT INTO `kota` VALUES ('3450', 'Selat Panjang', '47000');
INSERT INTO `kota` VALUES ('3451', 'Merbau', '71000');
INSERT INTO `kota` VALUES ('3452', 'Rangsang', '71000');
INSERT INTO `kota` VALUES ('3453', 'Rangsang Barat', '71000');
INSERT INTO `kota` VALUES ('3454', 'Tebing Tinggi', '47000');
INSERT INTO `kota` VALUES ('3455', 'Tebing Tinggi Barat', '47000');
INSERT INTO `kota` VALUES ('3456', 'Palangkaraya', '30000');
INSERT INTO `kota` VALUES ('3457', 'Bukit Batu', '30000');
INSERT INTO `kota` VALUES ('3458', 'Jekan Raya', '30000');
INSERT INTO `kota` VALUES ('3459', 'Pahandut', '30000');
INSERT INTO `kota` VALUES ('3460', 'Rakumpit', '93000');
INSERT INTO `kota` VALUES ('3461', 'Sebangau', '30000');
INSERT INTO `kota` VALUES ('3462', 'Kasongan', '49000');
INSERT INTO `kota` VALUES ('3463', 'Kamipang', '93000');
INSERT INTO `kota` VALUES ('3464', 'Katingan Hulu', '93000');
INSERT INTO `kota` VALUES ('3465', 'Katingan Kuala', '93000');
INSERT INTO `kota` VALUES ('3466', 'Katingan Tengah', '62000');
INSERT INTO `kota` VALUES ('3467', 'Marikit', '93000');
INSERT INTO `kota` VALUES ('3468', 'Pulau Malan', '62000');
INSERT INTO `kota` VALUES ('3469', 'Sanaman Mantikei', '93000');
INSERT INTO `kota` VALUES ('3470', 'Tasik Payawan', '93000');
INSERT INTO `kota` VALUES ('3471', 'Tewang Sangalang Garing', '93000');
INSERT INTO `kota` VALUES ('3472', 'Mendawai', '62000');
INSERT INTO `kota` VALUES ('3473', 'Katingan Hilir', '62000');
INSERT INTO `kota` VALUES ('3474', 'Kuala Kapuas', '49000');
INSERT INTO `kota` VALUES ('3475', 'Basarang', '62000');
INSERT INTO `kota` VALUES ('3476', 'Kapuas Barat', '62000');
INSERT INTO `kota` VALUES ('3477', 'Kapuas Murung', '62000');
INSERT INTO `kota` VALUES ('3478', 'Kapuas Tengah', '62000');
INSERT INTO `kota` VALUES ('3479', 'Kapuas Timur', '62000');
INSERT INTO `kota` VALUES ('3480', 'Kapuas Kuala', '62000');
INSERT INTO `kota` VALUES ('3481', 'Mantangai', '62000');
INSERT INTO `kota` VALUES ('3482', 'Pulau Petak', '62000');
INSERT INTO `kota` VALUES ('3483', 'Timpah', '62000');
INSERT INTO `kota` VALUES ('3484', 'Kapuas Hulu', '62000');
INSERT INTO `kota` VALUES ('3485', 'Kapuas Hilir', '62000');
INSERT INTO `kota` VALUES ('3486', 'Selat', '62000');
INSERT INTO `kota` VALUES ('3487', 'Kuala Kurun', '49000');
INSERT INTO `kota` VALUES ('3488', 'Kahayan Hulu Utara', '93000');
INSERT INTO `kota` VALUES ('3489', 'Rungan', '93000');
INSERT INTO `kota` VALUES ('3490', 'Sepang', '62000');
INSERT INTO `kota` VALUES ('3491', 'Tewah', '93000');
INSERT INTO `kota` VALUES ('3492', 'Munuhing', '93000');
INSERT INTO `kota` VALUES ('3493', 'Kuala Pembuang', '49000');
INSERT INTO `kota` VALUES ('3494', 'Danau Sembuluh', '62000');
INSERT INTO `kota` VALUES ('3495', 'Hanau', '93000');
INSERT INTO `kota` VALUES ('3496', 'Seruyan Hulu', '93000');
INSERT INTO `kota` VALUES ('3497', 'Seruyan Tengah', '93000');
INSERT INTO `kota` VALUES ('3498', 'Seruyan Hilir', '62000');
INSERT INTO `kota` VALUES ('3499', 'Pangkalan Bun', '49000');
INSERT INTO `kota` VALUES ('3500', 'Arut Utara', '62000');
INSERT INTO `kota` VALUES ('3501', 'Kota Waringin Lama', '62000');
INSERT INTO `kota` VALUES ('3502', 'Kumai', '62000');
INSERT INTO `kota` VALUES ('3503', 'Arut Selatan', '62000');
INSERT INTO `kota` VALUES ('3504', 'Pangkalan Lada', '62000');
INSERT INTO `kota` VALUES ('3505', 'Pangkalan Banteng', '62000');
INSERT INTO `kota` VALUES ('3506', 'Sampit', '49000');
INSERT INTO `kota` VALUES ('3507', 'Cempaga', '62000');
INSERT INTO `kota` VALUES ('3508', 'Kota Besi', '62000');
INSERT INTO `kota` VALUES ('3509', 'Mentaya Hilir Selatan', '62000');
INSERT INTO `kota` VALUES ('3510', 'Mentaya Hulu', '62000');
INSERT INTO `kota` VALUES ('3511', 'Mentaya Hilir Utara', '62000');
INSERT INTO `kota` VALUES ('3512', 'Parenggean', '62000');
INSERT INTO `kota` VALUES ('3513', 'Pulau Hanaut', '62000');
INSERT INTO `kota` VALUES ('3514', 'Antang Kalang', '62000');
INSERT INTO `kota` VALUES ('3515', 'Baamang', '62000');
INSERT INTO `kota` VALUES ('3516', 'Mentawa Baru', '62000');
INSERT INTO `kota` VALUES ('3517', 'Nanga Bulik', '49000');
INSERT INTO `kota` VALUES ('3518', 'Bulik', '62000');
INSERT INTO `kota` VALUES ('3519', 'Delang', '93000');
INSERT INTO `kota` VALUES ('3520', 'Lamandau', '62000');
INSERT INTO `kota` VALUES ('3521', 'Pulang Pisau', '49000');
INSERT INTO `kota` VALUES ('3522', 'Banamatingang', '62000');
INSERT INTO `kota` VALUES ('3523', 'Kahayan Hilir', '62000');
INSERT INTO `kota` VALUES ('3524', 'Kahayan Tengah', '62000');
INSERT INTO `kota` VALUES ('3525', 'Kahayan Kuala', '93000');
INSERT INTO `kota` VALUES ('3526', 'Pandih Batu', '62000');
INSERT INTO `kota` VALUES ('3527', 'Maliku', '93000');
INSERT INTO `kota` VALUES ('3528', 'Sukamara', '49000');
INSERT INTO `kota` VALUES ('3529', 'Balai Riam', '62000');
INSERT INTO `kota` VALUES ('3530', 'Jelai', '62000');
INSERT INTO `kota` VALUES ('3531', 'Palembang', '20000');
INSERT INTO `kota` VALUES ('3532', 'Plaju', '20000');
INSERT INTO `kota` VALUES ('3533', 'Alang-Alang Lebar', '20000');
INSERT INTO `kota` VALUES ('3534', 'Bukit Kecil', '20000');
INSERT INTO `kota` VALUES ('3535', 'Gandus', '20000');
INSERT INTO `kota` VALUES ('3536', 'Ilir Barat I', '20000');
INSERT INTO `kota` VALUES ('3537', 'Ilir Barat II', '20000');
INSERT INTO `kota` VALUES ('3538', 'Ilir Timur I', '20000');
INSERT INTO `kota` VALUES ('3539', 'Ilir Timur II', '20000');
INSERT INTO `kota` VALUES ('3540', 'Kalidoni', '20000');
INSERT INTO `kota` VALUES ('3541', 'Kemuning', '20000');
INSERT INTO `kota` VALUES ('3542', 'Kertapati', '20000');
INSERT INTO `kota` VALUES ('3543', 'Sako', '20000');
INSERT INTO `kota` VALUES ('3544', 'Seberang Ulu I', '20000');
INSERT INTO `kota` VALUES ('3545', 'Seberang Ulu II', '20000');
INSERT INTO `kota` VALUES ('3546', 'Sematang Borang', '20000');
INSERT INTO `kota` VALUES ('3547', 'Sukarame', '20000');
INSERT INTO `kota` VALUES ('3548', 'Muara Beliti Baru', '31000');
INSERT INTO `kota` VALUES ('3549', 'BKL Ulu Terawas', '39000');
INSERT INTO `kota` VALUES ('3550', 'BTS Ulu', '39000');
INSERT INTO `kota` VALUES ('3551', 'Jayaloka', '39000');
INSERT INTO `kota` VALUES ('3552', 'Karang Dapo', '39000');
INSERT INTO `kota` VALUES ('3553', 'Karang Jaya', '39000');
INSERT INTO `kota` VALUES ('3554', 'Megang Sakti', '39000');
INSERT INTO `kota` VALUES ('3555', 'Muara Beliti', '39000');
INSERT INTO `kota` VALUES ('3556', 'Muara Kelingi', '39000');
INSERT INTO `kota` VALUES ('3557', 'Muara Lakitan', '39000');
INSERT INTO `kota` VALUES ('3558', 'Muara Rupit', '39000');
INSERT INTO `kota` VALUES ('3559', 'Nibung', '39000');
INSERT INTO `kota` VALUES ('3560', 'Purwodadi', '39000');
INSERT INTO `kota` VALUES ('3561', 'Rawas Ulu', '39000');
INSERT INTO `kota` VALUES ('3562', 'Selangit', '39000');
INSERT INTO `kota` VALUES ('3563', 'Tugumulyo', '39000');
INSERT INTO `kota` VALUES ('3564', 'Ulu Rawas', '39000');
INSERT INTO `kota` VALUES ('3565', 'Rawas Ilir', '39000');
INSERT INTO `kota` VALUES ('3566', 'Baturaja', '31000');
INSERT INTO `kota` VALUES ('3567', 'Peninjauan', '39000');
INSERT INTO `kota` VALUES ('3568', 'Pengandonan', '39000');
INSERT INTO `kota` VALUES ('3569', 'Sosoh Buay Rayap', '39000');
INSERT INTO `kota` VALUES ('3570', 'Baturaja Barat', '39000');
INSERT INTO `kota` VALUES ('3571', 'Baturaja Timur', '39000');
INSERT INTO `kota` VALUES ('3572', 'Lengkiti', '39000');
INSERT INTO `kota` VALUES ('3573', 'Lubuk Batang', '39000');
INSERT INTO `kota` VALUES ('3574', 'Semidang Aji', '39000');
INSERT INTO `kota` VALUES ('3575', 'Ulu Ogan', '39000');
INSERT INTO `kota` VALUES ('3576', 'Kota Kayu Agung', '31000');
INSERT INTO `kota` VALUES ('3577', 'Mesuji', '39000');
INSERT INTO `kota` VALUES ('3578', 'Pampangan', '39000');
INSERT INTO `kota` VALUES ('3579', 'Pedamaran', '39000');
INSERT INTO `kota` VALUES ('3580', 'Sirah Pulau Padang', '39000');
INSERT INTO `kota` VALUES ('3581', 'Tanjung Lubuk', '39000');
INSERT INTO `kota` VALUES ('3582', 'Tulung Selapan', '39000');
INSERT INTO `kota` VALUES ('3583', 'Air Sugihan', '39000');
INSERT INTO `kota` VALUES ('3584', 'Cengal', '39000');
INSERT INTO `kota` VALUES ('3585', 'Jejawi', '39000');
INSERT INTO `kota` VALUES ('3586', 'Lempuing', '39000');
INSERT INTO `kota` VALUES ('3587', 'Pematang Panggang', '39000');
INSERT INTO `kota` VALUES ('3588', 'Lahat', '31000');
INSERT INTO `kota` VALUES ('3589', 'Merapi', '39000');
INSERT INTO `kota` VALUES ('3590', 'Pulau Pinang', '39000');
INSERT INTO `kota` VALUES ('3591', 'Tanjung Sakti', '39000');
INSERT INTO `kota` VALUES ('3592', 'Jarai', '39000');
INSERT INTO `kota` VALUES ('3593', 'Kikim Barat', '39000');
INSERT INTO `kota` VALUES ('3594', 'Kikim Selatan', '39000');
INSERT INTO `kota` VALUES ('3595', 'Kikim Tengah', '39000');
INSERT INTO `kota` VALUES ('3596', 'Kikim Timur', '39000');
INSERT INTO `kota` VALUES ('3597', 'Kota Agung', '39000');
INSERT INTO `kota` VALUES ('3598', 'Mulak Ulu', '39000');
INSERT INTO `kota` VALUES ('3599', 'Pajar Bulan', '39000');
INSERT INTO `kota` VALUES ('3600', 'Muara Enim', '31000');
INSERT INTO `kota` VALUES ('3601', 'Gunung Megang', '39000');
INSERT INTO `kota` VALUES ('3602', 'Tanjung Agung', '39000');
INSERT INTO `kota` VALUES ('3603', 'Gelumbang', '39000');
INSERT INTO `kota` VALUES ('3604', 'Rembang Dangku', '39000');
INSERT INTO `kota` VALUES ('3605', 'Rembang', '39000');
INSERT INTO `kota` VALUES ('3606', 'Benakat', '39000');
INSERT INTO `kota` VALUES ('3607', 'Lawang Kidul', '31000');
INSERT INTO `kota` VALUES ('3608', 'Lembak', '39000');
INSERT INTO `kota` VALUES ('3609', 'Lubai', '39000');
INSERT INTO `kota` VALUES ('3610', 'Penukal Abab', '39000');
INSERT INTO `kota` VALUES ('3611', 'Penukal Utara', '39000');
INSERT INTO `kota` VALUES ('3612', 'Semende Darat Laut', '39000');
INSERT INTO `kota` VALUES ('3613', 'Semende Darat Tengah', '39000');
INSERT INTO `kota` VALUES ('3614', 'Semende Darat Ulu', '39000');
INSERT INTO `kota` VALUES ('3615', 'Sungai Rotan', '39000');
INSERT INTO `kota` VALUES ('3616', 'Talang Ubi', '39000');
INSERT INTO `kota` VALUES ('3617', 'Tanah Abang', '39000');
INSERT INTO `kota` VALUES ('3618', 'Ujan Mas', '39000');
INSERT INTO `kota` VALUES ('3619', 'Abab (Penukal Abab)', '39000');
INSERT INTO `kota` VALUES ('3620', 'Muara Belikan', '39000');
INSERT INTO `kota` VALUES ('3621', 'Kelekar', '39000');
INSERT INTO `kota` VALUES ('3622', 'Pagar Alam', '31000');
INSERT INTO `kota` VALUES ('3623', 'Pagar Alam Utara', '31000');
INSERT INTO `kota` VALUES ('3624', 'Pagar Alam Selatan', '31000');
INSERT INTO `kota` VALUES ('3625', 'Dempo Selatan', '31000');
INSERT INTO `kota` VALUES ('3626', 'Dempo Tengah', '31000');
INSERT INTO `kota` VALUES ('3627', 'Dempo Utara', '31000');
INSERT INTO `kota` VALUES ('3628', 'Prabumulih', '31000');
INSERT INTO `kota` VALUES ('3629', 'Cambai', '31000');
INSERT INTO `kota` VALUES ('3630', 'Prabumulih Barat', '31000');
INSERT INTO `kota` VALUES ('3631', 'Rambang Kapak Tengah', '31000');
INSERT INTO `kota` VALUES ('3632', 'Prabumulih Timur', '31000');
INSERT INTO `kota` VALUES ('3633', 'Sekayu', '31000');
INSERT INTO `kota` VALUES ('3634', 'Babat Toman', '39000');
INSERT INTO `kota` VALUES ('3635', 'Bayung Lencir', '39000');
INSERT INTO `kota` VALUES ('3636', 'Sungai Lilin', '31000');
INSERT INTO `kota` VALUES ('3637', 'Batang Harileko', '39000');
INSERT INTO `kota` VALUES ('3638', 'Keluang', '39000');
INSERT INTO `kota` VALUES ('3639', 'Lais', '39000');
INSERT INTO `kota` VALUES ('3640', 'Sanga Desa', '39000');
INSERT INTO `kota` VALUES ('3641', 'Sungai Keruh', '39000');
INSERT INTO `kota` VALUES ('3642', 'Pangkalan Balai', '31000');
INSERT INTO `kota` VALUES ('3643', 'Banyuasin I', '39000');
INSERT INTO `kota` VALUES ('3644', 'Banyuasin II', '39000');
INSERT INTO `kota` VALUES ('3645', 'Banyuasin III', '39000');
INSERT INTO `kota` VALUES ('3646', 'Betung', '39000');
INSERT INTO `kota` VALUES ('3647', 'Makarti Jaya', '39000');
INSERT INTO `kota` VALUES ('3648', 'Muara Telang', '39000');
INSERT INTO `kota` VALUES ('3649', 'Pulau Rimau', '39000');
INSERT INTO `kota` VALUES ('3650', 'Rambutan', '39000');
INSERT INTO `kota` VALUES ('3651', 'Rantau Bayur', '39000');
INSERT INTO `kota` VALUES ('3652', 'Talang Kelapa', '39000');
INSERT INTO `kota` VALUES ('3653', 'Muara Padang', '39000');
INSERT INTO `kota` VALUES ('3654', 'Tebing Tinggi', '31000');
INSERT INTO `kota` VALUES ('3655', 'Lintang Kanan', '39000');
INSERT INTO `kota` VALUES ('3656', 'Muara Pinang', '39000');
INSERT INTO `kota` VALUES ('3657', 'Pasemah Air Keruh', '39000');
INSERT INTO `kota` VALUES ('3658', 'Pendopo', '39000');
INSERT INTO `kota` VALUES ('3659', 'Talang Padang', '39000');
INSERT INTO `kota` VALUES ('3660', 'Ulu Musi', '39000');
INSERT INTO `kota` VALUES ('3661', 'Indralaya', '31000');
INSERT INTO `kota` VALUES ('3662', 'Muara Kuang', '39000');
INSERT INTO `kota` VALUES ('3663', 'Pemulutan', '39000');
INSERT INTO `kota` VALUES ('3664', 'Rantau Alai', '39000');
INSERT INTO `kota` VALUES ('3665', 'Tanjung Batu', '39000');
INSERT INTO `kota` VALUES ('3666', 'Tanjung Raja', '39000');
INSERT INTO `kota` VALUES ('3667', 'Martapura', '31000');
INSERT INTO `kota` VALUES ('3668', 'Belitang', '39000');
INSERT INTO `kota` VALUES ('3669', 'Belitang II', '39000');
INSERT INTO `kota` VALUES ('3670', 'Belitang III', '39000');
INSERT INTO `kota` VALUES ('3671', 'Buay Madang', '39000');
INSERT INTO `kota` VALUES ('3672', 'Buay Pemuka Peliung', '39000');
INSERT INTO `kota` VALUES ('3673', 'Cempaka', '39000');
INSERT INTO `kota` VALUES ('3674', 'Madang Suku I', '39000');
INSERT INTO `kota` VALUES ('3675', 'Madang Suku II', '39000');
INSERT INTO `kota` VALUES ('3676', 'Semendawa Suku III', '39000');
INSERT INTO `kota` VALUES ('3677', 'MADANG SUKU III', '39000');
INSERT INTO `kota` VALUES ('3678', 'Muaradua', '31000');
INSERT INTO `kota` VALUES ('3679', 'Banding Agung', '39000');
INSERT INTO `kota` VALUES ('3680', 'Buay Pemaca', '39000');
INSERT INTO `kota` VALUES ('3681', 'Buay Runjung', '39000');
INSERT INTO `kota` VALUES ('3682', 'Buay Sandang Aji', '39000');
INSERT INTO `kota` VALUES ('3683', 'Kisam Tinggi', '39000');
INSERT INTO `kota` VALUES ('3684', 'Mekakau Ilir', '39000');
INSERT INTO `kota` VALUES ('3685', 'Muaradua Kisam', '39000');
INSERT INTO `kota` VALUES ('3686', 'Pulau Beringin', '39000');
INSERT INTO `kota` VALUES ('3687', 'Simpang', '39000');
INSERT INTO `kota` VALUES ('3688', 'Lubuk Linggau', '31000');
INSERT INTO `kota` VALUES ('3689', 'Lubuklinggau Barat I', '31000');
INSERT INTO `kota` VALUES ('3690', 'Lubuklinggau Barat II', '31000');
INSERT INTO `kota` VALUES ('3691', 'Lubuklinggau Selatan I', '31000');
INSERT INTO `kota` VALUES ('3692', 'Lubuklinggau Selatan II', '31000');
INSERT INTO `kota` VALUES ('3693', 'Lubuklinggau Timur I', '31000');
INSERT INTO `kota` VALUES ('3694', 'Lubuklinggau Timur II', '31000');
INSERT INTO `kota` VALUES ('3695', 'Lubuklinggau Utara I', '31000');
INSERT INTO `kota` VALUES ('3696', 'Lubuklinggau Utara II', '31000');
INSERT INTO `kota` VALUES ('3697', 'Palu', '40000');
INSERT INTO `kota` VALUES ('3698', 'Palu Barat', '40000');
INSERT INTO `kota` VALUES ('3699', 'Palu Selatan', '40000');
INSERT INTO `kota` VALUES ('3700', 'Palu Timur', '40000');
INSERT INTO `kota` VALUES ('3701', 'Palu Utara', '40000');
INSERT INTO `kota` VALUES ('3702', 'Luwuk', '58000');
INSERT INTO `kota` VALUES ('3703', 'Balantak', '73000');
INSERT INTO `kota` VALUES ('3704', 'Batui', '73000');
INSERT INTO `kota` VALUES ('3705', 'Bunta', '73000');
INSERT INTO `kota` VALUES ('3706', 'Kintom', '73000');
INSERT INTO `kota` VALUES ('3707', 'Lamala', '73000');
INSERT INTO `kota` VALUES ('3708', 'Pagimana', '73000');
INSERT INTO `kota` VALUES ('3709', 'Boalemo', '73000');
INSERT INTO `kota` VALUES ('3710', 'Toili', '73000');
INSERT INTO `kota` VALUES ('3711', 'Poso Kota', '58000');
INSERT INTO `kota` VALUES ('3712', 'Lage', '73000');
INSERT INTO `kota` VALUES ('3713', 'Lore Utara', '73000');
INSERT INTO `kota` VALUES ('3714', 'Lore Selatan', '73000');
INSERT INTO `kota` VALUES ('3715', 'Pamona Selatan', '73000');
INSERT INTO `kota` VALUES ('3716', 'Pamona Utara', '73000');
INSERT INTO `kota` VALUES ('3717', 'Poso Pesisir', '73000');
INSERT INTO `kota` VALUES ('3718', 'Lore Tengah', '73000');
INSERT INTO `kota` VALUES ('3719', 'Pamona Timur', '73000');
INSERT INTO `kota` VALUES ('3720', 'Toli-Toli', '58000');
INSERT INTO `kota` VALUES ('3721', 'Dampal Utara', '73000');
INSERT INTO `kota` VALUES ('3722', 'Dampal Selatan', '73000');
INSERT INTO `kota` VALUES ('3723', 'Dondo', '73000');
INSERT INTO `kota` VALUES ('3724', 'Galang', '73000');
INSERT INTO `kota` VALUES ('3725', 'Utara Toli Toli', '73000');
INSERT INTO `kota` VALUES ('3726', 'Baolan', '73000');
INSERT INTO `kota` VALUES ('3727', 'Basidondo', '73000');
INSERT INTO `kota` VALUES ('3728', 'Lampasio', '73000');
INSERT INTO `kota` VALUES ('3729', 'Ogo Deide', '73000');
INSERT INTO `kota` VALUES ('3730', 'Banggai', '58000');
INSERT INTO `kota` VALUES ('3731', 'Bokan Kepulauan', '73000');
INSERT INTO `kota` VALUES ('3732', 'Buko', '73000');
INSERT INTO `kota` VALUES ('3733', 'Bulagi', '73000');
INSERT INTO `kota` VALUES ('3734', 'Bulagi Selatan', '73000');
INSERT INTO `kota` VALUES ('3735', 'Liang', '73000');
INSERT INTO `kota` VALUES ('3736', 'Lo Bangkurung', '73000');
INSERT INTO `kota` VALUES ('3737', 'Tinangkung', '73000');
INSERT INTO `kota` VALUES ('3738', 'Totikum', '73000');
INSERT INTO `kota` VALUES ('3739', 'Buol', '58000');
INSERT INTO `kota` VALUES ('3740', 'Biau', '73000');
INSERT INTO `kota` VALUES ('3741', 'Bokat', '73000');
INSERT INTO `kota` VALUES ('3742', 'Bukal', '73000');
INSERT INTO `kota` VALUES ('3743', 'Bunobogu', '73000');
INSERT INTO `kota` VALUES ('3744', 'Gadung', '73000');
INSERT INTO `kota` VALUES ('3745', 'Lipunoto', '73000');
INSERT INTO `kota` VALUES ('3746', 'Momunu', '73000');
INSERT INTO `kota` VALUES ('3747', 'Paleleh', '73000');
INSERT INTO `kota` VALUES ('3748', 'Tiolan', '73000');
INSERT INTO `kota` VALUES ('3749', 'Banawa', '40000');
INSERT INTO `kota` VALUES ('3750', 'Balaesang', '73000');
INSERT INTO `kota` VALUES ('3751', 'Damsol', '73000');
INSERT INTO `kota` VALUES ('3752', 'Dolo', '73000');
INSERT INTO `kota` VALUES ('3753', 'Kulawi', '73000');
INSERT INTO `kota` VALUES ('3754', 'Marawola', '73000');
INSERT INTO `kota` VALUES ('3755', 'Palolo', '73000');
INSERT INTO `kota` VALUES ('3756', 'Pipikoro', '73000');
INSERT INTO `kota` VALUES ('3757', 'Riopakawa', '73000');
INSERT INTO `kota` VALUES ('3758', 'Sigi Biromaru', '73000');
INSERT INTO `kota` VALUES ('3759', 'Sindue', '73000');
INSERT INTO `kota` VALUES ('3760', 'Sirenja', '73000');
INSERT INTO `kota` VALUES ('3761', 'Sojol', '73000');
INSERT INTO `kota` VALUES ('3762', 'Tawaeli', '73000');
INSERT INTO `kota` VALUES ('3763', 'Bungku', '58000');
INSERT INTO `kota` VALUES ('3764', 'Bungku Barat', '73000');
INSERT INTO `kota` VALUES ('3765', 'Bungku Selatan', '73000');
INSERT INTO `kota` VALUES ('3766', 'Bungku Tengah', '73000');
INSERT INTO `kota` VALUES ('3767', 'Bungku Utara', '73000');
INSERT INTO `kota` VALUES ('3768', 'Bahodopi', '73000');
INSERT INTO `kota` VALUES ('3769', 'Bumi Raya', '73000');
INSERT INTO `kota` VALUES ('3770', 'Lembo', '73000');
INSERT INTO `kota` VALUES ('3771', 'Mamosalato', '73000');
INSERT INTO `kota` VALUES ('3772', 'Menui Kepulauan', '73000');
INSERT INTO `kota` VALUES ('3773', 'Mori Atas', '73000');
INSERT INTO `kota` VALUES ('3774', 'Petasia', '73000');
INSERT INTO `kota` VALUES ('3775', 'Soyo Jaya', '73000');
INSERT INTO `kota` VALUES ('3776', 'Wita Ponda', '73000');
INSERT INTO `kota` VALUES ('3777', 'Parigi', '58000');
INSERT INTO `kota` VALUES ('3778', 'Ampibabo', '73000');
INSERT INTO `kota` VALUES ('3779', 'Bolano Lambunu', '73000');
INSERT INTO `kota` VALUES ('3780', 'Kasimbar', '73000');
INSERT INTO `kota` VALUES ('3781', 'Moutong', '73000');
INSERT INTO `kota` VALUES ('3782', 'Sausu', '73000');
INSERT INTO `kota` VALUES ('3783', 'Tinombo', '73000');
INSERT INTO `kota` VALUES ('3784', 'Tinombo Selatan', '73000');
INSERT INTO `kota` VALUES ('3785', 'Tomini', '73000');
INSERT INTO `kota` VALUES ('3786', 'Torue', '73000');
INSERT INTO `kota` VALUES ('3787', 'Ampana Kota', '58000');
INSERT INTO `kota` VALUES ('3788', 'Ampana Tete', '73000');
INSERT INTO `kota` VALUES ('3789', 'Togean', '73000');
INSERT INTO `kota` VALUES ('3790', 'Tojo', '73000');
INSERT INTO `kota` VALUES ('3791', 'Tojo Barat', '73000');
INSERT INTO `kota` VALUES ('3792', 'Ulu Bongka', '73000');
INSERT INTO `kota` VALUES ('3793', 'Una-Una', '73000');
INSERT INTO `kota` VALUES ('3794', 'Walea Kepulauan', '73000');
INSERT INTO `kota` VALUES ('3795', 'Pontianak', '27000');
INSERT INTO `kota` VALUES ('3796', 'Pontianak Barat', '27000');
INSERT INTO `kota` VALUES ('3797', 'Pontianak Kota', '27000');
INSERT INTO `kota` VALUES ('3798', 'Pontianak Selatan', '27000');
INSERT INTO `kota` VALUES ('3799', 'Pontianak Tenggara', '27000');
INSERT INTO `kota` VALUES ('3800', 'Pontianak Timur/ Jungkat', '27000');
INSERT INTO `kota` VALUES ('3801', 'Pontianak Utara', '27000');
INSERT INTO `kota` VALUES ('3802', 'Ketapang', '42000');
INSERT INTO `kota` VALUES ('3803', 'Jelai Hulu', '53000');
INSERT INTO `kota` VALUES ('3804', 'Kendawangan', '53000');
INSERT INTO `kota` VALUES ('3805', 'Manis Mata', '53000');
INSERT INTO `kota` VALUES ('3806', 'Marau', '53000');
INSERT INTO `kota` VALUES ('3807', 'Nanga Tayap', '53000');
INSERT INTO `kota` VALUES ('3808', 'Sandai', '53000');
INSERT INTO `kota` VALUES ('3809', 'Simpang Hulu', '53000');
INSERT INTO `kota` VALUES ('3810', 'Sungai Laur', '53000');
INSERT INTO `kota` VALUES ('3811', 'Tumbang Titi', '53000');
INSERT INTO `kota` VALUES ('3812', 'Benua Kayong', '53000');
INSERT INTO `kota` VALUES ('3813', 'Air Upas', '53000');
INSERT INTO `kota` VALUES ('3814', 'Delta Pawan', '53000');
INSERT INTO `kota` VALUES ('3815', 'Hulu Sungai', '53000');
INSERT INTO `kota` VALUES ('3816', 'Matan Hilir Selatan', '53000');
INSERT INTO `kota` VALUES ('3817', 'Matan Hilir Utara', '53000');
INSERT INTO `kota` VALUES ('3818', 'Muara Pawan', '53000');
INSERT INTO `kota` VALUES ('3819', 'Pemaham', '53000');
INSERT INTO `kota` VALUES ('3820', 'Simpang Dua', '53000');
INSERT INTO `kota` VALUES ('3821', 'Singkup', '53000');
INSERT INTO `kota` VALUES ('3822', 'Sanggau', '42000');
INSERT INTO `kota` VALUES ('3823', 'Balai', '53000');
INSERT INTO `kota` VALUES ('3824', 'Beduwai', '53000');
INSERT INTO `kota` VALUES ('3825', 'Bonti', '53000');
INSERT INTO `kota` VALUES ('3826', 'Jangkang', '53000');
INSERT INTO `kota` VALUES ('3827', 'Kembayan', '53000');
INSERT INTO `kota` VALUES ('3828', 'Meliau', '53000');
INSERT INTO `kota` VALUES ('3829', 'Mukok', '53000');
INSERT INTO `kota` VALUES ('3830', 'Noyan', '53000');
INSERT INTO `kota` VALUES ('3831', 'Parindu', '53000');
INSERT INTO `kota` VALUES ('3832', 'Sekayam', '53000');
INSERT INTO `kota` VALUES ('3833', 'Tayan Hulu', '53000');
INSERT INTO `kota` VALUES ('3834', 'Tayan Hilir', '53000');
INSERT INTO `kota` VALUES ('3835', 'Toba', '53000');
INSERT INTO `kota` VALUES ('3836', 'Entikong', '53000');
INSERT INTO `kota` VALUES ('3837', 'Singkawang', '42000');
INSERT INTO `kota` VALUES ('3838', 'Singkawang Barat', '42000');
INSERT INTO `kota` VALUES ('3839', 'Singkawang Utara', '42000');
INSERT INTO `kota` VALUES ('3840', 'Singkawang Selatan', '42000');
INSERT INTO `kota` VALUES ('3841', 'Singkawang Timur', '42000');
INSERT INTO `kota` VALUES ('3842', 'Singkawang Tengah', '42000');
INSERT INTO `kota` VALUES ('3843', 'Sintang', '42000');
INSERT INTO `kota` VALUES ('3844', 'Ambalau', '53000');
INSERT INTO `kota` VALUES ('3845', 'Dedai', '53000');
INSERT INTO `kota` VALUES ('3846', 'Kayan Hulu', '53000');
INSERT INTO `kota` VALUES ('3847', 'Kayan Hilir', '53000');
INSERT INTO `kota` VALUES ('3848', 'Ketungau Hilir', '53000');
INSERT INTO `kota` VALUES ('3849', 'Ketungau Tengah', '53000');
INSERT INTO `kota` VALUES ('3850', 'Ketungau Hulu', '53000');
INSERT INTO `kota` VALUES ('3851', 'Sepauk', '53000');
INSERT INTO `kota` VALUES ('3852', 'Tempunak', '53000');
INSERT INTO `kota` VALUES ('3853', 'Binjai Hulu', '53000');
INSERT INTO `kota` VALUES ('3854', 'Kelam Permai', '53000');
INSERT INTO `kota` VALUES ('3855', 'Sungai Tebelian', '53000');
INSERT INTO `kota` VALUES ('3856', 'Putussibau', '42000');
INSERT INTO `kota` VALUES ('3857', 'Badau', '53000');
INSERT INTO `kota` VALUES ('3858', 'Batang Lupar', '53000');
INSERT INTO `kota` VALUES ('3859', 'Bunut Hilir', '53000');
INSERT INTO `kota` VALUES ('3860', 'Bunut Hulu', '53000');
INSERT INTO `kota` VALUES ('3861', 'Embaloh Hilir', '53000');
INSERT INTO `kota` VALUES ('3862', 'Embaloh Hulu', '53000');
INSERT INTO `kota` VALUES ('3863', 'Embau', '53000');
INSERT INTO `kota` VALUES ('3864', 'Empanang', '53000');
INSERT INTO `kota` VALUES ('3865', 'Hulu Gurung', '53000');
INSERT INTO `kota` VALUES ('3866', 'Manday', '53000');
INSERT INTO `kota` VALUES ('3867', 'Seberuang', '53000');
INSERT INTO `kota` VALUES ('3868', 'Selimbau', '53000');
INSERT INTO `kota` VALUES ('3869', 'Semitau', '53000');
INSERT INTO `kota` VALUES ('3870', 'Silat Hilir', '53000');
INSERT INTO `kota` VALUES ('3871', 'Silat Hulu', '53000');
INSERT INTO `kota` VALUES ('3872', 'Batu Datu', '53000');
INSERT INTO `kota` VALUES ('3873', 'Boyan Tanjung', '53000');
INSERT INTO `kota` VALUES ('3874', 'Kalis', '53000');
INSERT INTO `kota` VALUES ('3875', 'Kedamin', '53000');
INSERT INTO `kota` VALUES ('3876', 'Mentebah', '53000');
INSERT INTO `kota` VALUES ('3877', 'Puring Kencana', '53000');
INSERT INTO `kota` VALUES ('3878', 'Suhaid', '53000');
INSERT INTO `kota` VALUES ('3879', 'Bengkayang', '42000');
INSERT INTO `kota` VALUES ('3880', 'Ledo', '53000');
INSERT INTO `kota` VALUES ('3881', 'Samalantan', '53000');
INSERT INTO `kota` VALUES ('3882', 'Sanggau Ledo', '53000');
INSERT INTO `kota` VALUES ('3883', 'Seluas', '53000');
INSERT INTO `kota` VALUES ('3884', 'Sungai Raya', '42000');
INSERT INTO `kota` VALUES ('3885', 'Jagoi Babang', '53000');
INSERT INTO `kota` VALUES ('3886', 'Monterado', '53000');
INSERT INTO `kota` VALUES ('3887', 'Suti Semarang', '53000');
INSERT INTO `kota` VALUES ('3888', 'Teriak', '53000');
INSERT INTO `kota` VALUES ('3889', 'Ngabang', '42000');
INSERT INTO `kota` VALUES ('3890', 'Air Besar', '53000');
INSERT INTO `kota` VALUES ('3891', 'Mandor', '53000');
INSERT INTO `kota` VALUES ('3892', 'Mempawah Hulu', '53000');
INSERT INTO `kota` VALUES ('3893', 'Menjalin', '53000');
INSERT INTO `kota` VALUES ('3894', 'Menyuke', '53000');
INSERT INTO `kota` VALUES ('3895', 'Sengah Temila', '53000');
INSERT INTO `kota` VALUES ('3896', 'Kuala Behe', '53000');
INSERT INTO `kota` VALUES ('3897', 'Meranti', '53000');
INSERT INTO `kota` VALUES ('3898', 'Sebangki', '53000');
INSERT INTO `kota` VALUES ('3899', 'Nanga Pinoh', '42000');
INSERT INTO `kota` VALUES ('3900', 'Belimbing', '53000');
INSERT INTO `kota` VALUES ('3901', 'Ella Hilir', '53000');
INSERT INTO `kota` VALUES ('3902', 'Menukung', '53000');
INSERT INTO `kota` VALUES ('3903', 'Sayan', '53000');
INSERT INTO `kota` VALUES ('3904', 'Serawai', '53000');
INSERT INTO `kota` VALUES ('3905', 'Sokan', '53000');
INSERT INTO `kota` VALUES ('3906', 'Tanah Pinoh', '53000');
INSERT INTO `kota` VALUES ('3907', 'Mempawah', '42000');
INSERT INTO `kota` VALUES ('3908', 'Kubu', '53000');
INSERT INTO `kota` VALUES ('3909', 'Sungai Ambawang', '53000');
INSERT INTO `kota` VALUES ('3910', 'Sungai Kakap', '53000');
INSERT INTO `kota` VALUES ('3911', 'Sungai Kunyit', '53000');
INSERT INTO `kota` VALUES ('3912', 'Sungai Pinyuh', '53000');
INSERT INTO `kota` VALUES ('3913', 'Siantan / Wajok', '42000');
INSERT INTO `kota` VALUES ('3914', 'Telok Pa\'kedai', '53000');
INSERT INTO `kota` VALUES ('3915', 'Toho', '53000');
INSERT INTO `kota` VALUES ('3916', 'Rasau Jaya', '53000');
INSERT INTO `kota` VALUES ('3917', 'Sambas', '42000');
INSERT INTO `kota` VALUES ('3918', 'Jawai', '53000');
INSERT INTO `kota` VALUES ('3919', 'Paloh', '53000');
INSERT INTO `kota` VALUES ('3920', 'Pemangkat', '53000');
INSERT INTO `kota` VALUES ('3921', 'Sejangkung', '53000');
INSERT INTO `kota` VALUES ('3922', 'Selakau', '53000');
INSERT INTO `kota` VALUES ('3923', 'Tebas', '53000');
INSERT INTO `kota` VALUES ('3924', 'Teluk Keramat', '53000');
INSERT INTO `kota` VALUES ('3925', 'Galing', '53000');
INSERT INTO `kota` VALUES ('3926', 'Jawai Selatan', '53000');
INSERT INTO `kota` VALUES ('3927', 'Sajingan', '53000');
INSERT INTO `kota` VALUES ('3928', 'Sajad', '53000');
INSERT INTO `kota` VALUES ('3929', 'Sebawi', '53000');
INSERT INTO `kota` VALUES ('3930', 'Semparuk', '53000');
INSERT INTO `kota` VALUES ('3931', 'Subah', '53000');
INSERT INTO `kota` VALUES ('3932', 'Tanggaran', '53000');
INSERT INTO `kota` VALUES ('3933', 'Tekarang', '53000');
INSERT INTO `kota` VALUES ('3934', 'Sekadau Hilir', '42000');
INSERT INTO `kota` VALUES ('3935', 'Belitang Hilir', '53000');
INSERT INTO `kota` VALUES ('3936', 'Belitang Hulu', '53000');
INSERT INTO `kota` VALUES ('3937', 'Nanga Taman', '53000');
INSERT INTO `kota` VALUES ('3938', 'Nanga Mahap', '53000');
INSERT INTO `kota` VALUES ('3939', 'Sekadau Hulu', '53000');
INSERT INTO `kota` VALUES ('3940', 'Belitang', '53000');
INSERT INTO `kota` VALUES ('3941', 'Kubu Raya', '42000');
INSERT INTO `kota` VALUES ('3942', 'Kuala Mandor', '53000');
INSERT INTO `kota` VALUES ('3943', 'Sui Ambawang', '53000');
INSERT INTO `kota` VALUES ('3944', 'Sui Kakap', '53000');
INSERT INTO `kota` VALUES ('3945', 'Sui Raya', '53000');
INSERT INTO `kota` VALUES ('3946', 'Teluk Pakedai', '53000');
INSERT INTO `kota` VALUES ('3947', 'Terentang', '53000');
INSERT INTO `kota` VALUES ('3948', 'Sukadana', '42000');
INSERT INTO `kota` VALUES ('3949', 'Pulau Maya Karimata', '53000');
INSERT INTO `kota` VALUES ('3950', 'Simpang Hilir', '53000');
INSERT INTO `kota` VALUES ('3951', 'Teluk Batang', '53000');
INSERT INTO `kota` VALUES ('3952', 'Seponti Jaya', '53000');
INSERT INTO `kota` VALUES ('3953', 'Samarinda', '41000');
INSERT INTO `kota` VALUES ('3954', 'Samarinda Seberang', '41000');
INSERT INTO `kota` VALUES ('3955', 'Palaran', '41000');
INSERT INTO `kota` VALUES ('3956', 'Samarinda Ilir', '41000');
INSERT INTO `kota` VALUES ('3957', 'Samarinda Ulu', '41000');
INSERT INTO `kota` VALUES ('3958', 'Samarinda Utara', '41000');
INSERT INTO `kota` VALUES ('3959', 'Sungai Kunjang', '41000');
INSERT INTO `kota` VALUES ('3960', 'Tenggarong', '55000');
INSERT INTO `kota` VALUES ('3961', 'Kembang Janggut', '104000');
INSERT INTO `kota` VALUES ('3962', 'Kenohan', '104000');
INSERT INTO `kota` VALUES ('3963', 'Kota Bangun', '69000');
INSERT INTO `kota` VALUES ('3964', 'Loa Kulu', '55000');
INSERT INTO `kota` VALUES ('3965', 'Muara Kaman', '69000');
INSERT INTO `kota` VALUES ('3966', 'Muara Muntai', '69000');
INSERT INTO `kota` VALUES ('3967', 'Sebulu', '69000');
INSERT INTO `kota` VALUES ('3968', 'Tabang', '104000');
INSERT INTO `kota` VALUES ('3969', 'Loa Janan', '69000');
INSERT INTO `kota` VALUES ('3970', 'Muara Badak', '55000');
INSERT INTO `kota` VALUES ('3971', 'Sanga-Sanga', '55000');
INSERT INTO `kota` VALUES ('3972', 'Marang Kayu', '69000');
INSERT INTO `kota` VALUES ('3973', 'Muara Wis', '69000');
INSERT INTO `kota` VALUES ('3974', 'Tenggarong Seberang', '69000');
INSERT INTO `kota` VALUES ('3975', 'Anggana', '69000');
INSERT INTO `kota` VALUES ('3976', 'Sendawar', '55000');
INSERT INTO `kota` VALUES ('3977', 'Barong Tongkok', '69000');
INSERT INTO `kota` VALUES ('3978', 'Bentian Besar', '104000');
INSERT INTO `kota` VALUES ('3979', 'Bongan', '104000');
INSERT INTO `kota` VALUES ('3980', 'Damai', '104000');
INSERT INTO `kota` VALUES ('3981', 'Jempang', '104000');
INSERT INTO `kota` VALUES ('3982', 'Long Apari', '104000');
INSERT INTO `kota` VALUES ('3983', 'Long Iram', '104000');
INSERT INTO `kota` VALUES ('3984', 'Long Pahangai', '104000');
INSERT INTO `kota` VALUES ('3985', 'Long Bagun', '104000');
INSERT INTO `kota` VALUES ('3986', 'Melak', '69000');
INSERT INTO `kota` VALUES ('3987', 'Muara Pahu', '69000');
INSERT INTO `kota` VALUES ('3988', 'Muara Lawa', '69000');
INSERT INTO `kota` VALUES ('3989', 'Penyinggahan', '69000');
INSERT INTO `kota` VALUES ('3990', 'Linggang Bigung', '69000');
INSERT INTO `kota` VALUES ('3991', 'Long Hubung', '104000');
INSERT INTO `kota` VALUES ('3992', 'Nyuwatan', '69000');
INSERT INTO `kota` VALUES ('3993', 'Sukabumi', '9000');
INSERT INTO `kota` VALUES ('3994', 'Bantargadung', '15000');
INSERT INTO `kota` VALUES ('3995', 'Baros', '9000');
INSERT INTO `kota` VALUES ('3996', 'Bojong Genteng', '15000');
INSERT INTO `kota` VALUES ('3997', 'Caringin', '15000');
INSERT INTO `kota` VALUES ('3998', 'Cibadak', '15000');
INSERT INTO `kota` VALUES ('3999', 'Cibitung', '15000');
INSERT INTO `kota` VALUES ('4000', 'Cicurug', '15000');
INSERT INTO `kota` VALUES ('4001', 'Cicantayan', '15000');
INSERT INTO `kota` VALUES ('4002', 'Cidahu', '15000');
INSERT INTO `kota` VALUES ('4003', 'Cidolog', '15000');
INSERT INTO `kota` VALUES ('4004', 'Cidadap', '15000');
INSERT INTO `kota` VALUES ('4005', 'Ciemas', '15000');
INSERT INTO `kota` VALUES ('4006', 'Cikidang', '15000');
INSERT INTO `kota` VALUES ('4007', 'Cikembar', '15000');
INSERT INTO `kota` VALUES ('4008', 'Cikakak', '15000');
INSERT INTO `kota` VALUES ('4009', 'Ciracap', '15000');
INSERT INTO `kota` VALUES ('4010', 'Cireunghas', '15000');
INSERT INTO `kota` VALUES ('4011', 'Cisaat', '15000');
INSERT INTO `kota` VALUES ('4012', 'Cisolok', '15000');
INSERT INTO `kota` VALUES ('4013', 'Curugkembar', '15000');
INSERT INTO `kota` VALUES ('4014', 'Gegerbitung', '15000');
INSERT INTO `kota` VALUES ('4015', 'Gunung Guruh', '15000');
INSERT INTO `kota` VALUES ('4016', 'Jampang Kulon', '15000');
INSERT INTO `kota` VALUES ('4017', 'Jampang Tengah', '15000');
INSERT INTO `kota` VALUES ('4018', 'Kabandungan', '15000');
INSERT INTO `kota` VALUES ('4019', 'Kadudampit', '15000');
INSERT INTO `kota` VALUES ('4020', 'Kalapa Nunggal', '15000');
INSERT INTO `kota` VALUES ('4021', 'Kalibunder', '15000');
INSERT INTO `kota` VALUES ('4022', 'Kebonpedes', '15000');
INSERT INTO `kota` VALUES ('4023', 'Lengkong', '15000');
INSERT INTO `kota` VALUES ('4024', 'Nagrak', '15000');
INSERT INTO `kota` VALUES ('4025', 'Nyalindung', '15000');
INSERT INTO `kota` VALUES ('4026', 'Pabuaran', '15000');
INSERT INTO `kota` VALUES ('4027', 'Parung Kuda', '15000');
INSERT INTO `kota` VALUES ('4028', 'Parakan Salak', '15000');
INSERT INTO `kota` VALUES ('4029', 'Pelabuhan Ratu', '12000');
INSERT INTO `kota` VALUES ('4030', 'Purabaya', '15000');
INSERT INTO `kota` VALUES ('4031', 'Sagaranten', '15000');
INSERT INTO `kota` VALUES ('4032', 'Simpenan', '15000');
INSERT INTO `kota` VALUES ('4033', 'Sukalarang', '15000');
INSERT INTO `kota` VALUES ('4034', 'Sukaraja', '15000');
INSERT INTO `kota` VALUES ('4035', 'Surade', '15000');
INSERT INTO `kota` VALUES ('4036', 'Tegal Buleud', '15000');
INSERT INTO `kota` VALUES ('4037', 'Waluran', '15000');
INSERT INTO `kota` VALUES ('4038', 'Warung Kiara', '15000');
INSERT INTO `kota` VALUES ('4039', 'LEMBUR SITU', '9000');
INSERT INTO `kota` VALUES ('4040', 'Cikole', '9000');
INSERT INTO `kota` VALUES ('4041', 'Citamiang', '9000');
INSERT INTO `kota` VALUES ('4042', 'GUNUNG PUYUH', '9000');
INSERT INTO `kota` VALUES ('4043', 'Warudoyong', '9000');
INSERT INTO `kota` VALUES ('4044', 'Cibeureum', '9000');
INSERT INTO `kota` VALUES ('4045', 'Cianjur', '12000');
INSERT INTO `kota` VALUES ('4046', 'Agrabinta', '15000');
INSERT INTO `kota` VALUES ('4047', 'Bojongpicung', '15000');
INSERT INTO `kota` VALUES ('4048', 'Campaka', '15000');
INSERT INTO `kota` VALUES ('4049', 'Cibeber', '15000');
INSERT INTO `kota` VALUES ('4050', 'Cibinong', '15000');
INSERT INTO `kota` VALUES ('4051', 'Cidaun', '15000');
INSERT INTO `kota` VALUES ('4052', 'CIKALONG KULON', '15000');
INSERT INTO `kota` VALUES ('4053', 'Cilaku', '15000');
INSERT INTO `kota` VALUES ('4054', 'Ciranjang', '15000');
INSERT INTO `kota` VALUES ('4055', 'Cugenang', '15000');
INSERT INTO `kota` VALUES ('4056', 'Kadupandak', '15000');
INSERT INTO `kota` VALUES ('4057', 'Karangtengah', '15000');
INSERT INTO `kota` VALUES ('4058', 'Mande', '15000');
INSERT INTO `kota` VALUES ('4059', 'Naringgul', '15000');
INSERT INTO `kota` VALUES ('4060', 'Pacet', '15000');
INSERT INTO `kota` VALUES ('4061', 'Pagelaran', '15000');
INSERT INTO `kota` VALUES ('4062', 'Sindangbarang', '15000');
INSERT INTO `kota` VALUES ('4063', 'Sukaluyu', '15000');
INSERT INTO `kota` VALUES ('4064', 'Sukanagara', '15000');
INSERT INTO `kota` VALUES ('4065', 'Sukaresmi', '15000');
INSERT INTO `kota` VALUES ('4066', 'Takokak', '15000');
INSERT INTO `kota` VALUES ('4067', 'Tanggeung', '15000');
INSERT INTO `kota` VALUES ('4068', 'Warungkondang', '15000');
INSERT INTO `kota` VALUES ('4069', 'Cipanas', '15000');
INSERT INTO `kota` VALUES ('4070', 'Campaka Mulya', '15000');
INSERT INTO `kota` VALUES ('4071', 'Cijati', '15000');
INSERT INTO `kota` VALUES ('4072', 'Cikadu', '15000');
INSERT INTO `kota` VALUES ('4073', 'Gekbrong', '15000');
INSERT INTO `kota` VALUES ('4074', 'Leles', '15000');
INSERT INTO `kota` VALUES ('4075', 'Solo', '16000');
INSERT INTO `kota` VALUES ('4076', 'Jebres', '16000');
INSERT INTO `kota` VALUES ('4077', 'Laweyan', '16000');
INSERT INTO `kota` VALUES ('4078', 'Pasar Kliwon', '16000');
INSERT INTO `kota` VALUES ('4079', 'Serengan', '16000');
INSERT INTO `kota` VALUES ('4080', 'Boyolali', '20000');
INSERT INTO `kota` VALUES ('4081', 'Ampel', '25000');
INSERT INTO `kota` VALUES ('4082', 'Andong', '25000');
INSERT INTO `kota` VALUES ('4083', 'Banyudono', '25000');
INSERT INTO `kota` VALUES ('4084', 'Cepogo', '25000');
INSERT INTO `kota` VALUES ('4085', 'Juwangi', '25000');
INSERT INTO `kota` VALUES ('4086', 'Karanggede', '25000');
INSERT INTO `kota` VALUES ('4087', 'Kemusu', '25000');
INSERT INTO `kota` VALUES ('4088', 'Klego', '25000');
INSERT INTO `kota` VALUES ('4089', 'Nogosari', '25000');
INSERT INTO `kota` VALUES ('4090', 'Sambi', '25000');
INSERT INTO `kota` VALUES ('4091', 'Sawit', '25000');
INSERT INTO `kota` VALUES ('4092', 'Selo', '25000');
INSERT INTO `kota` VALUES ('4093', 'Simo', '25000');
INSERT INTO `kota` VALUES ('4094', 'Teras', '25000');
INSERT INTO `kota` VALUES ('4095', 'Wonosegoro', '25000');
INSERT INTO `kota` VALUES ('4096', 'Musuk', '25000');
INSERT INTO `kota` VALUES ('4097', 'Mojosongo', '25000');
INSERT INTO `kota` VALUES ('4098', 'Karanganyar', '20000');
INSERT INTO `kota` VALUES ('4099', 'Jatipuro', '25000');
INSERT INTO `kota` VALUES ('4100', 'Jatiyoso', '25000');
INSERT INTO `kota` VALUES ('4101', 'Jenawi', '25000');
INSERT INTO `kota` VALUES ('4102', 'Jumantono', '25000');
INSERT INTO `kota` VALUES ('4103', 'Jumapolo', '25000');
INSERT INTO `kota` VALUES ('4104', 'Karangpandan', '25000');
INSERT INTO `kota` VALUES ('4105', 'Kebakkramat', '25000');
INSERT INTO `kota` VALUES ('4106', 'Kerjo', '25000');
INSERT INTO `kota` VALUES ('4107', 'Matesih', '25000');
INSERT INTO `kota` VALUES ('4108', 'Mojogedang', '25000');
INSERT INTO `kota` VALUES ('4109', 'Ngargoyoso', '25000');
INSERT INTO `kota` VALUES ('4110', 'Tawangmangu', '25000');
INSERT INTO `kota` VALUES ('4111', 'Colomadu', '25000');
INSERT INTO `kota` VALUES ('4112', 'Gondangrejo', '25000');
INSERT INTO `kota` VALUES ('4113', 'Jaten', '25000');
INSERT INTO `kota` VALUES ('4114', 'Tasikmadu', '25000');
INSERT INTO `kota` VALUES ('4115', 'Klaten', '20000');
INSERT INTO `kota` VALUES ('4116', 'Bayat', '25000');
INSERT INTO `kota` VALUES ('4117', 'Cawas', '25000');
INSERT INTO `kota` VALUES ('4118', 'Ceper', '25000');
INSERT INTO `kota` VALUES ('4119', 'Delanggu', '25000');
INSERT INTO `kota` VALUES ('4120', 'Gantiwarno', '25000');
INSERT INTO `kota` VALUES ('4121', 'Jatinom', '25000');
INSERT INTO `kota` VALUES ('4122', 'Jogonalan', '25000');
INSERT INTO `kota` VALUES ('4123', 'Juwiring', '25000');
INSERT INTO `kota` VALUES ('4124', 'Kalikotes', '25000');
INSERT INTO `kota` VALUES ('4125', 'Karangnongko', '25000');
INSERT INTO `kota` VALUES ('4126', 'Karanganom', '25000');
INSERT INTO `kota` VALUES ('4127', 'Karangdowo', '25000');
INSERT INTO `kota` VALUES ('4128', 'Kebonarum', '25000');
INSERT INTO `kota` VALUES ('4129', 'Kemalang', '25000');
INSERT INTO `kota` VALUES ('4130', 'Manisrenggo', '25000');
INSERT INTO `kota` VALUES ('4131', 'Pedan', '25000');
INSERT INTO `kota` VALUES ('4132', 'Polanharjo', '25000');
INSERT INTO `kota` VALUES ('4133', 'Prambanan', '25000');
INSERT INTO `kota` VALUES ('4134', 'Trucuk', '25000');
INSERT INTO `kota` VALUES ('4135', 'Tulung', '25000');
INSERT INTO `kota` VALUES ('4136', 'Wedi', '25000');
INSERT INTO `kota` VALUES ('4137', 'Wonosari', '25000');
INSERT INTO `kota` VALUES ('4138', 'Klaten Selatan', '25000');
INSERT INTO `kota` VALUES ('4139', 'Klaten Tengah', '25000');
INSERT INTO `kota` VALUES ('4140', 'Klaten Utara', '25000');
INSERT INTO `kota` VALUES ('4141', 'Sragen', '20000');
INSERT INTO `kota` VALUES ('4142', 'Gesi', '25000');
INSERT INTO `kota` VALUES ('4143', 'Gemolong', '25000');
INSERT INTO `kota` VALUES ('4144', 'Gondang', '25000');
INSERT INTO `kota` VALUES ('4145', 'Jenar', '25000');
INSERT INTO `kota` VALUES ('4146', 'Kalijambe', '25000');
INSERT INTO `kota` VALUES ('4147', 'Kedawung', '25000');
INSERT INTO `kota` VALUES ('4148', 'Miri', '25000');
INSERT INTO `kota` VALUES ('4149', 'Masaran', '25000');
INSERT INTO `kota` VALUES ('4150', 'Mondokan', '25000');
INSERT INTO `kota` VALUES ('4151', 'Ngrampal', '25000');
INSERT INTO `kota` VALUES ('4152', 'Plupuh', '25000');
INSERT INTO `kota` VALUES ('4153', 'Sambungmacan', '25000');
INSERT INTO `kota` VALUES ('4154', 'Sambirejo', '25000');
INSERT INTO `kota` VALUES ('4155', 'Sidoharjo', '25000');
INSERT INTO `kota` VALUES ('4156', 'Sukodono', '25000');
INSERT INTO `kota` VALUES ('4157', 'Sumberlawang', '25000');
INSERT INTO `kota` VALUES ('4158', 'Tanon', '25000');
INSERT INTO `kota` VALUES ('4159', 'Tangen', '25000');
INSERT INTO `kota` VALUES ('4160', 'Karangmalang', '25000');
INSERT INTO `kota` VALUES ('4161', 'Sukoharjo', '20000');
INSERT INTO `kota` VALUES ('4162', 'Bulu', '25000');
INSERT INTO `kota` VALUES ('4163', 'Mojolaban / Palur', '25000');
INSERT INTO `kota` VALUES ('4164', 'Nguter', '25000');
INSERT INTO `kota` VALUES ('4165', 'Polokarto', '25000');
INSERT INTO `kota` VALUES ('4166', 'Tawangsari', '25000');
INSERT INTO `kota` VALUES ('4167', 'Weru', '25000');
INSERT INTO `kota` VALUES ('4168', 'Baki', '25000');
INSERT INTO `kota` VALUES ('4169', 'Bendosari', '25000');
INSERT INTO `kota` VALUES ('4170', 'Gatak', '25000');
INSERT INTO `kota` VALUES ('4171', 'Grogol', '25000');
INSERT INTO `kota` VALUES ('4172', 'Kartasura', '20000');
INSERT INTO `kota` VALUES ('4173', 'Wonogiri', '20000');
INSERT INTO `kota` VALUES ('4174', 'Baturetno', '25000');
INSERT INTO `kota` VALUES ('4175', 'Batuwarno', '25000');
INSERT INTO `kota` VALUES ('4176', 'Bulukerto', '25000');
INSERT INTO `kota` VALUES ('4177', 'Eromoko', '25000');
INSERT INTO `kota` VALUES ('4178', 'Girimarto', '25000');
INSERT INTO `kota` VALUES ('4179', 'Giritontro', '25000');
INSERT INTO `kota` VALUES ('4180', 'Giriwoyo', '25000');
INSERT INTO `kota` VALUES ('4181', 'Jatipurno', '25000');
INSERT INTO `kota` VALUES ('4182', 'Jatiroto', '25000');
INSERT INTO `kota` VALUES ('4183', 'Jatisrono', '25000');
INSERT INTO `kota` VALUES ('4184', 'Karangtengah', '25000');
INSERT INTO `kota` VALUES ('4185', 'Kismantoro', '25000');
INSERT INTO `kota` VALUES ('4186', 'Manyaran', '25000');
INSERT INTO `kota` VALUES ('4187', 'Ngadirojo', '25000');
INSERT INTO `kota` VALUES ('4188', 'Nguntoronadi', '25000');
INSERT INTO `kota` VALUES ('4189', 'Pracimantoro', '25000');
INSERT INTO `kota` VALUES ('4190', 'Purwantoro', '25000');
INSERT INTO `kota` VALUES ('4191', 'Selogiri', '25000');
INSERT INTO `kota` VALUES ('4192', 'Slogohimo', '25000');
INSERT INTO `kota` VALUES ('4193', 'Tirtomoyo', '25000');
INSERT INTO `kota` VALUES ('4194', 'Wuryantoro', '25000');
INSERT INTO `kota` VALUES ('4195', 'Puhpelem', '25000');
INSERT INTO `kota` VALUES ('4196', 'Paranggupito', '25000');
INSERT INTO `kota` VALUES ('4197', 'Manokwari', '115000');
INSERT INTO `kota` VALUES ('4198', 'Amberbaken', '144000');
INSERT INTO `kota` VALUES ('4199', 'Anggi', '144000');
INSERT INTO `kota` VALUES ('4200', 'Kebar', '144000');
INSERT INTO `kota` VALUES ('4201', 'Oransbari', '144000');
INSERT INTO `kota` VALUES ('4202', 'Ransiki', '144000');
INSERT INTO `kota` VALUES ('4203', 'Warmare', '144000');
INSERT INTO `kota` VALUES ('4204', 'Masni', '144000');
INSERT INTO `kota` VALUES ('4205', 'Minyambouw', '144000');
INSERT INTO `kota` VALUES ('4206', 'Prafi', '144000');
INSERT INTO `kota` VALUES ('4207', 'Sugurey', '144000');
INSERT INTO `kota` VALUES ('4208', 'Sorong', '80000');
INSERT INTO `kota` VALUES ('4209', 'Makbon', '144000');
INSERT INTO `kota` VALUES ('4210', 'Moraid', '144000');
INSERT INTO `kota` VALUES ('4211', 'Salawati', '144000');
INSERT INTO `kota` VALUES ('4212', 'Sausapor', '144000');
INSERT INTO `kota` VALUES ('4213', 'Seget', '144000');
INSERT INTO `kota` VALUES ('4214', 'Abun', '144000');
INSERT INTO `kota` VALUES ('4215', 'Aimas', '144000');
INSERT INTO `kota` VALUES ('4216', 'Beraur', '144000');
INSERT INTO `kota` VALUES ('4217', 'Fef', '144000');
INSERT INTO `kota` VALUES ('4218', 'Klamono', '144000');
INSERT INTO `kota` VALUES ('4219', 'Sayosa', '144000');
INSERT INTO `kota` VALUES ('4220', 'Segun', '144000');
INSERT INTO `kota` VALUES ('4221', 'Sorong Barat', '80000');
INSERT INTO `kota` VALUES ('4222', 'Sorong Timur', '80000');
INSERT INTO `kota` VALUES ('4223', 'FAK-FAK', '115000');
INSERT INTO `kota` VALUES ('4224', 'Fakfak Barat', '144000');
INSERT INTO `kota` VALUES ('4225', 'Fakfak Timur', '144000');
INSERT INTO `kota` VALUES ('4226', 'Kokas', '144000');
INSERT INTO `kota` VALUES ('4227', 'Kaimana', '115000');
INSERT INTO `kota` VALUES ('4228', 'Buruwai', '144000');
INSERT INTO `kota` VALUES ('4229', 'Teluk Arguni', '144000');
INSERT INTO `kota` VALUES ('4230', 'Teluk Etna', '144000');
INSERT INTO `kota` VALUES ('4231', 'Waisai', '115000');
INSERT INTO `kota` VALUES ('4232', 'Kepulauan Ayau', '144000');
INSERT INTO `kota` VALUES ('4233', 'Kofiau', '144000');
INSERT INTO `kota` VALUES ('4234', 'Misool', '144000');
INSERT INTO `kota` VALUES ('4235', 'Misool Timur Selatan', '144000');
INSERT INTO `kota` VALUES ('4236', 'Samate', '144000');
INSERT INTO `kota` VALUES ('4237', 'Teluk Mayalibit', '144000');
INSERT INTO `kota` VALUES ('4238', 'Waigeo Barat', '144000');
INSERT INTO `kota` VALUES ('4239', 'Waigeo Selatan', '144000');
INSERT INTO `kota` VALUES ('4240', 'Waigeo Timur', '144000');
INSERT INTO `kota` VALUES ('4241', 'Waigeo Utara', '144000');
INSERT INTO `kota` VALUES ('4242', 'Teminabuan', '115000');
INSERT INTO `kota` VALUES ('4243', 'Aifat', '144000');
INSERT INTO `kota` VALUES ('4244', 'Aifat Timur', '144000');
INSERT INTO `kota` VALUES ('4245', 'Aitinyo', '144000');
INSERT INTO `kota` VALUES ('4246', 'Ayamaru', '144000');
INSERT INTO `kota` VALUES ('4247', 'Ayamaru Utara', '144000');
INSERT INTO `kota` VALUES ('4248', 'Inanwatan', '144000');
INSERT INTO `kota` VALUES ('4249', 'Kais', '144000');
INSERT INTO `kota` VALUES ('4250', 'Kokoda', '144000');
INSERT INTO `kota` VALUES ('4251', 'Mare', '144000');
INSERT INTO `kota` VALUES ('4252', 'Moswaren', '144000');
INSERT INTO `kota` VALUES ('4253', 'Sawiat', '144000');
INSERT INTO `kota` VALUES ('4254', 'Seremuk', '144000');
INSERT INTO `kota` VALUES ('4255', 'Wayer', '144000');
INSERT INTO `kota` VALUES ('4256', 'Bintuni', '115000');
INSERT INTO `kota` VALUES ('4257', 'Aranday', '144000');
INSERT INTO `kota` VALUES ('4258', 'Babo', '144000');
INSERT INTO `kota` VALUES ('4259', 'Fafuwar', '144000');
INSERT INTO `kota` VALUES ('4260', 'Door', '144000');
INSERT INTO `kota` VALUES ('4261', 'Kuri', '144000');
INSERT INTO `kota` VALUES ('4262', 'Merdey', '144000');
INSERT INTO `kota` VALUES ('4263', 'Moskona Selatan', '144000');
INSERT INTO `kota` VALUES ('4264', 'Moskona Utara', '144000');
INSERT INTO `kota` VALUES ('4265', 'Tembuni', '144000');
INSERT INTO `kota` VALUES ('4266', 'Rasei', '115000');
INSERT INTO `kota` VALUES ('4267', 'Rumberpon', '144000');
INSERT INTO `kota` VALUES ('4268', 'Wamesa', '144000');
INSERT INTO `kota` VALUES ('4269', 'Wasior', '144000');
INSERT INTO `kota` VALUES ('4270', 'Wasior Barat', '144000');
INSERT INTO `kota` VALUES ('4271', 'Wasior Selatan', '144000');
INSERT INTO `kota` VALUES ('4272', 'Wasior Utara', '144000');
INSERT INTO `kota` VALUES ('4273', 'Windesi', '144000');
INSERT INTO `kota` VALUES ('4274', 'Semarang', '16000');
INSERT INTO `kota` VALUES ('4275', 'Banyumanik', '16000');
INSERT INTO `kota` VALUES ('4276', 'Candisari', '16000');
INSERT INTO `kota` VALUES ('4277', 'Gajahmungkur', '16000');
INSERT INTO `kota` VALUES ('4278', 'Gayamsari', '16000');
INSERT INTO `kota` VALUES ('4279', 'Genuk', '16000');
INSERT INTO `kota` VALUES ('4280', 'Gunungpati', '16000');
INSERT INTO `kota` VALUES ('4281', 'Mijen', '16000');
INSERT INTO `kota` VALUES ('4282', 'Ngaliyan', '16000');
INSERT INTO `kota` VALUES ('4283', 'Pedurungan', '16000');
INSERT INTO `kota` VALUES ('4284', 'Semarang Barat', '16000');
INSERT INTO `kota` VALUES ('4285', 'Semarang Selatan', '16000');
INSERT INTO `kota` VALUES ('4286', 'Semarang Tengah', '16000');
INSERT INTO `kota` VALUES ('4287', 'Semarang Timur', '16000');
INSERT INTO `kota` VALUES ('4288', 'Semarang Utara', '16000');
INSERT INTO `kota` VALUES ('4289', 'Tembalang', '16000');
INSERT INTO `kota` VALUES ('4290', 'Tugu', '16000');
INSERT INTO `kota` VALUES ('4291', 'Jepara', '20000');
INSERT INTO `kota` VALUES ('4292', 'Bangsri', '25000');
INSERT INTO `kota` VALUES ('4293', 'Batealit', '25000');
INSERT INTO `kota` VALUES ('4294', 'Karimunjawa', '38000');
INSERT INTO `kota` VALUES ('4295', 'Kedung', '25000');
INSERT INTO `kota` VALUES ('4296', 'Keling', '25000');
INSERT INTO `kota` VALUES ('4297', 'Mayong', '25000');
INSERT INTO `kota` VALUES ('4298', 'Mlonggo', '25000');
INSERT INTO `kota` VALUES ('4299', 'Nalumsari', '25000');
INSERT INTO `kota` VALUES ('4300', 'Pecangaan', '25000');
INSERT INTO `kota` VALUES ('4301', 'Welahan', '25000');
INSERT INTO `kota` VALUES ('4302', 'Kalinyamatan', '25000');
INSERT INTO `kota` VALUES ('4303', 'Kembang', '25000');
INSERT INTO `kota` VALUES ('4304', 'Tahunan', '25000');
INSERT INTO `kota` VALUES ('4305', 'Kudus', '20000');
INSERT INTO `kota` VALUES ('4306', 'Dawe', '25000');
INSERT INTO `kota` VALUES ('4307', 'Jekulo', '25000');
INSERT INTO `kota` VALUES ('4308', 'Mejobo', '25000');
INSERT INTO `kota` VALUES ('4309', 'Undaan', '25000');
INSERT INTO `kota` VALUES ('4310', 'Gebog', '25000');
INSERT INTO `kota` VALUES ('4311', 'Jati', '25000');
INSERT INTO `kota` VALUES ('4312', 'Kaliwungu', '25000');
INSERT INTO `kota` VALUES ('4313', 'Bae', '25000');
INSERT INTO `kota` VALUES ('4314', 'Pekalongan', '20000');
INSERT INTO `kota` VALUES ('4315', 'Pekalongan Barat', '20000');
INSERT INTO `kota` VALUES ('4316', 'Pekalongan Selatan', '20000');
INSERT INTO `kota` VALUES ('4317', 'Pekalongan Timur', '20000');
INSERT INTO `kota` VALUES ('4318', 'Pekalongan Utara', '20000');
INSERT INTO `kota` VALUES ('4319', 'Purwokerto', '20000');
INSERT INTO `kota` VALUES ('4320', 'Ajibarang', '20000');
INSERT INTO `kota` VALUES ('4321', 'Banyumas', '20000');
INSERT INTO `kota` VALUES ('4322', 'Baturaden', '25000');
INSERT INTO `kota` VALUES ('4323', 'Cilongok', '25000');
INSERT INTO `kota` VALUES ('4324', 'Gumelar', '25000');
INSERT INTO `kota` VALUES ('4325', 'Jatilawang', '25000');
INSERT INTO `kota` VALUES ('4326', 'Kalibagor', '25000');
INSERT INTO `kota` VALUES ('4327', 'Karanglewas', '25000');
INSERT INTO `kota` VALUES ('4328', 'Kebasen', '25000');
INSERT INTO `kota` VALUES ('4329', 'Kedungbanteng', '25000');
INSERT INTO `kota` VALUES ('4330', 'Kembaran', '25000');
INSERT INTO `kota` VALUES ('4331', 'Kemranjen', '25000');
INSERT INTO `kota` VALUES ('4332', 'Lumbir', '25000');
INSERT INTO `kota` VALUES ('4333', 'Pakuncen', '25000');
INSERT INTO `kota` VALUES ('4334', 'Patikraja', '25000');
INSERT INTO `kota` VALUES ('4335', 'Purwojati', '25000');
INSERT INTO `kota` VALUES ('4336', 'Rawalo', '25000');
INSERT INTO `kota` VALUES ('4337', 'Sokaraja', '25000');
INSERT INTO `kota` VALUES ('4338', 'Somagede', '25000');
INSERT INTO `kota` VALUES ('4339', 'Sumpyuh /Sumpiuh', '25000');
INSERT INTO `kota` VALUES ('4340', 'Sumbang', '25000');
INSERT INTO `kota` VALUES ('4341', 'Tambak', '25000');
INSERT INTO `kota` VALUES ('4342', 'Wangon', '25000');
INSERT INTO `kota` VALUES ('4343', 'Purwokerto Barat', '25000');
INSERT INTO `kota` VALUES ('4344', 'Purwokerto Selatan', '25000');
INSERT INTO `kota` VALUES ('4345', 'Purwokerto Timur', '25000');
INSERT INTO `kota` VALUES ('4346', 'Purwokerto Utara', '25000');
INSERT INTO `kota` VALUES ('4347', 'Batang', '20000');
INSERT INTO `kota` VALUES ('4348', 'Bandar', '25000');
INSERT INTO `kota` VALUES ('4349', 'Bawang', '25000');
INSERT INTO `kota` VALUES ('4350', 'Blado', '25000');
INSERT INTO `kota` VALUES ('4351', 'Gringsing', '25000');
INSERT INTO `kota` VALUES ('4352', 'Limpung', '25000');
INSERT INTO `kota` VALUES ('4353', 'Reban', '25000');
INSERT INTO `kota` VALUES ('4354', 'Subah', '25000');
INSERT INTO `kota` VALUES ('4355', 'Tersono', '25000');
INSERT INTO `kota` VALUES ('4356', 'Tulis', '25000');
INSERT INTO `kota` VALUES ('4357', 'Warungasem', '25000');
INSERT INTO `kota` VALUES ('4358', 'Wonotunggal', '25000');
INSERT INTO `kota` VALUES ('4359', 'Banyuputih', '25000');
INSERT INTO `kota` VALUES ('4360', 'Kandeman', '25000');
INSERT INTO `kota` VALUES ('4361', 'Pecalungan', '25000');
INSERT INTO `kota` VALUES ('4362', 'Blora', '20000');
INSERT INTO `kota` VALUES ('4363', 'Banjarejo', '25000');
INSERT INTO `kota` VALUES ('4364', 'Bogorejo', '25000');
INSERT INTO `kota` VALUES ('4365', 'Japah', '25000');
INSERT INTO `kota` VALUES ('4366', 'Jepon', '25000');
INSERT INTO `kota` VALUES ('4367', 'Kunduran', '25000');
INSERT INTO `kota` VALUES ('4368', 'Todanan', '25000');
INSERT INTO `kota` VALUES ('4369', 'Tunjungan', '25000');
INSERT INTO `kota` VALUES ('4370', 'Cepu', '20000');
INSERT INTO `kota` VALUES ('4371', 'Jiken', '25000');
INSERT INTO `kota` VALUES ('4372', 'Kedungtuban', '25000');
INSERT INTO `kota` VALUES ('4373', 'Kradenan /menden', '25000');
INSERT INTO `kota` VALUES ('4374', 'Randublatung', '25000');
INSERT INTO `kota` VALUES ('4375', 'Sambong', '25000');
INSERT INTO `kota` VALUES ('4376', 'Bojonegoro', '20000');
INSERT INTO `kota` VALUES ('4377', 'Balen', '25000');
INSERT INTO `kota` VALUES ('4378', 'Baureno', '25000');
INSERT INTO `kota` VALUES ('4379', 'Bubulan', '25000');
INSERT INTO `kota` VALUES ('4380', 'Dander', '25000');
INSERT INTO `kota` VALUES ('4381', 'Kalitidu', '25000');
INSERT INTO `kota` VALUES ('4382', 'Kanor', '25000');
INSERT INTO `kota` VALUES ('4383', 'Kapas', '25000');
INSERT INTO `kota` VALUES ('4384', 'Kasiman', '25000');
INSERT INTO `kota` VALUES ('4385', 'Kedungadem', '25000');
INSERT INTO `kota` VALUES ('4386', 'Kepohbaru', '25000');
INSERT INTO `kota` VALUES ('4387', 'Malo', '25000');
INSERT INTO `kota` VALUES ('4388', 'Margomulyo', '25000');
INSERT INTO `kota` VALUES ('4389', 'Ngambon', '25000');
INSERT INTO `kota` VALUES ('4390', 'Ngasem', '25000');
INSERT INTO `kota` VALUES ('4391', 'Ngraho', '25000');
INSERT INTO `kota` VALUES ('4392', 'Padangan', '25000');
INSERT INTO `kota` VALUES ('4393', 'Sugihwaras', '25000');
INSERT INTO `kota` VALUES ('4394', 'Sumberejo', '25000');
INSERT INTO `kota` VALUES ('4395', 'Tambakrejo', '25000');
INSERT INTO `kota` VALUES ('4396', 'Temayang', '25000');
INSERT INTO `kota` VALUES ('4397', 'Kedewan', '25000');
INSERT INTO `kota` VALUES ('4398', 'Sekar', '25000');
INSERT INTO `kota` VALUES ('4399', 'Sukosewu', '25000');
INSERT INTO `kota` VALUES ('4400', 'Brebes', '20000');
INSERT INTO `kota` VALUES ('4401', 'Banjarharjo', '25000');
INSERT INTO `kota` VALUES ('4402', 'Bantarkawung', '25000');
INSERT INTO `kota` VALUES ('4403', 'Bulakamba', '25000');
INSERT INTO `kota` VALUES ('4404', 'Bumiayu', '20000');
INSERT INTO `kota` VALUES ('4405', 'Jatibarang', '25000');
INSERT INTO `kota` VALUES ('4406', 'Kersana', '25000');
INSERT INTO `kota` VALUES ('4407', 'Ketanggungan', '25000');
INSERT INTO `kota` VALUES ('4408', 'Larangan', '25000');
INSERT INTO `kota` VALUES ('4409', 'Losari', '25000');
INSERT INTO `kota` VALUES ('4410', 'Paguyangan', '25000');
INSERT INTO `kota` VALUES ('4411', 'Salem', '25000');
INSERT INTO `kota` VALUES ('4412', 'Sirampog', '25000');
INSERT INTO `kota` VALUES ('4413', 'Songgom', '25000');
INSERT INTO `kota` VALUES ('4414', 'Tanjung', '25000');
INSERT INTO `kota` VALUES ('4415', 'Tonjong', '25000');
INSERT INTO `kota` VALUES ('4416', 'Wanasari', '25000');
INSERT INTO `kota` VALUES ('4417', 'Demak', '20000');
INSERT INTO `kota` VALUES ('4418', 'Bonang', '25000');
INSERT INTO `kota` VALUES ('4419', 'Dempet', '25000');
INSERT INTO `kota` VALUES ('4420', 'Gajah', '25000');
INSERT INTO `kota` VALUES ('4421', 'Guntur', '25000');
INSERT INTO `kota` VALUES ('4422', 'Karangawen', '25000');
INSERT INTO `kota` VALUES ('4423', 'Karanganyar', '25000');
INSERT INTO `kota` VALUES ('4424', 'Mijen', '25000');
INSERT INTO `kota` VALUES ('4425', 'Mranggen', '25000');
INSERT INTO `kota` VALUES ('4426', 'Sayung', '25000');
INSERT INTO `kota` VALUES ('4427', 'Wedung', '25000');
INSERT INTO `kota` VALUES ('4428', 'Wonosalam', '25000');
INSERT INTO `kota` VALUES ('4429', 'Kebonagung', '25000');
INSERT INTO `kota` VALUES ('4430', 'Kendal', '20000');
INSERT INTO `kota` VALUES ('4431', 'Boja', '25000');
INSERT INTO `kota` VALUES ('4432', 'Brangsong', '25000');
INSERT INTO `kota` VALUES ('4433', 'Cepiring', '25000');
INSERT INTO `kota` VALUES ('4434', 'Gemuh', '25000');
INSERT INTO `kota` VALUES ('4435', 'Limbangan', '25000');
INSERT INTO `kota` VALUES ('4436', 'Pagerruyung', '25000');
INSERT INTO `kota` VALUES ('4437', 'Patebon', '25000');
INSERT INTO `kota` VALUES ('4438', 'Patean', '25000');
INSERT INTO `kota` VALUES ('4439', 'Pegandon', '25000');
INSERT INTO `kota` VALUES ('4440', 'Plantungan', '25000');
INSERT INTO `kota` VALUES ('4441', 'Sukorejo', '25000');
INSERT INTO `kota` VALUES ('4442', 'Weleri', '25000');
INSERT INTO `kota` VALUES ('4443', 'Kangkung', '25000');
INSERT INTO `kota` VALUES ('4444', 'Ngampel', '25000');
INSERT INTO `kota` VALUES ('4445', 'Ringinarum', '25000');
INSERT INTO `kota` VALUES ('4446', 'Rowosari /Weleri Utara', '25000');
INSERT INTO `kota` VALUES ('4447', 'Singorojo', '25000');
INSERT INTO `kota` VALUES ('4448', 'Pati', '20000');
INSERT INTO `kota` VALUES ('4449', 'Batangan', '25000');
INSERT INTO `kota` VALUES ('4450', 'Cluwak', '25000');
INSERT INTO `kota` VALUES ('4451', 'Dukuhseti', '25000');
INSERT INTO `kota` VALUES ('4452', 'Gabus', '25000');
INSERT INTO `kota` VALUES ('4453', 'Gembong', '25000');
INSERT INTO `kota` VALUES ('4454', 'Gunungwungkal', '25000');
INSERT INTO `kota` VALUES ('4455', 'Jaken', '25000');
INSERT INTO `kota` VALUES ('4456', 'Jakenan', '25000');
INSERT INTO `kota` VALUES ('4457', 'Juwana', '25000');
INSERT INTO `kota` VALUES ('4458', 'Kayen', '25000');
INSERT INTO `kota` VALUES ('4459', 'Margorejo', '25000');
INSERT INTO `kota` VALUES ('4460', 'Margoyoso', '25000');
INSERT INTO `kota` VALUES ('4461', 'Pucakwangi', '25000');
INSERT INTO `kota` VALUES ('4462', 'Sukolilo', '25000');
INSERT INTO `kota` VALUES ('4463', 'Tambakromo', '25000');
INSERT INTO `kota` VALUES ('4464', 'Tayu', '25000');
INSERT INTO `kota` VALUES ('4465', 'Telogowungu', '25000');
INSERT INTO `kota` VALUES ('4466', 'Trangkil', '25000');
INSERT INTO `kota` VALUES ('4467', 'Wedarijaksa', '25000');
INSERT INTO `kota` VALUES ('4468', 'Winong', '25000');
INSERT INTO `kota` VALUES ('4469', 'Pemalang', '20000');
INSERT INTO `kota` VALUES ('4470', 'Ampelgading', '25000');
INSERT INTO `kota` VALUES ('4471', 'Bantarbolang', '25000');
INSERT INTO `kota` VALUES ('4472', 'Belik', '25000');
INSERT INTO `kota` VALUES ('4473', 'Bodeh', '25000');
INSERT INTO `kota` VALUES ('4474', 'Comal', '25000');
INSERT INTO `kota` VALUES ('4475', 'Moga', '25000');
INSERT INTO `kota` VALUES ('4476', 'Petarukan', '25000');
INSERT INTO `kota` VALUES ('4477', 'Pulosari', '25000');
INSERT INTO `kota` VALUES ('4478', 'Randudongkal', '25000');
INSERT INTO `kota` VALUES ('4479', 'Taman', '25000');
INSERT INTO `kota` VALUES ('4480', 'Ulujami', '25000');
INSERT INTO `kota` VALUES ('4481', 'Warungpring', '25000');
INSERT INTO `kota` VALUES ('4482', 'Watukumpul', '25000');
INSERT INTO `kota` VALUES ('4483', 'Purwodadi', '20000');
INSERT INTO `kota` VALUES ('4484', 'Brati', '25000');
INSERT INTO `kota` VALUES ('4485', 'Geyer', '25000');
INSERT INTO `kota` VALUES ('4486', 'Godong', '25000');
INSERT INTO `kota` VALUES ('4487', 'Grobogan', '25000');
INSERT INTO `kota` VALUES ('4488', 'Gubug', '25000');
INSERT INTO `kota` VALUES ('4489', 'Karangrayung', '25000');
INSERT INTO `kota` VALUES ('4490', 'Kedungjati', '25000');
INSERT INTO `kota` VALUES ('4491', 'Klambu', '25000');
INSERT INTO `kota` VALUES ('4492', 'Kradenan', '25000');
INSERT INTO `kota` VALUES ('4493', 'Ngaringan', '25000');
INSERT INTO `kota` VALUES ('4494', 'Penawangan', '25000');
INSERT INTO `kota` VALUES ('4495', 'Pulokulon', '25000');
INSERT INTO `kota` VALUES ('4496', 'Tanggungharjo', '25000');
INSERT INTO `kota` VALUES ('4497', 'Tawangharjo', '25000');
INSERT INTO `kota` VALUES ('4498', 'Tegowanu', '25000');
INSERT INTO `kota` VALUES ('4499', 'Toroh', '25000');
INSERT INTO `kota` VALUES ('4500', 'Wirosari', '25000');
INSERT INTO `kota` VALUES ('4501', 'Rembang', '20000');
INSERT INTO `kota` VALUES ('4502', 'Gunem', '25000');
INSERT INTO `kota` VALUES ('4503', 'Kaliori', '25000');
INSERT INTO `kota` VALUES ('4504', 'Kragan', '25000');
INSERT INTO `kota` VALUES ('4505', 'Lasem', '25000');
INSERT INTO `kota` VALUES ('4506', 'Pamotan', '25000');
INSERT INTO `kota` VALUES ('4507', 'Pancur', '25000');
INSERT INTO `kota` VALUES ('4508', 'Sale', '25000');
INSERT INTO `kota` VALUES ('4509', 'Sarang', '25000');
INSERT INTO `kota` VALUES ('4510', 'Sedan', '25000');
INSERT INTO `kota` VALUES ('4511', 'Sluke', '25000');
INSERT INTO `kota` VALUES ('4512', 'Sulang', '25000');
INSERT INTO `kota` VALUES ('4513', 'Sumber', '25000');
INSERT INTO `kota` VALUES ('4514', 'Salatiga', '20000');
INSERT INTO `kota` VALUES ('4515', 'Argomulyo', '20000');
INSERT INTO `kota` VALUES ('4516', 'Sidomukti', '20000');
INSERT INTO `kota` VALUES ('4517', 'Sidorejo', '20000');
INSERT INTO `kota` VALUES ('4518', 'Tingkir', '20000');
INSERT INTO `kota` VALUES ('4519', 'Slawi', '20000');
INSERT INTO `kota` VALUES ('4520', 'Balapulang', '25000');
INSERT INTO `kota` VALUES ('4521', 'Bojong', '25000');
INSERT INTO `kota` VALUES ('4522', 'Bumijawa', '25000');
INSERT INTO `kota` VALUES ('4523', 'Dukuhwaru', '25000');
INSERT INTO `kota` VALUES ('4524', 'Jatinegara', '25000');
INSERT INTO `kota` VALUES ('4525', 'Lebaksiu', '25000');
INSERT INTO `kota` VALUES ('4526', 'Margasari', '25000');
INSERT INTO `kota` VALUES ('4527', 'Pagerbarang', '25000');
INSERT INTO `kota` VALUES ('4528', 'Pangkah', '25000');
INSERT INTO `kota` VALUES ('4529', 'Adiwerna', '25000');
INSERT INTO `kota` VALUES ('4530', 'Dukuhturi', '25000');
INSERT INTO `kota` VALUES ('4531', 'Kramat', '25000');
INSERT INTO `kota` VALUES ('4532', 'Suradadi', '25000');
INSERT INTO `kota` VALUES ('4533', 'Talang', '25000');
INSERT INTO `kota` VALUES ('4534', 'Tarub', '25000');
INSERT INTO `kota` VALUES ('4535', 'Warureja', '25000');
INSERT INTO `kota` VALUES ('4536', 'Tegal', '20000');
INSERT INTO `kota` VALUES ('4537', 'Margadana', '20000');
INSERT INTO `kota` VALUES ('4538', 'Tegal Barat', '20000');
INSERT INTO `kota` VALUES ('4539', 'Tegal Selatan', '20000');
INSERT INTO `kota` VALUES ('4540', 'Tegal Timur', '20000');
INSERT INTO `kota` VALUES ('4541', 'Ungaran', '16000');
INSERT INTO `kota` VALUES ('4542', 'Ambarawa', '20000');
INSERT INTO `kota` VALUES ('4543', 'Banyubiru', '25000');
INSERT INTO `kota` VALUES ('4544', 'Bancak', '25000');
INSERT INTO `kota` VALUES ('4545', 'Bawen / Doplang', '25000');
INSERT INTO `kota` VALUES ('4546', 'Bergas', '25000');
INSERT INTO `kota` VALUES ('4547', 'Bringin', '25000');
INSERT INTO `kota` VALUES ('4548', 'Getasan', '25000');
INSERT INTO `kota` VALUES ('4549', 'Jambu', '25000');
INSERT INTO `kota` VALUES ('4550', 'Pabelan', '25000');
INSERT INTO `kota` VALUES ('4551', 'Pringapus', '25000');
INSERT INTO `kota` VALUES ('4552', 'Susukan', '25000');
INSERT INTO `kota` VALUES ('4553', 'Suruh', '25000');
INSERT INTO `kota` VALUES ('4554', 'Sumowono', '25000');
INSERT INTO `kota` VALUES ('4555', 'Tengaran', '25000');
INSERT INTO `kota` VALUES ('4556', 'Tuntang', '25000');
INSERT INTO `kota` VALUES ('4557', 'Ungaran Barat', '25000');
INSERT INTO `kota` VALUES ('4558', 'Ungaran Timur', '25000');
INSERT INTO `kota` VALUES ('4559', 'Purbalingga', '20000');
INSERT INTO `kota` VALUES ('4560', 'Bobotsari', '25000');
INSERT INTO `kota` VALUES ('4561', 'Bojongsari', '25000');
INSERT INTO `kota` VALUES ('4562', 'Bukateja', '25000');
INSERT INTO `kota` VALUES ('4563', 'Kaligondang', '25000');
INSERT INTO `kota` VALUES ('4564', 'Kalimanah', '25000');
INSERT INTO `kota` VALUES ('4565', 'Karangmoncol', '25000');
INSERT INTO `kota` VALUES ('4566', 'Karangreja', '25000');
INSERT INTO `kota` VALUES ('4567', 'Kejobong', '25000');
INSERT INTO `kota` VALUES ('4568', 'Kemangkon', '25000');
INSERT INTO `kota` VALUES ('4569', 'Kutasari', '25000');
INSERT INTO `kota` VALUES ('4570', 'Mrebet', '25000');
INSERT INTO `kota` VALUES ('4571', 'Karangjambu', '25000');
INSERT INTO `kota` VALUES ('4572', 'Kertanegara', '25000');
INSERT INTO `kota` VALUES ('4573', 'Padamara', '25000');
INSERT INTO `kota` VALUES ('4574', 'Pengadegan', '25000');
INSERT INTO `kota` VALUES ('4575', 'Banjarnegara', '20000');
INSERT INTO `kota` VALUES ('4576', 'Banjarmangu', '25000');
INSERT INTO `kota` VALUES ('4577', 'Batur', '25000');
INSERT INTO `kota` VALUES ('4578', 'Kalibening', '25000');
INSERT INTO `kota` VALUES ('4579', 'Karangkobar', '25000');
INSERT INTO `kota` VALUES ('4580', 'Madukara', '25000');
INSERT INTO `kota` VALUES ('4581', 'Mandiraja', '25000');
INSERT INTO `kota` VALUES ('4582', 'Pagentan', '25000');
INSERT INTO `kota` VALUES ('4583', 'Pejawaran', '25000');
INSERT INTO `kota` VALUES ('4584', 'Punggelan', '25000');
INSERT INTO `kota` VALUES ('4585', 'Purwanegara', '25000');
INSERT INTO `kota` VALUES ('4586', 'Purworejo Klampok', '25000');
INSERT INTO `kota` VALUES ('4587', 'Rakit', '25000');
INSERT INTO `kota` VALUES ('4588', 'Sigaluh', '25000');
INSERT INTO `kota` VALUES ('4589', 'Wanadadi', '25000');
INSERT INTO `kota` VALUES ('4590', 'Wanayasa', '25000');
INSERT INTO `kota` VALUES ('4591', 'Kajen', '25000');
INSERT INTO `kota` VALUES ('4592', 'Buaran', '25000');
INSERT INTO `kota` VALUES ('4593', 'Doro', '25000');
INSERT INTO `kota` VALUES ('4594', 'KANDANG SERANG', '25000');
INSERT INTO `kota` VALUES ('4595', 'Karangdadap', '25000');
INSERT INTO `kota` VALUES ('4596', 'Kedungwuni', '25000');
INSERT INTO `kota` VALUES ('4597', 'Kesesi', '25000');
INSERT INTO `kota` VALUES ('4598', 'LEBAK BARANG', '25000');
INSERT INTO `kota` VALUES ('4599', 'Paninggaran', '25000');
INSERT INTO `kota` VALUES ('4600', 'Petungkriono', '25000');
INSERT INTO `kota` VALUES ('4601', 'Siwalan', '25000');
INSERT INTO `kota` VALUES ('4602', 'Sragi', '25000');
INSERT INTO `kota` VALUES ('4603', 'Talun', '25000');
INSERT INTO `kota` VALUES ('4604', 'Tirto', '25000');
INSERT INTO `kota` VALUES ('4605', 'Wiradesa', '25000');
INSERT INTO `kota` VALUES ('4606', 'Wonokerto', '25000');
INSERT INTO `kota` VALUES ('4607', 'Wonopringgo', '25000');
INSERT INTO `kota` VALUES ('4608', 'Surabaya', '17000');
INSERT INTO `kota` VALUES ('4609', 'Asemrowo', '17000');
INSERT INTO `kota` VALUES ('4610', 'Benowo', '17000');
INSERT INTO `kota` VALUES ('4611', 'Bubutan', '17000');
INSERT INTO `kota` VALUES ('4612', 'Bulak', '17000');
INSERT INTO `kota` VALUES ('4613', 'Dukuh Pakis', '17000');
INSERT INTO `kota` VALUES ('4614', 'Gayungan', '17000');
INSERT INTO `kota` VALUES ('4615', 'Genteng', '17000');
INSERT INTO `kota` VALUES ('4616', 'Gubeng', '17000');
INSERT INTO `kota` VALUES ('4617', 'Gununganyar', '17000');
INSERT INTO `kota` VALUES ('4618', 'Jambangan', '17000');
INSERT INTO `kota` VALUES ('4619', 'Karangpilang', '17000');
INSERT INTO `kota` VALUES ('4620', 'Kenjeran', '17000');
INSERT INTO `kota` VALUES ('4621', 'Krembangan', '17000');
INSERT INTO `kota` VALUES ('4622', 'Lakarsantri', '17000');
INSERT INTO `kota` VALUES ('4623', 'Mulyorejo', '17000');
INSERT INTO `kota` VALUES ('4624', 'Pabean Cantikan', '17000');
INSERT INTO `kota` VALUES ('4625', 'Pakal', '17000');
INSERT INTO `kota` VALUES ('4626', 'Rungkut', '17000');
INSERT INTO `kota` VALUES ('4627', 'Sambikerep', '17000');
INSERT INTO `kota` VALUES ('4628', 'Sawahan', '17000');
INSERT INTO `kota` VALUES ('4629', 'Semampir', '17000');
INSERT INTO `kota` VALUES ('4630', 'Simokerto', '17000');
INSERT INTO `kota` VALUES ('4631', 'Sukolilo', '17000');
INSERT INTO `kota` VALUES ('4632', 'Sukomanunggal', '17000');
INSERT INTO `kota` VALUES ('4633', 'Tambaksari', '17000');
INSERT INTO `kota` VALUES ('4634', 'Tandes', '17000');
INSERT INTO `kota` VALUES ('4635', 'Tegalsari', '17000');
INSERT INTO `kota` VALUES ('4636', 'Tenggilis Mejoyo', '17000');
INSERT INTO `kota` VALUES ('4637', 'Wiyung', '17000');
INSERT INTO `kota` VALUES ('4638', 'Wonocolo', '17000');
INSERT INTO `kota` VALUES ('4639', 'Wonokromo', '17000');
INSERT INTO `kota` VALUES ('4640', 'Gresik', '17000');
INSERT INTO `kota` VALUES ('4641', 'Balongpanggang', '27000');
INSERT INTO `kota` VALUES ('4642', 'Benjeng', '27000');
INSERT INTO `kota` VALUES ('4643', 'Bungah', '27000');
INSERT INTO `kota` VALUES ('4644', 'Cerme', '27000');
INSERT INTO `kota` VALUES ('4645', 'Driyorejo', '27000');
INSERT INTO `kota` VALUES ('4646', 'Duduk Sampeyan', '27000');
INSERT INTO `kota` VALUES ('4647', 'Dukun', '27000');
INSERT INTO `kota` VALUES ('4648', 'Kedamean', '27000');
INSERT INTO `kota` VALUES ('4649', 'Manyar', '27000');
INSERT INTO `kota` VALUES ('4650', 'Menganti', '27000');
INSERT INTO `kota` VALUES ('4651', 'Panceng', '27000');
INSERT INTO `kota` VALUES ('4652', 'Sangkapura', '27000');
INSERT INTO `kota` VALUES ('4653', 'Sidayu', '27000');
INSERT INTO `kota` VALUES ('4654', 'Tambak', '27000');
INSERT INTO `kota` VALUES ('4655', 'Ujung Pangkah', '27000');
INSERT INTO `kota` VALUES ('4656', 'Wringinanom', '27000');
INSERT INTO `kota` VALUES ('4657', 'Kebomas', '27000');
INSERT INTO `kota` VALUES ('4658', 'Lamongan', '22000');
INSERT INTO `kota` VALUES ('4659', 'Babat', '27000');
INSERT INTO `kota` VALUES ('4660', 'Bluluk', '27000');
INSERT INTO `kota` VALUES ('4661', 'Brondong', '27000');
INSERT INTO `kota` VALUES ('4662', 'Deket', '27000');
INSERT INTO `kota` VALUES ('4663', 'Glagah', '27000');
INSERT INTO `kota` VALUES ('4664', 'Kalitengah', '27000');
INSERT INTO `kota` VALUES ('4665', 'Karangbinangun', '27000');
INSERT INTO `kota` VALUES ('4666', 'Karanggeneng', '27000');
INSERT INTO `kota` VALUES ('4667', 'Kedungpring', '27000');
INSERT INTO `kota` VALUES ('4668', 'Kembangbahu', '27000');
INSERT INTO `kota` VALUES ('4669', 'Laren', '27000');
INSERT INTO `kota` VALUES ('4670', 'Mantup', '27000');
INSERT INTO `kota` VALUES ('4671', 'Modo', '27000');
INSERT INTO `kota` VALUES ('4672', 'Ngimbang', '27000');
INSERT INTO `kota` VALUES ('4673', 'Paciran', '27000');
INSERT INTO `kota` VALUES ('4674', 'Pucuk', '27000');
INSERT INTO `kota` VALUES ('4675', 'Sambeng', '27000');
INSERT INTO `kota` VALUES ('4676', 'Solokuro', '27000');
INSERT INTO `kota` VALUES ('4677', 'Sekaran', '27000');
INSERT INTO `kota` VALUES ('4678', 'Sugio', '27000');
INSERT INTO `kota` VALUES ('4679', 'Sukodadi', '27000');
INSERT INTO `kota` VALUES ('4680', 'Sukorame', '27000');
INSERT INTO `kota` VALUES ('4681', 'Tikung', '27000');
INSERT INTO `kota` VALUES ('4682', 'Turi', '27000');
INSERT INTO `kota` VALUES ('4683', 'Maduran', '27000');
INSERT INTO `kota` VALUES ('4684', 'Sarirejo', '27000');
INSERT INTO `kota` VALUES ('4685', 'Bangkalan', '22000');
INSERT INTO `kota` VALUES ('4686', 'Arosbaya', '27000');
INSERT INTO `kota` VALUES ('4687', 'Balega', '27000');
INSERT INTO `kota` VALUES ('4688', 'Galis', '27000');
INSERT INTO `kota` VALUES ('4689', 'Geger', '27000');
INSERT INTO `kota` VALUES ('4690', 'Kamal', '27000');
INSERT INTO `kota` VALUES ('4691', 'Kwanyar', '27000');
INSERT INTO `kota` VALUES ('4692', 'Klampis', '27000');
INSERT INTO `kota` VALUES ('4693', 'Kokop', '27000');
INSERT INTO `kota` VALUES ('4694', 'Konang', '27000');
INSERT INTO `kota` VALUES ('4695', 'Labang', '27000');
INSERT INTO `kota` VALUES ('4696', 'Modung', '27000');
INSERT INTO `kota` VALUES ('4697', 'Sepulu', '27000');
INSERT INTO `kota` VALUES ('4698', 'Socah', '27000');
INSERT INTO `kota` VALUES ('4699', 'Tanah Merah', '27000');
INSERT INTO `kota` VALUES ('4700', 'Tanjungbumi', '27000');
INSERT INTO `kota` VALUES ('4701', 'Tragah', '27000');
INSERT INTO `kota` VALUES ('4702', 'Burneh', '27000');
INSERT INTO `kota` VALUES ('4703', 'Jombang', '22000');
INSERT INTO `kota` VALUES ('4704', 'Bandar Kedungmulyo', '27000');
INSERT INTO `kota` VALUES ('4705', 'Bareng', '27000');
INSERT INTO `kota` VALUES ('4706', 'Diwek', '27000');
INSERT INTO `kota` VALUES ('4707', 'Gudo', '27000');
INSERT INTO `kota` VALUES ('4708', 'Jogoroto', '27000');
INSERT INTO `kota` VALUES ('4709', 'Kabuh', '27000');
INSERT INTO `kota` VALUES ('4710', 'Kesamben', '27000');
INSERT INTO `kota` VALUES ('4711', 'Kudu', '27000');
INSERT INTO `kota` VALUES ('4712', 'Megaluh', '27000');
INSERT INTO `kota` VALUES ('4713', 'Mojoagung', '27000');
INSERT INTO `kota` VALUES ('4714', 'Mojowarno', '27000');
INSERT INTO `kota` VALUES ('4715', 'Ngoro', '27000');
INSERT INTO `kota` VALUES ('4716', 'Perak', '27000');
INSERT INTO `kota` VALUES ('4717', 'Peterongan', '27000');
INSERT INTO `kota` VALUES ('4718', 'Plandaan', '27000');
INSERT INTO `kota` VALUES ('4719', 'Ploso', '27000');
INSERT INTO `kota` VALUES ('4720', 'Sumobito', '27000');
INSERT INTO `kota` VALUES ('4721', 'Tembelang', '27000');
INSERT INTO `kota` VALUES ('4722', 'Wonosalam', '27000');
INSERT INTO `kota` VALUES ('4723', 'Ngusikan', '27000');
INSERT INTO `kota` VALUES ('4724', 'Nganjuk', '22000');
INSERT INTO `kota` VALUES ('4725', 'Bagor', '27000');
INSERT INTO `kota` VALUES ('4726', 'Berbek', '27000');
INSERT INTO `kota` VALUES ('4727', 'Gondang', '27000');
INSERT INTO `kota` VALUES ('4728', 'Loceret', '27000');
INSERT INTO `kota` VALUES ('4729', 'Ngetos', '27000');
INSERT INTO `kota` VALUES ('4730', 'Ngluyu', '27000');
INSERT INTO `kota` VALUES ('4731', 'Pace', '27000');
INSERT INTO `kota` VALUES ('4732', 'Prambon', '27000');
INSERT INTO `kota` VALUES ('4733', 'Rejoso', '27000');
INSERT INTO `kota` VALUES ('4734', 'Sawahan', '27000');
INSERT INTO `kota` VALUES ('4735', 'Sukomoro', '27000');
INSERT INTO `kota` VALUES ('4736', 'Tanjunganom', '27000');
INSERT INTO `kota` VALUES ('4737', 'Wilangan', '27000');
INSERT INTO `kota` VALUES ('4738', 'Kertosono', '27000');
INSERT INTO `kota` VALUES ('4739', 'Baron', '27000');
INSERT INTO `kota` VALUES ('4740', 'Jatikalen', '27000');
INSERT INTO `kota` VALUES ('4741', 'Lengkong', '27000');
INSERT INTO `kota` VALUES ('4742', 'Ngronggot', '27000');
INSERT INTO `kota` VALUES ('4743', 'Patianrowo', '27000');
INSERT INTO `kota` VALUES ('4744', 'Pamekasan', '22000');
INSERT INTO `kota` VALUES ('4745', 'Batu Marmar', '27000');
INSERT INTO `kota` VALUES ('4746', 'Kadur', '27000');
INSERT INTO `kota` VALUES ('4747', 'Larangan', '27000');
INSERT INTO `kota` VALUES ('4748', 'Pakong', '27000');
INSERT INTO `kota` VALUES ('4749', 'Palengaan', '27000');
INSERT INTO `kota` VALUES ('4750', 'Pasean', '27000');
INSERT INTO `kota` VALUES ('4751', 'Pegantenan', '27000');
INSERT INTO `kota` VALUES ('4752', 'Proppo', '27000');
INSERT INTO `kota` VALUES ('4753', 'Tlanakan', '27000');
INSERT INTO `kota` VALUES ('4754', 'Waru', '27000');
INSERT INTO `kota` VALUES ('4755', 'Pademawu', '27000');
INSERT INTO `kota` VALUES ('4756', 'Sampang', '22000');
INSERT INTO `kota` VALUES ('4757', 'Banyuates', '27000');
INSERT INTO `kota` VALUES ('4758', 'Camplong', '27000');
INSERT INTO `kota` VALUES ('4759', 'Jrengik', '27000');
INSERT INTO `kota` VALUES ('4760', 'KEDUNDUNG', '27000');
INSERT INTO `kota` VALUES ('4761', 'Ketapang', '27000');
INSERT INTO `kota` VALUES ('4762', 'Omben', '27000');
INSERT INTO `kota` VALUES ('4763', 'Robatal', '27000');
INSERT INTO `kota` VALUES ('4764', 'Sokobanah', '27000');
INSERT INTO `kota` VALUES ('4765', 'Sreseh', '27000');
INSERT INTO `kota` VALUES ('4766', 'Tambelangan', '27000');
INSERT INTO `kota` VALUES ('4767', 'Torjun', '27000');
INSERT INTO `kota` VALUES ('4768', 'Sidoarjo', '17000');
INSERT INTO `kota` VALUES ('4769', 'Buduran', '17000');
INSERT INTO `kota` VALUES ('4770', 'Candi', '17000');
INSERT INTO `kota` VALUES ('4771', 'Gedangan', '17000');
INSERT INTO `kota` VALUES ('4772', 'Jabon', '17000');
INSERT INTO `kota` VALUES ('4773', 'Krembung', '17000');
INSERT INTO `kota` VALUES ('4774', 'Porong', '17000');
INSERT INTO `kota` VALUES ('4775', 'Sedati', '17000');
INSERT INTO `kota` VALUES ('4776', 'Sukodono', '17000');
INSERT INTO `kota` VALUES ('4777', 'Tanggulangin', '17000');
INSERT INTO `kota` VALUES ('4778', 'Tulangan', '17000');
INSERT INTO `kota` VALUES ('4779', 'Waru', '17000');
INSERT INTO `kota` VALUES ('4780', 'Wonoayu', '17000');
INSERT INTO `kota` VALUES ('4781', 'Krian', '17000');
INSERT INTO `kota` VALUES ('4782', 'Taman', '17000');
INSERT INTO `kota` VALUES ('4783', 'Sumenep', '22000');
INSERT INTO `kota` VALUES ('4784', 'Ambunten', '27000');
INSERT INTO `kota` VALUES ('4785', 'Arjasa', '41000');
INSERT INTO `kota` VALUES ('4786', 'Batang Batang', '27000');
INSERT INTO `kota` VALUES ('4787', 'Batuputih', '27000');
INSERT INTO `kota` VALUES ('4788', 'Bluto', '27000');
INSERT INTO `kota` VALUES ('4789', 'Dasuk', '27000');
INSERT INTO `kota` VALUES ('4790', 'Dungkek', '27000');
INSERT INTO `kota` VALUES ('4791', 'Ganding', '27000');
INSERT INTO `kota` VALUES ('4792', 'Gapura', '27000');
INSERT INTO `kota` VALUES ('4793', 'Gayam', '41000');
INSERT INTO `kota` VALUES ('4794', 'Giligenteng', '41000');
INSERT INTO `kota` VALUES ('4795', 'Guluk-Guluk', '27000');
INSERT INTO `kota` VALUES ('4796', 'Kalianget', '27000');
INSERT INTO `kota` VALUES ('4797', 'Lenteng', '27000');
INSERT INTO `kota` VALUES ('4798', 'Manding', '27000');
INSERT INTO `kota` VALUES ('4799', 'Masalembu', '41000');
INSERT INTO `kota` VALUES ('4800', 'Nonggunong', '41000');
INSERT INTO `kota` VALUES ('4801', 'Pasongsongan', '27000');
INSERT INTO `kota` VALUES ('4802', 'Pragaan', '27000');
INSERT INTO `kota` VALUES ('4803', 'Raas', '41000');
INSERT INTO `kota` VALUES ('4804', 'Rubaru', '27000');
INSERT INTO `kota` VALUES ('4805', 'Sapeken', '41000');
INSERT INTO `kota` VALUES ('4806', 'Saronggi', '27000');
INSERT INTO `kota` VALUES ('4807', 'Talango', '41000');
INSERT INTO `kota` VALUES ('4808', 'Batuan', '27000');
INSERT INTO `kota` VALUES ('4809', 'Kangean', '41000');
INSERT INTO `kota` VALUES ('4810', 'Tuban', '22000');
INSERT INTO `kota` VALUES ('4811', 'Bancar', '27000');
INSERT INTO `kota` VALUES ('4812', 'Bangilan', '27000');
INSERT INTO `kota` VALUES ('4813', 'Jatirogo', '27000');
INSERT INTO `kota` VALUES ('4814', 'Jenu', '27000');
INSERT INTO `kota` VALUES ('4815', 'Kenduruan', '27000');
INSERT INTO `kota` VALUES ('4816', 'Kerek', '27000');
INSERT INTO `kota` VALUES ('4817', 'Merakurak', '27000');
INSERT INTO `kota` VALUES ('4818', 'Montong', '27000');
INSERT INTO `kota` VALUES ('4819', 'Palang', '27000');
INSERT INTO `kota` VALUES ('4820', 'Parengan', '27000');
INSERT INTO `kota` VALUES ('4821', 'Plumbang', '27000');
INSERT INTO `kota` VALUES ('4822', 'Rengel', '27000');
INSERT INTO `kota` VALUES ('4823', 'Semanding', '27000');
INSERT INTO `kota` VALUES ('4824', 'Senori', '27000');
INSERT INTO `kota` VALUES ('4825', 'Singgahan', '27000');
INSERT INTO `kota` VALUES ('4826', 'Soko', '27000');
INSERT INTO `kota` VALUES ('4827', 'Tambakboyo', '27000');
INSERT INTO `kota` VALUES ('4828', 'Widang', '27000');
INSERT INTO `kota` VALUES ('4829', 'Grabagan', '27000');
INSERT INTO `kota` VALUES ('4830', 'Tulungagung', '22000');
INSERT INTO `kota` VALUES ('4831', 'Bandung', '27000');
INSERT INTO `kota` VALUES ('4832', 'Besuki', '27000');
INSERT INTO `kota` VALUES ('4833', 'Campurdarat', '27000');
INSERT INTO `kota` VALUES ('4834', 'Kalidawir', '27000');
INSERT INTO `kota` VALUES ('4835', 'Karangrejo', '27000');
INSERT INTO `kota` VALUES ('4836', 'Ngantru', '27000');
INSERT INTO `kota` VALUES ('4837', 'Ngunut', '27000');
INSERT INTO `kota` VALUES ('4838', 'Pagerwojo', '27000');
INSERT INTO `kota` VALUES ('4839', 'Pakel', '27000');
INSERT INTO `kota` VALUES ('4840', 'Pucanglaban', '27000');
INSERT INTO `kota` VALUES ('4841', 'Rejotangan', '27000');
INSERT INTO `kota` VALUES ('4842', 'Sendang', '27000');
INSERT INTO `kota` VALUES ('4843', 'Sumbergempol', '27000');
INSERT INTO `kota` VALUES ('4844', 'Tanggung Gunung', '27000');
INSERT INTO `kota` VALUES ('4845', 'Boyolangu', '27000');
INSERT INTO `kota` VALUES ('4846', 'Kauman', '27000');
INSERT INTO `kota` VALUES ('4847', 'Kedungwaru', '27000');
INSERT INTO `kota` VALUES ('4848', 'Trenggalek', '22000');
INSERT INTO `kota` VALUES ('4849', 'Bendungan', '27000');
INSERT INTO `kota` VALUES ('4850', 'Dongko', '27000');
INSERT INTO `kota` VALUES ('4851', 'Durenan', '27000');
INSERT INTO `kota` VALUES ('4852', 'Gandusari', '27000');
INSERT INTO `kota` VALUES ('4853', 'Kampak', '27000');
INSERT INTO `kota` VALUES ('4854', 'Karangan', '27000');
INSERT INTO `kota` VALUES ('4855', 'Munjungan', '27000');
INSERT INTO `kota` VALUES ('4856', 'Panggul', '27000');
INSERT INTO `kota` VALUES ('4857', 'Pogalan', '27000');
INSERT INTO `kota` VALUES ('4858', 'Pule', '27000');
INSERT INTO `kota` VALUES ('4859', 'Tugu', '27000');
INSERT INTO `kota` VALUES ('4860', 'Watulimo', '27000');
INSERT INTO `kota` VALUES ('4861', 'Suruh', '27000');
INSERT INTO `kota` VALUES ('4862', 'Tangerang', '8000');
INSERT INTO `kota` VALUES ('4863', 'Ciledug', '8000');
INSERT INTO `kota` VALUES ('4864', 'Batuceper', '8000');
INSERT INTO `kota` VALUES ('4865', 'Benda', '8000');
INSERT INTO `kota` VALUES ('4866', 'Cibodas', '8000');
INSERT INTO `kota` VALUES ('4867', 'Cipondoh', '8000');
INSERT INTO `kota` VALUES ('4868', 'Jatiuwung', '8000');
INSERT INTO `kota` VALUES ('4869', 'Karangtengah', '8000');
INSERT INTO `kota` VALUES ('4870', 'Karawaci', '8000');
INSERT INTO `kota` VALUES ('4871', 'Larangan', '8000');
INSERT INTO `kota` VALUES ('4872', 'Neglasari', '8000');
INSERT INTO `kota` VALUES ('4873', 'Periuk', '8000');
INSERT INTO `kota` VALUES ('4874', 'Pinang', '8000');
INSERT INTO `kota` VALUES ('4875', 'Tigaraksa', '8000');
INSERT INTO `kota` VALUES ('4876', 'Balaraja', '8000');
INSERT INTO `kota` VALUES ('4877', 'Cikupa', '8000');
INSERT INTO `kota` VALUES ('4878', 'Cisoka', '8000');
INSERT INTO `kota` VALUES ('4879', 'Curug', '8000');
INSERT INTO `kota` VALUES ('4880', 'Kronjo', '8000');
INSERT INTO `kota` VALUES ('4881', 'Kresek', '8000');
INSERT INTO `kota` VALUES ('4882', 'Legok', '8000');
INSERT INTO `kota` VALUES ('4883', 'Mauk', '8000');
INSERT INTO `kota` VALUES ('4884', 'PASAR KEMIS', '8000');
INSERT INTO `kota` VALUES ('4885', 'Pakuhaji', '8000');
INSERT INTO `kota` VALUES ('4886', 'Rajeg', '8000');
INSERT INTO `kota` VALUES ('4887', 'Sepatan /Jatimulya/Cengklong', '8000');
INSERT INTO `kota` VALUES ('4888', 'Serpong', '8000');
INSERT INTO `kota` VALUES ('4889', 'Teluknaga', '8000');
INSERT INTO `kota` VALUES ('4890', 'Pondok Aren / Jurang Mangu', '8000');
INSERT INTO `kota` VALUES ('4891', 'Pamulang', '8000');
INSERT INTO `kota` VALUES ('4892', 'Ciputat', '8000');
INSERT INTO `kota` VALUES ('4893', 'Cisauk', '8000');
INSERT INTO `kota` VALUES ('4894', 'Jambe', '8000');
INSERT INTO `kota` VALUES ('4895', 'Jayanti', '8000');
INSERT INTO `kota` VALUES ('4896', 'Kemiri', '8000');
INSERT INTO `kota` VALUES ('4897', 'Kosambi /Salembaran jati', '8000');
INSERT INTO `kota` VALUES ('4898', 'Pagedangan', '8000');
INSERT INTO `kota` VALUES ('4899', 'Panongan', '8000');
INSERT INTO `kota` VALUES ('4900', 'Sukadiri', '8000');
INSERT INTO `kota` VALUES ('4901', 'Timika', '85000');
INSERT INTO `kota` VALUES ('4902', 'Agimuga', '138000');
INSERT INTO `kota` VALUES ('4903', 'Jila', '138000');
INSERT INTO `kota` VALUES ('4904', 'Jita', '138000');
INSERT INTO `kota` VALUES ('4905', 'Kuala Kencana', '138000');
INSERT INTO `kota` VALUES ('4906', 'Mimika Barat', '110000');
INSERT INTO `kota` VALUES ('4907', 'Mimika Barat Jauh', '110000');
INSERT INTO `kota` VALUES ('4908', 'Mimika Barat Tengah', '110000');
INSERT INTO `kota` VALUES ('4909', 'Mimika Baru', '110000');
INSERT INTO `kota` VALUES ('4910', 'Mimika Timur', '110000');
INSERT INTO `kota` VALUES ('4911', 'Mimika Timur Jauh', '110000');
INSERT INTO `kota` VALUES ('4912', 'Mimika Timur Tengah', '110000');
INSERT INTO `kota` VALUES ('4913', 'Tembaga Pura', '110000');
INSERT INTO `kota` VALUES ('4914', 'Tanjung Pandan', '23000');
INSERT INTO `kota` VALUES ('4915', 'Membalong', '33000');
INSERT INTO `kota` VALUES ('4916', 'Selat Nasik', '33000');
INSERT INTO `kota` VALUES ('4917', 'Badau', '33000');
INSERT INTO `kota` VALUES ('4918', 'Sijuk', '33000');
INSERT INTO `kota` VALUES ('4919', 'Manggar', '26000');
INSERT INTO `kota` VALUES ('4920', 'Dendang', '33000');
INSERT INTO `kota` VALUES ('4921', 'Gantung', '33000');
INSERT INTO `kota` VALUES ('4922', 'Kelapa Kampit', '33000');
INSERT INTO `kota` VALUES ('4923', 'Bandar Lampung', '17000');
INSERT INTO `kota` VALUES ('4924', 'Kedaton', '17000');
INSERT INTO `kota` VALUES ('4925', 'Kemiling', '17000');
INSERT INTO `kota` VALUES ('4926', 'Panjang', '17000');
INSERT INTO `kota` VALUES ('4927', 'Rajabasa', '17000');
INSERT INTO `kota` VALUES ('4928', 'Sukabumi', '17000');
INSERT INTO `kota` VALUES ('4929', 'Sukarame', '17000');
INSERT INTO `kota` VALUES ('4930', 'Tanjung Karang Barat', '17000');
INSERT INTO `kota` VALUES ('4931', 'Tanjung Karang Pusat', '17000');
INSERT INTO `kota` VALUES ('4932', 'Tanjung Karang Timur', '17000');
INSERT INTO `kota` VALUES ('4933', 'Tanjung Senang', '17000');
INSERT INTO `kota` VALUES ('4934', 'Teluk Betung Barat', '17000');
INSERT INTO `kota` VALUES ('4935', 'Teluk Betung Selatan', '17000');
INSERT INTO `kota` VALUES ('4936', 'Teluk Betung Utara', '17000');
INSERT INTO `kota` VALUES ('4937', 'Kalianda', '35000');
INSERT INTO `kota` VALUES ('4938', 'Palas', '44000');
INSERT INTO `kota` VALUES ('4939', 'Panengahan', '44000');
INSERT INTO `kota` VALUES ('4940', 'Natar', '44000');
INSERT INTO `kota` VALUES ('4941', 'Tanjung Bintang', '44000');
INSERT INTO `kota` VALUES ('4942', 'Candipuro', '44000');
INSERT INTO `kota` VALUES ('4943', 'Jati Agung', '44000');
INSERT INTO `kota` VALUES ('4944', 'Katibung', '44000');
INSERT INTO `kota` VALUES ('4945', 'Ketapang', '44000');
INSERT INTO `kota` VALUES ('4946', 'Merbau Mataram', '44000');
INSERT INTO `kota` VALUES ('4947', 'Rajabasa', '44000');
INSERT INTO `kota` VALUES ('4948', 'Sidomulyo', '44000');
INSERT INTO `kota` VALUES ('4949', 'Sragi', '44000');
INSERT INTO `kota` VALUES ('4950', 'Bakauheuni', '35000');
INSERT INTO `kota` VALUES ('4951', 'Tanjungsari', '44000');
INSERT INTO `kota` VALUES ('4952', 'Way Panji', '44000');
INSERT INTO `kota` VALUES ('4953', 'Way Sulan', '44000');
INSERT INTO `kota` VALUES ('4954', 'Kotabumi', '35000');
INSERT INTO `kota` VALUES ('4955', 'Abung Barat', '44000');
INSERT INTO `kota` VALUES ('4956', 'Abung Selatan', '44000');
INSERT INTO `kota` VALUES ('4957', 'Abung Timur', '44000');
INSERT INTO `kota` VALUES ('4958', 'Bukit Kemuning', '35000');
INSERT INTO `kota` VALUES ('4959', 'Sungkai Selatan', '44000');
INSERT INTO `kota` VALUES ('4960', 'Sungkai Utara', '44000');
INSERT INTO `kota` VALUES ('4961', 'Tanjung Raja', '44000');
INSERT INTO `kota` VALUES ('4962', 'Abung Semuli', '44000');
INSERT INTO `kota` VALUES ('4963', 'Abung Surakarta', '44000');
INSERT INTO `kota` VALUES ('4964', 'Abung Tengah', '44000');
INSERT INTO `kota` VALUES ('4965', 'Abung Tinggi', '44000');
INSERT INTO `kota` VALUES ('4966', 'Bunga Mayang', '44000');
INSERT INTO `kota` VALUES ('4967', 'Kotabumi Selatan', '44000');
INSERT INTO `kota` VALUES ('4968', 'Kotabumi Utara', '44000');
INSERT INTO `kota` VALUES ('4969', 'Muara Sungkai', '44000');
INSERT INTO `kota` VALUES ('4970', 'Metro', '35000');
INSERT INTO `kota` VALUES ('4971', 'Metro Barat', '35000');
INSERT INTO `kota` VALUES ('4972', 'Metro Pusat', '35000');
INSERT INTO `kota` VALUES ('4973', 'Metro Selatan', '35000');
INSERT INTO `kota` VALUES ('4974', 'Metro Timur', '35000');
INSERT INTO `kota` VALUES ('4975', 'Metro Utara', '35000');
INSERT INTO `kota` VALUES ('4976', 'Liwa', '35000');
INSERT INTO `kota` VALUES ('4977', 'Balik Bukit', '44000');
INSERT INTO `kota` VALUES ('4978', 'Belalau', '44000');
INSERT INTO `kota` VALUES ('4979', 'Pesisir Utara', '44000');
INSERT INTO `kota` VALUES ('4980', 'Pesisir Tengah / Krui', '35000');
INSERT INTO `kota` VALUES ('4981', 'Pesisir Selatan', '44000');
INSERT INTO `kota` VALUES ('4982', 'Sumber Jaya', '35000');
INSERT INTO `kota` VALUES ('4983', 'Batu Brak', '44000');
INSERT INTO `kota` VALUES ('4984', 'Bengkunat', '44000');
INSERT INTO `kota` VALUES ('4985', 'Karya Penggawa', '44000');
INSERT INTO `kota` VALUES ('4986', 'Lemong', '44000');
INSERT INTO `kota` VALUES ('4987', 'Sekincau', '44000');
INSERT INTO `kota` VALUES ('4988', 'Sukau', '44000');
INSERT INTO `kota` VALUES ('4989', 'Suoh', '66000');
INSERT INTO `kota` VALUES ('4990', 'Way Tenong', '44000');
INSERT INTO `kota` VALUES ('4991', 'Gunung Sugih', '35000');
INSERT INTO `kota` VALUES ('4992', 'Padang Ratu', '44000');
INSERT INTO `kota` VALUES ('4993', 'Seputih Mataram', '44000');
INSERT INTO `kota` VALUES ('4994', 'Seputih Banyak', '44000');
INSERT INTO `kota` VALUES ('4995', 'Seputih Surabaya', '44000');
INSERT INTO `kota` VALUES ('4996', 'Seputih Raman', '44000');
INSERT INTO `kota` VALUES ('4997', 'Terbanggi Besar / Bandar Jaya', '44000');
INSERT INTO `kota` VALUES ('4998', 'Anak Tuha', '44000');
INSERT INTO `kota` VALUES ('4999', 'Bandar Mataram', '44000');
INSERT INTO `kota` VALUES ('5000', 'Bandar Surabaya', '44000');
INSERT INTO `kota` VALUES ('5001', 'Bangunrejo', '44000');
INSERT INTO `kota` VALUES ('5002', 'Bekri', '44000');
INSERT INTO `kota` VALUES ('5003', 'Bumi Nabung', '44000');
INSERT INTO `kota` VALUES ('5004', 'Bumi Ratu Nuban', '44000');
INSERT INTO `kota` VALUES ('5005', 'Kalirejo', '44000');
INSERT INTO `kota` VALUES ('5006', 'Kota Gajah', '44000');
INSERT INTO `kota` VALUES ('5007', 'Pubian', '44000');
INSERT INTO `kota` VALUES ('5008', 'Punggur', '44000');
INSERT INTO `kota` VALUES ('5009', 'Rumbia', '44000');
INSERT INTO `kota` VALUES ('5010', 'Selagai Lingga', '66000');
INSERT INTO `kota` VALUES ('5011', 'Sendang Agung', '44000');
INSERT INTO `kota` VALUES ('5012', 'Seputih Agung', '44000');
INSERT INTO `kota` VALUES ('5013', 'Terusan Nunyai', '44000');
INSERT INTO `kota` VALUES ('5014', 'Trimurjo', '44000');
INSERT INTO `kota` VALUES ('5015', 'WAY PANGUBUAN', '44000');
INSERT INTO `kota` VALUES ('5016', 'Way Seputih', '44000');
INSERT INTO `kota` VALUES ('5017', 'Bandar Jaya', '44000');
INSERT INTO `kota` VALUES ('5018', 'Sukadana', '35000');
INSERT INTO `kota` VALUES ('5019', 'BATANG HARI', '44000');
INSERT INTO `kota` VALUES ('5020', 'Jabung/Gunung balak', '44000');
INSERT INTO `kota` VALUES ('5021', 'Labuhan Maringgai', '44000');
INSERT INTO `kota` VALUES ('5022', 'Pekalongan', '44000');
INSERT INTO `kota` VALUES ('5023', 'Purbolinggo', '44000');
INSERT INTO `kota` VALUES ('5024', 'Raman Utara', '44000');
INSERT INTO `kota` VALUES ('5025', 'Sekampung', '44000');
INSERT INTO `kota` VALUES ('5026', 'Way Jepara', '44000');
INSERT INTO `kota` VALUES ('5027', 'BANDAR SRIBAWANO', '44000');
INSERT INTO `kota` VALUES ('5028', 'Batanghari Nuban', '44000');
INSERT INTO `kota` VALUES ('5029', 'Braja Slebah', '44000');
INSERT INTO `kota` VALUES ('5030', 'Bumi Agung', '44000');
INSERT INTO `kota` VALUES ('5031', 'Gunung Pelindung', '44000');
INSERT INTO `kota` VALUES ('5032', 'Labuhan Ratu', '44000');
INSERT INTO `kota` VALUES ('5033', 'Margatiga', '44000');
INSERT INTO `kota` VALUES ('5034', 'Mataram Baru', '44000');
INSERT INTO `kota` VALUES ('5035', 'Melinting', '44000');
INSERT INTO `kota` VALUES ('5036', 'Metro Kibang', '44000');
INSERT INTO `kota` VALUES ('5037', 'Pasir Sakti', '44000');
INSERT INTO `kota` VALUES ('5038', 'Sekampung Udik', '44000');
INSERT INTO `kota` VALUES ('5039', 'Waway Karya', '44000');
INSERT INTO `kota` VALUES ('5040', 'Way Bungur', '44000');
INSERT INTO `kota` VALUES ('5041', 'Blambangan umpu', '35000');
INSERT INTO `kota` VALUES ('5042', 'Bahuga', '44000');
INSERT INTO `kota` VALUES ('5043', 'Baradatu', '44000');
INSERT INTO `kota` VALUES ('5044', 'Kasui', '44000');
INSERT INTO `kota` VALUES ('5045', 'Banjit/Banjid', '44000');
INSERT INTO `kota` VALUES ('5046', 'Gunung Labuhan', '44000');
INSERT INTO `kota` VALUES ('5047', 'Negeri Batin', '44000');
INSERT INTO `kota` VALUES ('5048', 'Negeri Agung', '66000');
INSERT INTO `kota` VALUES ('5049', 'Negeri Besar', '66000');
INSERT INTO `kota` VALUES ('5050', 'Pakuan Ratu', '44000');
INSERT INTO `kota` VALUES ('5051', 'Rebang Tangkas', '44000');
INSERT INTO `kota` VALUES ('5052', 'Way Tuba', '44000');
INSERT INTO `kota` VALUES ('5053', 'Menggala', '35000');
INSERT INTO `kota` VALUES ('5054', 'Mesuji', '44000');
INSERT INTO `kota` VALUES ('5055', 'Tulang Bawang Tengah', '44000');
INSERT INTO `kota` VALUES ('5056', 'Tulang Bawang Udik', '44000');
INSERT INTO `kota` VALUES ('5057', 'Banjar Agung', '44000');
INSERT INTO `kota` VALUES ('5058', 'Gedung Aji', '44000');
INSERT INTO `kota` VALUES ('5059', 'Gedung Meneng', '44000');
INSERT INTO `kota` VALUES ('5060', 'Gunung Terang', '44000');
INSERT INTO `kota` VALUES ('5061', 'Lambu Kibang', '44000');
INSERT INTO `kota` VALUES ('5062', 'Penawar Tama', '44000');
INSERT INTO `kota` VALUES ('5063', 'Rawajitu Selatan', '66000');
INSERT INTO `kota` VALUES ('5064', 'Rawajitu Utara', '66000');
INSERT INTO `kota` VALUES ('5065', 'Simpang Pematang', '44000');
INSERT INTO `kota` VALUES ('5066', 'Tanjung Raya', '44000');
INSERT INTO `kota` VALUES ('5067', 'Tumi Jajar', '44000');
INSERT INTO `kota` VALUES ('5068', 'Way Serdang', '44000');
INSERT INTO `kota` VALUES ('5069', 'Kota Agung', '35000');
INSERT INTO `kota` VALUES ('5070', 'Gading Rejo', '44000');
INSERT INTO `kota` VALUES ('5071', 'Pagelaran', '44000');
INSERT INTO `kota` VALUES ('5072', 'Pringsewu', '35000');
INSERT INTO `kota` VALUES ('5073', 'Pulau Panggung', '44000');
INSERT INTO `kota` VALUES ('5074', 'Sukoharjo', '44000');
INSERT INTO `kota` VALUES ('5075', 'Talang Padang', '35000');
INSERT INTO `kota` VALUES ('5076', 'Wonosobo', '44000');
INSERT INTO `kota` VALUES ('5077', 'Adi Luwih', '44000');
INSERT INTO `kota` VALUES ('5078', 'Cukup Balak', '44000');
INSERT INTO `kota` VALUES ('5079', 'Kelumbayan', '44000');
INSERT INTO `kota` VALUES ('5080', 'Pardasuka', '44000');
INSERT INTO `kota` VALUES ('5081', 'Pematang Sawa', '44000');
INSERT INTO `kota` VALUES ('5082', 'Pugung', '44000');
INSERT INTO `kota` VALUES ('5083', 'Semaka', '44000');
INSERT INTO `kota` VALUES ('5084', 'Sumberejo', '44000');
INSERT INTO `kota` VALUES ('5085', 'Ulubelu', '44000');
INSERT INTO `kota` VALUES ('5086', 'Gedong Tataan', '35000');
INSERT INTO `kota` VALUES ('5087', 'Kedondong', '44000');
INSERT INTO `kota` VALUES ('5088', 'Padang Cermin', '44000');
INSERT INTO `kota` VALUES ('5089', 'Negeri Katon', '44000');
INSERT INTO `kota` VALUES ('5090', 'Pundung Pidada', '44000');
INSERT INTO `kota` VALUES ('5091', 'Tegineneng', '44000');
INSERT INTO `kota` VALUES ('5092', 'Way Lima', '44000');
INSERT INTO `kota` VALUES ('5093', 'Tanjung Pinang', '32000');
INSERT INTO `kota` VALUES ('5094', 'Bukit Bestari', '32000');
INSERT INTO `kota` VALUES ('5095', 'Tanjung Pinang Barat', '32000');
INSERT INTO `kota` VALUES ('5096', 'Tanjung Pinang Kota', '32000');
INSERT INTO `kota` VALUES ('5097', 'Tanjung Pinang Timur', '32000');
INSERT INTO `kota` VALUES ('5098', 'Senggarang', '63000');
INSERT INTO `kota` VALUES ('5099', 'Dompak', '63000');
INSERT INTO `kota` VALUES ('5100', 'Pulau Penyengat', '63000');
INSERT INTO `kota` VALUES ('5101', 'Bandar Sri Bintan', '63000');
INSERT INTO `kota` VALUES ('5102', 'Bintan Timur', '63000');
INSERT INTO `kota` VALUES ('5103', 'Tanjung Uban/Bintan Utara', '50000');
INSERT INTO `kota` VALUES ('5104', 'Gunung Kijang', '63000');
INSERT INTO `kota` VALUES ('5105', 'Tambelan', '63000');
INSERT INTO `kota` VALUES ('5106', 'Teluk Bintan', '63000');
INSERT INTO `kota` VALUES ('5107', 'Teluk Sebong', '63000');
INSERT INTO `kota` VALUES ('5108', 'Lagoi', '63000');
INSERT INTO `kota` VALUES ('5109', 'Tarakan', '49000');
INSERT INTO `kota` VALUES ('5110', 'Tarakan Barat', '49000');
INSERT INTO `kota` VALUES ('5111', 'Tarakan Tengah', '49000');
INSERT INTO `kota` VALUES ('5112', 'Tarakan Timur', '49000');
INSERT INTO `kota` VALUES ('5113', 'Tarakan Utara', '49000');
INSERT INTO `kota` VALUES ('5114', 'Tanjung Selor', '55000');
INSERT INTO `kota` VALUES ('5115', 'Peso / Longpeso', '69000');
INSERT INTO `kota` VALUES ('5116', 'Pulau Bunyu', '69000');
INSERT INTO `kota` VALUES ('5117', 'Peso Hilir', '69000');
INSERT INTO `kota` VALUES ('5118', 'Sekatak', '69000');
INSERT INTO `kota` VALUES ('5119', 'Tanjung Palas', '69000');
INSERT INTO `kota` VALUES ('5120', 'Tanjung Palas Barat', '69000');
INSERT INTO `kota` VALUES ('5121', 'Tanjung Palas Tengah', '69000');
INSERT INTO `kota` VALUES ('5122', 'Tanjung Palas Timur', '69000');
INSERT INTO `kota` VALUES ('5123', 'Tanjung Palas Utara', '69000');
INSERT INTO `kota` VALUES ('5124', 'Malinau', '55000');
INSERT INTO `kota` VALUES ('5125', 'Mentarang', '69000');
INSERT INTO `kota` VALUES ('5126', 'Kayan Hulu', '69000');
INSERT INTO `kota` VALUES ('5127', 'Kayan Hilir', '69000');
INSERT INTO `kota` VALUES ('5128', 'Pujungan', '69000');
INSERT INTO `kota` VALUES ('5129', 'Malinau Barat', '55000');
INSERT INTO `kota` VALUES ('5130', 'Malinau Selatan', '55000');
INSERT INTO `kota` VALUES ('5131', 'Malinau Utara', '55000');
INSERT INTO `kota` VALUES ('5132', 'Sungai Boh', '69000');
INSERT INTO `kota` VALUES ('5133', 'Nunukan', '55000');
INSERT INTO `kota` VALUES ('5134', 'Krayan', '69000');
INSERT INTO `kota` VALUES ('5135', 'Lumbis', '69000');
INSERT INTO `kota` VALUES ('5136', 'Krayan Selatan', '69000');
INSERT INTO `kota` VALUES ('5137', 'Sebatik', '55000');
INSERT INTO `kota` VALUES ('5138', 'Sebuku', '69000');
INSERT INTO `kota` VALUES ('5139', 'Tanah Tidung', '55000');
INSERT INTO `kota` VALUES ('5140', 'Sembakung', '69000');
INSERT INTO `kota` VALUES ('5141', 'Sesayap', '69000');
INSERT INTO `kota` VALUES ('5142', 'Sesayap Hilir', '69000');
INSERT INTO `kota` VALUES ('5143', 'Tanah Lia', '69000');
INSERT INTO `kota` VALUES ('5144', 'Ternate', '55000');
INSERT INTO `kota` VALUES ('5145', 'Moti', '78000');
INSERT INTO `kota` VALUES ('5146', 'Ternate Selatan', '78000');
INSERT INTO `kota` VALUES ('5147', 'Ternate Utara', '78000');
INSERT INTO `kota` VALUES ('5148', 'Jailolo', '62000');
INSERT INTO `kota` VALUES ('5149', 'Jailolo Selatan', '78000');
INSERT INTO `kota` VALUES ('5150', 'Ibu', '117000');
INSERT INTO `kota` VALUES ('5151', 'Loloda', '117000');
INSERT INTO `kota` VALUES ('5152', 'Sahu', '78000');
INSERT INTO `kota` VALUES ('5153', 'Labuha', '62000');
INSERT INTO `kota` VALUES ('5154', 'Bacan', '78000');
INSERT INTO `kota` VALUES ('5155', 'Bacan Selatan', '78000');
INSERT INTO `kota` VALUES ('5156', 'Bacan Timur', '78000');
INSERT INTO `kota` VALUES ('5157', 'Gane Barat', '117000');
INSERT INTO `kota` VALUES ('5158', 'Gane Timur', '117000');
INSERT INTO `kota` VALUES ('5159', 'Kayoa', '117000');
INSERT INTO `kota` VALUES ('5160', 'Obi', '117000');
INSERT INTO `kota` VALUES ('5161', 'Obi Selatan', '117000');
INSERT INTO `kota` VALUES ('5162', 'Pulau Makian', '117000');
INSERT INTO `kota` VALUES ('5163', 'Weda', '62000');
INSERT INTO `kota` VALUES ('5164', 'Gebe', '78000');
INSERT INTO `kota` VALUES ('5165', 'Patani', '117000');
INSERT INTO `kota` VALUES ('5166', 'Maba', '62000');
INSERT INTO `kota` VALUES ('5167', 'Maba Selatan', '78000');
INSERT INTO `kota` VALUES ('5168', 'Wasile', '117000');
INSERT INTO `kota` VALUES ('5169', 'Wasile Selatan', '117000');
INSERT INTO `kota` VALUES ('5170', 'Tobelo', '62000');
INSERT INTO `kota` VALUES ('5171', 'Tobelo Selatan', '78000');
INSERT INTO `kota` VALUES ('5172', 'Galela', '78000');
INSERT INTO `kota` VALUES ('5173', 'Kao', '78000');
INSERT INTO `kota` VALUES ('5174', 'Loloda Utara', '117000');
INSERT INTO `kota` VALUES ('5175', 'Malifut', '117000');
INSERT INTO `kota` VALUES ('5176', 'Morotai Selatan', '117000');
INSERT INTO `kota` VALUES ('5177', 'Morotai Selatan Barat', '117000');
INSERT INTO `kota` VALUES ('5178', 'Morotai Utara', '117000');
INSERT INTO `kota` VALUES ('5179', 'Sanana', '62000');
INSERT INTO `kota` VALUES ('5180', 'Mangoli Barat', '78000');
INSERT INTO `kota` VALUES ('5181', 'Mangoli Timur', '78000');
INSERT INTO `kota` VALUES ('5182', 'Nggele', '117000');
INSERT INTO `kota` VALUES ('5183', 'Sula Besi Barat', '117000');
INSERT INTO `kota` VALUES ('5184', 'Taliabu Barat', '117000');
INSERT INTO `kota` VALUES ('5185', 'Taliabu Timur', '117000');
INSERT INTO `kota` VALUES ('5186', 'Tidore', '62000');
INSERT INTO `kota` VALUES ('5187', 'Oba', '117000');
INSERT INTO `kota` VALUES ('5188', 'Oba Utara', '117000');
INSERT INTO `kota` VALUES ('5189', 'Tidore Selatan', '78000');
INSERT INTO `kota` VALUES ('5190', 'Tidore Utara', '78000');
INSERT INTO `kota` VALUES ('5191', 'Ujung Pandang', '32000');
INSERT INTO `kota` VALUES ('5192', 'Tamalate', '32000');
INSERT INTO `kota` VALUES ('5193', 'Biring Kanaya', '32000');
INSERT INTO `kota` VALUES ('5194', 'Bontoala', '32000');
INSERT INTO `kota` VALUES ('5195', 'Mamajang', '32000');
INSERT INTO `kota` VALUES ('5196', 'Manggala', '32000');
INSERT INTO `kota` VALUES ('5197', 'Mariso', '32000');
INSERT INTO `kota` VALUES ('5198', 'Panakkukang', '32000');
INSERT INTO `kota` VALUES ('5199', 'Rappocini', '32000');
INSERT INTO `kota` VALUES ('5200', 'Tallo', '32000');
INSERT INTO `kota` VALUES ('5201', 'Tamalanrea', '32000');
INSERT INTO `kota` VALUES ('5202', 'Ujung Tanah', '32000');
INSERT INTO `kota` VALUES ('5203', 'Wajo', '32000');
INSERT INTO `kota` VALUES ('5204', 'Bantaeng', '49000');
INSERT INTO `kota` VALUES ('5205', 'Bissapu', '62000');
INSERT INTO `kota` VALUES ('5206', 'Tompobulu', '62000');
INSERT INTO `kota` VALUES ('5207', 'Eremerasa', '62000');
INSERT INTO `kota` VALUES ('5208', 'Pajukukang', '62000');
INSERT INTO `kota` VALUES ('5209', 'Uluere', '62000');
INSERT INTO `kota` VALUES ('5210', 'Barru', '49000');
INSERT INTO `kota` VALUES ('5211', 'Mallusetasi', '62000');
INSERT INTO `kota` VALUES ('5212', 'Soppeng Riaja', '62000');
INSERT INTO `kota` VALUES ('5213', 'Tanete Riaja', '62000');
INSERT INTO `kota` VALUES ('5214', 'Tanete Rilau', '62000');
INSERT INTO `kota` VALUES ('5215', 'Balusu', '62000');
INSERT INTO `kota` VALUES ('5216', 'Pujananting', '62000');
INSERT INTO `kota` VALUES ('5217', 'Bulukumba', '49000');
INSERT INTO `kota` VALUES ('5218', 'Bonto Bahari', '62000');
INSERT INTO `kota` VALUES ('5219', 'Bontotiro', '62000');
INSERT INTO `kota` VALUES ('5220', 'Gantarang /Gantarangkindang/Ganking', '62000');
INSERT INTO `kota` VALUES ('5221', 'Hero Lange-Lange /Heralangelange/Her', '62000');
INSERT INTO `kota` VALUES ('5222', 'Kajang', '62000');
INSERT INTO `kota` VALUES ('5223', 'Kindang', '62000');
INSERT INTO `kota` VALUES ('5224', 'Riau Ale', '62000');
INSERT INTO `kota` VALUES ('5225', 'Ujung Bulu', '62000');
INSERT INTO `kota` VALUES ('5226', 'Ujung Loe', '62000');
INSERT INTO `kota` VALUES ('5227', 'Enrekang', '49000');
INSERT INTO `kota` VALUES ('5228', 'Alla', '62000');
INSERT INTO `kota` VALUES ('5229', 'Anggeraja', '62000');
INSERT INTO `kota` VALUES ('5230', 'Baraka', '62000');
INSERT INTO `kota` VALUES ('5231', 'Maiwa', '62000');
INSERT INTO `kota` VALUES ('5232', 'Alla Timur', '62000');
INSERT INTO `kota` VALUES ('5233', 'Anggeraja Timur', '62000');
INSERT INTO `kota` VALUES ('5234', 'Enrekang Selatan', '62000');
INSERT INTO `kota` VALUES ('5235', 'Maiwa Atas', '62000');
INSERT INTO `kota` VALUES ('5236', 'Jeneponto', '49000');
INSERT INTO `kota` VALUES ('5237', 'Bangkala', '62000');
INSERT INTO `kota` VALUES ('5238', 'Batang', '62000');
INSERT INTO `kota` VALUES ('5239', 'Kelara', '62000');
INSERT INTO `kota` VALUES ('5240', 'Tamalatea', '62000');
INSERT INTO `kota` VALUES ('5241', 'Bangkala Barat', '62000');
INSERT INTO `kota` VALUES ('5242', 'Binamu', '62000');
INSERT INTO `kota` VALUES ('5243', 'Bontoramba', '62000');
INSERT INTO `kota` VALUES ('5244', 'Turatea', '62000');
INSERT INTO `kota` VALUES ('5245', 'Arungkeke', '62000');
INSERT INTO `kota` VALUES ('5246', 'Makale', '49000');
INSERT INTO `kota` VALUES ('5247', 'Bonggakaradeng', '62000');
INSERT INTO `kota` VALUES ('5248', 'Mengkendek', '62000');
INSERT INTO `kota` VALUES ('5249', 'Saluputti', '62000');
INSERT INTO `kota` VALUES ('5250', 'Sangalla', '62000');
INSERT INTO `kota` VALUES ('5251', 'Rantepao', '49000');
INSERT INTO `kota` VALUES ('5252', 'Rindingalo', '62000');
INSERT INTO `kota` VALUES ('5253', 'Sanggalangi', '62000');
INSERT INTO `kota` VALUES ('5254', 'Sesean', '62000');
INSERT INTO `kota` VALUES ('5255', 'Bituang', '62000');
INSERT INTO `kota` VALUES ('5256', 'Buntao Rantebua', '62000');
INSERT INTO `kota` VALUES ('5257', 'Rantetayo', '62000');
INSERT INTO `kota` VALUES ('5258', 'Sa\'dan Balusu', '62000');
INSERT INTO `kota` VALUES ('5259', 'Simbuang', '62000');
INSERT INTO `kota` VALUES ('5260', 'Tondon Nanggala', '62000');
INSERT INTO `kota` VALUES ('5261', 'Gandang Batu Silang', '62000');
INSERT INTO `kota` VALUES ('5262', 'Kurra', '62000');
INSERT INTO `kota` VALUES ('5263', 'Makale Selatan', '62000');
INSERT INTO `kota` VALUES ('5264', 'Makale Utara', '62000');
INSERT INTO `kota` VALUES ('5265', 'Mappak', '62000');
INSERT INTO `kota` VALUES ('5266', 'Masanda', '62000');
INSERT INTO `kota` VALUES ('5267', 'Malimbong Balepe', '62000');
INSERT INTO `kota` VALUES ('5268', 'Rano', '62000');
INSERT INTO `kota` VALUES ('5269', 'Rembon', '62000');
INSERT INTO `kota` VALUES ('5270', 'Soloara', '62000');
INSERT INTO `kota` VALUES ('5271', 'Awan Rante Karua', '62000');
INSERT INTO `kota` VALUES ('5272', 'Bangkelekila', '62000');
INSERT INTO `kota` VALUES ('5273', 'Baruppu', '62000');
INSERT INTO `kota` VALUES ('5274', 'Buntu Pepasan', '62000');
INSERT INTO `kota` VALUES ('5275', 'Denpina/Dende Piongan Napo', '62000');
INSERT INTO `kota` VALUES ('5276', 'Kapala Pitu', '62000');
INSERT INTO `kota` VALUES ('5277', 'Kesu', '62000');
INSERT INTO `kota` VALUES ('5278', 'Nanggala', '62000');
INSERT INTO `kota` VALUES ('5279', 'Rantebua', '62000');
INSERT INTO `kota` VALUES ('5280', 'Sopai', '62000');
INSERT INTO `kota` VALUES ('5281', 'Tallunglipu', '62000');
INSERT INTO `kota` VALUES ('5282', 'Tikala', '62000');
INSERT INTO `kota` VALUES ('5283', 'Mamuju', '49000');
INSERT INTO `kota` VALUES ('5284', 'Budong-Budong', '62000');
INSERT INTO `kota` VALUES ('5285', 'Kalumpang', '62000');
INSERT INTO `kota` VALUES ('5286', 'Kalukku', '62000');
INSERT INTO `kota` VALUES ('5287', 'Tappalang', '62000');
INSERT INTO `kota` VALUES ('5288', 'Bonehau', '62000');
INSERT INTO `kota` VALUES ('5289', 'Karossa', '62000');
INSERT INTO `kota` VALUES ('5290', 'Pangale', '62000');
INSERT INTO `kota` VALUES ('5291', 'Papalang', '62000');
INSERT INTO `kota` VALUES ('5292', 'Sampaga', '62000');
INSERT INTO `kota` VALUES ('5293', 'Simboro dan Kepulauan', '62000');
INSERT INTO `kota` VALUES ('5294', 'Tapalang Barat', '62000');
INSERT INTO `kota` VALUES ('5295', 'Tobadak', '62000');
INSERT INTO `kota` VALUES ('5296', 'Tommo', '62000');
INSERT INTO `kota` VALUES ('5297', 'Topoyo', '62000');
INSERT INTO `kota` VALUES ('5298', 'Maros', '32000');
INSERT INTO `kota` VALUES ('5299', 'Bantimurung', '62000');
INSERT INTO `kota` VALUES ('5300', 'Camba', '62000');
INSERT INTO `kota` VALUES ('5301', 'Mallawa', '62000');
INSERT INTO `kota` VALUES ('5302', 'Mandai', '62000');
INSERT INTO `kota` VALUES ('5303', 'Maros Utara', '62000');
INSERT INTO `kota` VALUES ('5304', 'Tanralili', '62000');
INSERT INTO `kota` VALUES ('5305', 'Cenrana', '62000');
INSERT INTO `kota` VALUES ('5306', 'Lau', '62000');
INSERT INTO `kota` VALUES ('5307', 'Maros Baru', '62000');
INSERT INTO `kota` VALUES ('5308', 'Marusu', '62000');
INSERT INTO `kota` VALUES ('5309', 'Moncongloe', '62000');
INSERT INTO `kota` VALUES ('5310', 'Simbang', '62000');
INSERT INTO `kota` VALUES ('5311', 'Tompu Bulu', '62000');
INSERT INTO `kota` VALUES ('5312', 'Turikale', '62000');
INSERT INTO `kota` VALUES ('5313', 'Majene', '49000');
INSERT INTO `kota` VALUES ('5314', 'Malunda', '62000');
INSERT INTO `kota` VALUES ('5315', 'Pamboang', '62000');
INSERT INTO `kota` VALUES ('5316', 'Sendana', '62000');
INSERT INTO `kota` VALUES ('5317', 'Banggae', '62000');
INSERT INTO `kota` VALUES ('5318', 'Palopo', '49000');
INSERT INTO `kota` VALUES ('5319', 'Telluwanua', '49000');
INSERT INTO `kota` VALUES ('5320', 'Wara', '49000');
INSERT INTO `kota` VALUES ('5321', 'Wara Selatan', '49000');
INSERT INTO `kota` VALUES ('5322', 'Wara Utara', '49000');
INSERT INTO `kota` VALUES ('5323', 'Pinrang', '49000');
INSERT INTO `kota` VALUES ('5324', 'Cempa', '62000');
INSERT INTO `kota` VALUES ('5325', 'Duampanua', '62000');
INSERT INTO `kota` VALUES ('5326', 'Lembang', '62000');
INSERT INTO `kota` VALUES ('5327', 'Mattiro Bulu', '62000');
INSERT INTO `kota` VALUES ('5328', 'Mattirosompe', '62000');
INSERT INTO `kota` VALUES ('5329', 'Patampanua', '62000');
INSERT INTO `kota` VALUES ('5330', 'Suppa', '62000');
INSERT INTO `kota` VALUES ('5331', 'Batulappa', '62000');
INSERT INTO `kota` VALUES ('5332', 'Lanrisang', '62000');
INSERT INTO `kota` VALUES ('5333', 'Paleteang', '62000');
INSERT INTO `kota` VALUES ('5334', 'Tiroang', '62000');
INSERT INTO `kota` VALUES ('5335', 'Watang Sawitto', '62000');
INSERT INTO `kota` VALUES ('5336', 'Polewali', '49000');
INSERT INTO `kota` VALUES ('5337', 'Campalagian', '62000');
INSERT INTO `kota` VALUES ('5338', 'Tinambung', '62000');
INSERT INTO `kota` VALUES ('5339', 'Tutallu', '62000');
INSERT INTO `kota` VALUES ('5340', 'Wonomulyo', '62000');
INSERT INTO `kota` VALUES ('5341', 'Allu', '62000');
INSERT INTO `kota` VALUES ('5342', 'Anreapi', '62000');
INSERT INTO `kota` VALUES ('5343', 'Balanipa', '62000');
INSERT INTO `kota` VALUES ('5344', 'Binuang', '62000');
INSERT INTO `kota` VALUES ('5345', 'Limboro', '62000');
INSERT INTO `kota` VALUES ('5346', 'Luyo', '62000');
INSERT INTO `kota` VALUES ('5347', 'Mapilli', '62000');
INSERT INTO `kota` VALUES ('5348', 'Matakali', '62000');
INSERT INTO `kota` VALUES ('5349', 'Matangnga', '62000');
INSERT INTO `kota` VALUES ('5350', 'Tapango', '62000');
INSERT INTO `kota` VALUES ('5351', 'Sidenreng', '49000');
INSERT INTO `kota` VALUES ('5352', 'Baranti', '62000');
INSERT INTO `kota` VALUES ('5353', 'Duapitue', '62000');
INSERT INTO `kota` VALUES ('5354', 'Panca Rijang', '62000');
INSERT INTO `kota` VALUES ('5355', 'Panca Lautang', '62000');
INSERT INTO `kota` VALUES ('5356', 'Tellulimpo E', '62000');
INSERT INTO `kota` VALUES ('5357', 'Watang Pulu', '62000');
INSERT INTO `kota` VALUES ('5358', 'Kulo', '62000');
INSERT INTO `kota` VALUES ('5359', 'Maritengngae', '62000');
INSERT INTO `kota` VALUES ('5360', 'Pitu Riase', '62000');
INSERT INTO `kota` VALUES ('5361', 'Pitu Riawa', '62000');
INSERT INTO `kota` VALUES ('5362', 'Sidrap', '62000');
INSERT INTO `kota` VALUES ('5363', 'Sengkang', '49000');
INSERT INTO `kota` VALUES ('5364', 'Belawa', '62000');
INSERT INTO `kota` VALUES ('5365', 'Majauleng', '62000');
INSERT INTO `kota` VALUES ('5366', 'Maniang Pajo', '62000');
INSERT INTO `kota` VALUES ('5367', 'Pamanna', '62000');
INSERT INTO `kota` VALUES ('5368', 'Pitumpanua', '62000');
INSERT INTO `kota` VALUES ('5369', 'Sabbang Paru', '62000');
INSERT INTO `kota` VALUES ('5370', 'Sajoanging', '62000');
INSERT INTO `kota` VALUES ('5371', 'Takkalalla', '62000');
INSERT INTO `kota` VALUES ('5372', 'Tana Sitolo', '62000');
INSERT INTO `kota` VALUES ('5373', 'Bola', '62000');
INSERT INTO `kota` VALUES ('5374', 'Gilireng', '62000');
INSERT INTO `kota` VALUES ('5375', 'Keera', '62000');
INSERT INTO `kota` VALUES ('5376', 'Penrang', '62000');
INSERT INTO `kota` VALUES ('5377', 'Tempe', '62000');
INSERT INTO `kota` VALUES ('5378', 'Sinjai', '49000');
INSERT INTO `kota` VALUES ('5379', 'Sinjai Barat', '62000');
INSERT INTO `kota` VALUES ('5380', 'Sinjai Selatan', '62000');
INSERT INTO `kota` VALUES ('5381', 'Sinjai Tengah', '62000');
INSERT INTO `kota` VALUES ('5382', 'Sinjai Timur', '62000');
INSERT INTO `kota` VALUES ('5383', 'Sinjai Utara', '62000');
INSERT INTO `kota` VALUES ('5384', 'Bulupoddo', '62000');
INSERT INTO `kota` VALUES ('5385', 'Pulau Sembilan', '62000');
INSERT INTO `kota` VALUES ('5386', 'Sinjai Borong', '62000');
INSERT INTO `kota` VALUES ('5387', 'Tellu Limpoe', '62000');
INSERT INTO `kota` VALUES ('5388', 'Sungguminasa', '32000');
INSERT INTO `kota` VALUES ('5389', 'Bajeng', '62000');
INSERT INTO `kota` VALUES ('5390', 'Bontomarannu', '62000');
INSERT INTO `kota` VALUES ('5391', 'Bontonompo', '62000');
INSERT INTO `kota` VALUES ('5392', 'Bungaya', '62000');
INSERT INTO `kota` VALUES ('5393', 'Pallangga', '62000');
INSERT INTO `kota` VALUES ('5394', 'Parangloe', '62000');
INSERT INTO `kota` VALUES ('5395', 'Tinggimoncong', '62000');
INSERT INTO `kota` VALUES ('5396', 'Barombong', '62000');
INSERT INTO `kota` VALUES ('5397', 'Biringbulu', '62000');
INSERT INTO `kota` VALUES ('5398', 'Somba Opu', '62000');
INSERT INTO `kota` VALUES ('5399', 'Tombolo Pao', '62000');
INSERT INTO `kota` VALUES ('5400', 'Takalar', '49000');
INSERT INTO `kota` VALUES ('5401', 'Galesong Selatan', '62000');
INSERT INTO `kota` VALUES ('5402', 'Galesong Utara', '62000');
INSERT INTO `kota` VALUES ('5403', 'Mangara Bombang', '62000');
INSERT INTO `kota` VALUES ('5404', 'Mappakasunggu', '62000');
INSERT INTO `kota` VALUES ('5405', 'Patallassang', '62000');
INSERT INTO `kota` VALUES ('5406', 'Polobangkeng Selatan', '62000');
INSERT INTO `kota` VALUES ('5407', 'Polobangkeng Utara', '62000');
INSERT INTO `kota` VALUES ('5408', 'Watampone', '49000');
INSERT INTO `kota` VALUES ('5409', 'Ajangale', '62000');
INSERT INTO `kota` VALUES ('5410', 'Barebbo', '62000');
INSERT INTO `kota` VALUES ('5411', 'Bontocani', '62000');
INSERT INTO `kota` VALUES ('5412', 'Cina', '62000');
INSERT INTO `kota` VALUES ('5413', 'Dua Boccoe', '62000');
INSERT INTO `kota` VALUES ('5414', 'Kahu', '62000');
INSERT INTO `kota` VALUES ('5415', 'Kajuara', '62000');
INSERT INTO `kota` VALUES ('5416', 'Lamuru', '62000');
INSERT INTO `kota` VALUES ('5417', 'Lappariaja', '62000');
INSERT INTO `kota` VALUES ('5418', 'Libureng', '62000');
INSERT INTO `kota` VALUES ('5419', 'Mare', '62000');
INSERT INTO `kota` VALUES ('5420', 'Ponre', '62000');
INSERT INTO `kota` VALUES ('5421', 'Salomekko', '62000');
INSERT INTO `kota` VALUES ('5422', 'Sibulue', '62000');
INSERT INTO `kota` VALUES ('5423', 'Tellu Siattinge', '62000');
INSERT INTO `kota` VALUES ('5424', 'Tonra', '62000');
INSERT INTO `kota` VALUES ('5425', 'Ulaweng', '62000');
INSERT INTO `kota` VALUES ('5426', 'Amali', '62000');
INSERT INTO `kota` VALUES ('5427', 'Awangpone', '62000');
INSERT INTO `kota` VALUES ('5428', 'Bengo', '62000');
INSERT INTO `kota` VALUES ('5429', 'Palakka', '62000');
INSERT INTO `kota` VALUES ('5430', 'Patimpeng', '62000');
INSERT INTO `kota` VALUES ('5431', 'Tanete Riattang', '62000');
INSERT INTO `kota` VALUES ('5432', 'Tanete Riattang Barat', '62000');
INSERT INTO `kota` VALUES ('5433', 'Tanete Riattang Timur', '62000');
INSERT INTO `kota` VALUES ('5434', 'Watansoppeng', '49000');
INSERT INTO `kota` VALUES ('5435', 'Donri Donri', '62000');
INSERT INTO `kota` VALUES ('5436', 'Lili Riaja', '62000');
INSERT INTO `kota` VALUES ('5437', 'Lili Rilau', '62000');
INSERT INTO `kota` VALUES ('5438', 'Mario Riwawo', '62000');
INSERT INTO `kota` VALUES ('5439', 'Mario Riawa', '62000');
INSERT INTO `kota` VALUES ('5440', 'Ganra', '62000');
INSERT INTO `kota` VALUES ('5441', 'Lalabata', '62000');
INSERT INTO `kota` VALUES ('5442', 'Benteng', '49000');
INSERT INTO `kota` VALUES ('5443', 'Bontosikuyu', '62000');
INSERT INTO `kota` VALUES ('5444', 'Bontomatene', '62000');
INSERT INTO `kota` VALUES ('5445', 'Pasimarannu', '62000');
INSERT INTO `kota` VALUES ('5446', 'Pasimasunggu', '62000');
INSERT INTO `kota` VALUES ('5447', 'Bontoharu', '62000');
INSERT INTO `kota` VALUES ('5448', 'Bontomanai', '62000');
INSERT INTO `kota` VALUES ('5449', 'Pasilambena', '62000');
INSERT INTO `kota` VALUES ('5450', 'Takabonerate', '62000');
INSERT INTO `kota` VALUES ('5451', 'Pangkajene', '49000');
INSERT INTO `kota` VALUES ('5452', 'Balocci', '62000');
INSERT INTO `kota` VALUES ('5453', 'Bungoro', '62000');
INSERT INTO `kota` VALUES ('5454', 'Labakkang', '62000');
INSERT INTO `kota` VALUES ('5455', 'Liukang Tangaya', '62000');
INSERT INTO `kota` VALUES ('5456', 'Liukang Tupabiring', '62000');
INSERT INTO `kota` VALUES ('5457', 'Ma\'Rang', '62000');
INSERT INTO `kota` VALUES ('5458', 'Segeri', '62000');
INSERT INTO `kota` VALUES ('5459', 'Kalukuang Masalima', '62000');
INSERT INTO `kota` VALUES ('5460', 'Mandalle', '62000');
INSERT INTO `kota` VALUES ('5461', 'Minasa Te\'ne', '62000');
INSERT INTO `kota` VALUES ('5462', 'Tondong Talasa', '62000');
INSERT INTO `kota` VALUES ('5463', 'Pare-Pare', '49000');
INSERT INTO `kota` VALUES ('5464', 'Bacukiki', '49000');
INSERT INTO `kota` VALUES ('5465', 'Soreang', '49000');
INSERT INTO `kota` VALUES ('5466', 'Ujung', '49000');
INSERT INTO `kota` VALUES ('5467', 'Belopa', '49000');
INSERT INTO `kota` VALUES ('5468', 'Bajo', '62000');
INSERT INTO `kota` VALUES ('5469', 'Bassesangtempe', '62000');
INSERT INTO `kota` VALUES ('5470', 'Bua', '62000');
INSERT INTO `kota` VALUES ('5471', 'Bua Ponrang', '62000');
INSERT INTO `kota` VALUES ('5472', 'Kamanre', '62000');
INSERT INTO `kota` VALUES ('5473', 'Lamasi', '62000');
INSERT INTO `kota` VALUES ('5474', 'Larompong', '62000');
INSERT INTO `kota` VALUES ('5475', 'Laronpong Selatan', '62000');
INSERT INTO `kota` VALUES ('5476', 'Latimojong', '62000');
INSERT INTO `kota` VALUES ('5477', 'Poncang', '62000');
INSERT INTO `kota` VALUES ('5478', 'Suli', '62000');
INSERT INTO `kota` VALUES ('5479', 'Walenrang', '62000');
INSERT INTO `kota` VALUES ('5480', 'Malili / Soroako', '49000');
INSERT INTO `kota` VALUES ('5481', 'Angkona', '62000');
INSERT INTO `kota` VALUES ('5482', 'Burau', '62000');
INSERT INTO `kota` VALUES ('5483', 'Mangkutana', '62000');
INSERT INTO `kota` VALUES ('5484', 'Nuha', '62000');
INSERT INTO `kota` VALUES ('5485', 'Tomoni', '62000');
INSERT INTO `kota` VALUES ('5486', 'Towuti', '62000');
INSERT INTO `kota` VALUES ('5487', 'Wotu', '62000');
INSERT INTO `kota` VALUES ('5488', 'Masamba', '49000');
INSERT INTO `kota` VALUES ('5489', 'Baebunta', '62000');
INSERT INTO `kota` VALUES ('5490', 'Bone-Bone', '62000');
INSERT INTO `kota` VALUES ('5491', 'Limbong', '62000');
INSERT INTO `kota` VALUES ('5492', 'Malangke', '62000');
INSERT INTO `kota` VALUES ('5493', 'Malangke Barat', '62000');
INSERT INTO `kota` VALUES ('5494', 'Mappedeceng', '62000');
INSERT INTO `kota` VALUES ('5495', 'Rampi', '62000');
INSERT INTO `kota` VALUES ('5496', 'Sabbang', '62000');
INSERT INTO `kota` VALUES ('5497', 'Seko', '62000');
INSERT INTO `kota` VALUES ('5498', 'Sukamaju', '62000');
INSERT INTO `kota` VALUES ('5499', 'Mamasa', '49000');
INSERT INTO `kota` VALUES ('5500', 'Aralle', '62000');
INSERT INTO `kota` VALUES ('5501', 'Mambi', '62000');
INSERT INTO `kota` VALUES ('5502', 'Messawa', '62000');
INSERT INTO `kota` VALUES ('5503', 'Pana', '62000');
INSERT INTO `kota` VALUES ('5504', 'Nosu', '62000');
INSERT INTO `kota` VALUES ('5505', 'Sesena Padang', '62000');
INSERT INTO `kota` VALUES ('5506', 'Sumarorong', '62000');
INSERT INTO `kota` VALUES ('5507', 'Tabang', '62000');
INSERT INTO `kota` VALUES ('5508', 'Tabulahan', '62000');
INSERT INTO `kota` VALUES ('5509', 'Tanduk Kalua', '62000');
INSERT INTO `kota` VALUES ('5510', 'Pasangkayu', '49000');
INSERT INTO `kota` VALUES ('5511', 'Bambalamotu', '62000');
INSERT INTO `kota` VALUES ('5512', 'Baras', '62000');
INSERT INTO `kota` VALUES ('5513', 'Sarudu', '62000');

-- ----------------------------
-- Table structure for kustomer
-- ----------------------------
DROP TABLE IF EXISTS `kustomer`;
CREATE TABLE `kustomer` (
  `id_kustomer` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` enum('u','k') COLLATE latin1_general_ci NOT NULL DEFAULT 'u',
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL,
  `fakultas` enum('FT','FIK','FE','FIP','FIS','FMIPA') COLLATE latin1_general_ci NOT NULL,
  `foto` text COLLATE latin1_general_ci NOT NULL,
  `blokir` enum('N','Y') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_kustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of kustomer
-- ----------------------------
INSERT INTO `kustomer` VALUES ('8', 'u', '270ec9b0b74535f78b7899cdf5958bfa', 'member umum 1', 'jalan memum1', 'memum1@email.com', '222222', '1529', '', '15202576_1376762425681117_4662238944514298261_n.jpg', 'N');
INSERT INTO `kustomer` VALUES ('10', 'k', '63ac4ab593b1c8a0a06d633a4f75fd3d', 'member koperasi 1', 'jalan memkop1', 'memkop1@email.com', '1111111111', '1064', 'FT', '11921650_1170781602937853_2602344976969667705_n.jpg', 'N');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id_label` int(5) NOT NULL AUTO_INCREMENT,
  `nama_label` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `label_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_label`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('19', 'Teknologi', 'teknologi', 'Y');
INSERT INTO `label` VALUES ('22', 'Politik', 'politik', 'Y');
INSERT INTO `label` VALUES ('23', 'Hiburan', 'hiburan', 'Y');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `id_session` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'admin1', '', 'e00cf25ad42683b3df678c61f42c6bda', '2016-11-26 17:26:19', 'cqodpq60c6nvqhp93acgq4dkd4', '');
INSERT INTO `login` VALUES ('2', 'admin2', '', 'c84258e9c39059a89ab77d846ddab909', '2016-11-20 16:17:28', 'ueli06jmcbogo3ioj9bl266112', '');
INSERT INTO `login` VALUES ('3', 'memkop1', '', '63ac4ab593b1c8a0a06d633a4f75fd3d', '2016-11-26 15:32:30', 'h3impj6sq7rtp4fd8khsj798a5', '');
INSERT INTO `login` VALUES ('4', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '0000-00-00 00:00:00', '', '');
INSERT INTO `login` VALUES ('5', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '0000-00-00 00:00:00', '', '');
INSERT INTO `login` VALUES ('6', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '0000-00-00 00:00:00', '', '');
INSERT INTO `login` VALUES ('7', '6', '', '8f14e45fceea167a5a36dedd4bea2543', '0000-00-00 00:00:00', '', '');

-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu` (
  `id_main` int(5) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `adminmenu` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_main`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES ('2', 'Home', 'http://', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('3', 'Nasional', 'kategori-34-nasional.html', 'Y', 'Y');
INSERT INTO `mainmenu` VALUES ('4', 'Otonomi', 'kategori-33-otonomi.html', 'N', 'N');
INSERT INTO `mainmenu` VALUES ('5', 'Politik', 'kategori-32-politik.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('6', 'Ekonomi', 'kategori-2-ekonomi.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('7', 'Olahraga', 'kategori-35-sport.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('8', 'Hukum', 'kategori-36-hukum.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('14', 'Setting Web', '', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('15', 'Setting Menu', '', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('16', 'Manajemen Berita', '', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('54', 'Hubungi Kami', '?module=hubungi', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('52', 'Media', '', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('59', 'Banner', '?module=banner', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('64', 'Manajemen Produk', '', 'N', 'Y');
INSERT INTO `mainmenu` VALUES ('66', 'Teknologi', 'kategori-37-teknologi.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('67', 'Kesehatan', 'kategori-38-kesehatan.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('68', 'Lifestyle', 'kategori-39-life-style.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('69', 'Lingkungan', 'kategori-40-lingkungan.html', 'Y', 'N');
INSERT INTO `mainmenu` VALUES ('70', 'Indeks', 'kategori-41-pendidikan.html', 'Y', 'N');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `kategori` enum('k','u') NOT NULL DEFAULT 'u' COMMENT 'k=koperasi; u=umum',
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `fakultas` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `blokir` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id_member`),
  KEY `id_loginFK2` (`id_login`) USING BTREE,
  CONSTRAINT `id_loginFK2` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2', '3', 'k', 'memKop1', 'jalan 1', '01111', 'FIB', '', 'N');

-- ----------------------------
-- Table structure for menuutama
-- ----------------------------
DROP TABLE IF EXISTS `menuutama`;
CREATE TABLE `menuutama` (
  `id_main` int(5) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lokasi` enum('Admin','Public') NOT NULL,
  `hakakses` enum('user','admin') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `urutan` int(5) NOT NULL,
  PRIMARY KEY (`id_main`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menuutama
-- ----------------------------
INSERT INTO `menuutama` VALUES ('2', 'Pengaturan', '', 'Y', 'Admin', 'admin', 'fa fa-info-circle', '1');
INSERT INTO `menuutama` VALUES ('24', 'Tentang Kami', 'profil-kami.html', 'Y', 'Public', 'admin', '', '2');
INSERT INTO `menuutama` VALUES ('3', 'Artikel', '', 'Y', 'Admin', 'admin', 'fa  fa-book', '2');
INSERT INTO `menuutama` VALUES ('4', 'Produk', '', 'Y', 'Admin', 'admin', 'fa fa-shopping-cart', '3');
INSERT INTO `menuutama` VALUES ('20', 'Interaksi', '', 'Y', 'Admin', 'admin', 'fa fa-comments', '4');
INSERT INTO `menuutama` VALUES ('21', 'Kontak', '', 'Y', 'Admin', 'user', 'fa fa-male', '5');
INSERT INTO `menuutama` VALUES ('22', 'Laporan', '', 'Y', 'Admin', 'admin', 'fa fa-bar-chart-o', '6');
INSERT INTO `menuutama` VALUES ('25', 'Cara Pembelian', 'cara-pembelian.html', 'Y', 'Public', 'admin', '', '3');
INSERT INTO `menuutama` VALUES ('26', 'Hubungi Kami', 'hubungi-kami.html', 'Y', 'Public', 'admin', '', '4');
INSERT INTO `menuutama` VALUES ('27', 'Member', 'member-viewbeli-0.html', 'Y', 'Public', 'admin', '', '1');
INSERT INTO `menuutama` VALUES ('28', 'User', '', 'Y', 'Admin', 'admin', 'fa fa-users', '2');

-- ----------------------------
-- Table structure for modul
-- ----------------------------
DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  `nama_toko` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `meta_keyword` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `email_pengelola` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_rekening` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_hp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of modul
-- ----------------------------
INSERT INTO `modul` VALUES ('18', 'Produk', '?module=produk', '', '', 'admin', 'Y', '5', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('42', 'Order', '?module=order', '', '', 'admin', 'Y', '6', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('31', 'Kategori Produk', '?module=kategori', '', '', 'admin', 'Y', '4', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('43', 'Profil Toko Online', '?module=profil', '<p><strong>Selamat Datang di DaichaShop | GROSIR Kosmetik Murah</strong></p>\r\n\r\n<p>Kami adalah Grosir Kosmetik Online Yang Menjual Kosmetik Murah|GROSIR Kosmetik Murah</p>\r\n', '1.jpg', 'admin', 'Y', '2', 'DaichaShop | Grosir Kosmetik Online', 'DaichaShop | Grosir Kosmetik Online', '', 'info@daichashop.com', 'Mandiri 131-000-699-7573 an. Sri Suhartini', '0821180935322');
INSERT INTO `modul` VALUES ('67', 'menu utama', '?module=menuutama', '', '', 'admin', 'Y', '11', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('58', 'Edit Rekening Bank', '?module=bank', '', '', 'user', 'Y', '16', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('44', 'Hubungi Kami', '?module=hubungi', '', '', 'admin', 'Y', '9', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('45', 'Cara Pembelian', '?module=carabeli', '<ol>\r\n	<li>Klik pada tombol&nbsp;<strong>Beli</strong> pada produk yang ingin Anda pesan.</li>\r\n	<li>Produk yang Anda pesan akan masuk ke dalam <strong>Keranjang Belanja</strong>. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom <strong>Jumlah</strong>, kemudian klik tombol <strong>Update</strong>. Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol Kali yang berada di kolom paling kanan.</li>\r\n	<li>Jika sudah selesai, klik tombol <strong>Selesai Belanja</strong>, maka akan tampil form untuk pengisian data kustomer/pembeli.</li>\r\n	<li>Setelah data pembeli selesai diisikan, klik tombol <strong>Proses</strong>, maka akan tampil data pembeli beserta produk yang dipesannya (jika diperlukan catat nomor ordersnya). Dan juga ada total pembayaran serta nomor rekening pembayaran.</li>\r\n	<li>Apabila telah melakukan pembayaran, maka produk/barang akan segera kami kirimkan.</li>\r\n</ol>\r\n', 'gedung.jpg', 'admin', 'Y', '8', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('47', 'Banner', '?module=banner', '', '', 'user', 'Y', '10', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('48', 'Ongkos Kirim', '?module=ongkoskirim', '', '', 'user', 'Y', '7', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('49', 'User', '?module=user', '', '', 'user', 'Y', '1', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('53', 'Modul YM', '?module=ym', '', '', 'user', 'Y', '12', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('52', 'Laporan', '?module=laporan', '', '', 'user', 'Y', '11', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('57', 'Download Katalog', '?module=download', '', '', 'user', 'N', '13', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('60', 'Edit Slide', '?module=header', '', '', 'admin', 'Y', '18', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('61', 'Data Kontak', '?module=kontak', '', '', 'user', 'Y', '19', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('62', 'Edit Header Website', '?module=nduwur', '', '', 'user', 'Y', '20', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('63', 'Testimoni', '?module=testimoni', '', '', 'user', 'Y', '21', '', '', '', '', '', '');
INSERT INTO `modul` VALUES ('66', 'Facebook Fanspage', '?module=fb', '', '', 'user', 'Y', '22', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for mod_bank
-- ----------------------------
DROP TABLE IF EXISTS `mod_bank`;
CREATE TABLE `mod_bank` (
  `id_bank` int(5) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(100) NOT NULL,
  `no_rekening` varchar(100) NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  PRIMARY KEY (`id_bank`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mod_bank
-- ----------------------------
INSERT INTO `mod_bank` VALUES ('9', 'BRI', '316201022470533', 'M.Sofi Asrifin', 'bri.png');

-- ----------------------------
-- Table structure for mod_kontak
-- ----------------------------
DROP TABLE IF EXISTS `mod_kontak`;
CREATE TABLE `mod_kontak` (
  `id_kontak` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kontak`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mod_kontak
-- ----------------------------
INSERT INTO `mod_kontak` VALUES ('1', 'Blackberry', 'xxx', 'www.omahwebsite.com', 'logo-bbm.jpg');
INSERT INTO `mod_kontak` VALUES ('2', 'No.Telp', '089667791613', '', 'tel.gif');

-- ----------------------------
-- Table structure for mod_ym
-- ----------------------------
DROP TABLE IF EXISTS `mod_ym`;
CREATE TABLE `mod_ym` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of mod_ym
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL AUTO_INCREMENT,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(11) NOT NULL,
  PRIMARY KEY (`id_orders`),
  KEY `id_kustomerFK` (`id_kustomer`) USING BTREE,
  CONSTRAINT `id_kustomerFK2` FOREIGN KEY (`id_kustomer`) REFERENCES `kustomer` (`id_kustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('89', 'Baru', '2016-11-27', '14:07:51', '8');
INSERT INTO `orders` VALUES ('90', 'Baru', '2016-11-27', '14:38:53', '8');
INSERT INTO `orders` VALUES ('91', 'Baru', '2016-11-27', '16:24:48', '10');
INSERT INTO `orders` VALUES ('92', 'Lunas', '2016-11-27', '16:26:15', '8');

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail` (
  `id_orders_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_orders` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_detail`),
  KEY `id_ordersFK3` (`id_orders`) USING BTREE,
  KEY `id_produkFK3` (`id_produk`) USING BTREE,
  CONSTRAINT `id_ordersFK` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`),
  CONSTRAINT `id_produkFK` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------
INSERT INTO `orders_detail` VALUES ('1', '89', '61', '1');
INSERT INTO `orders_detail` VALUES ('2', '89', '62', '1');
INSERT INTO `orders_detail` VALUES ('3', '90', '61', '2');
INSERT INTO `orders_detail` VALUES ('4', '92', '62', '2');

-- ----------------------------
-- Table structure for orders_detail_sewa
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail_sewa`;
CREATE TABLE `orders_detail_sewa` (
  `id_order_detail_sewa` int(11) NOT NULL AUTO_INCREMENT,
  `id_order_sewa` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `status` enum('p','b','k','t') NOT NULL DEFAULT 'p' COMMENT '''pending'',''belum'',''kembali'',''terlambat''',
  PRIMARY KEY (`id_order_detail_sewa`),
  KEY `id_order_sewaFK` (`id_order_sewa`) USING BTREE,
  KEY `id_produkFK3` (`id_produk`) USING BTREE,
  CONSTRAINT `id_order_sewaFK` FOREIGN KEY (`id_order_sewa`) REFERENCES `orders_sewa` (`id_order_sewa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_produkFK3` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders_detail_sewa
-- ----------------------------
INSERT INTO `orders_detail_sewa` VALUES ('1', '1', '73', '1', '2016-11-29 05:35:00', 'b');
INSERT INTO `orders_detail_sewa` VALUES ('2', '1', '76', '2', '2016-11-28 05:35:14', 'b');
INSERT INTO `orders_detail_sewa` VALUES ('3', '2', '83', '1', '0000-00-00 00:00:00', 'p');
INSERT INTO `orders_detail_sewa` VALUES ('4', '2', '84', '2', '0000-00-00 00:00:00', 'p');

-- ----------------------------
-- Table structure for orders_sewa
-- ----------------------------
DROP TABLE IF EXISTS `orders_sewa`;
CREATE TABLE `orders_sewa` (
  `id_order_sewa` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text NOT NULL,
  `id_kustomer` int(11) NOT NULL,
  `tgl_sewa` datetime NOT NULL,
  PRIMARY KEY (`id_order_sewa`),
  KEY `id_memberFK` (`id_kustomer`) USING BTREE,
  CONSTRAINT `id_kustomerFK` FOREIGN KEY (`id_kustomer`) REFERENCES `kustomer` (`id_kustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders_sewa
-- ----------------------------
INSERT INTO `orders_sewa` VALUES ('1', 'sewa palu dan lcd untuk sidang STNK', '8', '2016-11-27 05:33:17');
INSERT INTO `orders_sewa` VALUES ('2', 'Sewa untuk sidang skripsi ', '8', '2016-11-23 14:12:00');

-- ----------------------------
-- Table structure for orders_temp
-- ----------------------------
DROP TABLE IF EXISTS `orders_temp`;
CREATE TABLE `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of orders_temp
-- ----------------------------
INSERT INTO `orders_temp` VALUES ('182', '62', 'k65uenug9g4nvc34hff09q03r4', '1', '2016-11-14', '20:34:13', '10');
INSERT INTO `orders_temp` VALUES ('183', '61', 'mt8qs4084uvus8rgfba1r99gh0', '1', '2016-11-21', '14:02:59', '5');
INSERT INTO `orders_temp` VALUES ('189', '57', 'njcppgmfht0hmdbroaum486cq0', '1', '2016-11-26', '01:59:04', '6');
INSERT INTO `orders_temp` VALUES ('188', '61', 'njcppgmfht0hmdbroaum486cq0', '2', '2016-11-26', '01:57:24', '5');
INSERT INTO `orders_temp` VALUES ('190', '60', 'h3impj6sq7rtp4fd8khsj798a5', '1', '2016-11-26', '15:33:09', '3');
INSERT INTO `orders_temp` VALUES ('203', '61', '8os58bt4car38gjaorimhq0j44', '1', '2016-11-27', '16:22:32', '5');
INSERT INTO `orders_temp` VALUES ('202', '61', '5l2dsbijh6ckiarkpnoal8iba5', '1', '2016-11-27', '15:08:21', '5');
INSERT INTO `orders_temp` VALUES ('205', '58', 'm2qsrs22urb1r027r7n5jcr9s1', '1', '2016-11-27', '18:57:50', '9');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `produk_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL,
  `tipe` enum('j','s') COLLATE latin1_general_ci NOT NULL DEFAULT 'j' COMMENT '''jual'',''sewa''',
  `hargaumum` decimal(10,0) NOT NULL,
  `hargakoperasi` decimal(10,0) NOT NULL,
  `jenisdurasi` enum('h','j') COLLATE latin1_general_ci NOT NULL DEFAULT 'h' COMMENT '''hari'',''jam''',
  `durasi` int(11) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES ('56', '19', 'Sepatu Satu', 'sepatu-satu', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '100000', '9', '1.00', '2015-03-09', '52.jpg', '2', '5', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('57', '20', 'Sepatu Dua', 'sepatu-dua', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '150000', '6', '1.00', '2015-03-09', '54sample.jpg', '5', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('58', '19', 'Sepatu Tiga', 'sepatu-tiga', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '10000', '9', '1.00', '2015-03-09', '121.jpg', '2', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('59', '19', 'Sepatu Empat', 'sepatu-empat', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '50000', '5', '1.00', '2015-03-09', '962.jpg', '1', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('60', '19', 'Sepatu Lima', 'sepatu-lima', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '10000', '3', '1.00', '2015-03-09', '984.jpg', '2', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('61', '19', 'Sepatu Ajib', 'sepatu-ajib', '<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n\r\n<p>Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja Ini adalah contoh produk saja</p>\r\n', '1550000', '5', '1.00', '2015-03-09', '705.jpg', '2', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('62', '19', 'VanTofel', 'vantofel', '<p>Masukkan keterangan produk disini.</p>\r\n', '1250000', '10', '1.00', '2016-09-26', '66Screenshot_1.jpg', '1', '0', 'j', '0', '0', '', '0');
INSERT INTO `produk` VALUES ('73', '0', 'LCD Proyektor View Sonic + Screen', 'k', '<p>LCD Proyektor View Sonic Hitam</p>\r\n', '0', '1', '0.00', '2016-11-27', '62LCd Proyektor View Sonic.jpg', '1', '0', 's', '125000', '100000', 'h', '1');
INSERT INTO `produk` VALUES ('76', '0', 'Palu Sidang', 'opi', '<p>999999677Masukkan keterangan produk disini.</p>\r\n', '0', '1', '0.00', '2016-11-27', '56Palu sidang.jpg', '1', '0', 's', '20000', '15000', 'h', '1');
INSERT INTO `produk` VALUES ('83', '0', 'LCD Proyektor Sony + Screen', 'lcd-proyektor-sony', '<p>LCD Proyektor Sony</p>\r\n', '0', '1', '0.00', '2016-11-28', '21LCd Proyektor Sony.jpg', '1', '0', 's', '125000', '100000', 'h', '1');
INSERT INTO `produk` VALUES ('84', '0', 'Kamera Nikon D3200', 'kamera-nikon-d3200', '<p>Fitur</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<th>Spesifikasi</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipe</td>\r\n			<td>Nikon D3200</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ukuran (L x W x H cm)</td>\r\n			<td>12.5 x 9.6 x 7.65 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Berat (kg)</td>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Warna</td>\r\n			<td>Hitam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ukuran Layar (in)</td>\r\n			<td>3.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Megapiksel</td>\r\n			<td>24.3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fitur</td>\r\n			<td>Image Stabilization</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Garansi produk</td>\r\n			<td>1 Tahun Garansi (Spare-part dan Servis)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Input</td>\r\n			<td>USB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Output</td>\r\n			<td>Component Video|Composite Video|3.5mm jack|USB|HDMI</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Resolusi Layar</td>\r\n			<td>921000 dots</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipe Baterai</td>\r\n			<td>Li-Ion</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Format Foto</td>\r\n			<td>JPEG &amp; RAW</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ukuran File Foto</td>\r\n			<td>6016 x 4000</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Format Video</td>\r\n			<td>MOV</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Video HD</td>\r\n			<td>Ya</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Resolusi Video</td>\r\n			<td>1920x1080</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Focal Length</td>\r\n			<td>18 - 55mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Image Stabilization</td>\r\n			<td>Ya</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Range Aperture Lensa</td>\r\n			<td>f/3.5-5.6</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ISO Range</td>\r\n			<td>100-6400</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Range Shutter Speed</td>\r\n			<td>1/4000- 1/30 detik</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Built in Flash</td>\r\n			<td>Ya</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipe Memory Card</td>\r\n			<td>SD/SDHC/SDXC</td>\r\n		</tr>\r\n		<tr>\r\n			<td>HDMI Port</td>\r\n			<td>Ya</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipe Layar</td>\r\n			<td>LCD Layar</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '0', '1', '0.00', '2016-11-28', '55Kamera DSLR.jpg', '1', '0', 's', '75000', '50000', 'h', '3');

-- ----------------------------
-- Table structure for profil
-- ----------------------------
DROP TABLE IF EXISTS `profil`;
CREATE TABLE `profil` (
  `id_profil` int(5) NOT NULL AUTO_INCREMENT,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nama_toko` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `meta_keyword` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `email_pengelola` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_rekening` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_hp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `pin_bb` varchar(10) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of profil
-- ----------------------------
INSERT INTO `profil` VALUES ('1', '<p><strong>Selamat Datang di DaichaShop | GROSIR Kosmetik Murah</strong></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, his debet aliquam ne. Ei usu justo invidunt liberavisse, nec nonumes sententiae eu. Veniam decore aperiri in sed, an essent invenire definiebas eam. Te posse exerci theophrastus vel. Legimus postulant eum ut, per movet periculis adolescens ut, eros definitiones qui ad.</p>\r\n\r\n<p>Natum nostro definitionem no duo. Ex eam volutpat electram. Simul argumentum signiferumque ex mea, et quaerendum eloquentiam sea, cu nusquam persequeris complectitur eam. Consul qualisque eu vim, qui cu enim partem utamur. Mei at veniam vituperata, ex vel timeam tritani epicuri.</p>\r\n', 'logo.png', 'DaichaShop | Grosir Kosmetik Onlinex', 'Jl. Bumiku No.17 Jakarta', 'Unit Usaha Kopma Unesa', 'toko online, aneka merchandise kampus', 'info@kopmaunesa.com', 'Mandiri 131-xxx-xxx-xxxx an. OmahWebsite', '-', '-');

-- ----------------------------
-- Table structure for sekilasinfo
-- ----------------------------
DROP TABLE IF EXISTS `sekilasinfo`;
CREATE TABLE `sekilasinfo` (
  `id_sekilas` int(5) NOT NULL AUTO_INCREMENT,
  `info` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_sekilas`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of sekilasinfo
-- ----------------------------
INSERT INTO `sekilasinfo` VALUES ('1', 'Anak yang mengalami gangguan tidur, cenderung memakai obat2an dan alkohol berlebih saat dewasa.', '2010-04-11', 'news5.jpg');
INSERT INTO `sekilasinfo` VALUES ('2', 'WHO merilis, 30 persen anak-anak di dunia kecanduan menonton televisi dan bermain komputer.', '2010-04-11', 'news4.jpg');
INSERT INTO `sekilasinfo` VALUES ('3', 'Menurut peneliti di Detroit, orang yang selalu tersenyum lebar cenderung hidup lebih lama.', '2010-04-11', 'news3.jpg');
INSERT INTO `sekilasinfo` VALUES ('4', 'Menurut United Stated Trade Representatives, 25% obat yang beredar di Indonesia adalah palsu.', '2010-04-11', 'news2.jpg');
INSERT INTO `sekilasinfo` VALUES ('5', 'Presiden AS Barack Obama memesan Nasi Goreng di restoran Bali langsung dari Amerika', '2010-04-11', 'news1.jpg');

-- ----------------------------
-- Table structure for statistik
-- ----------------------------
DROP TABLE IF EXISTS `statistik`;
CREATE TABLE `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of statistik
-- ----------------------------
INSERT INTO `statistik` VALUES ('127.0.0.2', '2009-09-11', '1', '1252681630');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-09-11', '17', '1252734209');
INSERT INTO `statistik` VALUES ('127.0.0.3', '2009-09-12', '8', '1252817594');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-24', '8', '1256381921');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-26', '108', '1256620074');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-27', '52', '1256686769');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-28', '124', '1256792223');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-29', '9', '1256828032');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-10-31', '3', '1257047101');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-01', '85', '1257113554');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-02', '11', '1257207543');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-03', '165', '1257292312');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-04', '59', '1257403499');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-05', '10', '1257433172');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-11', '13', '1258006911');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-12', '10', '1258048069');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-14', '14', '1258222519');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-17', '2', '1258473856');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-19', '16', '1258635469');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-21', '4', '1258863505');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-25', '3', '1259216216');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-26', '1', '1259222467');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-11-30', '11', '1259651841');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-02', '9', '1259746407');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-03', '17', '1259906128');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-10', '69', '1260423794');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-12', '26', '1260560082');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-11', '5', '1260508621');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-13', '8', '1260716786');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-14', '9', '1260772698');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-15', '9', '1260837158');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-16', '7', '1260905627');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-17', '48', '1261026791');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-18', '11', '1261088534');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-22', '3', '1261477278');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-25', '2', '1261686043');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-26', '29', '1261835507');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-27', '7', '1261920445');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-28', '3', '1261965611');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-29', '21', '1262024011');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2009-12-30', '24', '1262146708');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-01-01', '12', '1262286131');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-01-03', '38', '1262529325');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-01-12', '89', '1263264291');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-01-14', '54', '1263482540');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-01-15', '57', '1263506901');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-11', '30', '1265831568');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-13', '2', '1266032303');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-14', '3', '1266115347');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-15', '15', '1266195235');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-18', '1', '1266499945');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-22', '5', '1266856332');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-02-25', '46', '1267103145');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-12', '10', '1273654648');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-16', '195', '1274026185');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-17', '2', '1274029517');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-19', '1', '1274279374');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-27', '16', '1274967085');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-30', '4', '1275192045');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-05-31', '13', '1275271939');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-06-05', '1', '1275676869');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-06-06', '2', '1275842170');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-06-15', '3', '1276572924');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-06-22', '206', '1277221605');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-08-02', '17', '1280754660');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-08-20', '7', '1282285305');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-08-30', '21', '1283185430');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-08-31', '53', '1283207455');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-02', '133', '1283402651');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-05', '35', '1283702206');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-13', '10', '1284370291');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-17', '12', '1284662303');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-22', '2', '1285091212');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-23', '47', '1285254071');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-26', '32', '1285512806');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-09-27', '51', '1285532379');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-14', '10', '1287074605');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-15', '6', '1287150179');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-16', '2', '1287170167');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-20', '145', '1287636778');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-21', '177', '1287721183');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2010-10-22', '63', '1287752692');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-02', '7', '1301680774');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-03', '8', '1301801389');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-05', '16', '1301977471');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-09', '44', '1302288659');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-10', '129', '1302370890');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-11', '34', '1302488765');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-17', '8', '1302998534');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-22', '5', '1303479879');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-04-23', '36', '1303534207');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-05-26', '144', '1306423419');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-05-27', '59', '1306467737');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-05-28', '57', '1306588828');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-05-29', '8', '1306649171');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2011-05-30', '18', '1306736260');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-21', '15', '1377121175');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-24', '10', '1377343613');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-25', '6', '1377389911');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-26', '3', '1377533210');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-28', '59', '1377711504');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-29', '3', '1377798184');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-08-30', '18', '1377872253');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-09-17', '1', '1379405147');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-09-25', '1', '1380120724');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-10-08', '1', '1381239151');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-10-13', '21', '1381682778');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-10-19', '3', '1382163981');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-10-25', '1', '1382666432');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-11-02', '115', '1383415029');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2013-11-12', '6', '1384232043');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-01-13', '55', '1389639455');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-01-14', '90', '1389702914');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-01-16', '1', '1389891942');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-01-17', '33', '1389926578');
INSERT INTO `statistik` VALUES ('10.2.131.32', '2014-01-18', '1', '1390031165');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-01-29', '4', '1390964736');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-02-05', '9', '1391572923');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-02', '12', '1393745237');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-05', '8', '1394041435');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-06', '23', '1394099209');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-12', '2', '1394597044');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-13', '1', '1394683281');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-03-17', '9', '1395016935');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-04-10', '13', '1397122712');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-05-18', '11', '1400435341');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-06-10', '105', '1402429043');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-06-11', '13', '1402479919');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-06-12', '1', '1402559175');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-06-15', '5', '1402827286');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-08-28', '7', '1409201292');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-09-02', '11', '1409659855');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-09-03', '3', '1409735837');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-12-21', '6', '1419184824');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2014-12-22', '1', '1419265338');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2015-03-09', '43', '1425920301');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2015-03-10', '2', '1425921455');
INSERT INTO `statistik` VALUES ('127.0.0.1', '2015-03-11', '25', '1426064999');
INSERT INTO `statistik` VALUES ('::1', '2016-05-27', '30', '1464315221');
INSERT INTO `statistik` VALUES ('::1', '2016-09-25', '16', '1474809955');
INSERT INTO `statistik` VALUES ('::1', '2016-09-26', '12', '1474894723');
INSERT INTO `statistik` VALUES ('::1', '2016-10-17', '2', '1476710495');
INSERT INTO `statistik` VALUES ('::1', '2016-11-14', '9', '1479134063');
INSERT INTO `statistik` VALUES ('::1', '2016-11-20', '27', '1479635172');
INSERT INTO `statistik` VALUES ('::1', '2016-11-21', '20', '1479747302');
INSERT INTO `statistik` VALUES ('::1', '2016-11-26', '8', '1480156157');
INSERT INTO `statistik` VALUES ('::1', '2016-11-27', '13', '1480259521');
INSERT INTO `statistik` VALUES ('::1', '2016-11-28', '11', '1480345982');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu` (
  `id_sub` int(5) NOT NULL AUTO_INCREMENT,
  `nama_sub` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `link_sub` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `id_main` int(5) NOT NULL,
  `id_submain` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `adminsubmenu` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_sub`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES ('21', 'Edit Cara Beli', '?module=carabeli', '3', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('2', 'Profil Toko Online', '?module=profil', '2', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('3', 'Artikel', '?module=artikel', '3', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('4', 'Kategori Artikel', '?module=label', '3', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('5', 'Produk Penjualan', '?module=produk', '4', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('8', 'Testimonial', '?module=testimoni', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('7', 'Kategori Produk', '?module=kategori', '4', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('9', 'Menu Utama', '?module=menuutama', '2', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('10', 'Sub-Menu', '?module=submenu', '2', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('11', 'Manajemen Media', '', '0', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('20', 'Slide', '?module=header', '2', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('13', 'Data Rekening', '?module=bank', '21', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('14', 'Facebook Fanspage', '?module=fb', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('15', 'Hubungi Kami', '?module=hubungi', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('16', 'Ongkos Kirim', '?module=ongkoskirim', '4', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('17', 'Data Order', '?module=order', '22', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('19', 'Banner', '?module=banner', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('22', 'Tag Artikel', '?module=tag', '3', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('23', 'Sensor Kata', '?module=katajelek', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('24', 'Data Komentar', '?module=komentar', '20', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('25', 'Laporan Order', '?module=laporan', '22', '0', 'Y', 'N');
INSERT INTO `submenu` VALUES ('26', 'Member', '?module=member', '28', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('27', 'Admin', '?module=admin', '28', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('29', 'Barang Persewaan', '?module=produksewa', '4', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('30', 'Laporan Persewaan', '?module=laporansewa', '22', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('31', 'Fakultas', '?module=fakultas', '2', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('32', 'Jurusan', '?module=jurusan', '2', '0', 'Y', 'Y');
INSERT INTO `submenu` VALUES ('33', 'Data Persewaan', '?module=sewa', '22', '0', 'Y', 'Y');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL AUTO_INCREMENT,
  `nama_tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tag_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `count` int(5) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('23', 'Musik', 'musik', '0');
INSERT INTO `tag` VALUES ('16', 'Komputer', 'komputer', '26');
INSERT INTO `tag` VALUES ('22', 'Hot-News', 'hotnews', '41');

-- ----------------------------
-- Table structure for testimoni
-- ----------------------------
DROP TABLE IF EXISTS `testimoni`;
CREATE TABLE `testimoni` (
  `id_testi` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi` text COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_testi`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of testimoni
-- ----------------------------
INSERT INTO `testimoni` VALUES ('115', 'Fendri', 'Ajib bener...Recomended Seller..Cool', 'Y', '2015-03-09');
INSERT INTO `testimoni` VALUES ('116', 'Andri', 'Emang keren nich..Manteb...', 'Y', '2015-03-09');
INSERT INTO `testimoni` VALUES ('114', 'Tomo', 'wih keren keren barangnya..Mantebb..', 'Y', '2015-03-09');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `foto` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@email.com', '08238923848', 'admin', 'N', 'ciyus-miapah.png', 'gqv5gtshd9g352vqfstij1io90');
