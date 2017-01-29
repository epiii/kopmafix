<script language="javascript">
function validasi(form){
  if (form.nama.value == ""){
    alert("Anda belum mengisikan Nama.");
    form.nama.focus();
    return (false);
  }    
  if (form.alamat.value == ""){
    alert("Anda belum mengisikan Alamat.");
    form.alamat.focus();
    return (false);
  }
  if (form.telpon.value == ""){
    alert("Anda belum mengisikan Telpon.");
    form.telpon.focus();
    return (false);
  }
  if (form.email.value == ""){
    alert("Anda belum mengisikan Email.");
    form.email.focus();
    return (false);
  }
  if (form.kota.value == 0){
    alert("Anda belum mengisikan Kota.");
    form.kota.focus();
    return (false);
  }
  if (form.kode.value == ""){
    alert("Anda belum mengisikan Kode.");
    form.kode.focus();
    return (false);
  }
  return (true);
}

function validasi2(form2){
  if (form2.email.value == ""){
    alert("Anda belum mengisikan Email.");
    form2.email.focus();
    return (false);
  }
  if (form2.password.value == ""){
    alert("Anda belum mengisikan Password.");
    form2.password.focus();
    return (false);
  }
  return (true);
}

function harusangka(jumlah){
  var karakter = (jumlah.which) ? jumlah.which : event.keyCode
  if (karakter > 31 && (karakter < 48 || karakter > 57))
    return false;
  return true;
}
</script>

<?php
require_once 'config/library.php';
// Halaman utama (Home)
if ($_GET['module']=='home'){
		include "content.php";  
}
// <epi>
// Modul member 
elseif ($_GET['module']=='member'){
  include "member.php";   
}
// Modul sewa 
elseif ($_GET['module']=='membersewa'){
  include "membersewa.php";   
}
// modul  member login 
elseif ($_GET['module']=='memberlogin'){
  include "memberlogin.php";   
}
// modul  member login 
elseif ($_GET['module']=='memberdaftar'){
  include "memberdaftar.php";   
}

// Modul detail produk
elseif ($_GET['module']=='detailproduk'){
 include "detailproduk.php";   
                          
}


// Modul produk per kategori
elseif ($_GET['module']=='detailkategori'){
    include "category.php";
}

// Menu utama di header

// Modul profil
elseif ($_GET['module']=='profilkami'){
 include "profil.php";                                 
}


// Modul cara pembelian
elseif ($_GET['module']=='carabeli'){
include "caraorder.php";                                
}


// Modul semua produk
elseif ($_GET['module']=='semuaproduk'){
include "product.php";
  
}

// Modul hubungi kami
elseif ($_GET['module']=='hubungikami'){
  include "contact-us.php";                            
}

// Modul hubungi aksi
elseif ($_GET['module']=='hubungiaksi'){
	echo "<div class='container'>

			<!-- Single -->
			<section class='blog'>

				<div class='row'>";
$nama=trim($_POST['nama']);
$email=trim($_POST['email']);
$subjek=trim($_POST['subjek']);
$pesan=trim($_POST['pesan']);

if (empty($nama)){
  echo "Anda belum mengisikan NAMA<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b>";
}
elseif (empty($email)){
  echo "Anda belum mengisikan EMAIL<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b>";
}
elseif (empty($subjek)){
  echo "Anda belum mengisikan SUBJEK<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b>";
}
elseif (empty($pesan)){
  echo "Anda belum mengisikan PESAN<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b>";
}
else{
	if(!empty($_POST['kode'])){
		if($_POST['kode']==$_SESSION['captcha_session']){

  mysqli_query($con,"INSERT INTO hubungi(nama,
                                   email,
                                   subjek,
                                   pesan,
                                   tanggal) 
                        VALUES('$_POST[nama]',
                               '$_POST[email]',
                               '$_POST[subjek]',
                               '$_POST[pesan]',
                               '$tgl_sekarang')");

  echo "Terimakasih
             
              <br />Terimakasih telah menghubungi kami.<br /><br /> Kami akan segera membalasnya ke email Anda.
               
          </div>
           </section>
          </div>";
		}else{
			echo "Kode yang Anda masukkan tidak cocok<br />
			      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
		}
	}else{
		echo "Anda belum memasukkan kode<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
	}
}                              
}


