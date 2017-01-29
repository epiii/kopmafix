<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
if (empty($_SESSION['namauser'])){
    echo "<link href='style.css' rel='stylesheet' type='text/css'>
    <center>Untuk mengakses modul, Anda harus login <br>";
    echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
    $aksi="modul/mod_ongkoskirim/aksi_ongkoskirim.php";
    echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Ongkos Kirim</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Ongkos Kirim</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";

$act=isset($_GET['act'])?$_GET['act']:'act';
switch($act){
  // Tampil Ongkos Kirim
  default:
    echo "
    <div class='box-header'>
                                    <h3 class='box-title'>
                                     <input type=button class='btn btn-primary btn' value='Tambah Ongkos Kirim' 
          onclick=\"window.location.href='?module=ongkoskirim&act=tambahongkoskirim';\">
                                    </h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                        <tr><th>No</th><th>Nama Kota</th><th>Ongkos Kirim</th><th>Aksi</th></tr></thead><tbody>"; 
    $tampil=mysqli_query($con,"SELECT * FROM kota ORDER BY id_kota DESC");
    $no=1;
    while ($r=mysqli_fetch_assoc($tampil)){
       $ongkos = format_rupiah($r['ongkos_kirim']);
       echo "<tr><td>$no</td>
             <td>$r[nama_kota]</td>
             <td align=right>$ongkos</td>
             <td class='center'>
		         <a class='btn btn-info' href='?module=ongkoskirim&act=editongkoskirim&id=$r[id_kota]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=ongkoskirim&act=hapus&id=$r[id_kota]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</tbody></table>";
    break;
  
  // Form Tambah Ongkos Kirim
  case "tambahongkoskirim":
    echo "
    <section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Produk</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
     <form method=POST action='$aksi?module=ongkoskirim&act=input'>
     <div class='form-group'>
                                            <label>Nama Kota</label>
                                            <input type='text' class='form-control' name='nama_kota' placeholder='Nama Kota ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Ongkos Kirim</label>
                                            <input type='text' class='form-control' name='ongkos_kirim' placeholder='Ongkos Kirim ...'/>
                                        </div>
                                        <div class='form-group'>
                                        <input type=submit class='btn btn-primary btn-lg' value=Simpan>
                            <input type=button class='btn btn-warning btn-lg' value=Batal onclick=self.history.back()>
                            </div>
                                    </form>
                                </div>
                            </div><!-- /.box -->

                            
                        </div><!-- /.col-->
                    </div><!-- ./row -->
                                    </section>
    
          ";
    
   
     break;
  
  // Form Edit Ongkos Kirim
  case "editongkoskirim":
    $edit=mysqli_query($con,"SELECT * FROM kota WHERE id_kota='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Produk</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
    <form method=POST action=$aksi?module=ongkoskirim&act=update>
          <input type=hidden name=id value='$r[id_kota]'>
     <div class='form-group'>
                                            <label>Nama Kota</label>
                                            <input type='text' class='form-control' name='nama_kota' value='$r[nama_kota]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Ongkos Kirim</label>
                                            <input type='text' class='form-control' name='ongkos_kirim' value='$r[ongkos_kirim]'/>
                                        </div>
                                        <div class='form-group'>
                                        <input type=submit class='btn btn-primary btn-lg' value=Simpan>
                            <input type=button class='btn btn-warning btn-lg' value=Batal onclick=self.history.back()>
                            </div>
                                    </form>
                                </div>
                            </div><!-- /.box -->

                            
                        </div><!-- /.col-->
                    </div><!-- ./row -->
                                    </section>";
    break;  
}
}
echo "</div><!-- /.box-body -->
 </div>
                    </div>

                </section>
                <!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->";
?>
