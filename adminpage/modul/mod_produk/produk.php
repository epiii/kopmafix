<script>
    function tipeChange(x) {
        if(x=='s') $('#kategoriSB').attr('disabled',true);
        else $('#kategoriSB').removeAttr('disabled');
    }

    $(function() {
    	$('#nav a[href~="' + location.href + '"]').parents('li').addClass('active');
    });
</script>
<?php
    // session_start();
    // vd($_SESSION);
    // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
    if (empty($_SESSION['namauser'])){
        echo "<link href='style.css' rel='stylesheet' type='text/css'>
            <center>Untuk mengakses modul, Anda harus login <br>";
            echo "<a href=../../index.php><b>LOGIN</b></a></center>";
    }else{ 
        $aksi="modul/mod_produk/aksi_produk.php";
        echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Produk Penjualan</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Produk</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
// vd($_GET);
$act=isset($_GET['act'])?$_GET['act']:'act';
switch($act){
  // Tampil Produk
  default:
    echo "
    <div class='box-header'>
        <h3 class='box-title'>
        <input type=button class='btn btn-primary btn' value='Tambah Produk' onclick=\"window.location.href='?module=produk&act=tambahproduk';\">
        </h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama Produk</th>
                                                <th>Berat (Kg)</th>
                                                <th>Harga</th>
                                                <th>Diskon (%)</th>
                                                <th>Stok</th>
                                                <th>Tgl. Masuk</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead><tbody>";
    
    

    $tampil = mysqli_query($con,"SELECT * FROM produk WHERE tipe='j' ORDER BY id_produk DESC");
  
    // $no = $posisi+1;
    $no=1;
    while($r=mysqli_fetch_assoc($tampil)){
      $tanggal=tgl_indo($r['tgl_masuk']);
      $harga=format_rupiah($r['harga']);
      echo "
      <tr><td>$no</td>
                <td>$r[nama_produk]</td>
                <td>$r[berat]</td>
                <td>$harga</td>
                <td>$r[diskon]</td>
                <td>$r[stok]</td>
                <td>$tanggal</td>
                <td class='center'>
		         <a class='btn btn-info' href='?module=produk&act=editproduk&id=$r[id_produk]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=produk&act=hapus&id=$r[id_produk]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
		            
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";
 
    break;
  
  case "tambahproduk":
    echo "<section class='content'>
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
                            
                            <!--form input-->
                            <form method=POST action='$aksi?module=produk&act=input' enctype='multipart/form-data'>
                               <div class='form-group'>
                                    <label>Nama Produk</label>
                                    <input type='text' class='form-control' name='nama_produk' placeholder='Nama Produk ...'/>
                                </div>
                                <div class='form-group'>
                                    <label>Kategori Produk</label>
                                    <select id='kategoriSB' name='kategori' class='form-control'>";
            $tampil=mysqli_query($con,"SELECT * FROM kategori ORDER BY nama_kategori");
            while($r=mysqli_fetch_assoc($tampil)){
              echo "<option value=$r[id_kategori]>$r[nama_kategori]</option>";
            }
                                       echo "
                                            </select>
                                        </div>
                                        <div class='form-group'>
                                            <label>Berat (Kg)</label>
                                            <input type='text' class='form-control' name='berat' placeholder='Berat ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Harga</label>
                                            <input type='text' class='form-control' name='harga' placeholder='Harga ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Diskon (%)</label>
                                            <input type='text' class='form-control' name='diskon' placeholder='Diskon jika ada ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Stok Produk</label>
                                            <input type='text' class='form-control' name='stok' placeholder='Jumlah Stok Barang ...'/>
                                        </div>
                                        
                                        <div class='box-body pad'>
                                    <textarea id='editor1' name='deskripsi' rows='10' cols='80'>
                                            Masukkan keterangan produk disini.
                                        </textarea>
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Resolusi Optimal 400 x 400px</i></p>
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
    
  case "editproduk":
    $edit = mysqli_query($con,"SELECT * FROM produk WHERE id_produk='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "
    <section class='content'>
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
                                
                                <form method=POST enctype='multipart/form-data' action=$aksi?module=produk&act=update>
                                    <input type=hidden name=id value=$r[id_produk]>
                                   <div class='form-group'>
                                        <label>Nama Produk</label>
                                        <input type='text' class='form-control' name='nama_produk' value='$r[nama_produk]'/>
                                    </div>
                                    <div class='form-group'>
                                    <label>Kategori Produk </label>
                                            <select name='kategori' class='form-control'>
                                                <option value=0 selected>- Pilih Kategori -</option>";
            $tampil=mysqli_query($con,"SELECT * FROM kategori ORDER BY nama_kategori");
          if ($r['id_kategori']==0){
            echo "<option value=0 selected>- Pilih Kategori -</option>";
          }   

          while($w=mysqli_fetch_array($tampil)){
            if ($r['id_kategori']==$w['id_kategori']){
              echo "<option value=$w[id_kategori] selected>$w[nama_kategori]</option>";
            }
            else{
              echo "<option value=$w[id_kategori]>$w[nama_kategori]</option>";
            }
          }
    echo "</select>
                                        </div>
                                        <div class='form-group'>
                                            <label>Berat (Kg)</label>
                                            <input type='text' class='form-control' name='berat' value='$r[berat]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Harga</label>
                                            <input type='text' class='form-control' name='harga' value='$r[harga]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Diskon (%)</label>
                                            <input type='text' class='form-control' name='diskon' value='$r[diskon]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Stok Produk</label>
                                            <input type='text' class='form-control' name='stok' value='$r[stok]'/>
                                        </div>
                                        
                                        <div class='box-body pad'>
                                    <textarea id='editor1' name='deskripsi' rows='10' cols='80'>
                                            $r[deskripsi]
                                        </textarea>
                                          </div>
                                           <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Produk</label><br />
                                    <img src='../foto_produk/$r[gambar]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Gambar Produk Yang Aktif</i></p>                                         
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Gambar Produk</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG Resolusi Optimal 400 x 400px</i></p>
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
}
echo "</div><!-- /.box-body -->
 </div>
                    </div>

                </section>
                <!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->";
        
        
?>


                
               
        
        
        