<script>
  function memberKat(x){
    if(x=='u'){
      $('.fakjur').attr('style','display:none;');
      $('#jurusan').removeAttr('required');
    }else{
      $('.fakjur').removeAttr('style');
      $('#jurusan').attr('required',true);
    } 
  }
  function combojur(x){
    $.ajax({
      url:'modul/mod_member/memberajax.php',
      data:'aksi=combojur&id_fakultas='+x,
      dataType:'json',
      type:'post',
      success:function(dt){
        if(dt.msg!=true) {
          alert(dt.msg);
        }else{
          var opt='<option value="">-Pilih Jurusan-</option>';
          $.each(dt.data,function (id,item) {
            opt+='<option value="'+item.id_jurusan+'">'+item.jurusan+'</option>'
          });$('#jurusan').html(opt);
        }
      }
    });
  }
</script>

<?php
// session_start();
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
  $aksi="modul/mod_member/aksi_member.php";
  echo " <aside class='right-side'>
            <!-- Content Header (Page header) -->
            <section class='content-header'>
                <h1>
                    Data
                    <small>Member</small>
                </h1>
                <ol class='breadcrumb'>
                    <li><a href='#'><i class='fa fa-dashboard'></i> Home</a></li>
                    <li class='active'>Data Member</li>
                   
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
          $s='SELECT *
              FROM
                kustomer k
                LEFT JOIN kota ko ON ko.id_kota = k.id_kota
                LEFT JOIN jurusan j ON j.id_jurusan = k.id_jurusan
                LEFT JOIN fakultas f ON f.id_fakultas = j.id_fakultas
              ORDER BY
                nama_lengkap';
          $tampil = mysqli_query($con,$s);
          // vd($tampil);
          echo "
           <div class='box-header'>
            <h3 class='box-title'>
            <input type=button class='btn btn-primary btn' value='Tambah Member' onclick=\"window.location.href='?module=member&act=tambahuser';\">
            
            <div class='btn-group' role='group' aria-label='...'>
              <div class='btn-group' role='group'>
                <button type='button' class='btn btn-success dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                  Cetak Member
                  <span class='caret'></span>
                </button>
                <ul class='dropdown-menu'>
                  <li><a target='_blank' href='modul/mod_member/lap_member2.php?mode=koperasi'>Koperasi</a></li>
                  <li><a target='_blank'  href='modul/mod_member/lap_member2.php?mode=umum'>Umum</a></li>
                </ul>
              </div>
            </div>
  
            <div class='btn-group' role='group' aria-label='...'>
              <div class='btn-group' role='group'>
                <button type='button' class='btn btn-success dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                  Cetak Member (mpdf)
                  <span class='caret'></span>
                </button>
                <ul class='dropdown-menu'>
                  <li><a target='_blank' href='modul/mod_member/lap_member.php?mode=koperasi'>Koperasi</a></li>
                  <li><a target='_blank'  href='modul/mod_member/lap_member.php?mode=umum'>Umum</a></li>
                </ul>
              </div>
            </div>

          </h3>
            </div><!-- /.box-header -->
            <div class='box-body table-responsive'>

            <table id='example1' class='table table-bordered table-striped'>
              <thead>";
      }else{
        // $tampil=mysqli_query($con,'SELECT * FROM member WHERE username="'.$_SESSION['namauser'].'"');
        $s='SELECT * FROM kustomer WHERE username="'.$_SESSION['namauser'].'"';
        // vd($s);
        $tampil=mysqli_query($con,$s);
        echo " <div class='box-header'>
                  <h3 class='box-title'>
                       Data User</h3>
                    </div><!-- /.box-header -->
                    <div class='box-body table-responsive'>
                <table id='example1' class='table table-bordered table-striped'>
                <thead><table id='example1' class='table table-bordered table-striped'>
                <thead>";
      }
      echo "<tr>
      <th>No</th>
      <th>Nama Lengkap</th>
      <th>Email</th>
      <th>Telpon</th>
      <th>Alamat</th>
      <th>Kota</th>
      <th>Foto User</th>          
      <th>Kategori</th>
      <th>Blokir</th>
      <th>Aksi</th>
      </tr></thead><tbody>"; 
      $no=1;
      // vd($no);
      while ($r=mysqli_fetch_assoc($tampil)){
        // vd($r);
        echo "<tr>
          <td class='center' width='10'>$no</td>
               <td class='left'>$r[nama_lengkap]</td>
               <td class='left'>$r[email]</td>
               <td class='left'>$r[telpon]</td>
               <td class='left'>$r[alamat]</td>
               <td class='left'>$r[nama_kota]</td>
               <td class='left'><img src='../foto_banner/$r[foto]' width='100' height='100'></td>
               <td class='left'>".
                ($r['kategori']=='k'?'koperasi':'umum')."<br>".
                ($r['id_jurusan']==0?'':'('.$r['fakultas'].'-'.$r['jurusan'].')')
                ."</td>
               <td class='left'>$r[blokir]</td>
               <td class='center'>
                  <a class='btn btn-info' href='?module=member&act=editmember&id=$r[id_kustomer]'>
          					<i class='icon-edit icon-white'></i>  
          					Edit                                            
          				</a>
          				<a class='btn btn-danger' href='$aksi?module=member&act=delcon&id=$r[id_kustomer]'>
          					<i class='icon-trash icon-white'></i> 
          					Delete
          				</a>
          			</td>
          	</tr>";
        $no++;
      }echo "</tbody></table>";
    break;

  case "tambahuser":
    if ($_SESSION['leveluser']=='admin'){
      // vd($aksi);
    echo "
    <section class='content'>
        <div class='row'>
            <div class='col-md-12'>
                <div class='box box-info'>
                    <div class='box-header'>
                        <h3 class='box-title'>Tambah <small>Member</small></h3>
                        <!-- tools box -->
                        <div class='pull-right box-tools'>
                            <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                            <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                        </div><!-- /. tools -->
                    </div><!-- /.box-header -->
                    <div class='box-body pad'>
                     <form method=POST action='$aksi?module=member&act=input' enctype='multipart/form-data'>
                             <div class='form-group'>
                                <label>Email</label>
                                <input required  type='text' class='form-control' name='email' placeholder='Email ...'/>
                            </div>
                             <div class='form-group'>
                                <label>Password</label>
                                <input required  type='password' class='form-control' name='password' placeholder='Password ...'/>
                            </div>
                             <div class='form-group'>
                                <label>Kategori Member</label>
                                <select onchange='memberKat(this.value);' class='form-control' name='kategori' id='kategori'>
                                  <option value='u'>umum</option>
                                  <option value='k'>koperasi</option>
                                </select>
                            </div>
                            <div style='display:none;' class='fakjur' class='form-group'>
                                <label style='color:red;'>Fakutas <small>(Hanya member koperasi)</small></label>
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
                            <div style='display:none;' class='fakjur' class='form-group'>
                                <label style='color:red;'>Jurusan <small>(Hanya member koperasi)</small></label>
                                <select class='form-control' name='jurusan' id='jurusan'>
                                  <option value=''>-Pilih Fakultas-</option>
                                </select>
                            </div>
                             <div class='form-group'>
                                <label>Nama Lengkap</label>
                                <input required type='text' class='form-control' name='nama_lengkap' placeholder='Nama Lengkap ...'/>
                            </div>
                             <div class='form-group'>
                                <label>No.Telp</label>
                                <input type='text' class='form-control' name='no_telp' placeholder='No.Telp ...'/>
                            </div>
                             <div class='form-group'>
                                <label>Alamat</label>
                                <input type='text' class='form-control' name='alamat' placeholder='alamat'/>
                            </div>
                             <div class='form-group'>
                                <label>Kota</label>
                                <select required class='form-control' name='kota'>";
                            $sk='SELECT * FROM kota order by nama_kota';
                            $ek=mysqli_query($con,$sk);
                            echo '<option value="">-Pilih-</option>';
                            while ($rk=mysqli_fetch_assoc($ek)) {
                                echo '<option value="'.$rk['id_kota'].'">'.$rk['nama_kota'].'</option>';
                            }echo"</select>
                            </div>
                            <div class='form-group'>
                                <label>Blokir</label>
                                <select class='form-control' name='blokir'>
                                  <option value='N'>Tidak</option>
                                  <option value='Y'>Ya</option>
                                </select>
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
    
  case "editmember":
    $s='SELECT *
        FROM kustomer k
          LEFT JOIN kota ko ON ko.id_kota = k.id_kota
          LEFT JOIN jurusan j ON j.id_jurusan = k.id_jurusan
          LEFT JOIN fakultas f ON f.id_fakultas = j.id_fakultas
        WHERE id_kustomer ='.$_GET['id'].' 
        ORDER BY nama_lengkap';

    $edit=mysqli_query($con,$s);
    $r=mysqli_fetch_assoc($edit);
  // vd($r);

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
           <form method=POST action=$aksi?module=member&act=update enctype='multipart/form-data'>
            <input type=hidden name=id value='$r[id_kustomer]'>
            <div class='form-group'>
                  <label>Email</label>
                   <input required type='email' class='form-control' placeholder='$r[email]' disabled/>
              </div>
               <div class='form-group'>
                  <label>Password</label>
                  <input type='password' class='form-control' name='password' placeholder='Password Baru...'/>
              </div>
               <div class='form-group'>
                  <label>Kategori Member</label>
                  <select onchange='memberKat(this.value);' class='form-control' name='kategori' id='kategori'>
                    <option ".($r['kategori']=='u'?'selected':'')." value='u'>umum</option>
                    <option ".($r['kategori']=='k'?'selected':'')." value='k'>koperasi</option>
                  </select>
              </div>
              <div ".($r['id_jurusan']!=0?'':"style='display:none;'")." class='fakjur' class='form-group'>
                  <label style='color:red;'>Fakutas <small>(Hanya member koperasi)</small></label>
                  <select onchange='combojur(this.value);' class='form-control' name='fakultas'>
                    <option value=''>-Pilih-</option>";
                      $ss='SELECT * from fakultas order by fakultas';
                      $ee=mysqli_query($con,$ss);
                      while ($rr=mysqli_fetch_assoc($ee)) {
                        echo '<option '.($r['id_fakultas']==$rr['id_fakultas']?'selected':'').' 
                        value="'.$rr['id_fakultas'].'">'.$rr['fakultas'].'</option>';
                      }echo"
                  </select>
              </div>
              <div ".($r['id_jurusan']!=0?'':"style='display:none;'")." class='fakjur' class='form-group'>
                  <label style='color:red;'>Jurusan <small>(Hanya member koperasi)</small></label>
                  <select class='form-control' name='jurusan' id='jurusan'>
                    <option value=''>-Pilih Jurusan-</option>";
                      $sj='SELECT * from jurusan where id_fakultas='.$r['id_fakultas'].' order by jurusan';
                      $ej=mysqli_query($con,$sj);
                      while ($rj=mysqli_fetch_assoc($ej)) {
                        echo '<option '.($r['id_jurusan']==$rj['id_jurusan']?'selected':'').' 
                        value="'.$rj['id_jurusan'].'">'.$rj['jurusan'].'</option>';
                      }echo"
                  </select>
              </div>
               <div class='form-group'>
                  <label>Nama Lengkap</label>
                  <input required type='text' class='form-control' name='nama_lengkap' value='$r[nama_lengkap]'/>
              </div>
             <div class='form-group'>
                  <label>No.Telp</label>
                  <input type='number' class='form-control' name='no_telp' value='$r[telpon]'/>
              </div>
              <div class='form-group'>
                  <label>Alamat</label>
                  <input type='text' class='form-control' name='alamat' value='$r[alamat]'/>
              </div>
             <div class='form-group'>
                    <label>Kota</label>
                    <select class='form-control' name='kota'>";
                $sk='SELECT * FROM kota order by nama_kota';
                $ek=mysqli_query($con,$sk);
                echo '<option value="">-Pilih-</option>';
                while ($rk=mysqli_fetch_assoc($ek)) {
                    echo '<option '.($rk['id_kota']==$r['id_kota']?'selected':'').' value="'.$rk['id_kota'].'">'.$rk['nama_kota'].'</option>';
                }
                echo"</select>
                </div>
                ";

                if ($r['blokir']=='N'){
                  echo " <label>Status Blokir </label><input type=radio name='blokir' value='Y'> Y   
                                                       <input type=radio name='blokir' value='N' checked> N ";
                }else{
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
                                 <form method=POST action=$aksi?module=member&act=update enctype='multipart/form-data'>
          <input type=hidden name=id value='$r[id_session]'>
                                  <div class='form-group'>
                                            <label>Username</label>
                                             <input type='text' class='form-control' placeholder='$r[username]' disabled/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Password</label>
                                            <input type='password' class='form-control' name='password' placeholder='Password Baru...'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Nama Lengkap</label>
                                            <input required type='text' class='form-control' name='nama_lengkap' value='$r[nama_lengkap]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Alamat</label>
                                            <input type='text' class='form-control' name='alamat' value='$r[alamat]'/>
                                        </div>
                                         <div class='form-group'>
                                            <label>Email</label>
                                            <input required  type='text' class='form-control' name='email' value='$r[email]'/>
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
