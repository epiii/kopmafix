<?php 
  // //error_reporting(0);
  session_start();	
  include "config/koneksi.php";
	include "config/fungsi_indotgl.php";
	include "config/class_paging.php";
	include "config/fungsi_combobox.php";
	include "config/library.php";
  include "config/fungsi_autolink.php";
  include "config/fungsi_badword.php";
  include "config/fungsi_kalender.php";
  include "config/fungsi_rupiah.php";
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php include "dina_titel.php"; ?></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		
		<!-- Metatag -->
		<meta property="og:title" content="<?php include "dina_meta1.php"; ?>" />
		<meta name="keywords" content="<?php include "dina_meta2.php"; ?>">
		<meta property="og:type" content="website" />
		<meta property="og:description" content="<?php include "dina_meta1.php"; ?>" />
		
		
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<!-- 
		<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
		-->
		<link href="css/datepicker3.css" rel="stylesheet" type="text/css" /> 
		<link rel="stylesheet" href="css/font.css" />
		<link rel="stylesheet" href="css/style.css" />
		
		<!-- Favicon -->
		<link rel="icon" href="favicon.ico">
	
		
		<!-- =========== -->
		<!-- Google Font -->
		<!-- =========== -->
<!--         <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <script src="js/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
 -->
		<script type="text/javascript">
		
			// Add Google Font name here
			
			WebFontConfig = { google: { families: [ 'Bangers', 'Lato' ] } };
			(function() {
			var wf = document.createElement('script');
			wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
			'://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
			wf.type = 'text/javascript';
			wf.async = 'true';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(wf, s);
			})();
			// var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
			// $.fn.bootstrapDP = datepicker;                 // give $().bootstrapDP the bootstrap-datepicker functionality
		</script>

		<style type="text/css">
		
			/* Add Google Font name here */

			.wf-active {font-family: 'Lato',serif; font-size: 14px;}
			.wf-active .logo {font-family: 'Bangers', serif;}
			
		</style>
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--[if IE 7]>
			<link rel="stylesheet" href="css/ie7.css" />
		<![endif]-->
		
	</head>

	<body class="wf-active">	
		
		<!-- =========== -->
		<!-- Top section -->
		<!-- =========== -->
		
		<div class="header-container">
		<div class="container welcome">
			<div class="row-fluid">
				<div class="pull-left greet">
					<?php
						$welcome=mysqli_query($con,"SELECT * FROM profil");
						$bb=mysqli_fetch_assoc($welcome);
						// vd($bb['nama_toko']);
						// $welcome=mysql_query("SELECT * FROM profil");
						// $bb=mysql_fetch_array($welcome);
						// var_dump($bb);exit();
						echo "Selamat Datang di $bb[nama_toko]";
					?>
				</div>
				<div class="pull-right cart tright">
					
					<!-- Cart Updates -->
					<div class="counter">
						<a href="javascript:void(0);"><?php require_once "item.php";?></a>
							
					</div>
					
					<!-- Bubble Cart Item -->
					<div class="cartbubble">
				
						<div class="arrow-box">							
							<!-- Item 1 -->
							<?php
	$sid2 = session_id();
	$sql1 = mysqli_query($con,"SELECT id_produk FROM orders_temp WHERE id_session='$sid2'");
	while($rx=mysqli_fetch_array($sql1)){
		$pr=$rx['id_produk'];
	$sql2 = mysqli_query($con,"SELECT * FROM produk WHERE id_produk=$pr");                           
	
	while($rr=mysqli_fetch_array($sql2)){
						echo "	<div class='clearfix'>
								<a href='#'>$rr[nama_produk]</a> <span class='theme pull-right'>Rp.$rr[harga]</span>
								</div>
							";
							}
						}
							echo "<hr /><div class='clearfix'>
								TOTAL <span class='theme pull-right'>Rp. $total_rp</span>
							</div>";
							?>
							<hr />
							<div class="clearfix">
								<a href="javascript:void(0)" id="closeit">Tutup</a>
								<a href="selesai-belanja.html" class="btn theme btn-mini pull-right">Bayar</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>	
		</div>

		<!-- ================ -->
		<!-- Branding section -->
		<!-- ================ -->
		
		<div class="container head">
			<div class="row">
				<div class="span12 clearfix">
					<div class="top row">
						
						<div class="span8 logo text" style="display:none"><a href="index.php">Sistem Informasi Unit Usaha Kopma Unesa</a></div>
						<div class="span8 logo image">
							<?php

