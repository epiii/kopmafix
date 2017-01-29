<div class='container'>

			<!-- Single -->
			<section class='blog'>

				<div class='row'>
					<header class='span12 prime'>
						<h3>Article</h3>
					</header>
				</div>

				<div class='wrap'>
					<div class='row-fluid'>
						
						<div class='span4 sidebar'>
							<aside>
								<p class='title'><i class='icon-rss'></i> <strong>Kategori Artikel</strong></p>
								
								<ul>
									<?php
									echo "
								
								<nav>
									<ul>";
							  $label=mysqli_query($con,"select * from label");
           
            while($w=mysqli_fetch_array($label)){
              
                echo "
                <li><a href='label-$w[id_label]-$w[label_seo].html'><i class='icon-right-open'></i> $w[nama_label]</a></li>";
             
            }
            
?>
</ul>
</nav>
						</aside>
						
							

							<aside>
								<p class='title'><i class='icon-rss'></i> <strong>Kategori Produk</strong></p>
								
								<ul>
									<?php
									echo "
								
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
?>
						</aside>
						<aside>
								<p class='title'><i class='icon-rss'></i> <strong>Artikel Populer</strong></p>
								
								<ul>
									<?php
							  $artikel=mysqli_query($con,"select * FROM artikel ORDER BY id_artikel DESC LIMIT 5");
            $no=1;
            while($k=mysqli_fetch_array($artikel)){
              
                echo "<li><a href='artikel-$k[id_artikel]-$k[judul_seo].html'>$k[judul]</a><br /><small>posted on $k[tanggal] WIB</small></li>
               ";
              }
              ?>
								
									
								</ul>
							</aside>
						</div>
						
						<div class='span8 list'>
							<?php
$p      = new Paging1;
  $batas  = 5;
  $posisi = $p->cariPosisi($batas);
  // Tampilkan semua artikel
  $sql=mysqli_query($con,"select count(komentar.id_komentar) as jml, judul, judul_seo, jam, 
                       artikel.id_artikel, hari, tanggal, gambar, isi_artikel    
                       from artikel left join komentar 
                       on artikel.id_artikel=komentar.id_artikel
                       and aktif='Y' 
                       group by artikel.id_artikel DESC LIMIT $posisi,$batas");
  while($r=mysqli_fetch_array($sql)){
		$tgl = tgl_indo($r[tanggal]);
			
      // Tampilkan hanya sebagian isi artikel
      $isi_artikel = htmlentities(strip_tags($r[isi_artikel])); // membuat paragraf pada isi artikel dan mengabaikan tag html
      $isi = substr($isi_artikel,0,220); // ambil sebanyak 150 karakter
      $isi = substr($isi_artikel,0,strrpos($isi," ")); // potong per spasi kalimat
							echo "<article>
								<a href='artikel-$r[id_artikel]-$r[judul_seo].html'><h4>$r[judul]</h4></a>
								<p><small class='date'><i class='icon-calendar'></i> $r[hari], $tgl - $r[jam] WIB</small> | <small class='comments'><a href='#'><i class='icon-comment'></i> $r[jml] Komentar</a></small></p>
								<p><img src='foto_berita/$r[gambar]' alt=''/></p>
								<p>$isi</p>
								<p><a href='artikel-$r[id_artikel]-$r[judul_seo].html' class='theme'>Read More...</a></p>					
							</article>";
						}
						$jmldata     = mysqli_num_rows(mysqli_query($con,"SELECT * FROM artikel"));
  $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
  $linkHalaman = $p->navHalaman($_GET[halartikel], $jmlhalaman);

echo "	<div class='pagination pagination-centered'><ul>$linkHalaman</ul></div>
							</div>

						</div> <!-- span8 Ends -->

					</div>
				</div>

			</section>";
		?>
		</div>