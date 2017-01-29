<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus header
if ($module=='header' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM header WHERE id_header='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input header
elseif ($module=='header' AND $act=='input'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
    UploadHeader($nama_file);
    mysqli_query($con,"INSERT INTO header(judul,
                                    url,
                                    keterangan,
                                    tgl_posting,
                                    gambar) 
                            VALUES('$_POST[judul]',
                                   '$_POST[url]',
                                   '$_POST[keterangan]',
                                   '$tgl_sekarang',
                                   '$nama_file')");
  }
  else{
    mysqli_query($con,"INSERT INTO header(judul,
                                    tgl_posting,
                                    keterangan,
                                    url) 
                            VALUES('$_POST[judul]',
                                   '$tgl_sekarang',
                                   '$_POST[keterangan]',
                                   '$_POST[url]')");
  }
  header('location:../../media.php?module='.$module);
}

// Update header
elseif ($module=='header' AND $act=='update'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    mysqli_query($con,"UPDATE header SET judul     = '$_POST[judul]',
                                   url       = '$_POST[url]',
                                   keterangan       = '$_POST[keterangan]'
                             WHERE id_header = '$_POST[id]'");
  }
  else{
    UploadHeader($nama_file);
    mysqli_query($con,"UPDATE header SET judul     = '$_POST[judul]',
                                   url       = '$_POST[url]',
                                   keterangan       = '$_POST[keterangan]',
                                   gambar    = '$nama_file'   
                             WHERE id_header = '$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}
?>
