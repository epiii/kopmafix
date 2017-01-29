
    <div class="title_box">Kategori</div>    
      <ul class="left_menu">
            <?php
            $kategori=mysqli_query($con,"select nama_kategori, kategori.id_kategori, kategori_seo,  
                                  count(produk.id_produk) as jml 
                                  from kategori left join produk 
                                  on produk.id_kategori=kategori.id_kategori 
                                  group by nama_kategori");
            $no=1;
            while($k=mysqli_fetch_array($kategori)){
              if(($no % 2)==0){
                echo "<li class='genap'><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'> $k[nama_kategori] ($k[jml])</a></li>";
              }
              else{
                echo "<li class='ganjil'><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'> $k[nama_kategori] ($k[jml])</a></li>";              
              }
              $no++;
            }
            ?>
      </ul>
       
    <div class="title_box">Produk Best Seller</div>  
     <div class="border_box">
      <?php
      $best=mysqli_query($con,"SELECT * FROM produk ORDER BY dibeli DESC LIMIT 2");
      while($a=mysqli_fetch_array($best)){
        $harga = format_rupiah($a[harga]);
		    echo "<div class='product_title'><a href='produk-$a[id_produk]-$a[produk_seo].html'>$a[nama_produk]</a></div>
         <div class='product_img'>
             <a href='produk-$a[id_produk]-$a[produk_seo].html'>
                <img src='foto_produk/small_$a[gambar]' border='0' >
             </a>
         </div>";
      }

        ?>
       </div>
       <div class="title_box">Testimoni Pelanggan</div>  
     <div class="border_box">
	                      			
          <MARQUEE onmouseover=this.stop() style="CURSOR:default" 
                       onmouseout=this.start() scrollAmount=1 direction=up loop=true height=180>
      <?php
              $hubungi=mysqli_query($con,"SELECT * FROM testimoni where aktif='Y' ORDER BY id_testi DESC LIMIT 5");
              while($s=mysqli_fetch_array($hubungi)){
                echo "<center><li><b>$s[nama]</b></br><i>
                      $s[isi]</i></center>
					 </li><br />
					 ";
					  
              }
            ?> </MARQUEE> </br>
	</br><a href="testimoni.html"><b><i><u>Tambah testimoni</u></b></i></a>
					</div>
<div class="title_box">Lacak Pengiriman</div>  
     <div class="border_box">
	 <div class="left_border_box">
	       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><div align="center">
					<form method="post" action="http://www.jne.co.id/index.php?mib=tracking&lang=IN" target="_blank">
 <span class='pengunjung'>Nomor Resi JNE <br />
<input name="awbnum" type="text" class="rightsearch" id="awbnum"  /></br>
<input type="submit" name="submittracking" class="btlogin" value="Track" id="trksubmit" />
</form>  </br></br>
<form method="get" action="http://www.posindonesia.co.id/home/modules/mod_search/tmpl/libs/lacakk1121m4np05.php" name="input" target="_blank">
<input type="hidden" name="lacak" value="Lacak" />
No Resi POS <br/>
<input name="barcode" type="text" /></br>
<input type="submit" value="Track"  /></form>
                   </span></div> </center></td>
                  </tr>
            </table>
		</div>
       </div>
       <div class="title_box">Recomended Link</div>  
     <div class="border_box">
       <?php
$banner=mysqli_query($con,"SELECT * FROM banner ORDER BY id_banner DESC LIMIT 4");
while($b=mysqli_fetch_array($banner)){
  echo "<p align='center'><a href='$b[url]'' target='_blank' title='$b[judul]'><img src='foto_banner/$b[gambar]' border=0></a></p>";
}

?>
</div>
<?php
$htmlkiri=mysqli_query($con,"SELECT * FROM htmlkiri");
while($b=mysqli_fetch_array($htmlkiri)){
 echo "<div class='title_box'>$b[nama]</div>  
     <div class='border_box'>
  $b[isi_html]
   </div>";
}
?>
     <div class="banner_adds"></div>    
