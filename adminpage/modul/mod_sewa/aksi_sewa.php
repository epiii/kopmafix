<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";
include "../../../config/fungsi_indotgl.php";
// vd($_SESSION['namauser']);
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  $module =$_GET['module'];
  $act    =$_GET['act'];
  if ($module=='sewa' AND $act=='update'){
      if(!isset($_POST)) echo 'invalid post';
      else{
        $tgl = tgl_db($_POST['tgl_kembali']).' '.$_POST['jam'].':'.$_POST['menit'];
        $ss  = $_POST['statussewa']=='k' || $_POST['statussewa']=='t'?$tgl:'0000-00-00 00:00:00'; 
        $s   = 'UPDATE orders_detail_sewa SET 
                status      ="'.$_POST['statussewa'].'",
                tgl_kembali ="'.$ss.'" 
              WHERE id_order_detail_sewa='.$_POST['id_order_detail_sewa'];
        // vd($s);
        mysqli_query($con,$s);
        header('location:../../media.php?module='.$module);
      }
  }
}
?>
