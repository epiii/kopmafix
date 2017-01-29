<?php
if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_label/aksi_label.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Kategori
                        <small>Artikel</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Kategori Artikel</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil label
  default:
    echo " <div class='box-header'>
<h3 class='box-title'>

<input type=button class='btn btn-primary btn' value='Tambah label' 
          onclick=\"window.location.href='?module=label&act=tambahlabel';\">
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
          <tr><td class='left'>No</td>
          <td class='left'>Kategori Artikel</td>
          <td class='center'>Status</td>
          <td class='center'>Aksi</td></tr></thead><tbody>"; 
    $tampil=mysqli_query($con,"SELECT * FROM label ORDER BY id_label DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
       echo "<tr><td class='left' width='25'>$no</td>
             <td class='left'>$r[nama_label]</td>
             <td class='center'>$r[aktif]</td>
             
             <td class='center'>
		         <a class='btn btn-info' href='?module=label&act=editlabel&id=$r[id_label]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=label&act=hapus&id=$r[id_label]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</tbody></table>";
    
    break;
  
  // Form Tambah label
  case "tambahlabel":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Kategori Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=label&act=input'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_label' placeholder='Kategori Artikel ...'/>
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
  
  // Form Edit label  
  case "editlabel":
    $edit=mysqli_query($con,"SELECT * FROM label WHERE id_label='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Kategori Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action=$aksi?module=label&act=update>
          <input type=hidden name=id value='$r[id_label]'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_label' value='$r[nama_label]'/>
                                        </div>
                                        <div class='form-group'>
                                         <label>Status Menu</label>
                                            <div class='radio'>";
                                            if ($r[aktif]=='Y'){    
                                            	echo "                                        
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios1' value='Y' checked>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios2' value='N'>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>";
                                                 }
    else{
    	echo "                                        
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios1' value='Y'>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios2' value='N' checked>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>";
                                                 }
                                                 echo "
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
}
?>
