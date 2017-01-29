<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
include "../../../config/koneksi.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus testimoni
if ($module=='testimoni' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM testimoni WHERE id_testi='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input testimoni
elseif ($module=='testimoni' AND $act=='input'){
  mysqli_query($con,"INSERT INTO testimoni(nama,isi,aktif) VALUES('$_POST[nama]','$_POST[isi]','$_POST[aktif]')");
  header('location:../../media.php?module='.$module);
}

// Update testimoni
elseif ($module=='testimoni' AND $act=='update'){
  mysqli_query($con,"UPDATE testimoni SET nama = '$_POST[nama]', isi='$_POST[isi]',aktif='$_POST[aktif]' WHERE id_testi = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
}
?>
