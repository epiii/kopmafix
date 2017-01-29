<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{    
$aksi="modul/mod_fb/aksi_fb.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Facebook
                        <small>Fanspage</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Facebook Fanspage</li>
                       
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
  // Tampil Profil
  default:
   $edit = mysqli_query($con,"SELECT * FROM facebook ORDER By id_fb");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Link Facebook Fanspage</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST enctype='multipart/form-data' action=$aksi?module=fb&act=update>
           <input type=hidden name=id value=$r[id_fb]>
            <div class='form-group'>
                                            <label>Judul Widget</label>
                                            <input type='text' class='form-control' name='widget' value='$r[nama_widget]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>URL Facebook Fanspage</label>
                                            <input type='text' class='form-control' name='fb' value='$r[alamat_fb]'/>
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
?>
