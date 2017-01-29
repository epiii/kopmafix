	<div class='container'>

			<!-- ================ -->
			<!-- Products section -->
			<!-- ================ -->

			<section class='product'>

				<div class='row'>
					<header class='span12 prime'>
						<!-- <p><a href='index.html'>Home</a> &#9656; <a href='product.html'>Mens</a> &#9656; T-Shirts</p> -->
						<h4>Hasil Cari Produk</h4>
					</header>
				</div>

				<div class='row'>

					<div class='span3 hidden-phone'>
						<div class='sidebar'>
							<section>
								<?php
								echo "
								<h5>Kategori Produk</h5>
								<nav>
									<ul>";
							  $kategori=mysqli_query($con,"select nama_kategori, kategori.id_kategori, kategori_seo,  
                                  count(produk.id_produk) as jml 
                                  from kategori left join produk 
                                  on produk.id_kategori=kategori.id_kategori 
                                  group by nama_kategori");
            $no=1;
            while($k=mysqli_fetch_array($kategori)){
              if(($no % 2)==0){
                echo "
                <li><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'><i class='icon-right-open'></i> $k[nama_kategori] ($k[jml])</a></li>";
              }
              else{
                echo "<li><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'><i class='icon-right-open'></i> $k[nama_kategori] ($k[jml])</a></li>";              
              }
              $no++;
            }
							echo "									
										
									</ul>
								</nav>
							</section>
							<section>
							<h5>Best Seller</h5>";								
      $best=mysqli_query($con,"SELECT * FROM produk ORDER BY dibeli DESC LIMIT 5");
      while($a=mysqli_fetch_array($best)){
        $harga = format_rupiah($a['harga']);
		    echo "<a href='produk-$a[id_produk]-$a[produk_seo].html'>
									<article class='clearfix'>
										<div class='thumb visible-desktop'><img src='foto_produk/$a[gambar]' alt=''/></div>
										<div class='info'>$a[nama_produk]<br><span class='price theme'>$a[harga]</span></div>
									</article>
								</a>";
      }

       
					echo "</section>
							<section>
								<h5>Bank Pembayaran</h5>";
								 $bank=mysqli_query($con,"SELECT * FROM mod_bank ORDER BY id_bank ASC");
      while($b=mysqli_fetch_array($bank)){
						 echo "
									<article class='clearfix'>
										<div class='thumb visible-desktop'><img src='foto_banner/$b[gambar]' alt=''/></div>
										<div class='info'>$b[no_rekening]<br><span class='price theme'>$b[pemilik]</span></div>
										
									</article>
								";
							}
							?>

						</div>
					</div>

					<div class='span9'>
						<div class='row-fluid'>

							<!-- Collection -->
							<div class='tab-content sideline'>
								<?php
								// Tentukan berapa data yang akan ditampilkan per halaman (paging)
   // menghilangkan spasi di kiri dan kanannya
  $kata = trim($_POST['kata']);
  // mencegah XSS
  $kata = htmlentities(htmlspecialchars($kata), ENT_QUOTES);

  // pisahkan kata per kalimat lalu hitung jumlah kata
  $pisah_kata = explode(" ",$kata);
  $jml_katakan = (integer)count($pisah_kata);
  $jml_kata = $jml_katakan-1;

  $cari = "SELECT * FROM produk WHERE " ;
    for ($i=0; $i<=$jml_kata; $i++){
      $cari .= "deskripsi LIKE '%$pisah_kata[$i]%' OR nama_produk LIKE '%$pisah_kata[$i]%'";
      if ($i < $jml_kata ){
        $cari .= " OR ";
      }
    }
  $cari .= " ORDER BY id_produk DESC LIMIT 7";
  $hasil  = mysqli_query($con,$cari);
  $ketemu = mysqli_num_rows($hasil); 
   if ($ketemu > 0){
  	
  echo "<h5>Ditemukan <b>$ketemu</b> produk dengan kata <font style='background-color:#00FFFF'><b>$kata</b></font> : </h5>";
  // Tampilkan semua produk
  while($r=mysqli_fetch_array($hasil)){
  
    include "diskon_stok.php";
    $isi_produk = strip_tags($r['deskripsi']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $isi = substr($isi_produk,0,42); // ambil sebanyak 200 karakter
                $isi = substr($isi_produk,0,strrpos($isi," ")); // potong per spasi kalimat
                
                $isi_judul = strip_tags($r['nama_produk']); // membuat paragraf pada isi berita dan mengabaikan tag html
                $jdl1 = substr($isi_judul,0,8); 
                $jdl1 = substr($isi_judul,0,strrpos($jdl1," ")); // potong per spasi kalimat
    echo "
								<article>
									<div class='view view-thumb'>
										<img src='foto_produk/$r[gambar]' alt='$r[nama_produk]' />
										<div class='mask'>
											<h2>$divharga</h2>
								            <p>$isi</p>
								            <a href='produk-$r[id_produk]-$r[produk_seo].html' class='btn theme'><b>Detail</b></a> 
				                       $tombol
										</div>
									</div>
									<p class='product-title'><a href='produk-$r[id_produk]-$r[produk_seo].html'>$r[nama_produk]</a></p>
								</article>";
							}
							 }                                                          
  else{
  	  echo "<p>Tidak ditemukan produk dengan kata <b>$kata</b></p>";
  	}
							echo "
							</div>
							<!-- Collections end -->

						</div>		
					</div>

				</div>
			</section>";
			?>

		</div>