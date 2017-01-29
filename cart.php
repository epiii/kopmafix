	<div class='container'>
<?php
// Tampilkan produk-produk yang telah dimasukkan ke keranjang belanja
	$sid = session_id();
	$sql = mysqli_query($con,"SELECT * FROM orders_temp, produk 
			                WHERE id_session='$sid' AND orders_temp.id_produk=produk.id_produk");
  $ketemu=mysqli_num_rows($sql);
  if($ketemu < 1){
    echo "<script>window.alert('Keranjang Belanjanya Masih Kosong');
        window.location=('index.php')</script>";
    }
  else{  
  	echo "
			<!-- Checkout Page -->
			<section class='order'>

				<div class='row standard'>
					<header class='span12 prime'>
						<h3>Keranjang Belanja Anda</h3>
					</header>
				</div>

				<div class='row cart'>
					<div class='span12'>
						<div class='wrap-table'>
							<form method=post action=aksi.php?module=keranjang&act=update>
							
								<table class='table'>
									<thead>
										<tr>
											<td width='70%'>Item</td>
											<td width='10%'>Price</td>
											<td width='10%'>Quantity</td>
											<td width='10%'>Total</td>
										</tr>
									</thead>";
									$no=1;
  $total=0;
  while($r=mysqli_fetch_array($sql)){
    $disc        = ($r['diskon']/100)*$r['harga'];
    $hargadisc   = number_format(($r['harga']-$disc),0,",",".");

    $subtotal    = ($r['harga']-$disc) * $r['jumlah'];
    $total       = $total + $subtotal;  
    $subtotal_rp = format_rupiah($subtotal);
    $total_rp    = format_rupiah($total);
    $harga       = format_rupiah($r['harga']);
    echo "
									<tbody>
										<tr>
											<td><input type=hidden name=id[$no] value=$r[id_orders_temp]>
												<div class='cart-img pull-left hidden-phone'><img src='foto_produk/$r[gambar]' alt='' /></div>
												<div class='item pull-left'>
													<span><a href='aksi.php?module=keranjang&act=hapus&id=$r[id_orders_temp]'>
													<i class='icon-cancel-circled'></i></a> 
													<a href='produk-$r[id_produk]-$r[produk_seo].html'>$r[nama_produk]</a> 
													</span>
												</div>
											</td>
											<td><i>Rp. $hargadisc</i></td>
											 <td><select name='jml[$no]' value=$r[jumlah] onChange='this.form.submit()'>";
              for ($j=1;$j <= $r[stok];$j++){
                  if($j == $r[jumlah]){
                   echo "<option selected>$j</option>";
                  }else{
                   echo "<option>$j</option>";
                  }
              }
        echo "</select></td>
											<td><strong>$subtotal_rp</strong></td>
										</tr>
										";
									}
									echo "										
										<tr>
											<td colspan='3'><div class='item'>Total</div></td>
											<td>Rp. <b>$total_rp</td>
										</tr>
									</tbody>
								</table>
								<div class='row-fluid cart-pay'>
									<div class='span6'></div>
									<div class='span6 cart-checkout'>
								
									<a href='semua-produk.html' class='btn'><i class='icon-arrows-ccw'></i> Lanjut Belanja </a>
									<a href='selesai-belanja.html' class='btn theme'><i class='icon-check'></i> Ke Kasir </a>
									
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</section>";
			}
	?>
		</div>
	