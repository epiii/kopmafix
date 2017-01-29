<?php
$aksi="modul/mod_hubungi/aksi_hubungi.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Hubungi
                        <small>Kami</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Hubungi Kami</li>
                       
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
  // Tampil Hubungi Kami
  default:
    echo " <div class='box-header'>
<h3 class='box-title'>

</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                        <tr><th>No</th><th>Nama</th><th>Email</th><th>Subjek</th><th>Tanggal</th><th>Aksi</th></tr>
                                        </thead><tbody>";

   

    $tampil=mysqli_query($con,"SELECT * FROM hubungi ORDER BY id_hubungi DESC");

    $no = 1;
    while ($r=mysqli_fetch_array($tampil)){
      $tgl=tgl_indo($r['tanggal']);
      echo "<tr><td>$no</td>
                <td>$r[nama]</td>
                <td><a href=?module=hubungi&act=balasemail&id=$r[id_hubungi]>$r[email]</a></td>
                <td>$r[subjek]</td>
                <td>$tgl</a></td>
                
                <td class='center'>
		         <a class='btn btn-info' href='?module=hubungi&act=balasemail&id=$r[id_hubungi]>$r[email]'>
										<i class='icon-edit icon-white'></i>  
										View                                            
									</a>
									<a class='btn btn-danger' href='hubungi&act=hapus&id=$r[id_hubungi]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
                </tr>";
    $no++;
    }
    echo "</tbody></table>";
   
    break;

  case "balasemail":
    $tampil = mysqli_query($con,"SELECT * FROM hubungi WHERE id_hubungi='$_GET[id]'");
    $r      = mysqli_fetch_array($tampil);
mysqli_query($con,"UPDATE hubungi SET dibuka=$r[dibuka]+1 WHERE id_hubungi='$_GET[id]'");
    echo " <section class='content'>
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
                                   
                                        <div class='form-group'>
                                        <label>Pengirim</label>
                                            <input type='email' class='form-control' name='email' value='$r[email]' disabled/>
                                        </div>
                                        <div class='form-group'>
                                        <label>Subjek Pesan</label>
                                            <input type='text' class='form-control' name='subject' value='Re: $r[subjek]' disabled/>
                                        </div>
                                        <div>
                                        <label>Isi Pesan</label>
                                          <textarea class='form-control' rows='3' placeholder='$r[pesan]' disabled></textarea></textarea>                                         
                                            
                                        </div>
                                    </form>
                                </div>
                                <div class='box-footer clearfix'>
                                <a class='btn btn-block btn-primary' data-toggle='modal' data-target='#compose-modal'>
                                            	<i class='fa fa-pencil'></i> Balas Pesan</a>
                                                                         
                               <input type=button class='btn btn-block btn-warning' value=Batal onclick=self.history.back()>
                                </div>
                                 </form>
                                </div>
                            </div><!-- /.box -->

                            
                        </div><!-- /.col-->
                    </div><!-- ./row -->
                                    </section>
                                    <div class='modal fade' id='compose-modal' tabindex='-1' role='dialog' aria-hidden='true'>
            <div class='modal-dialog'>
                <div class='modal-content'>
                    <div class='modal-header'>
                        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                        <h4 class='modal-title'><i class='fa fa-envelope-o'></i> Reply Message</h4>
                    </div>
                   <form method=POST action='?module=hubungi&act=kirimemail'>
                        <div class='modal-body'>
                            <div class='form-group'>
                                <div class='input-group'>
                                    <span class='input-group-addon'>TO:</span>
                                    <input name='email' type='email' class='form-control' value='$r[email]'>
                                </div>
                            </div>
                            <div class='form-group'>
                                <div class='input-group'>
                                    <span class='input-group-addon'>SUBJECT:</span>
                                    <input name='subjek' class='form-control' value='Re: $r[subjek]'>
                                </div>
                            </div>
                           
                            </div>
                            <div class='form-group'>
                                <textarea name='message' id='pesan' class='form-control' placeholder='Message' style='height: 120px;'> $r[pesan]</textarea>
                            </div>
                           

                        
                        <div class='modal-footer clearfix'>

                            <button type='button' class='btn btn-danger' data-dismiss='modal'><i class='fa fa-times'></i> Discard</button>

                            <button type='submit' class='btn btn-primary pull-left'><i class='fa fa-envelope'></i> Send Message</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
    
    ";
     break;
    
  case "kirimemail":

    $sql2 = mysqli_query($con,"select email_pengelola from profil");
    $j2   = mysqli_fetch_array($sql2);

    mail($_POST[email],$_POST[subjek],$_POST[pesan],"From: $j2[email_pengelola]");
   echo "<div class='alert alert-success alert-dismissable'>
<i class='fa fa-check'></i>
<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
<b>Status Email</b> Email telah sukses terkirim ke tujuan.<br /><br />
<a class='btn btn-info' href='javascript:history.go(-2)'><i class='icon-trash icon-white'></i>Back</a>
</div> ";	 		  
    break;  
}
?>