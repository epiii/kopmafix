	<div class='container'>

			<!-- =========== -->			
			<!-- Single Post -->
			<!-- =========== -->

			<section class='blog'>

				<div class='row'>
					<header class='span12 prime'>
						<?php
						$profil = mysqli_query($con,"SELECT * FROM modul WHERE id_modul='45'");
	$r      = mysqli_fetch_array($profil);
	echo "
						<h3>How to Order</h3>
						
				</div>

				<div class='wrap'>
					<div class='row-fluid post'>
						<div class='span8'>

							<article>

								

								<p>$r[static_content]<br /></p>";
							
  echo "</article></div>";				
							

							?>

						
						
						
						
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

					</div>
				</div>

			</section>
			</div>
	