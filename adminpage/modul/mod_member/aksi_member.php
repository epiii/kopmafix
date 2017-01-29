<?php
session_start();
// if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
include "../../../config/koneksi.php";
include "../../../config/library.php";
// vd($_POST);
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  include "../../../config/fungsi_thumb.php";
  $module=$_GET['module'];
  $act=$_GET['act'];

  if ($module=='member' AND $act=='delcon'){
    mysqli_query($con,'DELETE FROM kustomer WHERE id_kustomer='.$_GET['id']);
    header('location:../../media.php?module='.$module);
  }

// Input (tambah) user
elseif ($module=='member' AND $act=='input'){
   $lokasi_file = $_FILES['fupload']['tmp_name'];
   $tipe_file   = $_FILES['fupload']['type'];
   $nama_file   = $_FILES['fupload']['name'];
   $pass        = md5($_POST['password']);
  if (!empty($lokasi_file)){
  // vd($_POST);
    	UploadBanner($nama_file);
      $s='INSERT INTO kustomer SET 
                 alamat       ="'.$_POST['alamat'].'",
                 id_kota      ="'.$_POST['kota'].'",'.
                 ($_POST['jurusan']==''?'':'id_jurusan="'.$_POST['jurusan'].'",').'
                 password     ="'.$pass.'",
                 nama_lengkap ="'.$_POST['nama_lengkap'].'",
                 email        ="'.$_POST['email'].'", 
                 telpon       ="'.$_POST['no_telp'].'",
                 foto         ="'.$nama_file.'"';
  // vd($s);
  mysqli_query($con,$s); 
  header('location:../../media.php?module='.$module);
}else{
      $s='INSERT INTO kustomer SET 
                 alamat       ="'.$_POST['alamat'].'",
                 id_kota      ="'.$_POST['kota'].'",'.
                 ($_POST['jurusan']==''?'':'id_jurusan="'.$_POST['jurusan'].'",').'
                 password     ="'.$pass.'",
                 nama_lengkap ="'.$_POST['nama_lengkap'].'",
                 email        ="'.$_POST['email'].'", 
                 telpon       ="'.$_POST['no_telp'].'"';
    // vd($s);
    mysqli_query($con,$s); 
    header('location:../../media.php?module='.$module); 	
  }
}
// Update user
elseif ($module=='member' AND $act=='update'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $tipe_file   = $_FILES['fupload']['type'];
  $nama_file   = $_FILES['fupload']['name'];
  $pass        =md5($_POST['password']);
 
  if ((empty($_POST['password']))AND(empty($lokasi_file))){     
    // echo 'masuk pass & lok';
    // exit();
      $s='UPDATE kustomer SET 
                  nama_lengkap = "'.$_POST['nama_lengkap'].'",
                  alamat       = "'.$_POST['alamat'].'",
                  kategori     = "'.$_POST['kategori'].'",
                  id_kota      = "'.$_POST['kota'].'",  
                  id_jurusan="'.($_POST['kategori']=='u'?'0':$_POST['jurusan']).'",
                  blokir       = "'.$_POST['blokir'].'",  
                  telpon       = '.$_POST['no_telp'].'
          WHERE  id_kustomer   = '.$_POST['id'];
    // vd($s);
    $e=mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  }// Apabila password diubah
  elseif ((!empty($_POST['password']))AND(!empty($lokasi_file))){
    // echo 'masuk !pass & !lok';
    // exit();
    $pass=md5($_POST['password']);
    UploadBanner($nama_file);
    $s='UPDATE kustomer SET 
               password     = "'.$pass.'",
               nama_lengkap = "'.$_POST['nama_lengkap'].'",
               blokir       = "'.$_POST['blokir'].'",  
               kategori     = "'.$_POST['kategori'].'",
               id_jurusan="'.($_POST['kategori']=='u'?'0':$_POST['jurusan']).'",
               telpon       = '.$_POST['no_telp'].',
               foto         = "'.$nama_file.'"
       WHERE id_kustomer  = '.$_POST['id'];
    // vd($s);
    mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  }elseif ((!empty($_POST['password']))AND(empty($lokasi_file))){
    // echo 'masuk !pass & lok';
    // exit();
    $pass=md5($_POST['password']);
      $s='UPDATE kustomer SET 
                  password     = "'.$pass.'",
                  nama_lengkap = "'.$_POST['nama_lengkap'].'",
                  kategori     = "'.$_POST['kategori'].'",
                  id_jurusan="'.($_POST['kategori']=='u'?'0':$_POST['jurusan']).'",
                  alamat       = "'.$_POST['alamat'].'",
                  blokir       = "'.$_POST['blokir'].'",  
                  telpon       = '.$_POST['no_telp'].'
          WHERE  id_kustomer = '.$_POST['id'];
          // vd($s);
    $e=mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
  }elseif ((empty($_POST['password']))AND(!empty($lokasi_file))){
    // echo 'masuk pass & !lok';
    // exit();

      UploadBanner($nama_file);
      $s='UPDATE kustomer SET 
             password     = "'.$pass.'",
             nama_lengkap = "'.$_POST['nama_lengkap'].'",
             kategori     = "'.$_POST['kategori'].'",
             id_kota      = "'.$_POST['kota'].'",  
             id_jurusan="'.($_POST['kategori']=='u'?'0':$_POST['jurusan']).'",
             alamat       = "'.$_POST['alamat'].'",
             blokir       = "'.$_POST['blokir'].'",  
             telpon       = '.$_POST['no_telp'].',
             foto         = "'.$nama_file.'" 
          WHERE  id_kustomer = '.$_POST['id'];
    // vd($s);
    $e=mysqli_query($con,$s);
    header('location:../../media.php?module='.$module);
}
                           
}
}

?>
