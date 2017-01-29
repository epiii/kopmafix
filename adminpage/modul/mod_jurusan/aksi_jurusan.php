<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/fungsi_thumb.php";
include "../../../config/fungsi_seo.php";
include "../../../config/library.php";

if (empty($_SESSION['leveluser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
  $module=$_GET['module'];
  $act=$_GET['act'];

  if($_POST['fakultas']==0){
  	$jurusan = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM jurusan WHERE id_jurusan=$_POST[jurusan]"));
  	$fakultas = $jurusan['id_jurusan'];
  } else {
  	$fakultas = $_POST['fakultas'];
  }

  if ($module=='jurusan' AND $act=='hapus'){
    mysqli_query($con,"DELETE FROM jurusan WHERE id_jurusan='$_GET[id]'");
    header('location:../../media.php?module='.$module);
  }

  // Input sub menu
  elseif ($module=='jurusan' AND $act=='input'){
     mysqli_query($con,"INSERT INTO jurusan(jurusan,id_fakultas)VALUES('$_POST[jurusan]','$fakultas')");
     header('location:../../media.php?module='.$module);
  }

  // Update sub menu
  elseif ($module=='jurusan' AND $act=='update'){
      mysqli_query($con,"UPDATE jurusan SET jurusan   = '$_POST[jurusan]',
                                      id_fakultas     = '$fakultas',
                                WHERE id_jurusan      = '$_POST[id]'");
    header('location:../../media.php?module='.$module);
  }
}
?>
