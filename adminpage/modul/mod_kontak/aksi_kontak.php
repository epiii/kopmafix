<?php
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus banner
if ($module=='kontak' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM mod_kontak WHERE id_kontak='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input kontak
elseif ($module=='kontak' AND $act=='input'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
    UploadBanner($nama_file);
    mysqli_query($con,"INSERT INTO mod_kontak(judul,
                                    jenis,
                                    url,
                                    gambar) 
                            VALUES('$_POST[judul]',
                                   '$_POST[jenis]',
                                   '$_POST[url]',
                                   '$nama_file')");
  }
  else{
    mysqli_query($con,"INSERT INTO mod_kontak(judul,
                                    jenis,
                                    url) 
                            VALUES($_POST[judul]',
                                   '$_POST[jenis]',
                                   '$_POST[url]')");
  }
  header('location:../../media.php?module='.$module);
}

// Update banner
elseif ($module=='kontak' AND $act=='update'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    mysqli_query($con,"UPDATE mod_kontak SET judul     = '$_POST[judul]',
                                   jenis       = '$_POST[jenis]',
                                   url       = '$_POST[url]'                                   
                             WHERE id_kontak = '$_POST[id]'");
  }
  else{
    UploadBanner($nama_file);
    mysqli_query($con,"UPDATE mod_kontak SET judul     = '$_POST[judul]',
                                   jenis       = '$_POST[jenis]',
                                   url       = '$_POST[url]',
                                   gambar       = '$nama_file'
                             WHERE id_banner = '$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}
?>
