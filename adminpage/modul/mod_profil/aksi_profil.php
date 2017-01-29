<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/fungsi_thumb.php";
include "../../../config/library.php";
// vd($_SESSION);

if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
  $module =$_GET['module'];
  $act    =$_GET['act'];

  // Update profil
  if ($module=='profil' AND $act=='update'){
    $lokasi_file = $_FILES['fupload']['tmp_name'];
    $nama_file   = $_FILES['fupload']['name'];

    // Apabila ada gambar yang diupload
    if (!empty($lokasi_file)){
      UploadBanner($nama_file);
      move_uploaded_file($lokasi_file,"foto_banner/$nama_file");
      mysqli_query($con,"UPDATE profil SET nama_toko      = '$_POST[nama_toko]',
                                  alamat    		 = '$_POST[alamat]',
                                  meta_deskripsi = '$_POST[meta_deskripsi]',
                                  meta_keyword   = '$_POST[meta_keyword]',
                                  email_pengelola= '$_POST[email_pengelola]',
                                  nomor_rekening = '$_POST[nomor_rekening]',
                                  nomor_hp       = '$_POST[nomor_hp]',
                                  pin_bb       = '$_POST[pin_bb]',
                                  static_content = '$_POST[isi]',
                                  gambar         = '$nama_file'    
                            WHERE id_profil       = '$_POST[id]'");
  }
  else{
    mysqli_query($con,"UPDATE profil SET nama_toko      = '$_POST[nama_toko]',
                                  alamat    		 = '$_POST[alamat]',
                                  meta_deskripsi = '$_POST[meta_deskripsi]',
                                  meta_keyword   = '$_POST[meta_keyword]',
                                  email_pengelola= '$_POST[email_pengelola]',
                                  nomor_rekening = '$_POST[nomor_rekening]',
                                  nomor_hp       = '$_POST[nomor_hp]',
                                   pin_bb       = '$_POST[pin_bb]',
                                  static_content = '$_POST[isi]' 
                            WHERE id_profil       = '$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}
}
?>
