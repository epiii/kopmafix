<?php
session_start();
include "../config/koneksi.php";
// include "../config/library.php";
include "timeout.php";
// vd($_SESSION['login']);
// exit();
//error_reporting(0);
if($_SESSION['login']==1){
	if(!cek_login()){
		$_SESSION['login'] = 0;
	}
}
if($_SESSION['login']==0){
  header('location:logout.php');
}
else{
if (empty($_SESSION['username']) AND empty($_SESSION['passuser']) AND $_SESSION['login']==0){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=index.php><b>LOGIN</b></a></center>";
}
else{
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Page</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

    </head>
   <body style="min-height: 329px;" class="skin-blue  pace-done fixed"><div class="pace  pace-inactive"><div data-progress="99" data-progress-text="100%" style="width: 100%;" class="pace-progress">
  <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Unit Usaha Kopma
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                         <!-- Messages: style can be found in dropdown.less-->
                        <li class='dropdown messages-menu'>
                            <a href='#' class='dropdown-toggle' data-toggle='dropdown'>
                                <i class='fa fa-envelope'></i>
                                <?php
$hub = mysqli_query($con,"select count(hubungi.id_hubungi) as baru from hubungi where dibuka='1'");
  $bk = mysqli_fetch_array($hub);
  echo "
                                <span class='label label-success'>$bk[baru]</span>
                            </a>
                            <ul class='dropdown-menu'>
                                <li class='header'>Anda Memiliki $bk[baru] pesan baru</li>
                                <li>                                
                                    <!-- inner menu: contains the actual data -->
                                    <ul class='menu'>";
                                    $hub1 = mysqli_query($con,"select * from hubungi where dibuka='1'");
                                 while ($bk2=mysqli_fetch_array($hub1)){
                                echo "
                                        <li>
                                            <a href='?module=hubungi&act=balasemail&id=$bk2[id_hubungi]>$bk2[email]'>
                                                <div class='pull-left'>
                                                    <img src='img/avatar3.png' class='img-circle' alt='User Image'/>
                                                </div>
                                                <h4>
                                                    $bk2[nama]
                                                    <small><i class='fa fa-clock-o'></i> $bk2[tanggal]</small>
                                                </h4>
                                                <p>$bk2[subjek]</p>
                                            </a>
                                        </li>";
                                      }
                                      ?>
                                     </ul> 
                                                          
                                      <li class='footer'><a href='?module=hubungi'>Lihat semua pesan</a></li>
                            </ul>
                        </li>
                         <li class="dropdown tasks-menu">
                            <a href="?module=hubungi" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <?php
$ord = mysqli_query($con,"select count(orders.id_orders) as jmlorder from orders where status_order='Baru'");
  $od = mysqli_fetch_array($ord);
  echo "
                                <span class='label label-danger'>$od[jmlorder]</span>
                            </a>
                            <ul class='dropdown-menu'>
                                <li class='header'>Anda Memiliki $od[jmlorder] Order Baru</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class='menu'>
                                    <!-- Task item -->";
                                    $detod = mysqli_query($con,"select * from orders where status_order='Baru'");
  while ($od = mysqli_fetch_array($detod)){
  	$kost = mysqli_query($con,"select * from kustomer where id_kustomer='$od[id_kustomer]'");
  $p = mysqli_fetch_array($kost);
  	echo "<li>
                                            <a href='?module=order&act=detailorder&id=$od[id_orders]'>
                                                <h3>
                                                    Order dari $p[nama_lengkap]
                                                    <small class='pull-right'>$od[tgl_order]</small>
                                                </h3>
                                                <div class='progress xs'>
                                                    <div class='progress-bar progress-bar-aqua' style='width: 20%' role='progressbar' aria-valuenow='20' aria-valuemin='0' aria-valuemax='100'>
                                                        <span class='sr-only'>0% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>";
                                      }
                                      ?>
                                        <!-- end task item -->
                                    	
                                        
                                       
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="?module=order">Lihat Semua Order</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <?php
                                	echo "
                        <li class='dropdown user user-menu'>
                            <a href='#' class='dropdown-toggle' data-toggle='dropdown'>
                                <i class='glyphicon glyphicon-user'></i>
                                <span>$_SESSION[namalengkap] <i class='caret'></i></span>
                            </a>
                            <ul class='dropdown-menu'>
                                <!-- User image -->";                               
                               $staff= $_SESSION['namauser'];                            
$sq1 = mysqli_query($con,"SELECT * from users where username='$staff'");
$n1 = mysqli_fetch_array($sq1);
                                echo "
                                <li class='user-header bg-light-blue'>
                                    <img src='../foto_banner/$n1[foto]' class='img-circle' alt='User Image' />
                                    <p>
                                        $staff - $_SESSION[namalengkap]
                                        <small>$staff Member since Nov. 2012</small>
                                    </p>
                                </li>";
                                ?>
                                <!-- Menu Body -->
                                
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="?module=user" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout.php" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left"> 
       <?php include "content.php"; ?>
      </div>
     
        <!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- 
        jQuery 2.0.2 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
       
      
<script src="js/highcharts.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- datepicker -->
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        
       
        <!-- DATA TABES SCRIPT -->
        <script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        
        <!-- AdminLTE for demo purposes -->

        <!-- page script -->
        <!-- CK Editor -->
        <script src="js/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        
        
        <script type="text/javascript">
            $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
 <script type="text/javascript">
            $(function() {
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('editor1');
                //bootstrap WYSIHTML5 - text editor
                $(".textarea").wysihtml5();
            });
        </script>
       
    </body>
    
</html>
<?php
}
}
?>