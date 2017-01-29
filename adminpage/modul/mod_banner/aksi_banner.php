<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";

$module=$_GET['module'];
$act=$_GET['act'];

// Hapus banner
if ($module=='banner' AND $act=='hapus'){
  $data=mysqli_fetch_array(mysqli_query($con,"SELECT gambar FROM banner WHERE id_banner='$_GET[id]'"));
  if ($data['gambar']!=''){
     mysqli_query($con,"DELETE FROM banner WHERE id_banner='$_GET[id]'");
     unlink("../../../foto_banner/$_GET[namafile]");   
  }
  else{
    mysqli_query($con,"DELETE FROM banner WHERE id_banner='$_GET[id]'");
  }
  header('location:../../media.php?module='.$module);
}

// Input banner
elseif ($module=='banner' AND $act=='input'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
   
    UploadBanner($nama_file);
    mysqli_query($con,"INSERT INTO banner(judul,
                                    url,
                                     posisi,
                                    tgl_posting,
                                    gambar) 
                            VALUES('$_POST[judul]',
                                   '$_POST[url]',
                                    '$_POST[posisi]',
                                   '$tgl_sekarang',
                                   '$nama_file')");
   header('location:../../media.php?module='.$module);
  
  }
  else{
    mysqli_query($con,"INSERT INTO banner(judul,
                                    tgl_posting,
                                    url,
                                     posisi) 
                            VALUES('$_POST[judul]',
                                   '$tgl_sekarang',
                                   '$_POST[url]',
                                    '$_POST[posisi]')");
  header('location:../../media.php?module='.$module);
  }
}

// Update banner
elseif ($module=='banner' AND $act=='update'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    mysqli_query($con,"UPDATE banner SET judul     = '$_POST[judul]',
                                   url       = '$_POST[url]',
                                   posisi    = '$_POST[posisi]'
                             WHERE id_banner = '$_POST[id]'");
   header('location:../../media.php?module='.$module);
  }
  else{
   
    UploadBanner($nama_file);
    mysqli_query($con,"UPDATE banner SET judul     = '$_POST[judul]',
                                   url       = '$_POST[url]',
                                   posisi    = '$_POST[posisi]',
                                   gambar    = '$nama_file'   
                             WHERE id_banner = '$_POST[id]'");
   header('location:../../media.php?module='.$module);
   
  }
}
}
?>
