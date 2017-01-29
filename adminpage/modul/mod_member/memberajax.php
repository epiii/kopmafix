<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";

$out=array();
$out['data']=null;
if (!isset($_SESSION['leveluser'])){
    $out['msg']='you have to login';
}else{
  if(!isset($_POST)){
    $out['msg']='invalid post';
  }else{
    $s='SELECT * from jurusan where id_fakultas='.$_POST['id_fakultas'];
    $e=mysqli_query($con,$s);
    if(mysqli_num_rows($e)==0){
      $out['msg']='jurusan masih kosong';
    }else{
      while ($r=mysqli_fetch_assoc($e)) {
        $out['data'][]=$r;
      }$out['msg']=true;
    }
  }
}echo json_encode($out);
?>
