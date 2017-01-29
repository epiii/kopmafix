	<div class='container'>

			<!-- =========== -->			
			<!-- Single Post -->
			<!-- =========== -->

			<section class='blog'>

				<div class='row'>
					<header class='span12 prime'>
						<?php
						$detail=mysqli_query($con,"SELECT * FROM artikel,users,label    
                      WHERE users.username=artikel.username 
                      AND label.id_label=artikel.id_label 
                      AND id_artikel = '".abs((int)$_GET[id])."'");
	$d   = mysqli_fetch_array($detail);
	$tgl = tgl_indo($d[tanggal]);
	$baca = $d[dibaca]+1;
	
	echo "
						<h3>$d[judul]</h3>
						<p><span class='date'><i class='icon-calendar'></i> $tgl - $d[jam] WIB<i class='icon-tag'></i> 
						<a href='label-$d[id_label]-$d[label_seo].html'>Kategori Artikel : $d[nama_label]</a></span></p>
					</header>
				</div>

				<div class='wrap'>
					<div class='row-fluid post'>
						<div class='span8'>

							<article>

								<p><img src='foto_berita/$d[gambar]' alt=''/></p>

								<p>$d[isi_artikel] <br /></p>";
								$domain=mysqli_fetch_array(mysqli_query($con,"SELECT alamat_website FROM identitas"));
								mysqli_query($con,"UPDATE artikel SET dibaca=$d[dibaca]+1 
				  WHERE id_artikel='".$val->validasi($_GET['id'],'sql')."'"); 

  // Hitung jumlah komentar
  $komentar = mysqli_query($con,"select count(komentar.id_komentar) as jml from komentar WHERE id_artikel='".$val->validasi($_GET['id'],'sql')."' AND aktif='Y'");
  $k = mysqli_fetch_array($komentar); 
								 echo "<div class='fb-like' data-href='$domain[alamat_website]/artikel-$d[id_artikel]-$d[judul_seo].html' 
        data-send='true' data-show-faces='true' data-width='600'></div>";
								echo "
							</article><div class='comments'>
								<h5><b>$k[jml]</b> Comments</h5>";
// Paging komentar
  $p      = new Paging7;
  $batas  = 10;
  $posisi = $p->cariPosisi($batas);

  // Komentar artikel
	$sql = mysqli_query($con,"SELECT * FROM komentar WHERE id_artikel='".$val->validasi($_GET['id'],'sql')."' AND aktif='Y' LIMIT $posisi,$batas");
	$jml = mysqli_num_rows($sql);
  // Apabila sudah ada komentar, tampilkan 
  if ($jml > 0){
    while ($s = mysqli_fetch_array($sql)){
      $tanggal = tgl_indo($s[tgl]);
      // Apabila ada link website diisi, tampilkan dalam bentuk link   
 	    if ($s[url]!=''){
        echo "<article class='clearfix'>
									<div class='pull-left avatar'><img src='img/poto.jpg' alt='' /></div>
									<div class='pull-right text'>
        <a name=$s[id_komentar] id=$s[id_komentar]>
       </a>
       ";  
	    }
	    else{
        echo "<article class='clearfix'>
									<div class='pull-left avatar'><img src='img/poto.jpg' alt='' /></div>
									<div class='pull-right text'>
        <a name=$s[id_komentar] id=$s[id_komentar]>
       </a>";  
      }

  		
      $isian=nl2br($s[isi_komentar]); // membuat paragraf pada isi komentar
      $isikan=sensor($isian); 
 
  	  echo autolink($isikan);
  	  echo "<br /><small>$s[nama_komentar] | $tanggal - $s[jam_komentar] WIB</small>";
      echo "</div>
								</article>";	 		  
    }

		$jmldata     = mysqli_num_rows(mysqli_query($con,"SELECT * FROM komentar WHERE id_artikel='".$val->validasi($_GET['id'],'sql')."' AND aktif='Y'"));
    $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
    $linkHalaman = $p->navHalaman($_GET['halkomentar'], $jmlhalaman);

    echo "$linkHalaman";
  }
  echo "</div><hr />				
							

							<!-- =============== -->
							<!-- Comment Section -->
							<!-- =============== -->

							<div class='comment-form'>
								<h5>Leave comment</h5>
								<form name='form' class='form-horizontal' action=simpankomentar.php method=POST onSubmit=\"return validasi(this)\">
									<input type=hidden name=id value=".$val->validasi($_GET['id'],'sql').">
  			<input type=hidden name=judul_seo value='$d[judul_seo]'>
								  <div class='control-group'>
								    <label class='control-label' for='inputEmail'>Your Name</label>
								    <div class='controls'>
								      <input type='text' name=nama_komentar id='inputEmail' placeholder='Name..'>
								    </div>
								  </div>
								  <div class='control-group'>
								    <label class='control-label' for='inputPassword'>Email</label>
								    <div class='controls'>
								      <input type='text' name=url id='inputPassword' placeholder='Email'>
								    </div>
								  </div>
								  <div class='control-group'>
								    <label class='control-label' for='inputPassword'>Comment</label>
								    <div class='controls'>
								      <textarea name='isi_komentar' id='' rows='5'></textarea>
								    </div>
								  </div>
								  <div class='controls'>
									<img src='captcha.php'>
									</div>
									<div class='controls'>
									  (Masukkan 6 kode diatas)<br /><input type=text name=kode size=6 maxlength=6><br />
									
									</div>
									<br />
								  <div class='control-group'>
								    <div class='controls'>
								      <button type='submit' class='btn'>Submit</button>
								    </div>
								  </div>
								</form>				
							</div>";
			?>

						</div>
						
						
						
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
	