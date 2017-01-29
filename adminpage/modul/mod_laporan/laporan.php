<?php
// session_start();
 if (empty($_SESSION['leveluser'])){ 
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
   echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Order</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Order</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>
  
 <div class='box-header'>
  <h3 class='box-title'>
   <a class='btn btn-info btn-sm' onclick=\"window.location.href='modul/mod_laporan/pdf_toko_sekarang.php';\">
										<i class='fa fa-plus-square'></i>  
										Laporan                                            
									</a> </h3>
         
<h3 class='box-title'>

</h3>
                                </div><!-- /.box-header -->
          <form method=POST action='modul/mod_laporan/pdf_toko.php'>
      <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
          <tr><td colspan=2><b>Laporan Per Periode</b></td></tr>
          <tr><td>Dari Tanggal</td><td> : ";        
          combotgl(1,31,'tgl_mulai',$tgl_skrg);
          combonamabln(1,12,'bln_mulai',$bln_sekarang);
          combothn(2000,$thn_sekarang,'thn_mulai',$thn_sekarang);

    echo "</td></tr>
          <tr><td>s/d Tanggal</td><td> : ";
          combotgl(1,31,'tgl_selesai',$tgl_skrg);
          combonamabln(1,12,'bln_selesai',$bln_sekarang);
          combothn(2000,$thn_sekarang,'thn_selesai',$thn_sekarang);

    echo "</td></tr>
          <tr><td colspan=2><input type=submit class='btn btn-primary btn-sm' value=Report></td></tr>
          </table>
          </form>
          </div><!-- /.box-body -->
 </div>
                    </div>

                </section>
                <!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->";
}
?>
