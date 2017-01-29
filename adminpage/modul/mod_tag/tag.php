<?php
// session_start();
if (empty($_SESSION['namauser'])){
    echo "<link href='style.css' rel='stylesheet' type='text/css'>
    <center>Untuk mengakses modul, Anda harus login <br>";
    echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
    $aksi="modul/mod_tag/aksi_tag.php";
    echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Banner Iklan</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Banner Iklan</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Tag
  default:
// <input type=button class='btn btn-primary btn' value='Tambah Banner' onclick=location.href=\"window.location.href='?module=tag&act=tambahtag';\">
    echo "
    <div class='box-header'>
                                    <h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambah Banner'
onclick=\"window.location.href='?module=tag&act=tambahtag';\">
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                        <tr><th>no</th><th>Nama Tag</th><th>aksi</th></tr>
                                        </thead><tbody>";
    
  
    $tampil=mysqli_query($con,"SELECT * FROM tag ORDER BY id_tag DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
       echo "<tr><td>$no</td>
                <td>$r[nama_tag]</td>                
                <td class='center'>
		         <a class='btn btn-info' href='?module=tag&act=edittag&id=$r[id_tag]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=tag&act=hapus&id=$r[id_tag]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
                
		        </tr>";
    $no++;
    }
    echo "</tbody></table>";
    break;
  
  // Form Tambah Tag
  case "tambahtag":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Tag Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=tag&act=input'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_tag' placeholder='Nama Tag ...'/>
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
  
  // Form Edit Kategori  
  case "edittag":
    $edit=mysqli_query($con,"SELECT * FROM tag WHERE id_tag='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Tag Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=tag&act=update'>
                                <input type=hidden name=id value='$r[id_tag]'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_tag' value='$r[nama_tag]'>
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
}
}
?>
