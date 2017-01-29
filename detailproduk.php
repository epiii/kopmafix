<div class='container'>

			<!-- ====================== -->			
			<!-- Single Product Section -->
			<!-- ====================== -->

			<section class='single'>

				<div class='row'>
					<header class='span12 prime'>
						<h3>Color Scatter Tee</h3>
					</header>
				</div>

				<div class='row'>
<?php
  
$detail=mysqli_query($con,"SELECT * FROM produk,kategori    
                      WHERE kategori.id_kategori=produk.id_kategori 
                      AND id_produk='$_GET[id]'");
	$r = mysqli_fetch_array($detail);
	include "diskon_stok.php";
	echo"
					<div class='span5'>

						<!-- Product Images -->
						<div class='wrap'>

							<div id='flexslider-product' class='flexslider'>
							  <ul class='slides'>
							    <li><a href='foto_produk/$r[gambar]'><img src='foto_produk/$r[gambar]' /></a></li>
							    <li><a href='img/products/3.gif'><img src='img/products/3.gif' /></a></li>
							    <li><a href='img/products/4.gif'><img src='img/products/4.gif' /></a></li>
							    <li><a href='img/products/5.gif'><img src='img/products/5.gif' /></a></li>
							  </ul>				  
							</div>

							<div id='flexcarousel-product' class='flexslider visible-desktop'>
							  <ul class='slides'>
							    <li><img src='foto_produk/$r[gambar]' width ='115' height='115' alt='' /></li>
							   							    
							  </ul>
							</div>

						</div>

					</div>

					<div class='span7'>

						<!-- Product Info -->
						<div class='details wrapper'>

							<p><h3>&#8220;$r[nama_produk]&#8221;</h3></p>
							<p class='price'><i class='icon-tag'></i> $divharga</p>

							<div class='clearfix'></div>
									<div class='pull-left'>
									$tombol
									
									
								
							

							<hr>
							<div class='row-fluid'>
								<div class='span6 decidernote'>Hard to decide? Ask you friends :)</div>
								<div class='addthis_toolbox addthis_default_style'>
                  <a class='addthis_button_preferred_1'></a>
                  <a class='addthis_button_preferred_2'></a>
                  <a class='addthis_button_preferred_3'></a>
                  <a class='addthis_button_preferred_4'></a>
                  <a class='addthis_button_compact'></a>
                  <a class='addthis_counter addthis_bubble_style'></a>
                  </div>
								 <script type='text/javascript' src='http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f8aab4674f1896a'></script>
							</div>

							<hr>

							<!-- Product details -->

							<div class='accordion' id='accordion2'>
							  <div class='accordion-group'>
							    <div class='accordion-heading'>
							      <a class='accordion-toggle' data-toggle='collapse' data-parent='#accordion2' href='#description'>
							        <i class='icon-layout theme'></i> Product Description
							      </a>
							    </div>
							    <div id='description' class='accordion-body collapse'>
							      <div class='accordion-inner'>
							       $r[deskripsi]
							      </div>
							    </div>
							  </div>
							   </div>

						</div>

					</div>
					
				</div>

				<!-- ================== -->
				<!-- Cross-sell section -->
				<!-- ================== -->

				<div class='row'>
					<div class='span12'>
						<div class='cross-wrapper'>
							<hr />
							<header>Produk Lainnya :</header>

							<section class='row-fluid cross-product'>";
							 $sql=mysqli_query($con,"SELECT * FROM produk ORDER BY rand() LIMIT 4");
							 while ($r=mysqli_fetch_array($sql)){
  include "diskon_stok.php";
							 $isi_produk = strip_tags($r['deskripsi']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $isi = substr($isi_produk,0,42); // ambil sebanyak 200 karakter
                $isi = substr($isi_produk,0,strrpos($isi," ")); // potong per spasi kalimat
                
                $isi_judul = strip_tags($r['nama_produk']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $jdl1 = substr($isi_judul,0,8); 
                $jdl1 = substr($isi_judul,0,strrpos($jdl1," ")); // potong per spasi kalimat
							 echo "

									<article class='span3'>
										<div class='view view-thumb'>
											<img src='foto_produk/$r[gambar]' alt='$r[nama_produk]' />
											<div class='mask'>
												<h2>$divharga</h2>
						                        <p>$isi</p>
						                         <a href='produk-$r[id_produk]-$r[produk_seo].html' class='btn theme'><b>Detail</b></a> 
				                       $tombol
											</div>
										</div>
										<p>$r[nama_produk]</p>
									</article>";
								}
								echo "								
							</div>

						</div>
					</div>
				</div>

			</section>

		</div>";
		?>