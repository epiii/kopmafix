<div class='homepagecontainer'>
		<div class='slides home-span12'>
		<div class='container'>
			
			<div id='flexslider' class='flexslider row'>
			  <ul class='slides span12'>		
			  	<?php
			  	$header=mysqli_query($con,"SELECT * FROM header ORDER BY id_header");
while($b=mysqli_fetch_array($header)){
	echo "	   
			    <li>
			     <img src='header/$b[gambar]' alt='' />
			      <p class='flex-caption'>
				      <strong>$b[judul]</strong><br />
				      $b[keterangan]
				      <a href='$b[url]' class='btn theme'>Check it Out</a>
			      </p>
			    </li>";
			  }
			  ?>  
			  </ul>
			</div>
			
		</div>
		</div>
		<div class='clearfix'></div>
		<!-- =================== -->
		<!-- Promo Banner Option -->
		<!-- =================== -->
        <section class='home-panel promo'>
		<div class='container' style='display:block'>
			<div class='row-fluid'>
			 <?php
$banner=mysqli_query($con,"SELECT * FROM banner WHERE posisi='atas' ORDER BY id_banner DESC LIMIT 3");
while($b=mysqli_fetch_array($banner)){
  echo "<article class='span4'><a href='$b[url]'><img src='foto_banner/$b[gambar]' alt='$b[judul]' target='_blank' title='$b[judul]'/></a></article>"
  ;
}
?>
	</div>			
				
				
		</div>
		</section>	
		
		<div class='container home'>

			<!-- ================ -->
			<!-- Featured section -->
			<!-- ================ -->

			<section class='feat'>

				<div class='row'>
					<div class='span12'>

						<h6 class='subhead theme'><strong>PRODUK TERBARU KAMI</strong></h6>

						<div class='tab-content row'>

						  <!-- Feat tab -->
						  <div class='tab-pane active' id='feat'>
						  	<?php
						  	 $sql=mysqli_query($con,"SELECT * FROM produk WHERE tipe='j' ORDER BY id_produk DESC LIMIT 12");
  while ($r=mysqli_fetch_array($sql)){
    $isi_produk = strip_tags($r['deskripsi']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $isi = substr($isi_produk,0,42); // ambil sebanyak 200 karakter
                $isi = substr($isi_produk,0,strrpos($isi," ")); // potong per spasi kalimat
                
                $isi_judul = strip_tags($r['nama_produk']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $jdl1 = substr($isi_judul,0,8); 
                $jdl1 = substr($isi_judul,0,strrpos($jdl1," ")); // potong per spasi kalimat
    include "diskon_stok.php";
    echo "
						  	<article class='span4'>
								<div class='view view-thumb'>
									<img src='foto_produk/$r[gambar]' alt='$r[nama_produk]' width='258' height='258'>
									<div class='mask'>
										<h2>$divharga</h2>
				                        <p>$isi</p>
				                        <a href='produk-$r[id_produk]-$r[produk_seo].html' class='btn theme'><b>Detail</b></a> 
				                       $tombol
									</div>
								</div>
								<p><a href='#'>$r[nama_produk]</a></p>
							</article>";					
						
						}
							?>
							
							 </div>
						</div> <!-- End tab-content -->

					</div>
				</div>


				<!-- ====== -->
				<!-- Brands -->
				<!-- ====== -->

					

			</section>
 
			
		</div>
		<section class='home-panel promo'>
		<div class='container' style='display:block'>
			<div class='row-fluid'>
			 <?php
$banner1=mysqli_query($con,"SELECT * FROM banner WHERE posisi='bawah' ORDER BY id_banner DESC LIMIT 3");
while($c=mysqli_fetch_array($banner1)){
  echo "<article class='span4'><a href='$c[url]'><img src='foto_banner/$c[gambar]' alt='$c[judul]' target='_blank' title='$c[judul]'/></a></article>"
  ;
}
?>
	</div>			
				
				
		</div>
		</section>	
			</div>
			