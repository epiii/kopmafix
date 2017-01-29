<?php
$aksi="modul/mod_profil/aksi_profil.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Profil
                        <small>Toko Online</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Profil Toko Online</li>                        
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];                         
switch($act){
	
  // Tampil Profil
  default:
    $sql  = mysqli_query($con,"SELECT * FROM profil order by id_profil");
    $r    = mysqli_fetch_array($sql);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Profil Toko Online</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
    <form method=POST enctype='multipart/form-data' action=$aksi?module=profil&act=update>
    <input type=hidden name=id value=$r[id_profil]>
    <div class='form-group'>
                                            <label>Nama Toko Online</label>
                                            <input type='text' class='form-control' name='nama_toko' value='$r[nama_toko]'/>
                                        </div>   
                                        <div class='form-group'>
                                            <label>Alamat</label>
                                            <input type='text' class='form-control' name='alamat' value='$r[alamat]'/>
                                        </div>                                     
                                        <div class='form-group'>
                                            <label>Meta Deskripsi</label>
                                            <input type='text' class='form-control' name='meta_deskripsi' value='$r[meta_deskripsi]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Meta Keyword</label>
                                            <input type='text' class='form-control' name='meta_keyword' value='$r[meta_keyword]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Email Pengelola</label>
                                            <input type='text' class='form-control' name='email_pengelola' value='$r[email_pengelola]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>No.HP Pengelola</label>
                                            <input type='text' class='form-control' name='nomor_hp' value='$r[nomor_hp]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>PIN BB</label>
                                            <input type='text' class='form-control' name='pin_bb' value='$r[pin_bb]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Nomor Rekening</label>
                                            <input type='text' class='form-control' name='nomor_rekening' value='$r[nomor_rekening]'/>
                                        </div>
                                        <div class='form-group'>
                                           <label for='exampleInputFile'>Gambar Logo</label><br />
                                    <img src='../foto_banner/$r[gambar]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Gambar Logo Yang Aktif</i></p>                                         
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Upload Logo</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention PNG Transparan Resolusi optimal 300x75px</i></p>
                                        </div>
                                        <div class='form-group'>
                                            <label>Isi Profil Toko</label>
                                         <div class='box-body pad'>
                                    <textarea id='editor1' name='isi' rows='10' cols='80'>
                                            $r[static_content]
                                        </textarea>
                                          </div>
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
echo "</div><!-- /.box-body -->
 </div>
                    </div>

                </section>
                <!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->";
        
?>
