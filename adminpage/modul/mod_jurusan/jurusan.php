<?php
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
        <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else{
  $aksi="modul/mod_jurusan/aksi_jurusan.php";
  echo "
  <aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Jurusan</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Jurusan</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Jurusan
  default:
    echo " <div class='box-header'>
      <h3 class='box-title'>
      <input type=button class='btn btn-primary btn' value='Tambah Jurusan' onclick=\"window.location.href='?module=jurusan&act=tambahjurusan';\">
      </h3>
      </div><!-- /.box-header -->
      <div class='box-body table-responsive'>

      <table id='example1' class='table table-bordered table-striped'>
      <thead>
          <tr><td class='center'>No</td>
          <td class='center'>Jurusan</td>
          <td class='center'>Fakultas</td>
          <td class='center'>aksi</td></tr></thead><tbody>";          

  $tampil = mysqli_query($con,"SELECT * FROM jurusan,fakultas WHERE jurusan.id_fakultas=fakultas.id_fakultas");

  $no = 1;
  while($r=mysqli_fetch_array($tampil)){
	if($r['id_jurusan']!=0){
		$sub = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM jurusan WHERE id_jurusan=$r[id_jurusan]"));
		$fakultas = $r['fakultas'];
	} else {
		$fakultas = $r['fakultas'];
	}
      echo "<tr><td class='left' width='25'>$no</td>
                <td class='left'>$r[jurusan]</td>
                <td class='left'>$fakultas</td>
		            <td class='center'>
		         <a class='btn btn-info' href='?module=jurusan&act=editjurusan&id=$r[id_jurusan]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=jurusan&act=hapus&id=$r[id_jurusan]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahjurusan":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Jurusan</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=jurusan&act=input'>
                                 <div class='form-group'>
                                            <label>Nama Jurusan</label>
                                            <input type='text' class='form-control' name='jurusan' placeholder='Nama Jurusan ...'/>
                                        </div>
                                        <div class='form-group'>
                                          <label>Fakultas</label>
                                          <select onchange='combojur(this.value);' class='form-control' name='fakultas'>
                                            <option value=''>-Pilih-</option>";
                                              $s='SELECT * from fakultas order by fakultas';
                                              $e=mysqli_query($con,$s);
                                              while ($r=mysqli_fetch_assoc($e)) {
                                                echo '<option value="'.$r['id_fakultas'].'">'.$r['fakultas'].'</option>';
                                              }
                                            echo"
                                          </select>
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
    
  case "editjurusan":
    $edit = mysqli_query($con,"SELECT * FROM jurusan WHERE id_jurusan='$_GET[id]'");
    $r    = mysqli_fetch_assoc($edit);
    // vd($r);
    echo "<section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Jurusan</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action=$aksi?module=jurusan&act=update>
          <input type=hidden name=id value=$r[id_jurusan]>
                                 <div class='form-group'>
                                            <label>Nama Jurusan</label>
                                            <input type='text' class='form-control' name='jurusan' value='$r[jurusan]'/>
                                        </div>
                                        <div class='form-group'>
                                          <label>Menu Fakultas</label>
                                          <select class='form-control' name='fakultas'>
                                            <option value=''>-Pilih-</option>";
                                            $ss ='SELECT * from fakultas order by fakultas';
                                            $ee =mysqli_query($con,$ss);
                                            while ($rr=mysqli_fetch_assoc($ee)) {
                                              echo '<option '.($rr['id_fakultas']==$r['id_fakultas']?'selected':'').' value="'.$rr['id_fakultas'].'">'.$rr['fakultas'].'</option>';
                                            }echo"
                                          </select>
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
