<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  include "../../../config/koneksi.php";
  include "../../../config/library.php";
  include "../../../config/fungsi_thumb.php";
  include "../../../config/fungsi_seo.php";

// vd($_GET);
  $module =$_GET['module'];
  $act    =$_GET['act'];

// Hapus produk
if ($module=='produk' AND $act=='hapus'){
  $data=mysqli_fetch_array(mysqli_query($con,"SELECT gambar FROM produk WHERE id_produk='$_GET[id]'"));
  if ($data['gambar']!=''){
     mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
     unlink("../../../foto_produk/$_GET[namafile]");   
     unlink("../../../foto_produk/small_$_GET[namafile]");   
  }else{
     mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
  }header('location:../../media.php?module='.$module);

  mysqli_query($con,"DELETE FROM produk WHERE id_produk='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input produk
elseif ($module=='produk' AND $act=='input'){
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
                      id_kategori,
                      berat,
                      harga,
                      diskon,
                      stok,
                      deskripsi,
                      tipe,
                      tgl_masuk,
                      gambar
              )VALUES(
                     "'.$_POST['nama_produk'].'",
                     "'.$produk_seo.'",
                     "'.$_POST['kategori'].'",
                     "'.$_POST['berat'].'",                                 
                     "'.$_POST['harga'].'",
                     "'.$_POST['harga'].'",
                     "'.$_POST['stok'].'",
                     "'.$_POST['deskripsi'].'",
                     "j",
                     "'.$tgl_sekarang.'",
                     "'.$nama_file_unik.'"
               )';
      // vd($s);
      mysqli_query($con,$s);
      header('location:../../media.php?module='.$module);
    }
  } else{
      // echo 'input & !file';
      // exit();
      $s='INSERT INTO produk(nama_produk,
                            produk_seo,
                            id_kategori,
                            berat,
                            harga,
                            diskon,
                            stok,
                            deskripsi,
                            tipe,
                            tgl_masuk) 
                    VALUES("'.$_POST['nama_produk'].'",
                           "'.$produk_seo.'",
                           "'.$_POST['kategori'].'",
                           "'.$_POST['berat'].'",                                 
                           "'.$_POST['harga'].'",
                           "'.$_POST['harga'].'",
                           "'.$_POST['stok'].'",
                           "'.$_POST['deskripsi'].'",
                           "j",
                           "'.$tgl_sekarang.'")';
    // vd($s);
    mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  }
}
// Update produk
elseif ($module=='produk' AND $act=='update'){
  $lokasi_file    = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file      = $_FILES['fupload']['name'];
  $acak           = rand(1,99);
  $nama_file_unik = $acak.$nama_file; 

  $produk_seo      = seo_title($_POST['nama_produk']);
// vd($lokasi_file);
  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    // echo 'update & !file';
    // exit();

    mysqli_query($con,"UPDATE produk SET nama_produk = '$_POST[nama_produk]',
                                   produk_seo  = '$produk_seo', 
                                   id_kategori = '$_POST[kategori]',
                                   berat       = '$_POST[berat]',
                                   harga       = '$_POST[harga]',
                                   diskon      = '$_POST[diskon]',
                                   stok        = '$_POST[stok]',
                                   deskripsi   = '$_POST[deskripsi]'
                             WHERE id_produk   = '$_POST[id]'");
    header('location:../../media.php?module='.$module);
  } else{
    // echo "string";
    // exit();
      if ($tipe_file != "image/jpeg" AND $tipe_file != "image/pjpeg"){
      //   // echo 'update & file invalid';
      //   // exit();
        echo "<script>window.alert('Upload Gagal, Pastikan File yang di Upload bertipe *.JPG');
          location.href=\"../../media.php?module=$module&act=editproduk&id=$_POST[id]\";
        </script>";
        // header('location:../../media.php?module='.$module.'&act=editproduk&id='.$_POST['id']);
        // echo "<script>window.alert('Upload Gagal, Pastikan File yang di Upload bertipe *.JPG');
        //   window.location=('../../media.php?module=produk)</script>";
      } else{
        // echo 'update & file';
        // exit();

        UploadProduk($nama_file_unik);
        $s="UPDATE produk SET nama_produk = '$_POST[nama_produk]',
                                   produk_seo  = '$produk_seo', 
                                   id_kategori = '$_POST[kategori]',
                                   berat       = '$_POST[berat]',
                                   harga       = '$_POST[harga]',
                                   diskon      = '$_POST[diskon]',
                                   stok        = '$_POST[stok]',
                                   deskripsi   = '$_POST[deskripsi]',
                                   gambar      = '$nama_file_unik'   
                             WHERE id_produk   = '$_POST[id]'";
        mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
    }
  }
}
}
?>
