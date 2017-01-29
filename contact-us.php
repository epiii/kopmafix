<div class='container'>

			<!-- ============ -->
			<!-- Contact page -->
			<!-- ============ -->

			<section class='page'>

				<div class='row'>
					<div class='span12'>

						
				</div>

				<div class='row address'>

					<div class='span4'>
						<div class='wrap contactform'>
							<address class="row-fluid">
							<div class="pull-left clabel"><i class="icon-location"></i></div>
							<div class="pull-left cdata"><?php echo "$bb[nama_toko]"; ?></div>
						</address>
						<address class="row-fluid">
							<div class="pull-left clabel"><i class="icon-phone"></i></div>
							<div class="pull-left cdata"><?php echo "$bb[nomor_hp]"; ?></div>
						</address>
						<address class="row-fluid">
							<div class="pull-left clabel"><i class="icon-phone"></i></div>
							<div class="pull-left cdata">PIN BB : <?php echo "$bb[pin_bb]"; ?></div>
						</address>
						<address class="row-fluid">
							<div class="pull-left clabel"><i class="icon-mail"></i></div>
							<div class="pull-left cdata"><a href="#"><?php echo "$bb[email_pengelola]"; ?></a></div>
						</address>
						</div>
					</div>

					<div class='span8'>
						<div class='row-fluid'>
							<?php
							echo "
							 <form action=hubungi-aksi.html method=POST>
								<div class='span4'>
									<label for='inputEmail'>Name</label>
									<input type='text' name=nama id='inputEmail' placeholder='Nama Lengkap' class='input-medium'>
								</div>
								<div class='span4'>
									<label for='inputEmail'>Email</label>
									<input type='text' name=email id='inputEmail' placeholder='Email' class='input-medium'>
								</div>	
								<div class='span4'>
									<label for='inputEmail'>Subjek</label>
									<input type='text' name=subjek id='inputEmail' placeholder='Subjek atau No Telp' class='input-medium'>
								</div>							
								<div class='row-fluid'>
									<div class='span12'>
										<label for='inputPassword'>Pesan</label>
										<textarea name='pesan' id='' rows='5'></textarea>
									</div>
									<div class='controls'>
									<img src='captcha.php'>
									</div>
									<div class='controls'>
									  (Masukkan 6 kode diatas)<br /><input type=text name=kode size=6 maxlength=6><br />
									
									</div>
									<br />
									<p><input type='submit' class='btn' value='Submit'/></p>
								</div>
							</form>	
						</div>";
						?>

					</div>

				</div>

			</section>
		</div>