<?php
    // diskon  
    $harga     = format_rupiah($r['harga']);
    $disc      = ($r['diskon']/100)*$r['harga'];
    $hargadisc = number_format(($r['harga']-$disc),0,",",".");

    $d=$r['diskon'];
    $hargatetap  = "<span class='price'> <br /></span>&nbsp;
                    <span style=\"color:#ff6600;font-size:14px;\"> Rp. <b>$hargadisc,-</b></span>";
    $hargadiskon = "<span style='text-decoration:line-through;' class='price'>Rp. $harga <br /></span>&nbsp;diskon $d% 
                    <span style=\"color:#ff6600;font-size:14px;\"> Rp. <b>$hargadisc,-</b></span>";
    if ($d!=0){
      $divharga=$hargadiskon;
    }else{
      $divharga=$hargatetap;
    } 

    // tombol stok habis kalau stoknya 0
    $stok        = $r['stok'];
    $tombolbeli  = "<a href=\"aksi.php?module=keranjang&act=tambah&id=$r[id_produk]\" class='btn theme'><b>Beli</b></a>";
    $tombolhabis = "<b>Stok Habis</b>";
    if ($stok!=0){
      $tombol=$tombolbeli;
    }else{
      $tombol=$tombolhabis;
    } 
    
?>
