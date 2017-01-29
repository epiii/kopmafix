<?php
// session_start();
include "../config/koneksi.php";
include "../config/library.php";
include "../config/fungsi_indotgl.php";
include "../config/fungsi_combobox.php";
include "../config/fungsi_rupiah.php";
echo "
            <!-- Left side column. contains the logo and sidebar -->
            
            <aside class='left-side sidebar-offcanvas'>
                <!-- sidebar: style can be found in sidebar.less -->
                <section class='sidebar'>
                    <!-- Sidebar user panel -->
                    <div class='user-panel'>
                        <div class='pull-left image'>";
                        $staff= $_SESSION['namauser'];                            
$sq1 = mysqli_query($con,"SELECT * from users where username='$staff'");
$n1 = mysqli_fetch_array($sq1);
echo "
                            <img src='../foto_banner/$n1[foto]' class='img-circle' alt='$staff' />
                        </div>
                        <div class='pull-left info'>
                            <p>Hello, $staff</p>";
                            echo "

                            <a href='#'><i class='fa fa-circle text-success'></i> Online</a>
                        </div>
                    </div>";
                   include "content-one.php"; 
                   echo " </section>
                <!-- /.sidebar -->
            </aside>"; 
                   
                   
            
if ($_GET['module']=='home'){
	?>
	 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>
<?php
    if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
      $jam=date("H:i:s");
$tgl=tgl_indo(date("Y m d")); 
	echo "     
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>

                    <!-- Small boxes (Stat box) -->
                    <div class='row'>
                        <div class='col-lg-3 col-xs-6'>
                            <!-- small box -->
                            <div class='small-box bg-aqua'>
                                <div class='inner'>";
                                 $orders = mysqli_query($con,"select count(orders.id_orders) as jmlorder from orders");
  $l1 = mysqli_fetch_array($orders);
  echo "
                                    <h3>
                                         $l1[jmlorder]
                                    </h3>
                                    <p>
                                        Order Baru
                                    </p>
                                </div>
                                <div class='icon'>
                                    <i class='ion ion-bag'></i>
                                </div>
                                <a href='?module=order' class='small-box-footer'>
                                    Lihat Detail <i class='fa fa-arrow-circle-right'></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class='col-lg-3 col-xs-6'>
                            <!-- small box -->
                             <div class='small-box bg-maroon'>
                                <div class='inner'>";
                                 $produk = mysqli_query($con,"select count(produk.id_produk) as jmlproduk from produk");
  $l2 = mysqli_fetch_array($produk);
  echo "
                                    <h3>
                                        $l2[jmlproduk]
                                    </h3>
                                    <p>
                                        Data Produk
                                    </p>
                                </div>
                                <div class='icon'>
                                    <i class='ion ion-ios7-pricetag-outline'></i>
                                </div>
                                <a href='?module=produk' class='small-box-footer'>
                                    Lihat Detail <i class='fa fa-arrow-circle-right'></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class='col-lg-3 col-xs-6'>
                            <!-- small box -->
                            <div class='small-box bg-yellow'>
                                <div class='inner'>";
                                $artikel = mysqli_query($con,"select count(artikel.id_artikel) as jmlartikel from artikel");
  $l3 = mysqli_fetch_array($artikel);
                               
  echo "
                                    <h3>
                                         $l3[jmlartikel]
                                    </h3>
                                    <p>
                                        Artikel
                                    </p>
                                </div>
                                <div class='icon'>
                                    <i class='ion ion-pie-graph'></i>
                                </div>
                                <a href='?module=artikel' class='small-box-footer'>
                                    Lihat Detail <i class='fa fa-arrow-circle-right'></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class='col-lg-3 col-xs-6'>
                            <!-- small box -->
                            <div class='small-box bg-red'>
                                <div class='inner'>";
                                $hubungi = mysqli_query($con,"select count(hubungi.id_hubungi) as jml1 from hubungi");
  $l = mysqli_fetch_array($hubungi);
  echo "
                                    <h3>
                                        $l[jml1]
                                    </h3>
                                    <p>
                                        Hubungi Kami
                                    </p>
                                </div>
                                <div class='icon'>
                                <i class='ion ion-person-add'></i>                                    
                                </div>
                                <a href='?module=hubungi' class='small-box-footer'>
                                    More info <i class='fa fa-arrow-circle-right'></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row -->
<h4 class='page-header'>
                        Hai <b>$_SESSION[namalengkap]</b>, Welcome to Administrator Page
                        <small>Silahkan menggunakan menu di sebelah kiri untuk mengelola konten website</small>
                    </h4>
                    

                            
                    <!-- Main row -->
                    <div class='row'>
                        <!-- Left col -->
                        <section class='col-lg-7 connectedSortable'>                            


                            <!-- Custom tabs (Charts with tabs)-->
                           
                           <!-- /.nav-tabs-custom -->

                            <!-- Chat box -->
                            
                                       <!-- end chate -->                                              

                            <!-- TO DO List -->
                            

                        </section><!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <!-- sing tengen -->
                        <section class='col-lg-5 connectedSortable'> 

                            <!-- Map box -->
                            
                            <!-- /.box -->

                            <!-- solid sales graph -->
                           <!-- /.box -->                            

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->

            </aside>
            
            <!-- /.right-side -->";
}
}
// Bagian Modul
elseif ($_GET['module']=='modul'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_modul/modul.php";
  }
}
// Bagian User - admin
elseif ($_GET['module']=='admin'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_admin/admins.php";
  }
}
// Bagian fakkultas
elseif ($_GET['module']=='admin'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_fakultas/fakultas.php";
  }
}
// Bagian jurusan
elseif ($_GET['module']=='admin'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_jurusan/jurusan.php";
  }
}
// Bagian User - member
elseif ($_GET['module']=='member'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user')
    include "modul/mod_member/member.php";
  else 
    include "logout.php";
}
// // Bagian User
// elseif ($_GET['module']=='user'){
//   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
//     include "modul/mod_users/users.php";
//   }
// }
 
