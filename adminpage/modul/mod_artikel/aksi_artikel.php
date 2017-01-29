<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";
include "../../../config/fungsi_seo.php";
// vd($_SESSION);

if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
  $module =$_GET['module'];
  $act    =$_GET['act'];
  
// Hapus artikel
if ($module=='artikel' AND $act=='hapus'){
  $data=mysqli_fetch_array(mysqli_query($con,"SELECT gambar FROM artikel WHERE id_artikel='$_GET[id]'"));
  if ($data[gambar]!=''){
     mysqli_query($con,"DELETE FROM artikel WHERE id_artikel='$_GET[id]'");
     unlink("../../../foto_artikel/$_GET[namafile]");   
     unlink("../../../foto_artikel/small_$_GET[namafile]");   
  }
  else{
     mysqli_query($con,"DELETE FROM artikel WHERE id_artikel='$_GET[id]'");
  }
  header('location:../../media.php?module='.$module);
}

// Input artikel
elseif ($module=='artikel' AND $act=='input'){
  $lokasi_file    = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file      = $_FILES['fupload']['name'];
  $acak           = rand(1,99);
  $nama_file_unik = $acak.$nama_file; 
  
  if (!empty($_POST['tag_seo'])){
    $tag_seo = $_POST['tag_seo'];
    $tag=implode(',',$tag_seo);
  }
  $judul_seo      = seo_title($_POST['judul']);

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
    UploadImage($nama_file_unik);
// vd($_SESSION);
      $s='INSERT INTO artikel(
                            judul,
                            judul_seo,
                            id_label,
                            username,
                            isi_artikel,
                            jam,
                            tanggal,
                            hari,
                            tag, 
                            gambar) 
                    VALUES("'.$_POST['judul'].'",
                           "'.$judul_seo.'",
                           "'.$_POST['label'].'",
                           "'.$_SESSION['namauser'].'",
                           "'.$_POST['isi_artikel'].'",
                           "'.$jam_sekarang.'",
                           "'.$tgl_sekarang.'",
                           "'.$hari_ini.'",
                           "'.$tag.'",
                           "'.$nama_file_unik.'")';
      // vd($s);
      $e=mysqli_query($con,$s);
  }
  else{
      $s='INSERT INTO artikel(judul,
                                    judul_seo, 
                                    id_label,
                                    username,
                                    isi_artikel,
                                    jam,
                                    tanggal,
                                    tag, 
                                    hari) 
                            VALUES('.$_POST['judul'].',
                                   '.$judul_seo.',
                                   '.$_POST['label'].',
                                   '.$_SESSION['namauser'].',
                                   '.$_POST['isi_artikel'].',
                                   '.$jam_sekarang.',
                                   '.$tgl_sekarang.',
                                   '.$tag.',
                                   '.$hari_ini.')';
    mysqli_query($con,$s);
  }
  
  $jml=count($tag_seo);
  for($i=0;$i<$jml;$i++){
    mysqli_query($con,"UPDATE tag SET count=count+1 WHERE tag_seo='$tag_seo[$i]'");
  }
  header('location:../../media.php?module='.$module);
}

// Update artikel
elseif ($module=='artikel' AND $act=='update'){
  $lokasi_file    = $_FILES['fupload']['tmp_name'];
  $tipe_file      = $_FILES['fupload']['type'];
  $nama_file      = $_FILES['fupload']['name'];
  $acak           = rand(1,99);
  $nama_file_unik = $acak.$nama_file; 

  if (!empty($_POST[tag_seo])){
    $tag_seo = $_POST[tag_seo];
    $tag=implode(',',$tag_seo);
  }

  $judul_seo      = seo_title($_POST['judul']);

  // Apabila gambar tidak diganti
  if (empty($lokasi_file)){
    mysqli_query($con,"UPDATE artikel SET judul       = '$_POST[judul]',
                                   judul_seo   = '$judul_seo', 
                                   id_label = '$_POST[label]',
                                   tag         = '$tag',
                                   isi_artikel  = '$_POST[isi_artikel]'  
                             WHERE id_artikel   = '$_POST[id]'");
  }
  else{
    UploadImage($nama_file_unik);
    mysqli_query($con,"UPDATE artikel SET judul       = '$_POST[judul]',
                                   judul_seo   = '$judul_seo', 
                                   id_label = '$_POST[label]',
                                   tag         = '$tag',
                                   isi_artikel  = '$_POST[isi_artikel]',
                                   gambar      = '$nama_file_unik'   
                             WHERE id_artikel   = '$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}
}
?>
