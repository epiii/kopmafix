<div class='container'>

			<!-- Single -->
			<section class='blog'>

				<div class='row'>
					<header class='span12 prime'>
						<h3>Testimonial</h3>
					</header>
				</div>

				<div class='wrap'>
					<div class='row-fluid'>
						
						<div class='span4 sidebar'>
							<aside>
								<p class='title'><i class='icon-rss'></i> <strong>Recent Testimoni</strong></p>
								<ul>
									<?php
										$testia=mysqli_query($con,"SELECT * FROM testimoni WHERE aktif='Y' ORDER BY id_testi DESC LIMIT 5");
      while($ab=mysqli_fetch_array($testia)){
echo "
									<li><a href='testimoni.html'>$ab[nama]</a><br /><small>Posted on $ab[tanggal]</small></li>";
								}
									?>
								</ul>
							</aside>

							
						</div>
						
						<div class='span8 list'>
							<?php
$p      = new Paging8;
  $batas  = 5;
  $posisi = $p->cariPosisi($batas);
							$testi=mysqli_query($con,"SELECT * FROM testimoni WHERE aktif='Y' ORDER BY id_testi DESC LIMIT $posisi,$batas");
      while($aa=mysqli_fetch_array($testi)){
echo "
							<article>
								<h4>$aa[nama]</h4></a>
								<p><small class='date'><i class='icon-calendar'></i> $aa[tanggal]</small></p>
								<p><img src='img/logo.png' alt=''/></p>
								<p>$aa[isi]</p>					
							</article>";
						}
						$jmldata     = mysqli_num_rows(mysqli_query($con,"SELECT * FROM testimoni"));
  $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
  $linkHalaman = $p->navHalaman($_GET[haltestimoni], $jmlhalaman);

  echo "Halaman : $linkHalaman ";
						echo "<label class='control-label' for='inputEmail'> <h4>Silahkan Isikan Testimoni Anda</h4></label>
						<form action=testimoni-aksi.html method=POST>
						<div class='control-group'>
									<label class='control-label' for='inputEmail'>Nama Lengkap</label>
									<div class='controls'>
									  <input type='text' name=nama id='inputEmail' placeholder='Nama Lengkap'>
									</div>
									</div>
									
						<div class='control-group'>
									<label class='control-label' for='inputEmail'> Isi Testimoni</label>
									<div class='controls'>
									<textarea rows='3' name=pesan placeholder='Testimoni Anda'></textarea>
									
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
									  <button type='submit' class='btn theme'>Submit</button>
									</div>
									</div>
								</form>";		
						?>
						

						</div> <!-- span8 Ends -->

					</div>
				</div>

			</section>
		</div>