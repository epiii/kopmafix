<div class='container'>
<?php
	// selesain-belanja.html
	$sid = session_id();
	$sql = mysqli_query($con,"SELECT * FROM orders_temp, produk 
			                WHERE id_session='$sid' AND orders_temp.id_produk=produk.id_produk");
  $ketemu=mysqli_num_rows($sql);
  if($ketemu < 1){
   echo "<script> alert('Keranjang belanja masih kosong');window.location='index.php'</script>\n";
   	 exit(0);
	}
	else{
		echo "
			<!-- Login Section -->
			<section class='login'>

				<div class='row standard'>
					<header class='span12 prime'>
						<h3>Account</h3>
					</header>
				</div>

				<div class='wrap'>

					<div class='row-fluid'>
						<div class='span6'>

							<ul class='nav nav-tabs' id='myTab'>
							  <li class='active'><a href='#login'><i class='icon-lock'></i> Data Kostumer</a></li>
							  <li><a href='#forgot'><i class='icon-help'></i> Lupa password</a></li>
							</ul>

							<div class='tab-content'>

							<!-- Login -->
							  <div class='tab-pane active' id='login'>
							  <div class='control-group'>
									<label class='control-label' for='inputEmail'><b>Kustomer Lama</b></label>
									</div>
							  <form name=form2 class='form-horizontal' action=simpan-transaksi-member.html method=POST onSubmit=\"return validasi2(this)\">
							  	<div class='control-group'>
									<label class='control-label' for='inputEmail'> Email</label>
									<div class='controls'>
									  <input type='email' name=email id='inputEmail' placeholder='Email'>
									</div>
									</div>
									<div class='control-group'>
									<label class='control-label' for='inputPassword'> Password</label>
									<div class='controls'>
									    <input type='password' name=password id='inputPassword' placeholder='Password'>
									</div>
									</div>		
							  <div class='control-group'>
									<div class='controls'>
									  <button type='submit' class='btn theme'>Login</button>
									</div>
									</div>
							</form>	

						 	<form name=form class='form-horizontal' action=simpan-transaksi.html method=POST onSubmit=\"return validasi(this)\">
									<div class='control-group'>
									<label class='control-label' for='inputEmail'><b>Kustomer Baru</b></label>
									</div>
									<div class='control-group'>
									<label class='control-label' for='inputEmail'> Nama Lengkap</label>
									<div class='controls'>
									  <input type='text' name=nama id='inputEmail' placeholder='Nama Lengkap'>
									</div>
									</div>
									<div class='control-group'>
									<label class='control-label' for='inputEmail'> Email</label>
									<div class='controls'>
									  <input type='email' name=email id='inputEmail' placeholder='Email'>
									</div>
									</div>
									<div class='control-group'>
									<label class='control-label' for='inputPassword'> Password</label>
									<div class='controls'>
									    <input type='password' name=password id='inputPassword' placeholder='Password'>
									</div>
									</div>		
									<div class='control-group'>
									<label class='control-label' for='inputEmail'> Alamat Lengkap</label>
									<div class='controls'>
									<textarea rows='3' name=alamat placeholder='Alamat'></textarea>
									  <br />Alamat pengiriman harus di isi lengkap, termasuk kota/kabupaten dan kode posnya.
									</div>
									</div>								
									<div class='control-group'>
									<label class='control-label' > No. Telp</label>
									<div class='controls'>
									  <input type='text' name=telpon placeholder='No.Telepon Yang bisa dihubungi'>
									</div>
									</div>
									<div class='control-group'>
									<label class='control-label' for='inputKota'> Kota</label>
									<div class='controls'>
									 <select name='kota'>
      <option value=0 selected>- Pilih Kota -</option>";
      $tampil=mysqli_query($con,"SELECT * FROM kota ORDER BY nama_kota");
      while($r=mysqli_fetch_array($tampil)){
         echo "<option value=$r[id_kota]>$r[nama_kota]</option>";
      }
  echo "</select> <br /><br />*)  Apabila tidak terdapat nama kota tujuan Anda, pilih <b>Lainnya</b>
                  <br />**) Ongkos kirim dihitung berdasarkan kota tujuan
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
									  <button type='submit' class='btn theme'>Daftar</button>
									</div>
									</div>
								</form>
							  </div>

							<!-- Register -->
							  <div class='tab-pane' id='forgot'>
								<form name=form3 class='form-horizontal' action=kirim-password.html method=POST>
									<div class='control-group'>
									<label class='control-label' for='inputEmail'> Email</label>
									<div class='controls'>
									  <input type='email' name=email id='inputEmail' placeholder='Email'>
									</div>
									</div>

									<div class='control-group'>
									<div class='controls'>
									  <button type='submit' class='btn theme'>Retrieve password</button>
									</div>
									</div>
								</form>
							  </div>

							</div>

						</div>

						<div class='span6'>
							<p>New Customer</p>
							<hr>
							<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere. <a href='#' class='theme'>Create an Account ?</a></p>
						</div>
					</div>

				</div>

			</section>";
		}
			?>
		</div>