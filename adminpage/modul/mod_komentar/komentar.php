<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
   if (empty($_SESSION['namauser'])){   
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_komentar/aksi_komentar.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Komentar</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Komentar</li>
                        
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
  // Tampil Komentar
  default:  
    echo "<div class='box-header'>
                                   
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
          <th>No</th><th>Nama</th><th>Komentar</th><th>Aktif</th><th>Aksi</th>
                                            </tr>
                                        </thead><tbody>"; 

   
    $tampil=mysqli_query($con,"SELECT * FROM komentar ORDER BY id_komentar DESC");

    $no = 1;
    while ($r=mysqli_fetch_array($tampil)){
      echo "<tr><td>$no</td>
             <td>$r[nama_komentar]</td>
             <td>$r[isi_komentar]</td>
             <td>$r[aktif]</td>
             <td class='center'>
		         <a class='btn btn-info' href='?module=komentar&act=editkomentar&id=$r[id_komentar]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=komentar&act=hapus&id=$r[id_komentar]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</table>";
    break;
  
  case "editkomentar":
    $edit = mysqli_query($con,"SELECT * FROM komentar WHERE id_komentar='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Data Komentar</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=komentar&act=update'>
                                <input type=hidden name=id value=$r[id_komentar]>
                                <div class='form-group'>
                                            <label>Nama</label>
                                            <input type='text' class='form-control' name='nama_komentar' value='$r[nama_komentar]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>URL Website</label>
                                            <input type='text' class='form-control' name='url' value='$r[url]'/>
                                        </div>
                                          <div class='box-body pad'>
    
                                    <textarea id='editor1' name='isi_komentar' rows='10' cols='80'>
                                            $r[isi_komentar]
                                        </textarea>
                                          </div>";
                                                if ($r[aktif]=='Y'){
      echo " <label>Status Aktif : </label><input type=radio name='aktif' value='Y' checked> Y   
                                           <input type=radio name='aktif' value='N'> N ";
    }
    else{
      echo " <label>Status Blokir </label><input type=radio name='aktif' value='Y'> Y  
                                          <input type=radio name='aktif' value='N' checked> N ";
    }
    echo "
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
