<?php
include "class.ezpdf.php";
$pdf = new Cezpdf();
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_indotgl.php";
// include "rupiah.php";
// vd($_GET);
session_start();
if (empty($_SESSION['leveluser'])){
	echo "<link href='style.css' rel='stylesheet' type='text/css'>
	<center>Untuk mengakses modul, Anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
	 
	// Set margin dan font
	$pdf->ezSetCmMargins(3, 3, 3, 3);
	$pdf->selectFont('fonts/Courier.afm');

	$all = $pdf->openObject();

	// Tampilkan logo
	$pdf->setStrokeColor(0, 0, 0, 1);
	$pdf->addJpegFromFile('logo.jpg',20,800,69);

	// Teks di tengah atas untuk judul header
	$pdf->addText(208, 820, 16,'<b>Laporan Member '.($_GET['mode']=='koperasi'?'Koperasi':'Umum').'</b>');
	$pdf->addText(230, 800, 18,'<b>Kopma UNESA</b>');
	// Garis atas untuk header
	$pdf->line(10, 795, 578, 795);

	// Garis bawah untuk footer
	$pdf->line(10, 50, 578, 50);
	// Teks kiri bawah
	$pdf->addText(30,34,8,'Dicetak tgl:' . date( 'd-m-Y, H:i:s'));

	$pdf->closeObject();

	// Tampilkan object di semua halaman
	$pdf->addObject($all, 'all');
	$s='SELECT *
	  FROM
	    kustomer k
	    LEFT JOIN kota ko ON ko.id_kota = k.id_kota
	    LEFT JOIN jurusan j ON j.id_jurusan = k.id_jurusan
	    LEFT JOIN fakultas f ON f.id_fakultas = j.id_fakultas
  	WHERE kategori ="'.($_GET['mode']=='koperasi'?'k':'u').'"
  	ORDER BY nama_lengkap';
	$e   = mysqli_query($con,$s);
	$jml = mysqli_num_rows($e);

	if ($jml > 0){
		$i = 0;
		while($r = mysqli_fetch_assoc($e)){
		  	$data[$i]=array(
				'<b>No</b>'      =>$i+1, 
				'<b>Nama</b>'    =>$r['nama_lengkap'],
				'<b>Email</b>'   =>$r['email'],
				'<b>Telpon</b>'  =>$r['telpon'],
				'<b>Alamat</b>'  =>$r['alamat'],
				'<b>Kota</b>'    =>$r['nama_kota'],
			); if($_GET['mode']=='koperasi') $data[$i]['<b>Jur/Fak</b>']=$r['jurusan'].'/'.$r['fakultas'];
			$i++;
		}
		$pdf->ezTable($data, '', '', '');
		$pdf->ezText("\n\nTotal Member : Rp. {$i}");
	// Penomoran halaman
		$pdf->ezStartPageNumbers(320, 15, 8);
		$pdf->ezStream();
	} else{
		echo 'Member masih kosong ';
	}
}
?>
