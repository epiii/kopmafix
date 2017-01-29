<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";
include "../../../config/fungsi_seo.php";
// vd($_POST);

if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{

  $module =$_GET['module'];
  $act    =$_GET['act'];

// Hapus produk
if ($module=='produksewa' AND $act=='hapus'){
  $data=mysqli_fetch_assoc(mysqli_query($con,"SELECT gambar FROM produk WHERE id_produk='$_GET[id]'"));
  if ($data['gambar']!=''){
     mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
     unlink("../../../foto_produk/$_GET[namafile]");   
     unlink("../../../foto_produk/small_$_GET[namafile]");   
  }else{
     mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
  }header('location:../../media.php?module='.$module);

  mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}// Input produk
elseif ($module=='produksewa' AND $act=='input'){
  $lokasi_file    = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file      = $_FILES['fupload']['name'];
  $acak           = rand(1,99);
  $nama_file_unik = $acak.$nama_file; 

  $produk_seo      = seo_title($_POST['nama_produk']);

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
    if ($tipe_file != "image/jpeg" AND $tipe_file != "image/pjpeg"){
    echo "<script>window.alert('Upload Gagal, Pastikan File yang di Upload bertipe *.JPG');
        window.location=('../../media.php?module=produk)</script>";
    }else{
      // echo 'input & file';
      // exit();

      UploadProduk($nama_file_unik);
      $s='INSERT INTO produk(
                      nama_produk,
                      produk_seo,
                      tipe,
                      hargakoperasi,
                      hargaumum,
                      stok,
                      deskripsi,
                      tgl_masuk,
                      gambar,
                      jenisdurasi,
                      durasi
              )VALUES(
                     "'.$_POST['nama_produk'].'",
                     "'.$produk_seo.'",
                     "s",
                     "'.$_POST['hargakoperasi'].'",
                     "'.$_POST['hargaumum'].'",
                     "'.$_POST['stok'].'",
                     "'.$_POST['deskripsi'].'",
                     "'.$tgl_sekarang.'",
                     "'.$nama_file_unik.'",
                     "'.$_POST['jenisdurasi'].'",
                     "'.$_POST['durasi'].'"
               )';
      // vd($s);
      mysqli_query($con,$s);
      header('location:../../media.php?module='.$module);
    }
  } else{
      // echo 'input & !file';
      // exit();
      $s='INSERT INTO produk(
                      nama_produk,
                      produk_seo,
                      tipe,
                      hargakoperasi,
                      hargaumum,
                      stok,
                      deskripsi,
                      tgl_masuk,
                      jenisdurasi,
                      durasi
              )VALUES(
                     "'.$_POST['nama_produk'].'",
                     "'.$produk_seo.'",
                     "s",
                     "'.$_POST['hargakoperasi'].'",
                     "'.$_POST['hargaumum'].'",
                     "'.$_POST['stok'].'",
                     "'.$_POST['deskripsi'].'",
                     "'.$tgl_sekarang.'",
                    "'.$_POST['jenisdurasi'].'",
                     "'.$_POST['durasi'].'"
               )';
    // vd($s);
    mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  }
}
// Update produk
elseif ($module=='produksewa' AND $act=='update'){
  // vd($_GET);
  $lokasi_file    = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file      = $_FILES['fupload']['name'];
  $acak           = rand(1,99);
  $nama_file_unik = $acak.$nama_file; 

  $produk_seo      = seo_title($_POST['nama_produk']);

  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    // echo 'update & !file';
    // exit();
    // vd($_POST);
    $s='UPDATE produk SET   
              nama_produk   = "'.$_POST['nama_produk'].'",
              hargakoperasi = "'.$_POST['hargakoperasi'].'",
              hargaumum     = "'.$_POST['hargaumum'].'",
              stok          = "'.$_POST['stok'].'",
              deskripsi     = "'.$_POST['deskripsi'].'",
              jenisdurasi   = "'.$_POST['jenisdurasi'].'",
              durasi        = "'.$_POST['durasi'].'"
        WHERE id_produk   = '.$_POST['id'];
    // vd($s);
    mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  } else{
      if ($tipe_file != "image/jpeg" AND $tipe_file != "image/pjpeg"){
        echo "<script>window.alert('Upload Gagal, Pastikan File yang di Upload bertipe *.JPG');
          window.location=('../../media.php?module=produk)</script>";
      } else{
        // echo 'update & file';
        // exit();
        
        UploadProduk($nama_file_unik);
        $s='UPDATE produk SET   
               nama_produk   = "'.$_POST['nama_produk'].'",
               hargakoperasi = "'.$_POST['hargakoperasi'].'",
               hargaumum     = "'.$_POST['hargaumum'].'",
               stok          = "'.$_POST['stok'].'",
               jenisdurasi   = "'.$_POST['jenisdurasi'].'",
               durasi        = "'.$_POST['durasi'].'",
               deskripsi     = "'.$_POST['deskripsi'].'",
               gambar        = "'.$nama_file_unik.'"   
            WHERE id_produk  = '.$_POST['id'];
        // vd($s);
        mysqli_query($con,$s);
        header('location:../../media.php?module='.$module);
    }
  }
}
}
?>
