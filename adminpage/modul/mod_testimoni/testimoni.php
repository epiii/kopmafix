<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_testimoni/aksi_testimoni.php";
echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Testimoni
                        <small>Produk</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Testimoni Produk</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=isset($_GET['act'])?$_GET['act']:'act';
switch($act){
  default:
    echo " <div class='box-header'>
<h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambah testimoni' 
          onclick=\"window.location.href='?module=testimoni&act=tambahtestimoni';\">
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
          <tr><th>No</th><th>Nama</th><th>Aktif<th>Aksi</th></tr>
          </thead><tbody>"; 
    $tampil=mysqli_query($con,"SELECT * FROM testimoni ORDER BY id_testi DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
    
       echo "<tr><td>$no</td>
             <td>$r[nama]</td>
            
			 <td>$r[aktif]</td>
			 <td class='center'>
		         <a class='btn btn-info' href='?module=testimoni&act=edittestimoni&id=$r[id_testi]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=testimoni&act=hapus&id=$r[id_testi]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</tbody></table>";
    break;
  
  // Form Tambah testimoni
  case "tambahtestimoni":
    echo "<section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Testimoni</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=testimoni&act=input'>
          <div class='form-group'>
                                            <label>Nama testimoni</label>
                                            <input type='text' class='form-control' name='nama' placeholder='Nama Anda ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Isi</label>
                                            <input type='text' class='form-control' name='isi' placeholder='Isi Testimoni ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Status</label>
                                            <select name='aktif' class='form-control'>                                            
                                                <option value=0>- Pilih Kategori -</option>
                                                <option value='Y'>Y</option>		 
		   <option value='N'>N</option>
								  </select> </div>
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
  
  // Form Edit testimoni
  case "edittestimoni":
    $edit=mysqli_query($con,"SELECT * FROM testimoni WHERE id_testi='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Testimoni</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action=$aksi?module=testimoni&act=update>
          <input type=hidden name=id value='$r[id_testi]'>
          <div class='form-group'>
                                            <label>Nama testimoni</label>
                                            <input type='text' class='form-control' name='nama' value='$r[nama]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>NIsi</label>
                                            <input type='text' class='form-control' name='isi' value='$r[isi]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Status</label>
                                            <select name='aktif' class='form-control'>
                                                <option ".($r['aktif']=='Y'?'selected':'')." value='Y'>Y</option>        
                                                <option ".($r['aktif']=='N'?'selected':'')." value='N'>N</option>		 
                                            </select> </div>
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
    // }
}
?>
