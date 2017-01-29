<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  $aksi="modul/mod_admin/aksi_admins.php";
  echo "<aside class='right-side'>
            <!-- Content Header (Page header) -->
            <section class='content-header'>
                <h1>
                    Data
                    <small>User</small>
                </h1>
                <ol class='breadcrumb'>
                    <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                    <li class='active'>Data User</li>
                   
                </ol>
            </section>

            <!-- Main content -->
            <section class='content'>
                <div class='row'>
                    <div class='col-xs-12'>
                      <div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){ 
  // Tampil User
  default:
    if ($_SESSION['leveluser']=='admin'){
      $tampil = mysqli_query($con,"SELECT * FROM users ORDER BY username");
      echo "<div class='box-header'>
        <h3 class='box-title'>
          <input type=button class='btn btn-primary btn' value='Tambah Admin' onclick=\"window.location.href='?module=admin&act=tambahadmin';\"></h3>
            </div><!-- /.box-header -->
            <div class='box-body table-responsive'>
              <table id='example1' class='table table-bordered table-striped'>
                <thead>";
    }else{
      $tampil=mysqli_query($con,'SELECT * FROM users WHERE username="'.$_SESSION['namauser'].'"');
      echo " <div class='box-header'>
              <h3 class='box-title'>
                Data User</h3>
            </div><!-- /.box-header -->
            <div class='box-body table-responsive'>
              <table id='example1' class='table table-bordered table-striped'>
                <thead>
                  <table id='example1' class='table table-bordered table-striped'>
                <thead>";
    }echo "<tr>
      <th>No</th>
      <th>Username</th>
      <th>Nama Lengkap</th>
      <th>Foto User</th>          
      <th>Level</th>
      <th>Blokir</th>
      <th>Aksi</th>
      </tr></thead><tbody>"; 
      $no=1;
      while ($r=mysqli_fetch_assoc($tampil)){
        // vd($r);
        echo "<tr>
       <td class='center' width='10'>$no</td>
             <td class='left'>$r[username]</td>
             <td class='left'>$r[nama_lengkap]</td>
             <td class='left'><img src='../foto_banner/$r[foto]' width='100' height='100'></td>
		         <td class='left'>$r[level]</td>
		         <td class='left'>$r[blokir]</td>
		         <td class='center'>
		         <a class='btn btn-info' href='?module=admin&act=editadmin&id=$r[id_session]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=admin&act=delcon&id=$r[id_session]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
							</tr>";
      $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahadmin":
    if ($_SESSION['leveluser']=='admin'){
    echo "
    <section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>fbah <small>Admin</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                 <form method=POST action='$aksi?module=admin&act=input' enctype='multipart/form-data'>
                                  <div class='form-group'>
                                            <label>Username</label>
                                            <input type='text' class='form-control' name='username' placeholder='Username Anda ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Password</label>
                                            <input type='password' class='form-control' name='password' placeholder='Password ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Lengkap</label>
                                            <input type='text' class='form-control' name='nama_lengkap' placeholder='Nama Lengkap ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Email</label>
                                            <input type='text' class='form-control' name='email' placeholder='Email ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>No.Telp</label>
                                            <input type='text' class='form-control' name='no_telp' placeholder='No.Telp ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Foto</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / PNG Resolusi Optimal 215 x 215</i></p>
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
    }
    else{
      echo "Anda tidak berhak mengakses halaman ini.";
    }
     break;
    
  case "editadmin":
    $edit=mysqli_query($con,"SELECT * FROM users WHERE id_session='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    if ($_SESSION['leveluser']=='admin'){
    echo "
     <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Data User</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                 <form method=POST action=$aksi?module=admin&act=update enctype='multipart/form-data'>
          <input type=hidden name=id value='$r[id_session]'>
                                  <div class='form-group'>
                                            <label>Username</label>
                                             <input type='text' class='form-control' placeholder='$r[username]' disabled/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Password</label>
                                            <input type='text' class='form-control' name='password' placeholder='Password Baru...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Lengkap</label>
                                            <input type='text' class='form-control' name='nama_lengkap' value='$r[nama_lengkap]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Email</label>
                                            <input type='text' class='form-control' name='email' value='$r[email]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>No.Telp</label>
                                            <input type='text' class='form-control' name='no_telp' value='$r[no_telp]'/>
                                        </div>
                                         <div class='form-group'>
                                           ";
                                                if ($r['blokir']=='N'){
      echo " <label>Status Blokir </label><input type=radio name='blokir' value='Y'> Y   
                                           <input type=radio name='blokir' value='N' checked> N ";
    }
    else{
      echo " <label>Status Blokir </label><input type=radio name='blokir' value='Y' checked> Y  
                                          <input type=radio name='blokir' value='N'> N ";
    }
    echo "
                                        <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Foto</label><br />
                                    <img src='../foto_banner/$r[foto]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Foto Yang Aktif</i></p>                                         
                                          </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Foto</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / PNG Resolusi Optimal 215 x 215</i></p>
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
    else{
    echo "<div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Data User</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                 <form method=POST action=$aksi?module=user&act=update enctype='multipart/form-data'>
          <input type=hidden name=id value='$r[id_session]'>
                                  <div class='form-group'>
                                            <label>Username</label>
                                             <input type='text' class='form-control' placeholder='$r[username]' disabled/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Password</label>
                                            <input type='text' class='form-control' name='password' placeholder='Password Baru...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Lengkap</label>
                                            <input type='text' class='form-control' name='nama_lengkap' value='$r[nama_lengkap]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Email</label>
                                            <input type='text' class='form-control' name='email' value='$r[email]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>No.Telp</label>
                                            <input type='text' class='form-control' name='no_telp' value='$r[no_telp]'/>
                                        </div>
                                         <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Foto</label><br />
                                    <img src='../foto_banner/$r[foto]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Foto Yang Aktif</i></p>                                         
                                          </div>
                                        <div class='form-group'>
                                            <label for='exampleInputFile'>Foto</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / PNG Resolusi Optimal 215 x 215</i></p>
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
