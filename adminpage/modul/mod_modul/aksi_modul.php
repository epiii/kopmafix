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

// Hapus modul
if ($module=='modul' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM modul WHERE id_modul='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input modul
elseif ($module=='modul' AND $act=='input'){
  // Cari angka urutan terakhir
  $u=mysqli_query($con,"SELECT urutan FROM modul ORDER by urutan DESC");
  $d=mysqli_fetch_array($u);
  $urutan=$d[urutan]+1;
  
  // Input data modul
  mysqli_query($con,"INSERT INTO modul(nama_modul,
                                 link,
                                 aktif,
                                 urutan) 
	                       VALUES('$_POST[nama_modul]',
                                '$_POST[link]',
                                '$_POST[aktif]',
                                '$urutan')");
  header('location:../../media.php?module='.$module);
}

// Update modul
elseif ($module=='modul' AND $act=='update'){
  mysqli_query($con,"UPDATE modul SET nama_modul = '$_POST[nama_modul]',
                                link       = '$_POST[link]',
                                aktif      = '$_POST[aktif]',
                                urutan     = '$_POST[urutan]'  
                          WHERE id_modul   = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
}
?>
