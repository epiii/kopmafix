<script>
function status(e){
  if(e=='k'||e=='t') $('.pengembalian').removeAttr('style');
  else $('.pengembalian').attr('style','display:none;');
}
  function validasi(e){
    e.preventDefault();
    // if($('form').val()==''){
    //   alert('kosong');
    // }else{
    //   alert('ok');
    // }
  }
    function simpan () {
        // if($('.barangTR').length==0){ 
        //     $('tbody').html('<tr><td class="alert alert-danger text-center" colspan="4">pilih barang</td></tr>')
        //     setTimeout(function  (argument) {
        //         $('tr').fadeOut('slow',function(){
        //             $(this).html('');
        //         });
        //     },200);
        // }else if($('#tgl_sewa').val()==''){
        //     alert('isi tanggal sewa');
        //     $('#tgl_sewa').focus();
        // }else
            $.ajax({
                url:'memberajax.php',
                dataType:'json',
                data:'aksi=simpan&'+$('form').serialize(),
                type:'post',
                success:function(dt){
                    alert(dt.success?'berhasil disimpan':'gagal');
                    if(dt.success)location.href='member-viewsewa-0.html';
                },
            });
    }
</script>
<?php
if (empty($_SESSION['namauser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
  $aksi = "modul/mod_sewa/aksi_sewa.php";
  echo "
  <aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>sewa</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data sewa</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'':$_GET['act'];
switch($act){
  default:
    echo "   
      <div class='box-header'>
      <h3 class='box-title'>

      </h3>
      </div><!-- /.box-header -->
      <div class='box-body table-responsive'>

      <table id='example1' class='table table-bsewaed table-striped'>
      <thead>
      <tr>
        <th>No.</th>
        <th>Nama Kostumer</th>
        <th>Keperluan</th>
        <th>Barang</th>
        <th>Biaya</th>
        <th>Jumlah</th>
        <th>Biaya Total</th>
        <th>Tgl/Jam Sewa</th>
        <th>Tgl/Jam Kembali</th>
        <th>Status</th>
        <th>Aksi</th>
      </tr>
      </thead><tbody>";
    
    $no=1;
    $s='SELECT *,
          IF(k.kategori="k",p.hargakoperasi,p.hargaumum)hargasatuan,
          IF(p.jenisdurasi="h","hari","jam")jenisdurasi,
          case ds.status
            when "b" then "belum kembali"
            when "k" then "sudah kembali"
            when "p" then "pending"
            else "terlambat"
          end as statussewa

        FROM
          orders_sewa s
          JOIN orders_detail_sewa ds ON ds.id_order_sewa = s.id_order_sewa
          JOIN kustomer k ON k.id_kustomer = s.id_kustomer
          JOIN produk p on p.id_produk = ds.id_produk';

      // vd($s);
    $tampil = mysqli_query($con,$s);
    while($r=mysqli_fetch_assoc($tampil)){
      $tanggal  =tgl_indo($r['tgl_sewa']);
      $jam      =jam_indo($r['tgl_sewa']);
      $tanggal2 =$r['tgl_kembali']=='0000-00-00 00:00:00'?'-':tgl_indo($r['tgl_kembali']);
      $jam2     =$r['tgl_kembali']=='0000-00-00 00:00:00'?'-':jam_indo($r['tgl_kembali']);
      echo "<tr><td align=center>$no</td>
                <td>$r[nama_lengkap]</td>
                <td>$r[keterangan]</td>
                <td>$r[nama_produk]</td>
                <td>Rp. ".(format_rupiah($r['hargasatuan']))." / ".($r['durasi'].' '.$r['jenisdurasi'])."</td>
                <td>$r[total]</td>
                <td>Rp. ".(format_rupiah($r['total']*$r['hargasatuan']))."</td>
                <td>$tanggal <br>$jam</td>
                <td>$tanggal2 <br>$jam2</td>
                <td>$r[statussewa]</td>
                <td class='center'>
                  <a class='btn btn-info' href='?module=sewa&act=detailsewa&id=$r[id_order_detail_sewa]'>
                    <i class='icon-edit icon-white'></i>  
          					Detail                                            
          				</a>
                </td></tr>";
      $no++;
    }echo "</tbody></table>";
  break;
  
  case "detailsewa":
    $s='SELECT *,
          IF(k.kategori="k",p.hargakoperasi,p.hargaumum)hargasatuan,
          IF(p.jenisdurasi="h","hari","jam")jenisdurasi,
          case ds.status
            when "b" then "belum kembali"
            when "k" then "sudah kembali"
            when "p" then "pending"
            else "terlambat"
          end as statussewa
        FROM
          orders_sewa s
          JOIN orders_detail_sewa ds ON ds.id_order_sewa = s.id_order_sewa
          JOIN kustomer k ON k.id_kustomer = s.id_kustomer
          JOIN produk p on p.id_produk = ds.id_produk 
        WHERE id_order_detail_sewa='.$_GET['id'];
    $edit     = mysqli_query($con,$s);
    $r        = mysqli_fetch_assoc($edit);
    $totBiaya = $r['total']*$r['hargasatuan'];
    $date     = getdate();
    
    echo "
      <div class='container'>
        <section class='content-header'>
          <h1>Data Sewa Barang</h1>
        </section>

          <div class='table-responsive'>
          <form method='POST' action='$aksi?module=sewa&act=update' onsubmit='validasi(e);'>
            <input type='hidden' name='id_order_detail_sewa' value='$r[id_order_detail_sewa]'>
            <table class='table table-striped'>
              <tbody>
                <tr>
                  <th style='width:15%'>Nama Kustomer </th>
                  <td>: ".$r['nama_lengkap']."</td>
                </tr>
                <tr>
                  <th style='width:15%'>Barang </th>
                  <td>: ".$r['nama_produk']."</td>
                </tr>
                <tr>
                  <th style='width:15%'>Biaya </th>
                  <td>: Rp. ".format_rupiah($r['hargasatuan'])."</td>
                </tr>
                <tr>
                  <th style='width:15%'>Jumlah </th>
                  <td>: ".$r['total']."</td>
                </tr>
                <tr>
                  <th style='width:15%'>Biaya Total </th>
                  <td>: Rp. ".format_rupiah($totBiaya)."</td>
                </tr>
                <tr>
                  <th style='width:15%'>Tgl / Jam Sewa </th>
                  <td>: ".tgl_indo($r['tgl_sewa'])." / ".jam_indo($r['tgl_sewa'])."</td>
                </tr>";
                
                echo'<tr>
                    <th style="width:15%">Status </th>
                    <td>
                      <div class="form-group">: 
                        <select onchange="status(this.value);" class="span3 control-input" name="statussewa">
                          <option '.($r['status']=='p'?'selected':'').' value="p">Pending</option>
                          <option '.($r['status']=='b'?'selected':'').' value="b">Terpinjam</option>
                          <option '.($r['status']=='k'?'selected':'').' value="k">Sudah Kembali</option>
                        </select>
                      </div></td>
                  </tr>';

                echo"<tr ".(($r['status']=='p'||$r['status']=='b')?'style=\'display:none\'':'')." class='pengembalian'>
                  <th style='width:15%'>Tgl Kembali </th>
                  <td>
                    <div class='input-group date' data-date-format='dd-mm-yyyy' data-provide='datepicker'>
                      : <input  value='".($date['mday'].'-'.$date['mon'].'-'.$date['year'])."' required  readonly placeholder='tanggal Kembali' name='tgl_kembali' id='tgl_kembali' 
                        type='text' xclass='span3 datepicker form-control '>
                      <div class='input-group-addon'>
                          <i class='glyphicon glyphicon-th'></i>
                      </div>
                    </div>
                  </td> 
                </tr>
                <tr  ".(($r['status']=='p'||$r['status']=='b')?'style=\'display:none\'':'')."  class='pengembalian'>
                  <th style='width:15%'>Jam Kembali </th>
                  <td>: <select required class='span1 control-input' name='jam'>
                       <option value=''>-jam-</option>";
                        for ($i=0; $i <=23 ; $i++) {
                            $i=$i<10?'0'.$i:$i; 
                            echo'<option '.($i==$date['hours']?'selected':'').' value="'.$i.'">'.$i.'</option>';
                        }
                    echo'</select> : <select required class="span1 control-input" name="menit">
                        <option value="">-menit-</option>';
                        for ($i=0; $i <60 ; $i++) { 
                            $i=$i<10?'0'.$i:$i; 
                            echo'<option '.($i==$date['minutes']?'selected':'').' value="'.$i.'">'.$i.'</option>';
                        }
                    echo" </select></td>";
                echo"</tbody>
              </table>
              <button class='btn btn-info'>Simpan</button>
            </form>
          </div>
      </div>
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