echo "<a href='index.php'><img src='foto_banner/$bb[gambar]' alt='$bb[nama_toko]' /></a>";

?>
</div>
						
						<div class="cart span4">
							<form action="hasil-pencarian.html" method="POST" class="topsearch">
								<input type="search" name="kata" class="top-search" placeholder="Search"/>
								<button type="submit"><i class="icon-search"></i></button>
							</form>
						</div>
						
					</div>	
				</div>
			</div>
		</div>
		
		<!-- ================ -->
		<!-- Main Nav section -->
		<!-- ================ -->
		
		<div class="container-menu">
		<div class="container">
			<div class="row">		
				<div class="span12">
					<nav class="horizontal-nav full-width">
						<ul class="nav" id="nav">
								<li>
								<a href="index.php">Beranda</a>								
							</li>
								<li>
								<a href="semua-produk.html">Product</a>
									<ul class="nav" id="nav">
										<?php
								 $kategori=mysqli_query($con,"select * FROM kategori ORDER BY id_kategori");
                        while($kk=mysqli_fetch_array($kategori)){
                        echo "<li><a href='kategori-$kk[id_kategori]-$kk[kategori_seo].html'>$kk[nama_kategori]</a></li>";
                        
                      }
                      ?>	
                      </ul>
							</li>
							<li>
								<a href="semua-artikel.html">Artikel</a>
									<ul class="nav" id="nav">
										<?php
								 $lbl=mysqli_query($con,"select * FROM label ORDER BY id_label");
                        while($kk=mysqli_fetch_array($lbl)){
                        echo "<li><a href='label-$kk[id_label]-$kk[label_seo].html'>$kk[nama_label]</a></li>";
                       
                      }
                      ?>	
                      </ul>
							</li>
						
						
							
            <?php               
              $main=mysqli_query($con,"SELECT * FROM menuutama WHERE aktif='Y' AND lokasi='Public' order by urutan");

              while($r=mysqli_fetch_array($main)){
	             echo "<li><a href='$r[link]'>$r[nama_menu]</a>";
	             $sub=mysqli_query($con,"SELECT * FROM submenu, menuutama  
                            WHERE submenu.id_main=menuutama.id_main 
                            AND submenu.id_main=$r[id_main] AND submenu.id_submain=0 AND submenu.aktif='Y'");
               $jml=mysqli_num_rows($sub);
                // apabila sub menu ditemukan                
                if ($jml > 0){
                  echo "<div><ul>";                 
	                while($w=mysqli_fetch_array($sub)){
                    echo "<li><a href='$w[link_sub]' class='parent'>&#187; $w[nama_sub]</a>";
            			  $sub2 = mysqli_query($con,"SELECT * FROM submenu WHERE id_submain=$w[id_sub] AND id_submain!=0");
                    $jml2=mysqli_num_rows($sub2);
                    if ($jml2 > 0){
			         			  echo "<div><ul>";
			                 while($s=mysqli_fetch_array($sub2)){
			  	                echo "<li><a href='$s[link_sub]'>&#187; $s[nama_sub]</a></li>";
			                 }
			                echo "</ul></div></li>";
			              }
	                }           
	                
                 echo "</li></ul></div>
                       </li>";
                }
                else{
                  echo "</li>";
                }
              }        
            ?>
		      </ul>
					</nav>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		
		<!-- =========== -->
		<!-- Main Slider -->
		<!-- =========== -->

<?php
include "tengah.php";
?>

				<!-- ====== -->
				<!-- Brands -->
				<!-- ====== -->

				

			
		

		<!-- ============== -->
		<!-- Footer section -->
		<!-- ============== -->
		
		<footer>
			<div class="container">
				<section class="row foot">
					<article class="span3">
						<strong>Testimonial</strong>
						 <MARQUEE onmouseover=this.stop() style="CURSOR:default" 
                       onmouseout=this.start() scrollAmount=1 direction=up loop=true height=180>
      <?php
              $hubungi=mysqli_query($con,"SELECT * FROM testimoni where aktif='Y' ORDER BY id_testi DESC LIMIT 5");
              while($s=mysqli_fetch_array($hubungi)){
                echo "<center><li><b>$s[nama]</b></br><i>
                      $s[isi]</i></center>
					 </li><br />
					 ";
					  
              }
            ?> </MARQUEE> </br>
	</br><a href="semua-testimoni.html"><b><i><u>Tambah testimoni</u></b></i></a>
					</article>
					<article class="span3">
						<strong>Latest Post</strong>
						<ul>
									<?php
							  $artikel=mysqli_query($con,"select * FROM artikel ORDER BY id_artikel DESC LIMIT 3");
            $no=1;
            while($k=mysqli_fetch_array($artikel)){
              
                echo "<li><a href='artikel-$k[id_artikel]-$k[judul_seo].html'>$k[judul]</a><br /><small>posted on $k[tanggal] WIB</small></li>
               ";
              }
              ?>
								
									
								</ul>
						
					</article>
					<article class="span3">
						<strong>Find us ON Facebook</strong>
						<script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) {return;}
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <?php
	$fb = mysqli_query($con,"SELECT * FROM facebook");
	$r      = mysqli_fetch_array($fb);			
	echo "
	
