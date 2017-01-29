<?php
session_start();
//error_reporting(0);
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
include "../../../config/library.php";
// vd($_SESSION);
if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
include "../../../config/koneksi.php";
include "../../../config/fungsi_thumb.php";
include "../../../config/fungsi_seo.php";

$module=$_GET['module'];
$act=$_GET['act'];

if($_POST['menu_utama']==0){
	$submenu = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM submenu WHERE id_sub=$_POST[sub_menu]"));
	$menu_utama = $submenu['id_main'];
} else {
	$menu_utama = $_POST['menu_utama'];
}
// vd($_POST);
// Hapus sub menu
if ($module=='submenu' AND $act=='hapus'){
  mysqli_query($con,"DELETE FROM submenu WHERE id_sub='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input sub menu
elseif ($module=='submenu' AND $act=='input'){
   mysqli_query($con,"INSERT INTO submenu(nama_sub,id_main,link_sub,id_submain,aktif,adminsubmenu)
                 VALUES('$_POST[nama_sub]','$menu_utama','$_POST[link_sub]','$_POST[sub_menu]','$_POST[aktif]','$_POST[adminsubmenu]')");
   header('location:../../media.php?module='.$module);
}

// Update sub menu
elseif ($module=='submenu' AND $act=='update'){
    mysqli_query($con,"UPDATE submenu SET nama_sub = '$_POST[nama_sub]',
                                    id_main     = '$menu_utama',
                                    link_sub    = '$_POST[link_sub]',
  								                  id_submain  = '$_POST[sub_menu]',  
  								                  aktif       = '$_POST[aktif]',  
  								                  adminsubmenu = '$_POST[adminsubmenu]'  
                              WHERE id_sub      = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
}
?>
