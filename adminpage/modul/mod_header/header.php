<?php
// session_start();
if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_header/aksi_header.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Slide</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Slide</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil header
  default:
    echo "<div class='box-header'>
                                    <h3 class='box-title'>
<input type=button  class='btn btn-primary btn' value='Tambahkan Slide' onclick=location.href='?module=header&act=tambahheader'>
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
          <tr><th>No</th><th>Judul</th><th>Tgl. Posting</th><th>Aksi</th></tr></thead><tbody>";
    $tampil=mysqli_query($con,"SELECT * FROM header ORDER BY id_header DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
      $tgl=tgl_indo($r['tgl_posting']);
          //       <td><a href=?module=header&act=editheader&id=$r[id_header]>Edit</a> | 
	         //          <a href=$aksi?module=header&act=hapus&id=$r[id_header]>Hapus</a>
		        // </tr>";
      echo "<tr><td>$no</td>
                <td>$r[judul]</td>
                <td>$tgl</td>
                <td class='center'>
                 <a class='btn btn-info' href='?module=header&act=editheader&id=$r[id_header]'>
                                        <i class='icon-edit icon-white'></i>  
                                        Edit                                            
                                    </a>
                                    <a class='btn btn-danger' href='$aksi?module=editheader&act=hapus&id=$r[id_header]'>
                                        <i class='icon-trash icon-white'></i> 
                                        Delete
                                    </a>
                                </td>
             </tr>";
    $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahheader":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Slide</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                  <form method=POST action='$aksi?module=header&act=input' enctype='multipart/form-data'>
                                  <div class='form-group'>
                                            <label>Judul</label>
                                            <input type='text' class='form-control' name='judul' placeholder='Judul Slide ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>URL Link</label>
                                            <input type='text' class='form-control' name='url' placeholder='Link Slide ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Keterangan</label>
                                            <input type='text' class='form-control' name='keterangan' placeholder='Keterangan Slide ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Slide</label>
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
    
  case "editheader":
    $edit = mysqli_query($con,"SELECT * FROM header WHERE id_header='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Slide</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                   <form method=POST enctype='multipart/form-data' action=$aksi?module=header&act=update>
          <input type=hidden name=id value=$r[id_header]>
                                  <div class='form-group'>
                                            <label>Judul</label>
                                            <input type='text' class='form-control' name='judul' value='$r[judul]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>URL Link</label>
                                            <input type='text' class='form-control' name='url' value='$r[url]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Keterangan</label>
                                            <input type='text' class='form-control' name='keterangan' value='$r[keterangan]'/>
                                        </div>
                                        <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Slide</label><br />
                                    <img src='../header/$r[gambar]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Gambar Slide Yang Aktif</i></p>                                         
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Slide</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG</i></p>
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
