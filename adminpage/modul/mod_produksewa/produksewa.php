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
        $aksi="modul/mod_produksewa/aksi_produksewa.php";
        echo "<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Produk
                        <small> Persewaan</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Produk Persewaan</li>
                       
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
        <input type=button class='btn btn-primary btn' value='Tambah Barang' onclick=\"window.location.href='?module=produksewa&act=tambahproduksewa';\">
        </h3>
            </div><!-- /.box-header -->
            <div class='box-body table-responsive'>

    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama Produk</th>
                                                <th>Durasi Sewa</th>
                                                <th>Member Koperasi</th>
                                                <th>Member Umum</th>
                                                <th>Jumlah</th>
                                                <th>Sisa</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead><tbody>";
    $s='SELECT
            p.*,
            p.stok total,
            (p.stok-IFNULL(s.terpinjam,0))stok
        FROM produk p
            LEFT JOIN (
                SELECT 
                    s.id_produk,
                    (SELECT stok FROM produk WHERE id_produk=s.id_produk)kuota,
                    SUM(s.total)terpinjam
                FROM orders_detail_sewa s 
                WHERE s.status!="k"
                GROUP BY s.id_produk
            )s on s.id_produk = p.id_produk
        WHERE p.tipe="s" ';
    // vd($s);
    $tampil = mysqli_query($con,$s);

    $no=1;
    while($r=mysqli_fetch_assoc($tampil)){
      $tanggal  =tgl_indo($r['tgl_masuk']);
      $hargaKop =format_rupiah($r['hargakoperasi']);
      $hargaMum =format_rupiah($r['hargaumum']);
      echo "
      <tr><td>$no</td>
                <td>$r[nama_produk]</td>
                <td>Per $r[durasi] ".($r['jenisdurasi']=='h'?' hari':'jam')."</td>
                <td>$hargaKop</td>
                <td>$hargaMum</td>
                <td>$r[total]</td>
                <td>$r[stok]</td>
                <td class='center'>
		         <a class='btn btn-info' href='?module=produksewa&act=editproduksewa&id=$r[id_produk]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=produksewa&act=hapus&id=$r[id_produk]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
		            
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";
 
    break;
  
  case "tambahproduksewa":
    echo "<section class='content'>
            <div class='row'>
                <div class='col-md-12'>
                    <div class='box box-info'>
                        <div class='box-header'>
                            <h3 class='box-title'>Tambah <small>Barang Persewaan</small></h3>
                            <!-- tools box -->
                            <div class='pull-right box-tools'>
                                <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                            </div><!-- /. tools -->
                        </div><!-- /.box-header -->
                        <div class='box-body pad'>
                            
                            <!--form input-->
                            <form method=POST action='$aksi?module=produksewa&act=input' enctype='multipart/form-data'>
                               <div class='form-group'>
                                    <label>Nama Produk</label>
                                    <input type='text' class='form-control' name='nama_produk' placeholder='Nama Produk ...'/>
                                </div>
                               <div class='form-group'>
                                    <label>Kategori Durasi</label>
                                    <select class='form-control' name='jenisdurasi'>
                                        <option value='h'>Hari</option>
                                        <option value='j'>Jam</option>
                                    </select>
                                </div>
                               <div class='form-group'>
                                    <label>Durasi</label>
                                    <input type='text' class='form-control' name='durasi' placeholder='durasi'/>
                                </div>
                                <div class='form-group'>
                                    <label>Harga Member Koperasi</label>
                                    <input type='text' class='form-control' name='hargakoperasi' placeholder='Harga member Koperasi ...'/>
                                </div>
                                <div class='form-group'>
                                    <label>Harga Member Umum</label>
                                    <input type='text' class='form-control' name='hargaumum' placeholder='Harga member Umum ...'/>
                                </div>
                                <div class='form-group'>
                                    <label>Jumlah Barang</label>
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
    
  case "editproduksewa":
    $edit = mysqli_query($con,"SELECT * FROM produk WHERE id_produk='$_GET[id]'");
    $r    = mysqli_fetch_assoc($edit);
// vd($r);
    echo "
    <section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Ubah <small>Barang Persewaan</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                
                                <form method=POST enctype='multipart/form-data' action=$aksi?module=produksewa&act=update>
                                    <input type=hidden name=id value=$r[id_produk]>
                                   <div class='form-group'>
                                        <label>Nama Barang</label>
                                        <input type='text' class='form-control' name='nama_produk' value='$r[nama_produk]'/>
                                    </div>
                                   <div class='form-group'>
                                    <label>Kategori Durasi</label>
                                    <select class='form-control' name='jenisdurasi'>
                                        <option ".($r['jenisdurasi']=='h'?'selected':'')." value='h'>Hari</option>
                                        <option ".($r['jenisdurasi']=='j'?'selected':'')." value='j'>Jam</option>
                                    </select>
                                </div>
                               <div class='form-group'>
                                    <label>Durasi</label>
                                    <input type='text' value='$r[durasi]' class='form-control' name='durasi' placeholder='durasi'/>
                                </div>
                                <div class='form-group'>
                                        <label>Harga Member Koperasi</label>
                                        <input type='text' class='form-control' name='hargakoperasi' value='$r[hargakoperasi]'/>
                                    </div>
                                    <div class='form-group'>
                                        <label>Harga Member Umum</label>
                                        <input type='text' class='form-control' name='hargaumum' value='$r[hargaumum]'/>
                                    </div>
                                    <div class='form-group'>
                                        <label>Jumlah</label>
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


                
               
        
        
        