<div class='fb-like-box clearfix' data-href='https://$r[alamat_fb]' data-width='210' data-height='310' data-colorscheme='light' data-show-faces='true' data-stream='false' data-header='false' data-border-color=''>
            	</div>";
?>
					</article>
					<article class="span3">
						<strong>Newsletter</strong>
						<div>
							<form class="form-inline">
							<input class="input-medium" type="text" placeholder="Email address">
							<button class="btn"><i class="icon-direction"></i></button>
							</form>
						</div>
						<?php
						echo "
						<address class='row-fluid'>
							<div class='pull-left clabel'><i class='icon-location'></i></div>
							<div class='pull-left cdata'>$bb[nama_toko]</div>
						</address>
						<address class='row-fluid'>
							<div class='pull-left clabel'><i class='icon-phone'></i></div>
							<div class='pull-left cdata'>$bb[nomor_hp]</div>
						</address>
						<address class='row-fluid'>
							<div class='pull-left clabel'><i class='icon-air'></i></div>
							<div class='pull-left cdata'>PIN BB : $bb[pin_bb]</div>
						</address>
						<address class='row-fluid'>
							<div class='pull-left clabel'><i class='icon-mail'></i></div>
							<div class='pull-left cdata'><a href='#'>$bb[email_pengelola]</a></div>
						</address>
						<address class='row-fluid'>
							<div class='pull-left clabel'><i class='icon-address'></i></div>
							<div class='pull-left cdata'>$bb[alamat]</div>
						</address>";
						?>
							
					</article>
				</section>

			</div>
			<section class="row-fluid doubleline">
					<div class="container">
					<div class="span6">
		
						<div class="payment amex"></div>
						<div class="payment mastercard"></div>
						<div class="payment visa"></div>
						<div class="payment paypal"></div>
						<!-- 
						<div class="payment cirrus"></div>
						<div class="payment delta"></div>
						<div class="payment direct-debit"></div>
						<div class="payment discover"></div>
						<div class="payment ebay"></div>
						<div class="payment googlecheckout"></div>
						<div class="payment maestro"></div>
						<div class="payment moneybookers"></div>
						<div class="payment sagepay"></div>
						<div class="payment solo"></div>
						<div class="payment switch"></div>
						<div class="payment visaelectron"></div>
						<div class="payment 2checkout"></div>
						<div class="payment westernunion"></div> 
						-->
					</div>
				
					</div>
				</section>
		
				<section class="row-fluid social">
					<div class="container">
					<div class="pull-left">&copy; 2016 <?php echo "$bb[nama_toko]" ?></div>
					<div class="pull-right">
						
					</div>
					</div>
				</section>
			
		</footer>
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="js/jquery.tweet.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
	<!--
	<script src="js/datepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	-->

	<script type="text/javascript" src="js/shop.js"></script>
	<script type="text/javascript" src="js/script.js"></script>

	</body>
</html>