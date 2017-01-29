<?php
//error_reporting(0);
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{

include "class.ezpdf.php";
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_indotgl.php";
include "rupiah.php";
  
$pdf = new Cezpdf();
 
// Set margin dan font
$pdf->ezSetCmMargins(3, 3, 3, 3);
$pdf->selectFont('fonts/Courier.afm');

$all = $pdf->openObject();

// Tampilkan logo
$pdf->setStrokeColor(0, 0, 0, 1);
$pdf->addJpegFromFile('logo.jpg',20,800,69);

// Teks di tengah atas untuk judul header
$pdf->addText(220, 820, 16,'<b>Laporan Sewa</b>');
$pdf->addText(200, 800, 14,'<b>Kopma UNESA</b>');
// Garis atas untuk header
$pdf->line(10, 795, 578, 795);

// Garis bawah untuk footer
$pdf->line(10, 50, 578, 50);
// Teks kiri bawah
$pdf->addText(30,34,8,'Dicetak tgl:' . date( 'd-m-Y, H:i:s'));

$pdf->closeObject();

// Tampilkan object di semua halaman
$pdf->addObject($all, 'all');

// Baca input tanggal yang dikirimkan user
$mulai=$_POST['thn_mulai'].'-'.$_POST['bln_mulai'].'-'.$_POST['tgl_mulai'];
$selesai=$_POST['thn_selesai'].'-'.$_POST['bln_selesai'].'-'.$_POST['tgl_selesai'];
// vd($_POST);
/*
Array
(
    [tgl_mulai] => 29
    [bln_mulai] => 11
    [thn_mulai] => 2000

    [tgl_selesai] => 29
    [bln_selesai] => 11
    [thn_selesai] => 2016
)
*/
// Query untuk merelasikan kedua tabel di filter berdasarkan tanggal
  $s='SELECT 
        ds.id_order_detail_sewa,
        k.nama_lengkap,
        p.nama_produk,
        IF(k.kategori="k",p.hargakoperasi,p.hargaumum)hargasatuan,
        p.durasi,
        IF(p.jenisdurasi="h","hari","jam")jenisdurasi,
        ds.total,
        (if(k.kategori="k",p.hargakoperasi,p.hargaumum)*ds.total)subtotal,
        case ds.status
          when "b" then "belum kembali"
          when "k" then "sudah kembali"
          when "p" then "pending"
          else "terlambat"
        end as statussewa,
        s.tgl_sewa

      FROM
        orders_sewa s
        JOIN orders_detail_sewa ds ON ds.id_order_sewa = s.id_order_sewa
        JOIN kustomer k ON k.id_kustomer = s.id_kustomer
        JOIN produk p on p.id_produk = ds.id_produk
      WHERE 
        s.tgl_sewa BETWEEN "'.$mulai.'" and "'.$selesai.'" and ds.status!="p"';
// vd($s);
$sql = mysqli_query($con,$s);
$jml = mysqli_num_rows($sql);
if ($jml > 0){
$i = 1;
while($r = mysqli_fetch_assoc($sql)){
  // vd($r);
  $quantityharga=rp($r['total']*$r['hargasatuan']);
  $hargarp=rp($r['hargasatuan']); 
  // $faktur=$r['faktur'];
  
  $data[$i]=array('<b>No</b>'=>$i, 
                  // '<b>Faktur</b>'=>$faktur, 
                  '<b>Tanggal</b>'=>tgl_indo2($r['tgl_sewa']).' / '.jam_indo($r['tgl_sewa']), 
                  '<b>Nama Produk</b>'=>$r['nama_produk'], 
                  '<b>Nama Member</b>'=>$r['nama_lengkap'], 
                  '<b>Qty</b>'=>$r['total'], 
                  '<b>Harga</b>'=>$hargarp,
                  '<b>Sub Total</b>'=>$quantityharga
                );
	$total = $total+($r['total']*$r['hargasatuan']);
	$totqu = $totqu + $r['total'];
  $i++;
}

$pdf->ezTable($data, '', '', '');

$tot=rp($total);
$pdf->ezText("\n\nTotal Pendapatan Sewa : Rp. {$tot}");
$pdf->ezText("\nTotal Persewaan : {$jml} unit");
$pdf->ezText("Total Item yang disewa: {$totqu} unit");

// Penomoran halaman
$pdf->ezStartPageNumbers(320, 15, 8);
$pdf->ezStream();
}
else{
  $m=$_POST['tgl_mulai'].'-'.$_POST['bln_mulai'].'-'.$_POST['thn_mulai'];
  $s=$_POST['tgl_selesai'].'-'.$_POST['bln_selesai'].'-'.$_POST['thn_selesai'];
  echo "Tidak ada transaksi/sewa pada Tanggal $m s/d $s";
}
}
?>
