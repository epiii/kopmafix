	   <div class="shopping_cart">
        <div class="cart_title">Keranjang belanja</div>
        <div class="cart_details">
           <?php require_once "item.php";?>
        </div>    
        <div class="cart_icon"><img src="images/shoppingcart.png" alt="" title="" width="48" border="0" height="48">
        </div>        
      </div>	

      <div class="title_box">Customer Service</div>  
      <div class="border_box">

      <?php 
      //ym
      $ym=mysqli_query($con,"select * from mod_ym order by id desc");
      while($t=mysqli_fetch_array($ym)){
        echo "<br /><p>&bull; $t[nama] 
              <a href='ymsgr:sendIM?$t[username]'>
              <img src='http://opi.yahoo.com/online?u=$t[username]&amp;m=g&amp;t=1' border='0' height='16' width='64'></a>
              </p><br />";
      }
      ?>
      </div>  
      <div class="title_box">Kontak Kami</div>  
      <div class="border_box">
      <div style='display: block;'>
<table border='0' cellpadding='0' cellspacing='0' height='1' width='100%'>
<tbody>
</tbody>
<?
 $kontak=mysqli_query($con,"select * from mod_kontak order by id_kontak desc");
      while($t=mysqli_fetch_array($kontak)){
      	echo "
<p align='center'><span style='font-weight:bold;' font-size='18'> $t[judul]</span></p>
<p align='center' ><img src='foto_banner/$t[gambar]' alt=' $t[judul]'/><span style='font-weight:normal;' font-size='20'> $t[jenis]</span></p>
<p align='center'><span style='font-weight:bold;'>----------</span></p>";
}
?>
</table></div> 
	 </div>
      <div class="title_box">Bank Pembayaran</div>  
      <div class="border_box">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><div align="center">
                      <?php
      $bank=mysqli_query($con,"SELECT * FROM mod_bank ORDER BY id_bank ASC");
      while($b=mysqli_fetch_array($bank)){
		    echo "<span class='bank'>$a[nama_bank]</a></div>
         <div class='bank'>
             <img src='foto_banner/$b[gambar]' border='0' >
             </a>
         </div>
         <div class='bank'><span class='bank'>No. Rek : $b[no_rekening]
<div class='bank'><span class='bank'>an. $b[pemilik]</span></div>";
      }

        ?>
                    </span></div></td>
                  </tr>
                </table>
          </div>	 
	 																														
            <script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) {return;}
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <?
	$fb = mysqli_query($con,"SELECT * FROM facebook");
	$r      = mysqli_fetch_array($fb);			
	echo "
	<div class='title_box'>$r[nama_widget]</div>  
     <div class='border_box'> 
<div class='fb-like-box clearfix' data-href='https://$r[alamat_fb]' data-width='180' data-height='300' data-colorscheme='light' data-show-faces='true' data-stream='false' data-header='false' data-border-color=''>
            	</div></div>";
?>

	  <div class="title_box">Statistik User</div>  
     <div class="border_box">
<?php
  // Statistik user
  $ip      = $_SERVER['REMOTE_ADDR']; // Mendapatkan IP komputer user
  $tanggal = date("Ymd"); // Mendapatkan tanggal sekarang
  $waktu   = time(); // 

  // Mencek berdasarkan IPnya, apakah user sudah pernah mengakses hari ini 
  $s = mysqli_query($con,"SELECT * FROM statistik WHERE ip='$ip' AND tanggal='$tanggal'");
  // Kalau belum ada, simpan data user tersebut ke database
  if(mysqli_num_rows($s) == 0){
    mysqli_query($con,"INSERT INTO statistik(ip, tanggal, hits, online) VALUES('$ip','$tanggal','1','$waktu')");
  } 
  else{
    mysqli_query($con,"UPDATE statistik SET hits=hits+1, online='$waktu' WHERE ip='$ip' AND tanggal='$tanggal'");
  }

  $pengunjung       = mysqli_num_rows(mysqli_query($con,"SELECT * FROM statistik WHERE tanggal='$tanggal' GROUP BY ip"));
  $totalpengunjung  = mysqli_result(mysqli_query($con,"SELECT COUNT(hits) FROM statistik"), 0); 
  // var_dump($totalpengunjung);exit();
  $hits             = mysql_fetch_assoc(mysqli_query($con,"SELECT SUM(hits) as hitstoday FROM statistik WHERE tanggal='$tanggal' GROUP BY tanggal")); 
  $totalhits        = mysqli_result(mysqli_query($con,"SELECT SUM(hits) FROM statistik"), 0); 
  $tothitsgbr       = mysqli_result(mysqli_query($con,"SELECT SUM(hits) FROM statistik"), 0); 
  $bataswaktu       = time() - 300;
  $pengunjungonline = mysqli_num_rows(mysqli_query($con,"SELECT * FROM statistik WHERE online > '$bataswaktu'"));

  $path = "counter/";
  $ext = ".png";

  $tothitsgbr = sprintf("%06d", $tothitsgbr);
  for ( $i = 0; $i <= 9; $i++ ){
	   $tothitsgbr = str_replace($i, "<img src='$path$i$ext' alt='$i'>", $tothitsgbr);
  }

  echo "<br /><p align='left'>
      <img src='counter/hariini.png'> Pengunjung hari ini : $pengunjung <br />
      <img src='counter/total.png'> Total pengunjung    : $totalpengunjung <br /><br />
      <img src='counter/hariini.png'> Hits hari ini    : $hits[hitstoday] <br />
      <img src='counter/total.png'> Total Hits       : $totalhits <br /><br />
      <img src='counter/online.png'> Pengunjung Online: $pengunjungonline<br /><br /></p>
      <p align='center'>$tothitsgbr </p><br />";
?>


	 </div> 	     
     <?php
$htmlkanan=mysqli_query($con,"SELECT * FROM htmlkanan");
while($b=mysqli_fetch_array($htmlkanan)){
	?>
<div class='title_box'><? echo "$b[nama]"; ?></div>  
     <div class='border_box'>
 <? echo"<html>$b[isi_html]</html>"; ?>
   </div>";
<?
}
?>
     <div class="banner_adds"></div>        
