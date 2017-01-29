<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
   if (empty($_SESSION['namauser'])){   
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_katajelek/aksi_katajelek.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Sensor
                        <small> Kata</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Sensor Kata</li>
                        
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>
                                ";
// switch($_GET[act]){
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
// Tampil Kata Jelek
  default:
    echo "<div class='box-header'>
                                    <h3 class='box-title'><input type=button class='btn btn-primary btn' value='Tambah Kategori' 
          onclick=\"window.location.href='?module=katajelek&act=tambahkatajelek';\"></h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
          <th>No</th><th>Kata Jelek</th><th>Sensor Kata</th><th>Aksi</th>
                                            </tr>
                                        </thead><tbody>"; 
    $tampil=mysqli_query($con,"SELECT * FROM katajelek ORDER BY id_jelek DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
       echo "
   <tr><td>$no</td>
             <td>$r[kata]</td>
              <td>$r[ganti]</td>
             <td class='center'>
		         <a class='btn btn-info' href='?module=katajelek&act=editkatajelek&id=$r[id_jelek]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=katajelek&act=hapus&id=$r[id_jelek]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</table>";
    break;
  
  // Form Tambah Kata Jelek
  case "tambahkatajelek":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Sensor Kata</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=katajelek&act=input'>
                                <div class='form-group'>
                                            <label>Kata Jelek</label>
                                            <input type='text' class='form-control' name='kata' placeholder='Masukkan kata Jelek ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Sensor Kata</label>
                                            <input type='text' class='form-control' name='ganti' placeholder='Sensor kata Jelek ...'/>
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
  
  // Form Edit Kata Jelek 
  case "editkatajelek":
    $edit=mysqli_query($con,"SELECT * FROM katajelek WHERE id_jelek='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Sensor Kata</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=katajelek&act=update'>
                                <input type=hidden name=id value='$r[id_jelek]'>
                                <div class='form-group'>
                                            <label>Kata Jelek</label>
                                            <input type='text' class='form-control' name='kata' value='$r[kata]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Sensor Kata</label>
                                            <input type='text' class='form-control' name='ganti' value='$r[ganti]'/>
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
