<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_banner/aksi_banner.php";
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
// switch($_GET[act]){
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Banner
  default:
    echo "<div class='box-header'>
                                    <h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambah Banner' onclick=location.href='?module=banner&act=tambahbanner'>
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                        <tr><th>no</th><th>judul</th><th>url</th><th>Posisi</th><th>tgl. posting</th><th>aksi</th></tr>
                                        </thead><tbody>";
    $tampil=mysqli_query($con,"SELECT * FROM banner ORDER BY id_banner DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
      $tgl=tgl_indo($r['tgl_posting']);
      echo "<tr><td>$no</td>
                <td>$r[judul]</td>
                <td><a href=$r[url] target=_blank>$r[url]</a></td>
                 <td>$r[posisi]</td>
                <td>$tgl</td>
                <td class='center'>
		         <a class='btn btn-info' href='?module=banner&act=editbanner&id=$r[id_banner]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=banner&act=hapus&id=$r[id_banner]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
                
		        </tr>";
    $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahbanner":
    echo "<section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Banner</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
    <form method=POST action='$aksi?module=banner&act=input' enctype='multipart/form-data'>
     <div class='form-group'>
                                            <label>Judul Banner</label>
                                            <input type='text' class='form-control' name='judul' placeholder='Judul Banner ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Link URL</label>
                                            <input type='text' class='form-control' name='url' placeholder='Link URL Banner ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Posisi Banner</label>
                                            <select name='posisi' class='form-control'>
                                                <option value=0 selected>- Pilih Posisi -</option>
                                                <option value='atas'>Atas</option>		 
		   <option value='bawah'>Bawah</option>
								  </select> </div>
								  <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Banner</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Resolusi Optimal 305 x 106</i></p>
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
    
  case "editbanner":
    $edit = mysqli_query($con,"SELECT * FROM banner WHERE id_banner='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Banner</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
    <form method=POST enctype='multipart/form-data' action=$aksi?module=banner&act=update>
          <input type=hidden name=id value=$r[id_banner]>
     <div class='form-group'>
                                            <label>Judul Banner</label>
                                            <input type='text' class='form-control' name='judul' value='$r[judul]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Link URL</label>
                                            <input type='text' class='form-control' name='url' value='$r[url]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Posisi Banner</label>
                                            <select name='posisi' class='form-control'>
                                            <option value=$r[posisi] selected>$r[posisi]</option>
                                                <option value=0>- Pilih Kategori -</option>
                                                <option value='atas'>Atas</option>		 
		   <option value='bawah'>Bawah</option>
								  </select> </div>
								   <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Banner</label><br />
                                    <img src='../foto_banner/$r[gambar]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Gambar Banner Yang Aktif</i></p>                                         
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Resolusi Optimal 305 x 106</i></p>
                                        </div>
                                        <div class='form-group'>
                                        <input type=submit class='btn btn-primary btn-lg' value=Update>
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
?>
