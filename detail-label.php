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
								<p class='title'><i class='icon-rss'></i> <strong>Recent Articles</strong></p>
								
								<ul>
									<?php
							  $artikel=mysqli_query($con,"select * FROM artikel ORDER BY id_artikel DESC LIMIT 5");
            $no=1;
            while($k=mysqli_fetch_array($artikel)){
              
                echo "<li><a href='artikel-$k[id_artikel]-$k[judul_seo].html'>$k[judul]</a><br /><small>posted on $tgl - $d[jam] WIB</small></li>
               ";
              }
              ?>
								
									
								</ul>
							</aside>

							<aside>
								<p class='title'><i class='icon-rss'></i> <strong>Best Product</strong></p>
								
								<ul>
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
?>
						</aside>
						</div>
						
						<div class='span8 list'>
							<?php
$sq = mysqli_query($con,"SELECT nama_label from label where id_label='".$val->validasi($_GET['id'],'sql')."'");
  $n = mysqli_fetch_array($sq);
  echo "<span class=judul_head>&#187; Kategori Artikel : <b>$n[nama_label]</b></span><br /><br />";
  
  $p      = new Paging3a;
  $batas  = 6;
  $posisi = $p->cariPosisi($batas);
  
  // Tampilkan daftar artikel sesuai dengan label yang dipilih
 	$sql   = "SELECT * FROM artikel WHERE id_label='".$val->validasi($_GET['id'],'sql')."' 
            ORDER BY id_artikel DESC LIMIT $posisi,$batas";		 

	$hasil = mysqli_query($con,$sql);
	$jumlah = mysqli_num_rows($hasil);
	// Apabila ditemukan artikel dalam label
	if ($jumlah > 0){
   while($r=mysqli_fetch_array($hasil)){
   	$isi_artikel = htmlentities(strip_tags($r[isi_artikel])); // membuat paragraf pada isi artikel dan mengabaikan tag html
    $isi = substr($isi_artikel,0,400); // ambil sebanyak 220 karakter
    $isi = substr($isi_artikel,0,strrpos($isi," ")); // potong per spasi kalimat
   $komentar = mysqli_query($con,"select count(komentar.id_komentar) as jml from komentar WHERE id_artikel='$r[id_artikel]' AND aktif='Y'");
  $k = mysqli_fetch_array($komentar); 
           
							echo "<article>
								<a href='artikel-$r[id_artikel]-$r[judul_seo].html'><h4>$r[judul]</h4></a>
								<p><small class='date'><i class='icon-calendar'></i> $r[hari], $tgl - $r[jam] WIB</small> | <small class='comments'><a href='#'><i class='icon-comment'></i> $k[jml] comments</a></small></p>
								<p><img src='foto_berita/$r[gambar]' alt=''/></p>
								<p>$isi</p>
								<p><a href='artikel-$r[id_artikel]-$r[judul_seo].html' class='theme'>Read More ?</a></p>					
							</article>";
						}
						$jmldata     = mysqli_num_rows(mysqli_query($con,"SELECT * FROM artikel WHERE id_label='".$val->validasi($_GET['id'],'sql')."'"));
  $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
  $linkHalaman = $p->navHalaman($_GET[hallabel], $jmlhalaman);
echo "<div class='pagination pagination-centered'>
							  <ul>
							   $linkHalaman
							  </ul>
							</div>";  
  }
  else{
    echo "Belum ada artikel pada label ini.";
  }

 echo "

						</div> <!-- span8 Ends -->

					</div>
				</div>

			</section>";
		?>
		</div>