// Modul hasil pencarian produk 
elseif ($_GET['module']=='hasilcari'){
	
  include "cariproduk.php";
  
}


// Modul download katalog
elseif ($_GET['module']=='downloadkatalog'){
 echo "<div class='container'>

			<!-- Single -->
			<section class='blog'>

				<div class='row'>Download Katalog";
  // Tampilkan daftar katalog download
 	$sql = mysqli_query($con,"SELECT * FROM download ORDER BY id_download DESC");		 

  echo "<br /><br /><ul>";   
   while($d=mysqli_fetch_array($sql)){
      echo "<li><a href='downlot.php?file=$d[nama_file]'>$d[judul]</a></li>";
	 }
  echo "</ul><br />
  </div>
  </section>
  </div>";	
}

// Modul keranjang belanja
elseif ($_GET['module']=='keranjangbelanja'){
  include "cart.php";
}
// Modul selesai belanja
elseif ($_GET['module']=='selesaibelanja'){
 include "checkout.php";
}      


// Modul lupa password
elseif ($_GET['module']=='lupapassword'){
  echo "<div class='center_title_bar'>Lupa Password</div>";
    	  echo "<div class='prod_box_big'>
        	<div class='top_prod_box_big'></div>
        <div class='center_prod_box_big'>            
          <div class='details_big_cari'>
              <div>
      <form name=form3 action=kirim-password.html method=POST>
      <table>
      <tr><td>Masukkan Email Anda</td><td> : <input type=text name=email size=30></td></tr>
      <tr><td colspan=2><input type='submit' class='button' value='Kirim'></td></td></tr>
      </table>
      </form>
              </div>
          </div>    
          </div>
            <div class='bottom_prod_box_big'></div>
          </div>";                      
}


// Modul kirim password
elseif ($_GET['module']=='kirimpassword'){

// Cek email kustomer di database
$cek_email=mysqli_num_rows(mysqli_query($con,"SELECT email FROM kustomer WHERE email='$_POST[email]'"));
// Kalau email tidak ditemukan
if ($cek_email == 0){
  echo "Email <b>$_POST[email]</b> tidak terdaftar di database kami.<br />
        <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
}
else{

$password_baru = substr(md5(uniqid(rand(),1)),3,10);

// ganti password kustomer dengan password yang baru (reset password)
$query=mysqli_query($con,"update kustomer set password=md5('$password_baru') where email='$_POST[email]'");

// dapatkan email_pengelola dari database
$sql2 = mysqli_query($con,"select email_pengelola from modul where id_modul='43'");
$j2   = mysqli_fetch_array($sql2);

$subjek="Password Baru";
$pesan="Password Anda yang baru adalah <b>$password_baru</b>";
// Kirim email dalam format HTML
$dari = "From: $j2[email_pengelola]\r\n";
$dari .= "Content-type: text/html\r\n";

// Kirim password ke email kustomer
mail($_POST[email],$subjek,$pesan,$dari);

  echo "<div class='container'>
  <div class='control-group'>
<label class='control-label' for='inputEmail'> Password Sudah Terkirim</label>
                  <br />Silahkan cek email Anda.
              </div> </div>
          ";
}                              
}


