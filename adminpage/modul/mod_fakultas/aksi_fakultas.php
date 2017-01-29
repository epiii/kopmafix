<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/fungsi_seo.php";
include "../../../config/library.php";

if (empty($_SESSION['leveluser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
  $module =$_GET['module'];
  $act    =$_GET['act'];

  // Hapus fakultas
  if ($module=='fakultas' AND $act=='hapus'){
    mysqli_query($con,"DELETE FROM fakultas WHERE id_fakultas='$_GET[id]'");
    header('location:../../media.php?module='.$module);
  }elseif ($module=='fakultas' AND $act=='input'){
    mysqli_query($con,"INSERT INTO fakultas(fakultas) VALUES('$_POST[fakultas]')");
    header('location:../../media.php?module='.$module);
  }elseif ($module=='fakultas' AND $act=='update'){
    mysqli_query($con,"UPDATE fakultas SET fakultas = '$_POST[fakultas]' WHERE id_fakultas = '$_POST[id]'");
    header('location:../../media.php?module='.$module);
  }
}
?>
