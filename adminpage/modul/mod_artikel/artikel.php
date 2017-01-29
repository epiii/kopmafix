<?php    
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  $aksi="modul/mod_artikel/aksi_artikel.php";
  echo "
  <aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Artikel</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Artikel</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil artikel
  default:   
    echo "   
    <div class='box-header'>
<h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambahkan Artikel' onclick=\"window.location.href='?module=artikel&act=tambahartikel';\">
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
          <tr><th>No</th><th>Judul</th><th>Tgl. Posting</th><th>Aksi</th></tr> </thead><tbody>";

    

    if ($_SESSION['leveluser']=='admin'){
      $tampil = mysqli_query($con,"SELECT * FROM artikel ORDER BY id_artikel DESC ");
    }
    else{
      $tampil=mysqli_query($con,"SELECT * FROM artikel 
                           WHERE username='$_SESSION[namauser]'       
                           ORDER BY id_artikel DESC");
    }
    // $no = $posisi+1;
    $no = 1;
    while($r=mysqli_fetch_assoc($tampil)){
      $tgl_posting=tgl_indo($r['tanggal']);
      echo "<tr><td>$no</td>
                <td>$r[judul]</td>
                <td>$tgl_posting</td>
		             <td class='center'>
		         <a class='btn btn-info' href='?module=artikel&act=editartikel&id=$r[id_artikel]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=artikel&act=hapus&id=$r[id_artikel]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";

    if ($_SESSION['leveluser']=='admin'){
      $jmldata = mysqli_num_rows(mysqli_query($con,"SELECT * FROM artikel"));
    }else{
      // $jmldata = mysqli_num_rows(mysqli_query($con,"SELECT * FROM artikel WHERE username='$_SESSION['namauser']'"));
      $s='SELECT * FROM artikel WHERE username="'.$_SESSION['namauser'].'"';
      vd($s);
      $e=mysqli_query($con,$s);
      $jmldata = mysqli_num_rows($e);
    } 
    break; 
    $no = 1;
    while($r=mysqli_fetch_array($tampil)){
      $tgl_posting=tgl_indo($r[tanggal]);
      echo "<tr><td>$no</td>
                <td>$r[judul]</td>
                <td>$tgl_posting</td>
		            <td><a href=?module=artikel&act=editartikel&id=$r[id_artikel]>Edit</a> | 
		                <a href='$aksi?module=artikel&act=hapus&id=$r[id_artikel]&namafile=$r[gambar]'>Hapus</a></td>
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";    
 
    break;    
   
  
  case "tambahartikel":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
          <form method=POST action='$aksi?module=artikel&act=input' enctype='multipart/form-data'>
          <div class='form-group'>
                                            <label>Judul</label>
                                            <input type='text' class='form-control' name='judul' placeholder='Judul Artikel ...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Kategori Artikel </label>
                                            <select name='label'>
            <option value=0 selected>- Pilih Kategori Artikel-</option>";
            $tampil=mysqli_query($con,"SELECT * FROM label ORDER BY nama_label");
            while($r=mysqli_fetch_array($tampil)){
              echo "<option value=$r[id_label]>$r[nama_label]</option>";
            }
    echo "</select>
    <div class='box-body pad'>
    
                                    <textarea id='editor1' name='isi_artikel' rows='10' cols='80'>
                                            Masukkan Isi Artikel Andak disini.
                                        </textarea>
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Foto Artikel</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG</i></p>
                                        </div>
                                         <div class='form-group'>
                                            <label>Tag (Label): </label>";
                                            $tag = mysqli_query($con,"SELECT * FROM tag ORDER BY tag_seo");
                                            while ($t=mysqli_fetch_array($tag)){
                                            	echo "<input type=checkbox value='$t[tag_seo]' name=tag_seo[]>$t[nama_tag] ";
                                            }
                                            echo "
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
    
    
  case "editartikel":
    $edit = mysqli_query($con,"SELECT * FROM artikel WHERE id_artikel='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);

    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Artikel</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
          <form method=POST enctype='multipart/form-data' action=$aksi?module=artikel&act=update>
          <input type=hidden name=id value=$r[id_artikel]>
          <div class='form-group'>
                                            <label>Judul</label>
                                            <input type='text' class='form-control' name='judul' value='$r[judul]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Kategori Artikel </label>
                                            <select name='label'>
            <option value=0 selected>- Pilih Kategori Artikel-</option>";
            $tampil=mysqli_query($con,"SELECT * FROM label ORDER BY nama_label");
          if ($r[id_label]==0){
            echo "<option value=0 selected>- Pilih Kategori -</option>";
          }   

          while($w=mysqli_fetch_array($tampil)){
            if ($r[id_label]==$w[id_label]){
              echo "<option value=$w[id_label] selected>$w[nama_label]</option>";
            }
            else{
              echo "<option value=$w[id_label]>$w[nama_label]</option>";
            }
          }
    echo "</select>
    <div class='box-body pad'>
    
                                    <textarea id='editor1' name='isi_artikel' rows='10' cols='80'>
                                            $r[isi_artikel]
                                        </textarea>
                                          </div>
                                          <div class='form-group'>
                                           <label for='exampleInputFile'>Preview Foto</label><br />
                                    <img src='../foto_berita/$r[gambar]' height='20%' width='20%'>  
                                    <p class='help-block'><i>Foto Artikel Yang Aktif</i></p>                                         
                                          </div>
                                          <div class='form-group'>
                                            <label for='exampleInputFile'>Edit Foto Artikel</label>
                                            <input type='file' name='fupload' id='exampleInputFile'>
                                            <p class='help-block'><i>File gambar harus berekstention .JPG / JPEG</i> Apabila gambar tidak diubah, dikosongkan saja.</p>
                                        </div>
                                         <div class='form-group'>
                                            <label>Tag (Label): </label>";
                                             $d = GetCheckboxes('tag', 'tag_seo', 'nama_tag', $r['tag']);
                                            echo "$d
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
echo "</div><!-- /.box-body -->
 </div>
                    </div>

                </section>
                <!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->";
?>
