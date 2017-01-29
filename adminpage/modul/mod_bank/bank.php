<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
   if (empty($_SESSION['namauser'])){   
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_bank/aksi_bank.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Rekening Bank</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                         <li class='active'>Tables</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
// switch($_GET[act]){
  $act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Bank
  default:
    echo "
     <div class='box-header'>
                                    <h3 class='box-title'>
                                    <input type=button class='btn btn-primary btn' value='Tambah Rekening Bank' onclick=location.href='?module=bank&act=tambahbank'>
                                    </h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr><th>No</th><th>Nama Bank</th><th>Nomer Rekening</th><th>Nama Pemilik</th><th>Aksi</th></tr>
                                        </thead><tbody>";
    
    $tampil=mysqli_query($con,"SELECT * FROM mod_bank ORDER BY id_bank DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
      // $tgl=tgl_indo($r['tgl_posting']);
      echo "<tr><td align=left>$no</td>
                <td align=left><img src='../foto_banner/$r[gambar]'></td>
                <td>$r[no_rekening]</td>
                <td>$r[pemilik]</td>
                <td class='center'>
		         <a class='btn btn-info' href='?module=bank&act=editbank&id=$r[id_bank]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=bank&act=hapus&id=$r[id_bank]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
                
		        </tr>";
    $no++;
    }
    echo "</table>";
    break;
  
  case "tambahbank":
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
                                <form method=POST action='$aksi?module=bank&act=input' enctype='multipart/form-data'>
                                <div class='form-group'>
                                            <label>Nama Bank</label>
                                            <input type='text' class='form-control' name='nama_bank' placeholder='Nama Bank ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>No. Rekening</label>
                                            <input type='text' class='form-control' name='no_rekening' placeholder='No. Rekening'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Pemilik</label>
                                            <input type='text' class='form-control' name='pemilik' placeholder='Nama Pemegang Rekening'/>
                                        </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG</i></p>
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
    
  case "editbank":
    $edit = mysqli_query($con,"SELECT * FROM mod_bank WHERE id_bank='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

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
                              <form method=POST enctype='multipart/form-data' action=$aksi?module=bank&act=update>
          <input type=hidden name=id value=$r[id_bank]>
                                <div class='form-group'>
                                            <label>Nama Bank</label>
                                            <input type='text' class='form-control' name='nama_bank' value='$r[nama_bank]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>No. Rekening</label>
                                            <input type='text' class='form-control' name='no_rekening' value='$r[no_rekening]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Pemilik</label>
                                            <input type='text' class='form-control' name='pemilik' value='$r[pemilik]'/>
                                        </div>
                                         <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Produk</label><br />
                                    <img src='../foto_banner/$r[gambar]' >  
                                    <p class='help-block'><i>Gambar Produk Yang Aktif</i></p>                                         
                                          </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG</i></p>
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
