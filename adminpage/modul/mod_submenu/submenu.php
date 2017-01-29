<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
        <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_submenu/aksi_submenu.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Submenu</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Produk</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'act':$_GET['act'];
switch($act){
  // Tampil Sub Menu
  default:
    echo " <div class='box-header'>
<h3 class='box-title'>
<input type=button class='btn btn-primary btn' value='Tambah Sub Menu' onclick=\"window.location.href='?module=submenu&act=tambahsubmenu';\">
</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
    <thead>
              <tr><td class='center'>No</td>
          <td class='center'>Sub Menu</td>
          <td class='center'>Menu Utama</td>
          <td class='left'>Link Submenu</td>
          <td class='center'>Aktif</td>
          
          <td class='center'>aksi</td></tr></thead><tbody>";          

    $tampil = mysqli_query($con,"SELECT * FROM submenu,menuutama WHERE submenu.id_main=menuutama.id_main");
  
    $no = 1;
    while($r=mysqli_fetch_array($tampil)){
	if($r['id_submain']!=0){
		$sub = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM submenu WHERE id_sub=$r[id_submain]"));
		$menuutama = $r['nama_menu']." &gt; ".$sub['nama_sub'];
	} else {
		$menuutama = $r['nama_menu'];
	}
      echo "<tr><td class='left' width='25'>$no</td>
                <td class='left'>$r[nama_sub]</td>
                <td class='left'>$menuutama</td>
                <td class='left'>$r[link_sub]</td>
                <td class='center'>$r[aktif]</td>
               
		            <td class='center'>
		         <a class='btn btn-info' href='?module=submenu&act=editsubmenu&id=$r[id_sub]'>
										<i class='icon-edit icon-white'></i>  
										Edit                                            
									</a>
									<a class='btn btn-danger' href='$aksi?module=submenu&act=hapus&id=$r[id_sub]'>
										<i class='icon-trash icon-white'></i> 
										Delete
									</a>
								</td>
		        </tr>";
      $no++;
    }
    echo "</tbody></table>";
    break;
  
  case "tambahsubmenu":
    echo "<section class='content'>

                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Sub Menu</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action='$aksi?module=submenu&act=input'>
                                 <div class='form-group'>
                                            <label>Nama Sub Menu</label>
                                            <input type='text' class='form-control' name='nama_sub' placeholder='Nama Sub-Menu ...'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Menu Utama</label>
                                            <select name='menu_utama' class='form-control'>
                                                <option value=0 selected>- Pilih Menu Utama -</option>";
                                                $tampil=mysqli_query($con,"SELECT * FROM menuutama WHERE aktif='Y' ORDER BY nama_menu");
            while($r=mysqli_fetch_array($tampil)){
              echo "<option value=$r[id_main]>$r[nama_menu]</option>";
            }
    echo "</select>
     <div class='form-group'>
                                            <label>Sub Menu</label>
                                            <select name='sub_menu' class='form-control'>
                                                <option value=0 selected>- Pilih Sub Menu Dari Menu Utama -</option>";
                                                $tampil=mysqli_query($con,"SELECT * FROM menuutama WHERE aktif='Y' ORDER BY nama_menu");
            while($r=mysqli_fetch_array($tampil)){
              echo "<option value=$r[id_main]>$r[nama_menu]</option>";
            }
    echo "</select>
    <div class='form-group'>
                                            <label>Link Sub Menu</label>
                                            <input type='text' class='form-control' name='link_sub' placeholder='Link Sub Menu ...'/>
                                        </div>
                                        <div class='form-group'>
                                         <label>Status Sub Menu</label>
                                            <div class='radio'>
                                            
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios1' value='Y' checked>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='aktif' id='optionsRadios2' value='N'>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>
                                            </div>                                            
                                        </div>
                                        <div class='form-group'>
                                         <label>Sub Menu Dari Submenu</label>
                                            <div class='radio'>
                                            
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios1' value='Y' checked>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios2' value='N'>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>
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
    
  case "editsubmenu":
    $edit = mysqli_query($con,"SELECT * FROM submenu WHERE id_sub='$_GET[id]'");
    $r    = mysqli_fetch_assoc($edit);
    // vd($r);
    echo "<section class='content'>
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Edit <small>Sub Menu</small></h3>
                                    <!-- tools box -->
                                    <div class='pull-right box-tools'>
                                        <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                        <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class='box-body pad'>
                                <form method=POST action=$aksi?module=submenu&act=update>
          <input type=hidden name=id value=$r[id_sub]>
                                 <div class='form-group'>
                                            <label>Nama Sub Menu</label>
                                            <input type='text' class='form-control' name='nama_sub' value='$r[nama_sub]'/>
                                        </div>
                                        <div class='form-group'>
                                            <label>Menu Utama</label>
                                            <select name='menu_utama' class='form-control'>
                                                <option value=0>- Pilih Menu Utama -</option>";
                                                $tampil=mysqli_query($con,"SELECT * FROM menuutama WHERE aktif='Y' ORDER BY nama_menu");
          if ($r['id_main']==0){
            echo "<option value=0 selected>- Pilih Menu Utama -</option>";
          }   
          while($w=mysqli_fetch_assoc($tampil)){
            if ($r['id_main']==0 || ($r['id_main']!=0 && $r['id_submain']!=0)){
              echo "<option value=$w[id_main] selected>$w[nama_menu]</option>";
            }else{
              echo "<option selected value=$w[id_main]>$w[nama_menu]</option>";
            }
          }
    echo "</select>
     <div class='form-group'>
                                            <label>Sub Menu</label>
                                            <select name='sub_menu' class='form-control'>
                                                <option value=0 selected>- Pilih Sub Menu Dari Menu Utama -</option>";
                                                $tampil2=mysqli_query($con,"SELECT * FROM submenu WHERE id_submain=0 AND aktif='Y' ORDER BY nama_sub");
          if ($r['id_submain']==0){
            echo "<option value=0 selected>- Pilih Sub Menu -</option>";
          }   
          while($s=mysqli_fetch_array($tampil2)){
            if ($r['id_submain']==$s['id_sub']){
              echo "<option value=$s[id_sub] selected>$s[nama_sub]</option>";
            }
            else{
              echo "<option value=$s[id_sub]>$s[nama_sub]</option>";
            }
          }
    echo "</select>
    <div class='form-group'>
                                            <label>Link Sub Menu</label>
                                            <input type='text' class='form-control' name='link_sub' value='$r[link_sub]'/>
                                        </div>
                                        <div class='form-group'>
                                         <label>Status Sub Menu</label>
                                            <div class='radio'>";
                                             if ($r['aktif']=='Y'){
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
    	echo" <label>
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
                                         <label>Sub Menu Dari Submenu</label>
                                            <div class='radio'>";
                                            if ($r['aktif']=='Y'){
                                            	echo "                                            
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios1' value='Y' checked>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios2' value='N'>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>";
                                              }
                                              else{
                                              echo "                                            
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios1' value='Y'>
                                                    Y, Maka Menu AKTIF
                                                </label>
                                            </div>
                                            <div class='radio'>
                                                <label>
                                                    <input type='radio' name='adminsubmenu' id='optionsRadios2' value='N' checked>
                                                  N, Maka Menu TIDAK AKTIF
                                                </label>";
                                              }
                                              echo "                                              
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
