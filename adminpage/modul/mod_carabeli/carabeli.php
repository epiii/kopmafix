<?php
// session_start();
if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_carabeli/aksi_carabeli.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Cara 
                        <small>Pembelian</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Cara Pembelian</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>
        ";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Cara Pembelian
  default:
    $sql  = mysqli_query($con,"SELECT * FROM modul WHERE id_modul='45'");
    $r    = mysqli_fetch_array($sql);

    echo "
    <section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Isian <small>Cara Pembelian</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
    <form method=POST action=$aksi?module=carabeli&act=update>
          <input type=hidden name=id value=$r[id_modul]>
          <div class='form-group'>
                                            <label>Keterangan Cara Pembelian</label>
          <div class='box-body pad'>
                                    <textarea id='editor1' name='isi' rows='10' cols='80'>
                                            $r[static_content]
                                        </textarea>
                                          </div>
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