// Modul simpan transaksi
elseif ($_GET['module']=='simpantransaksi'){
  $kar1=strstr($_POST['email'], "@");
  $kar2=strstr($_POST['email'], ".");

// Cek email kustomer di database
$cek_email=mysqli_num_rows(mysqli_query($con,"SELECT email FROM kustomer WHERE email='$_POST[email]'"));
// Kalau email sudah ada yang pakai
if ($cek_email > 0){
  echo "Email <b>$_POST[email]</b> sudah ada yang pakai.<br />
        <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
}elseif (empty($_POST['nama']) || empty($_POST['password']) || empty($_POST['alamat']) || empty($_POST['telpon']) || empty($_POST['email']) || empty($_POST['kota']) || empty($_POST['kode'])){
  echo "Data yang Anda isikan belum lengkap<br />
  	    <a href='selesai-belanja.html'><b>Ulangi Lagi</b>";
}
// elseif (!ereg("[a-z|A-Z]",$_POST['nama'])){
//   echo "Nama tidak boleh diisi dengan angka atau simbol.<br />
//  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
// }
elseif (strlen($kar1)==0 OR strlen($kar2)==0){
  echo "Alamat email Anda tidak valid, mungkin kurang tanda titik (.) atau tanda @.<br />
 	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
}
else{

// fungsi untuk mendapatkan isi keranjang belanja
// function isi_keranjang(){
// 	$isikeranjang = array();
// 	$sid = session_id();
// 	$sql = mysqli_query($con,"SELECT * FROM orders_temp WHERE id_session='$sid'");
	
// 	while ($r=mysqli_fetch_array($sql)) {
// 		$isikeranjang[] = $r;
// 	}
// 	return $isikeranjang;
// }

$tgl_skrg = date("Ymd");
$jam_skrg = date("H:i:s");

if(!empty($_POST['kode'])){
  if($_POST['kode']==$_SESSION['captcha_session']){

function antiinjection($data){
  // $filter_sql = mysqli_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  $filter_sql = stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES)));
  return $filter_sql;
}

$nama   = antiinjection($_POST['nama']);
$alamat = antiinjection($_POST['alamat']);
$telpon = antiinjection($_POST['telpon']);
$email = antiinjection($_POST['email']);
$password=md5($_POST['password']);

// simpan data kustomer
$s="INSERT INTO kustomer(nama_lengkap, password, alamat, telpon, email, id_kota) 
           VALUES('$nama','$password','$alamat','$telpon','$email','$_POST[kota]')"; 
// vd($s);
mysqli_query($con,$s);

// mendapatkan nomor kustomer
$id_kustomer=mysqli_insert_id($con);

// simpan data pemesanan 
mysqli_query($con,"INSERT INTO orders(tgl_order,jam_order,id_kustomer) VALUES('$tgl_skrg','$jam_skrg','$id_kustomer')");
  
// mendapatkan nomor orders
$id_orders=mysqli_insert_id($con);

// panggil fungsi isi_keranjang dan hitung jumlah produk yang dipesan
$isikeranjang = isi_keranjang();
$jml          = count($isikeranjang);

// simpan data detail pemesanan  
for ($i = 0; $i < $jml; $i++){
  mysqli_query($con,"INSERT INTO orders_detail(id_orders, id_produk, jumlah) 
               VALUES('$id_orders',{$isikeranjang[$i]['id_produk']}, {$isikeranjang[$i]['jumlah']})");
}
  
// setelah data pemesanan tersimpan, hapus data pemesanan di tabel pemesanan sementara (orders_temp)
for ($i = 0; $i < $jml; $i++) {
  mysqli_query($con,"DELETE FROM orders_temp
	  	         WHERE id_orders_temp = {$isikeranjang[$i]['id_orders_temp']}");
}

  echo "<div class='container'>
 
  <section class='order'>

				<div class='row standard'>
					<header class='span12 prime'>
						<h3>Data Pesanan Anda :</h3>
					</header>
				</div>
<h5>Data pemesan beserta ordernya adalah sebagai berikut: </h5>
<p>Nama Lengkap : <b>$nama</b></p>
					<p>	Alamat Lengkap : $alamat</p>
						<p>Telpon	: $telpon</p>
						<p>E-mail	: $email</p>
					<p>	Nomor Order: <b>$id_orders</b></p>
  <div class='row cart'>
					<div class='span12'>
						<div class='wrap-table'>";

      $daftarproduk=mysqli_query($con,"SELECT * FROM orders_detail,produk 
                                 WHERE orders_detail.id_produk=produk.id_produk 
                                 AND id_orders='$id_orders'");

echo "<table class='table'>
									<thead>
										<tr>
      <td width='70%'>Item</td>
											<td width='10%'>Price</td>
											<td width='10%'>Quantity</td>
											<td width='10%'>Total</td>
										</tr>
									</thead>";
      
      
$pesan="Terimakasih telah melakukan pemesanan online di toko online kami <br /><br />  
        Nama: $nama <br />
        Password: $_POST[password]<br />
        Alamat: $alamat <br/>
        Telpon: $telpon <br /><hr />
        
        Nomor Order: $id_orders <br />
        Data order Anda adalah sebagai berikut: <br /><br />";
        
$no=1;
$total=$totalberat =$subtotalberat =0;
while ($d=mysqli_fetch_array($daftarproduk)){
   $disc        = ($d['diskon']/100)*$d['harga'];
   $hargadisc   = number_format(($d['harga']-$disc),0,",","."); 
   $subtotal    = ($d['harga']-$disc) * $d['jumlah'];

   $subtotalberat = $d['berat'] * $d['jumlah']; // total berat per item produk 
   $totalberat  = $totalberat + $subtotalberat; // grand total berat all produk yang dibeli

   $total       = $total + $subtotal;
   $subtotal_rp = format_rupiah($subtotal);    
   $total_rp    = format_rupiah($total);    
   $harga       = format_rupiah($d['harga']);

  echo "<tbody>
										<tr>
											<td>
												<div class='cart-img pull-left hidden-phone'><img src='foto_produk/$d[gambar]' alt='' /></div>
												<div class='item pull-left'>$d[nama_produk]
												</div>
											</td>
											<td><i>Rp. $hargadisc</i></td>
											 <td>$d[jumlah]</td>
											<td><strong>$subtotal_rp</strong></td>
										</tr>
																		
										<tr>
											<td colspan='3'><div class='item'>Total</div></td>
											<td>Rp. <b>$total_rp</td>
										</tr>
									</tbody>
								</table>";

   $pesan.="$d[jumlah] $d[nama_produk] -> Rp. $harga -> Subtotal: Rp. $subtotal_rp <br />";
   $no++;
}

$ongkos=mysqli_fetch_array(mysqli_query($con,"SELECT ongkos_kirim FROM kota WHERE id_kota='$_POST[kota]'"));
$ongkoskirim1=$ongkos['ongkos_kirim'];
$ongkoskirim = $ongkoskirim1 * $totalberat;

$grandtotal    = $total + $ongkoskirim; 

$ongkoskirim_rp = format_rupiah($ongkoskirim);
$ongkoskirim1_rp = format_rupiah($ongkoskirim1); 
$grandtotal_rp  = format_rupiah($grandtotal);  

// dapatkan email_pengelola dan nomor rekening dari database
$sql2 = mysqli_query($con,"select email_pengelola,nomor_rekening,nomor_hp from profil");
$j2   = mysqli_fetch_array($sql2);

$pesan.="<br /><br />Total : Rp. $total_rp 
         <br />Ongkos Kirim untuk Tujuan Kota Anda : Rp. $ongkoskirim1_rp/Kg 
         <br />Total Berat : $totalberat Kg
         <br />Total Ongkos Kirim  : Rp. $ongkoskirim_rp		 
         <br />Grand Total : Rp. $grandtotal_rp 
         <br /><br />Silahkan lakukan pembayaran sebanyak Grand Total yang tercantum, rekeningnya: $j2[nomor_rekening]
         <br />Apabila sudah transfer, konfirmasi ke nomor: $j2[nomor_hp]";

$subjek="Pemesanan Online";

// Kirim email dalam format HTML
$dari = "From: $j2[email_pengelola]\r\n";
$dari .= "Content-type: text/html\r\n";

// Kirim email ke kustomer
mail($email,$subjek,$pesan,$dari);

// Kirim email ke pengelola toko online
mail("$j2[email_pengelola]",$subjek,$pesan,$dari);

echo "<hr />
       <p>Total Harga : Rp.<b>$total_rp</b> </p>
       <p> Ongkos Kirim untuk Tujuan Kota Anda: Rp. <b>$ongkoskirim1_rp</b>/Kg</p>
       <p> Total Berat : <b>$totalberat Kg</b></p>
       <p> Total Ongkos Kirim : Rp. <b>$ongkoskirim_rp</b></p>
        <p>Grand Total : Rp. <b>$grandtotal_rp</b></p>
      
      <hr /><p>Data order dan nomor rekening transfer sudah terkirim ke email Anda. <br />
               Apabila Anda tidak melakukan pembayaran dalam 3 hari, maka transaksi dianggap batal.</p><br />    
             
         	</div>
					</div>
				</div>

			</section> </div>";                   
}
else{
echo "Kode yang Anda masukkan tidak cocok<br />
<a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
}
}else{
echo "Anda belum memasukkan kode<br />
<a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
}
}
}


// Modul simpan transaksi member (checkout dari shoping_cart)
elseif ($_GET['module']=='simpantransaksimember'){
  $email    = $_POST['email'];
  $password = md5($_POST['password']);
  
  $sql      = "SELECT * FROM	kustomer WHERE email='$email' AND password='$password'";
  $hasil    = mysqli_query($con,$sql);
  $r        = mysqli_fetch_assoc($hasil);

  if(mysqli_num_rows($hasil) == 0){
		 echo "Email atau Password Anda tidak benar<br />";
		 echo "<a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
  }else{
    $tgl_skrg = date("Ymd");
    $jam_skrg = date("H:i:s");

    $sId="SELECT id_kustomer FROM kustomer WHERE email='$email' AND password='$password'";
    $id = mysqli_fetch_assoc(mysqli_query($con,$sId));

    // mendapatkan nomor kustomer
    $id_kustomer=$id['id_kustomer'];
    // simpan data pemesanan
    $sAdd ="INSERT INTO orders(tgl_order,jam_order,id_kustomer) VALUES('$tgl_skrg','$jam_skrg','$id_kustomer')"; 
    $q    =mysqli_query($con,$sAdd);
    // vd($sAdd);
      
    // mendapatkan nomor orders
    $id_orders=mysqli_insert_id($con);

    // panggil fungsi isi_keranjang dan hitung jumlah produk yang dipesan
    $isikeranjang = isi_keranjang();
    // vd($isikeranjang);
    $jml          = count($isikeranjang);

    // vd($isikeranjang[0]['id_produk']);
    // simpan data detail pemesanan  
    for ($i = 0; $i < $jml; $i++){
      mysqli_query($con,"INSERT INTO orders_detail(id_orders, id_produk, jumlah) 
                   VALUES('$id_orders',{$isikeranjang[$i]['id_produk']}, {$isikeranjang[$i]['jumlah']})");
    }
      
    // setelah data pemesanan tersimpan, hapus data pemesanan di tabel pemesanan sementara (orders_temp)
    for ($i = 0; $i < $jml; $i++) {
      mysqli_query($con,"DELETE FROM orders_temp
    	  	         WHERE id_orders_temp = {$isikeranjang[$i]['id_orders_temp']}");
    }

 echo "<div class='container'>
        <section class='order'>
      				<div class='row standard'>
      					<header class='span12 prime'>
      						<h3>Data Pesanan Anda :</h3>
      					</header>
      				</div>
      <h5>Data pemesan beserta ordernya adalah sebagai berikut: </h5>
						
			<p>Nama Lengkap : <b>$r[nama_lengkap]</b></p>
					<p>	Alamat Lengkap : $r[alamat]</p>
						<p>Telpon	: $r[telpon]</p>
						<p>E-mail	: $r[email]</p>
					<p>	Nomor Order: <b>$id_orders</b></p>
				<div class='row cart'>
					<div class='span12'>
						<div class='wrap-table'>";
      $daftarproduk=mysqli_query($con,"SELECT * FROM orders_detail,produk 
                                 WHERE orders_detail.id_produk=produk.id_produk 
                                 AND id_orders='$id_orders'");

echo "<table class='table'>
									<thead>
										<tr>
      <td width='70%'>Item</td>
											<td width='10%'>Price</td>
											<td width='10%'>Quantity</td>
											<td width='10%'>Total</td>
										</tr>
									</thead>";
      
$pesan="Terimakasih telah melakukan pemesanan online di toko online kami <br /><br />  
        Nama: $r[nama_lengkap] <br />
        Alamat: $r[alamat] <br/>
        Telpon: $r[telpon] <br /><hr />
        
        Nomor Order: $id_orders <br />
        Data order Anda adalah sebagai berikut: <br /><br />";
        
$no=1;
$total_rp=$total=$totalberat=0;
while ($d=mysqli_fetch_array($daftarproduk)){
   $disc        = ($d['diskon']/100)*$d['harga'];
   $hargadisc   = number_format(($d['harga']-$disc),0,",","."); 
   $subtotal    = ($d['harga']-$disc) * $d['jumlah'];

   $subtotalberat = $d['berat'] * $d['jumlah']; // total berat per item produk 
   $totalberat  = $totalberat + $subtotalberat; // grand total berat all produk yang dibeli

   $total       = $total + $subtotal;
   $subtotal_rp = format_rupiah($subtotal);    
   $total_rp    = format_rupiah($total);    
   $harga       = format_rupiah($d['harga']);

   echo "<tbody>
										<tr>
											<td>
												<div class='cart-img pull-left hidden-phone'><img src='foto_produk/$d[gambar]' alt='' /></div>
												<div class='item pull-left'>$d[nama_produk]
												</div>
											</td>
											<td><i>Rp. $hargadisc</i></td>
											 <td>$d[jumlah]</td>
											<td><strong>$subtotal_rp</strong></td>
										</tr>
																		
										<tr>
											<td colspan='3'><div class='item'>Total</div></td>
											<td>Rp. <b>$total_rp</td>
										</tr>
									</tbody>
								</table>";

   $pesan.="$d[jumlah] $d[nama_produk] -> Rp. $harga -> Subtotal: Rp. $subtotal_rp <br />";
   $no++;
}

$kota=$r['id_kota'];

$ongkos=mysqli_fetch_array(mysqli_query($con,"SELECT ongkos_kirim FROM kota WHERE id_kota='$kota'"));
$ongkoskirim1    =$ongkos['ongkos_kirim'];
$ongkoskirim     = $ongkoskirim1 * $totalberat;

$grandtotal      = $total + $ongkoskirim; 

// vd($total_rp);
$ongkoskirim_rp  = format_rupiah($ongkoskirim);
$ongkoskirim1_rp = format_rupiah($ongkoskirim1); 
$grandtotal_rp   = format_rupiah($grandtotal);  

// dapatkan email_pengelola dan nomor rekening dari database
$sql2 = mysqli_query($con,"select email_pengelola,nomor_rekening,nomor_hp from profil");
$j2   = mysqli_fetch_array($sql2);
$pesan.="<br /><br />Total : Rp. $total 
         <br />Ongkos Kirim untuk Tujuan Kota Anda : Rp. $ongkoskirim1_rp/Kg 
         <br />Total Berat : $totalberat Kg
         <br />Total Ongkos Kirim  : Rp. $ongkoskirim_rp		 
         <br />Grand Total : Rp. $grandtotal_rp 
         <br /><br />Silahkan lakukan pembayaran sebanyak Grand Total yang tercantum, rekeningnya: $j2[nomor_rekening]
         <br />Apabila sudah transfer, konfirmasi ke nomor: $j2[nomor_hp]";

$subjek="Pemesanan Online";

// Kirim email dalam format HTML
$dari = "From: $j2[email_pengelola]\r\n";
$dari .= "Content-type: text/html\r\n";

// Kirim email ke kustomer
// ini_set();
$m=mail($email,$subjek,$pesan,$dari);
// vd($dari);
// Kirim email ke pengelola toko online
mail("$j2[email_pengelola]",$subjek,$pesan,$dari);

echo "
       <hr />
       <p>Total Harga : Rp.<b>$total_rp</b> </p>
       <p> Ongkos Kirim untuk Tujuan Kota Anda: Rp. <b>$ongkoskirim1_rp</b>/Kg</p>
       <p> Total Berat : <b>$totalberat Kg</b></p>
       <p> Total Ongkos Kirim : Rp. <b>$ongkoskirim_rp</b></p>
        <p>Grand Total : Rp. <b>$grandtotal_rp</b></p>
      
      <hr /><p>Data order dan nomor rekening transfer sudah terkirim ke email Anda. <br />
               Apabila Anda tidak melakukan pembayaran dalam 3 hari, maka transaksi dianggap batal.</p><br />      
             
          	</div>
					</div>
				</div>

			</section> </div>";  
}                    
}
//modul testimoni
elseif ($_GET['module']=='semuatestimoni'){
   include "testimonian.php";                           
}
//testimoni aksi
elseif ($_GET['module']=='testimoniaksi'){
	echo "<div class='container'>

			<!-- Single -->
			<section class='blog'>

				<div class='row'>";
$nama=trim($_POST['nama']);
$pesan=trim($_POST['pesan']);

if (empty($nama)){
  echo "<div class='container'>
			<section class='blog'>
			<div class='row'>
			Anda belum mengisikan NAMA<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b>
  	      </div>
  	      </section>
  	      </div>";
}

elseif (empty($pesan)){
  echo "<div class='container'>
			<section class='blog'>
			<div class='row'>Anda belum mengisikan PESAN<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></div>
  	      </section>
  	      </div>";
}
else{
	if(!empty($_POST['kode'])){
		if($_POST['kode']==$_SESSION['captcha_session']){

  mysqli_query($con,"INSERT INTO testimoni(nama,
                                     isi,
									 aktif,
								   tanggal)
                                   
                        VALUES('$_POST[nama]',
                               '$_POST[pesan]',
							    'Y',
                               '$tgl_sekarang')");

  echo "
					<header class='span12 prime'>Terimakasih Atas Testimonial Anda
              
              <br />Testimonial Anda sangat berarti bagi kami.<br/>
              <h4>Salam </h4>
               <b><i>$bb[nama_toko]</i></b>
              </div>
          </section>    
          </div>
           
          </div>";
		}else{
			echo "Kode yang Anda masukkan tidak cocok<br />
			      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
		}
	}else{
		echo "Anda belum memasukkan kode<br />
  	      <a href=javascript:history.go(-1)><b>Ulangi Lagi</b></a>";
	}
}                              
}
elseif ($_GET['module']=='detailartikel'){
	include "detail-article.php";    
}

// Modul artikel per label
elseif ($_GET['module']=='detaillabel'){
include "detail-label.php";    	          
}

elseif ($_GET['module']=='halamanstatis'){
		  echo "<div id='content'>          
               <div id='content-detail'>";
               
	$detail=mysqli_query($con,"SELECT * FROM halamanstatis 
                      WHERE id_halaman='".$val->validasi($_GET['id'],'sql')."'");
	$d   = mysqli_fetch_array($detail);
  $tgl_posting   = tgl_indo($d[tgl_posting]);
	
  echo "<span class=judul>$d[judul]</span><br />";
  echo "<span class=tanggal>Diposting tanggal: $tgl_posting</span><br /><br />";
  if ($d[gambar]!=''){
		echo "<span class=image><img src='foto_banner/$d[gambar]'></span>";
	}
	echo "$d[isi_halaman] <br />";
            
  echo "</div>
    </div>";            
}

// Modul semua artikel
elseif ($_GET['module']=='semuaartikel'){
 include "article.php";        
}

?>