elseif ($_GET['module']=='jurusan'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_jurusan/jurusan.php";
  }
}  
elseif ($_GET['module']=='fakultas'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_fakultas/fakultas.php";
  }
}  
elseif ($_GET['module']=='artikel'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_artikel/artikel.php";
  }
}  
elseif ($_GET['module']=='label'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_label/label.php";
  }
}      
elseif ($_GET['module']=='produk'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_produk/produk.php";
  }
}
elseif ($_GET['module']=='produksewa'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_produksewa/produksewa.php";
  }
}

// Bagian label Produk
elseif ($_GET['module']=='kategori'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_kategori/kategori.php";
  }
}  
// Bagian Order
elseif ($_GET['module']=='order'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_order/order.php";
  }
}

// Bagian Profil
elseif ($_GET['module']=='profil'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_profil/profil.php";
  }
}

// Bagian Order
elseif ($_GET['module']=='hubungi'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_hubungi/hubungi.php";
  }
}

// Bagian Cara Pembelian
elseif ($_GET['module']=='carabeli'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_carabeli/carabeli.php";
  }
}

// Bagian Banner
elseif ($_GET['module']=='banner'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_banner/banner.php";
  }
}

// Bagian Kota/Ongkos Kirim
elseif ($_GET['module']=='ongkoskirim'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_ongkoskirim/ongkoskirim.php";
  }
}

// Bagian Password
elseif ($_GET['module']=='password'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_password/password.php";
  }
}

// Bagian Laporan
elseif ($_GET['module']=='laporan'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_laporan/laporan.php";
  }
}
// Bagian data  sewa
elseif ($_GET['module']=='sewa'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_sewa/sewa.php";
  }
}
// Bagian Laporan sewa
elseif ($_GET['module']=='laporansewa'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_laporansewa/laporansewa.php";
  }
}

//bagian testimoni
elseif ($_GET['module']=='testimoni'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_testimoni/testimoni.php";
  }
}

// Modul bank
elseif ($_GET['module']=='bank'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_bank/bank.php";
  }
}

// Bagian Download
elseif ($_GET['module']=='download'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_download/download.php";
  }
}
// Bagian Download
elseif ($_GET['module']=='kontak'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_kontak/kontak.php";
  }
}

// Bagian Menu Utama
elseif ($_GET['module']=='menuutama'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_menuutama/menuutama.php";
  }
}

// Bagian Sub Menu
elseif ($_GET['module']=='submenu'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_submenu/submenu.php";
  }
}

// Bagian Download
elseif ($_GET['module']=='fb'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_fb/fb.php";
  }
}
elseif ($_GET['module']=='tag'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_tag/tag.php";
  }
}
elseif ($_GET['module']=='katajelek'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_katajelek/katajelek.php";
  }
}
elseif ($_GET['module']=='komentar'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_komentar/komentar.php";
  }
}
elseif ($_GET['module']=='header'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_header/header.php";
  }
}
elseif ($_GET['module']=='laporan'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_laporan/laporan.php";
  }
}
else{
  echo "<p><b>MODUL Tidak DITEMUKAN</b></p>";
}		

?>   
