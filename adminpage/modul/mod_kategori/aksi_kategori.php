<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
include "../../../config/koneksi.php";
include "../../../config/fungsi_seo.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus Kategori
if ($module=='kategori' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM kategori WHERE id_kategori='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input kategori
elseif ($module=='kategori' AND $act=='input'){
  $kategori_seo = seo_title($_POST['nama_kategori']);
  mysqli_query($con,"INSERT INTO kategori(nama_kategori,kategori_seo) VALUES('$_POST[nama_kategori]','$kategori_seo')");
  header('location:../../media.php?module='.$module);
}

// Update kategori
elseif ($module=='kategori' AND $act=='update'){
  $kategori_seo = seo_title($_POST['nama_kategori']);
  mysqli_query($con,"UPDATE kategori SET nama_kategori = '$_POST[nama_kategori]', kategori_seo='$kategori_seo' WHERE id_kategori = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
}
?>
