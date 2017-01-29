<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
   if (empty($_SESSION['namauser'])){   
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_kontak/aksi_kontak.php";
echo "

<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Produk</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Produk</li>
                       
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
// Tampil kontak
  default:
    echo "<div class='box-header'>
<h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambah Kontak' onclick=location.href='?module=kontak&act=tambahkontak'>
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>    
   
          <tr><th>No</th>
          <th>Logo</th>
          <th>Jenis Kontak</th>
          <th>Nomor / ID Kontak</th>
          <th>url</th>
          <th>Aksi</th></tr> </thead><tbody>";
    $tampil=mysqli_query($con,"SELECT * FROM mod_kontak ORDER BY id_kontak DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
      $tgl=tgl_indo($r[tgl_posting]);
      echo "<tr><td align=left>$no</td>
                <td align=left><img src='../foto_banner/$r[gambar]'></td>
                 <td>$r[judul]</td>
                <td>$r[jenis]</td>
                <td>$r[url]</td>
                <td align=left><a href=?module=kontak&act=editkontak&id=$r[id_kontak]><b>Edit</b></a> | 
	                  <a href=$aksi?module=kontak&act=hapus&id=$r[id_kontak]><b>Hapus</b></a>
		        </tr>";
    $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahkontak":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Data Kontak</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=kontak&act=input' enctype='multipart/form-data'>
                               <div class='form-group'>
                                            <label>Tipe Kontak</label>
                                            <input type='text' class='form-control' name='judul' placeholder='Tipe Kontak'/>
                                            <p class='help-block'><i>Contoh : Telp, Blackberry,WhatsApp dsb</i></p>
                                        </div>
                                        <div class='form-group'>
                                            <label>Nomor / ID Kontak</label>
                                            <input type='text' class='form-control' name='jenis' placeholder=''/>
                                            <p class='help-block'><i>Detail : Telp, Blackberry,WhatsApp dsb</i></p>
                                        </div>
                                         <div class='form-group'>
                                            <label>URL Kontak</label>
                                            <input type='text' class='form-control' name='url' placeholder='URL Kontak'/>
                                         <p class='help-block'><i>Contoh : www.facebook.com/id-facebook..kosongkan jika tidak ada</i></p>
                                        </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Panjang 20px, Lebar 20px</i></p>
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
    
  case "editkontak":
    $edit = mysqli_query($con,"SELECT * FROM mod_kontak WHERE id_kontak='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Data Kontak</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST enctype='multipart/form-data' action=$aksi?module=kontak&act=update>
          <input type=hidden name=id value=$r[id_kontak]>
                                <div class='form-group'>
                                            <label>Tipe Kontak</label>
                                            <input type='text' class='form-control' name='judul' value='$r[judul]'/>
                                            <p class='help-block'><i>Contoh : Telp, Blackberry,WhatsApp dsb</i></p>
                                        </div>
                                        <div class='form-group'>
                                            <label>Nomor / ID Kontak</label>
                                            <input type='text' class='form-control' name='jenis' value='$r[jenis]'/>
                                            <p class='help-block'><i>Detail : Telp, Blackberry,WhatsApp dsb</i></p>
                                        </div>
                                         <div class='form-group'>
                                            <label>URL Kontak</label>
                                            <input type='text' class='form-control' name='url' value='$r[url]'/>
                                         <p class='help-block'><i>Contoh : www.facebook.com/id-facebook..kosongkan jika tidak ada</i></p>
                                        </div>
                                        <div class='form-group'>
                                           <label for='exampleInputFile'>Preview</label><br />
                                    <img src='../foto_banner/$r[gambar]' >  
                                    <p class='help-block'><i>Gambar Produk Yang Aktif</i></p>                                         
                                          </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Panjang 20px, Lebar 20px</i></p>
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
