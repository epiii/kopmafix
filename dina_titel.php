<?php

if (isset($_GET['id'])){
    $sql = mysqli_query($con,"select nama_produk from produk where id_produk='$_GET[id]'");
    $j   = mysqli_fetch_array($sql);
    if ($j) {
        echo "$j[nama_produk]";
    } 
    else{
      $sql2 = mysqli_query($con,"select nama_toko from profil");
      $j2   = mysqli_fetch_array($sql2);
		  echo "$j2[nama_toko]";
		}
}
else{
      $sql3 = mysqli_query($con,"select nama_toko from profil");
      $j3   = mysqli_fetch_array($sql3);
		  echo "$j3[nama_toko]";
}
?>
