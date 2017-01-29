<?php
$aksi="modul/mod_kategori/aksi_kategori.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Kategori Produk</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Kategori Produk</li>
                        
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=isset($_GET['act'])?$_GET['act']:'act';
switch($act){
  // Tampil Kategori
  default:
  echo "
    <div class='box-header'>
                                    <h3 class='box-title'><input type=button class='btn btn-primary btn' value='Tambah Kategori' 
          onclick=\"window.location.href='?module=kategori&act=tambahkategori';\"></h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
          <th>No</th><th>Nama Kategori</th><th>Aksi</th>
                                            </tr>
                                        </thead><tbody>"; 
    $tampil=mysqli_query($con,"SELECT * FROM kategori ORDER BY id_kategori DESC");
    $no=1;
    while ($r=mysqli_fetch_array($tampil)){
       echo "<tr><td>$no</td>
             <td>$r[nama_kategori]</td>
             <td class='center'>
		         <a class='btn btn-info' href='?module=kategori&act=editkategori&id=$r[id_kategori]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=kategori&act=hapus&id=$r[id_kategori]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
             </tr>";
      $no++;
    }
    echo "</table>";
    break;
  
  // Form Tambah Kategori
  case "tambahkategori":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Kategori Produk</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=kategori&act=input'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_kategori' placeholder='Nama Kategori ...'/>
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
  
  // Form Edit Kategori  
  case "editkategori":
    $edit=mysqli_query($con,"SELECT * FROM kategori WHERE id_kategori='$_GET[id]'");
    $r=mysqli_fetch_array($edit);

    echo "
    <section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Kategori Produk</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action=$aksi?module=kategori&act=update>
          <input type=hidden name=id value='$r[id_kategori]'>
                                <div class='form-group'>
                                            <label>Nama Kategori</label>
                                            <input type='text' class='form-control' name='nama_kategori' value='$r[nama_kategori]'/>
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
                                    </section>
    ";
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
