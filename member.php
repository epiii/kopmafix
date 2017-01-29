        <!-- <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" /> -->

<script>
    function simpan() {
        if($('.barangTR').length==0){ 
            $('tbody').html('<tr><td class="alert alert-danger text-center" colspan="4">pilih barang</td></tr>')
            setTimeout(function  (argument) {
                $('tr').fadeOut('slow',function(){
                    $(this).html('');
                });
            },200);
        }else if($('#tgl_sewa').val()==''){
            alert('isi tanggal sewa');
            $('#tgl_sewa').focus();
        }else
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

    function getBarang (nox) {
        $.ajax({
            url:'memberajax.php',
            dataType:'json',
            data:'aksi=baranglist',
            type:'post',
            success:function(dt){
                console.log(arr);
                // var select='<select onchange="getTotal('+nox+')" name="selectTB[]" id="selectTB_'+nox+'">';
                var select='<select class="barangTB" onchange="barangChange('+nox+')" name="selectTB[]" id="selectTB_'+nox+'">';
                select+='<option required value="">-Pilih-</option>';
                $.each(dt,function (id,item) {
                    console.log('anu ke '+id+': '+arr[id]);
                    select+='<option '+($.inArray(item.id_produk,arr)>-1?'disabled style="background-color:#f3f3f3;"':'')+' value="'+item.id_produk+'">'+item.nama_produk+' (per '+item.durasi+' '+(item.jenisdurasi=='j'?'jam':'hari')+')</option>';
                });select+='</select>';
                $('#selectTD_'+nox).html(select);
            },
        });
    }

function barangChange (nox) {
    $.ajax({
        url:'memberajax.php',
        data:'aksi=stok&id_produk='+$('#selectTB_'+nox).val(),
        dataType:'json',
        type:'post',
        success:function(dt){
            var msg='Pilih';
            if(dt.total==0){
                msg='maaf barang kosong';
            }else if(dt.stok==0){
                msg='maaf semua barang terpinjam';
            }
            var sel='<option value="">-'+msg+'-</option>';
            if(dt.total!=0){
                for (var i = 1; i<=dt.total; i++) {
                    sel+='<option '+(i>dt.stok && dt.stok!=dt.total?'disabled style="background-color:#f3f3f3;"':'')+' value="'+i+'">'+i+'</option>';
                 }; 
            }$('#jumlahTB_'+nox).html(sel);
        },
    });
}

function getTotal (nox) {
    $.ajax({
        url:'memberajax.php',
        data:'aksi=total&id_produk='+$('#selectTB_'+nox).val(),
        dataType:'json',
        type:'post',
        success:function(dt){
            var total=parseInt(dt)*parseInt($('#jumlahTB_'+nox).val());
            $('#totalTD_'+nox).html(total);
        },
    });
}

function removeTR(nox){
    $('#barangTR_'+nox).remove();
    updateBarangArr();
}

var no=1;
var arr=[];
function updateBarangArr () {
    var jum =$('.barangTR').length;
    arr=[];
    if(jum!=0){ 
        $('.barangTB').each(function (id,item) {
            arr.push($(this).val());
        });        
    } 
}

function addBarang () {
    updateBarangArr();
    // console.log(arr);
    var barangTR='<tr class="barangTR" id="barangTR_'+no+'">'
        +'<td id="selectTD_'+no+'"></td>'
        +'<td><select class="jumlahTB" required onchange="getTotal('+no+');" name="jumlahTB[]" id="jumlahTB_'+no+'"><option value="">-Pilih Barang Dahulu-</option></select></td>'
        +'<td id="totalTD_'+no+'">Rp.0</td>'
        +'<td><a data-toggle="tooltip" title="hapus" class="btn btn-danger" onclick="removeTR('+no+');" href="#"><i class="icon-trash"></i></a></td>'
    +'</tr>';
    $('#barangTR').append(barangTR);
    getBarang(no);
    no++;
 }
    // $(function() {
    //     $('#nav a[href~="' + location.href + '"]').parents('li').addClass('active');
    // });
    // </script>
<?php
if(!isset($_SESSION['levelmember'])){
    echo "<script>location.href='memberlogin.html'</script>";
} else{
    // $aksi="modul/mod_tag/aksi_tag.php";
    echo"<div class='container'>            
    <section class='page'>
    <a class='btn ' href='memberlogout.php'>Logout</a>";
    $act    =!isset($_GET['act'])?'act':$_GET['act'];
    $idsewa =!isset($_GET['idsewa'])?'idsewa':$_GET['idsewa'];
// vd($_GET);
// vd($act);
    switch($act){
        case 'viewbeli':
            echo"
            <ol class='breadcrumb'>
                <li class='active'>Pembelian</li>
                <li class='active'>/</li>
                <li><a href='member-viewsewa-0.html'><i class='fa fa-dashboard'></i>Sewa</a></li>
            </ol>

            <h4><center>History Pembelian</center></h4><br>
            <table class='table table-hovered' >
                <tr>
                    <th class='span1'>Nama</th>
                    <td>: ".$_SESSION['namamember']."</td>
                </tr>
                <tr>
                    <th class='span1'>Anggota</th>
                    <td>: ".($_SESSION['levelmember']=='u'?'umum':'koperasi')."</td>
                </tr>
                <tr>
                    <th class='span1'>Alamat</th>
                    <td>: ".$_SESSION['alamatmember']."</td>
                </tr>
                <tr>
                    <th class='span1'>Kota</th>
                    <td>: ".$_SESSION['kotamember']."</td>
                </tr>
            </table>

            <div class='box-body table-responsive'>
            <table id='example1' class='table table-bordered table-striped'>
                <thead><tr>
                    <th>no</th>
                    <th>Tgl Order</th>
                    <th>Barang</th>
                    <th>Jumlah</th>
                    <th>Harga Satuan</th>
                    <th>Harga Diskon</th>
                    <th>Total</th>
                </tr></thead>
                <tbody>";
                $s='SELECT
                        o.id_orders,    
                        od.jumlah,
                        p.nama_produk,
                        o.tgl_order,
                        p.harga,
                        od.jumlah,
                        p.diskon
                    FROM
                        orders o 
                        JOIN orders_detail od on od.id_orders = o.id_orders
                        JOIN produk p on p.id_produk = od.id_produk 
                    WHERE
                        o.id_kustomer ='.$_SESSION['idmember'];
                // pr($s);
                $tampil=mysqli_query($con,$s);
                if(mysqli_num_rows($tampil)==0){
                    echo '<tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>';
                }else{
                    $no=1;
                    while ($r=mysqli_fetch_assoc($tampil)){
                        $hargasatuan =$r['harga'];
                        $hargadiskon =$hargasatuan-($hargasatuan*$r['diskon']/100);
                        $hargatotal  =$hargadiskon*$r['jumlah'];
                        echo "<tr><td>$no</td>
                                <td>".tgl_indo($r['tgl_order'])."</td>                
                                <td>$r[nama_produk]</td>                
                                <td>$r[jumlah]</td>                
                                <td>Rp. ".format_rupiah($hargasatuan)."</td>                
                                <td>Rp. ".format_rupiah($hargadiskon)."</td>                
                                <td>Rp. ".format_rupiah($hargatotal)."</td>                
                            </td>
                        </tr>";
                        $no++;
                    }
                }echo "</tbody>
                
            </table>";
        break;

        case 'viewsewa':
            echo"
            <ol class='breadcrumb'>
                <li class='active'>
                    <a href='member-viewbeli-0.html'><i class='fa fa-dashboard'></i>Pembelian</a>
                </li>
                <li class='active'>/ Sewa</li>
            </ol>

            <h4><center>History Sewa</center></h4><br>
            <table class='table table-hovered' >
                <tr>
                    <th class='span1'>Nama</th>
                    <td>: ".$_SESSION['namamember']."</td>
                </tr>
                <tr>
                    <th class='span1'>Anggota</th>
                    <td>: ".($_SESSION['levelmember']=='u'?'umum':'koperasi')."</td>
                </tr>
                <tr>
                    <th class='span1'>Alamat</th>
                    <td>: ".$_SESSION['alamatmember']."</td>
                </tr>
                <tr>
                    <th class='span1'>Kota</th>
                    <td>: ".$_SESSION['kotamember']."</td>
                </tr>
            </table>
            <div class='box-body table-responsive'>
            <div class='box-header'>
                <h3 class='box-title'>
                    <input type=button class='btn btn-primary btn' value='Tambah Sewa'
                    onclick=\"window.location.href='member-tambahsewa-0.html';\">
                </h3>
            </div>
            <table id='example1' class='table table-bordered table-striped'>
                <thead><tr>
                    <th>no</th>
                    <th>Keperluan</th>
                    <th>Tgl Sewa</th>
                    <th>Jam Sewa</th>
                    <th>Produk</th>
                    <th>Durasi</th>
                    <th>Jumlah</th>
                    <th>harga</th>
                    <th>total</th>
                    <th>status</th>
                    <th>aksi</th>
                </tr></thead>
                <tbody>";
                $s='SELECT *
                    FROM
                        orders_sewa o
                        JOIN orders_detail_sewa od ON od.id_order_sewa= o.id_order_sewa
                        JOIN produk p ON p.id_produk = od.id_produk
                    WHERE
                        o.id_kustomer ='.$_SESSION['idmember'];
                // vd($s);
                $tampil=mysqli_query($con,$s);
                if(mysqli_num_rows($tampil)==0){
                    echo '<tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>';
                }else{
                    $no=1;
                    while ($r=mysqli_fetch_assoc($tampil)){
                        $lev ='harga'.($_SESSION['levelmember']=='k'?'koperasi':'umum');
                        $hrg =format_rupiah($r[$lev]);
                        $tot =format_rupiah($r[$lev]*$r['total']);
                        $btn='<a disabled class="btn" href="#">Delete</a>';
                        if($r['status']=='p'){
                            $stat='Pending';
                            $clr='';
                            $btn='<a class="btn btn-danger" href="member-hapussewa-'.$r['id_order_detail_sewa'].'.html">Delete</a>';
                        }elseif($r['status']=='b'){
                            $clr='green';
                            $stat='Belum Kembali';
                        }elseif($r['status']=='k'){
                            $clr='info';
                            $stat='Sudah Kembali';
                        }else{
                            $clr='danger';
                            $stat='Terlambat Kembali';
                        }
                        echo "<tr><td>$no</td>
                                <td>$r[keterangan]</td>                
                                <td>".tgl_indo($r['tgl_sewa'])."</td>                
                                <td>".jam_indo($r['tgl_sewa'])."</td>                
                                <td>$r[nama_produk]</td>                
                                <td>per $r[durasi] ".($r['jenisdurasi']=='h'?'hari':'jam')."</td>                
                                <td>$r[total]</td>                
                                <td>Rp. ".$hrg."</td>                
                                <td>Rp. ".$tot."</td>                
                                <td class='bg-".$clr."'>".$stat."</td>                
                                <td>".$btn."</td>                
                            </td>
                        </tr>";
                        $no++;
                    }
                }echo "</tbody>
            </table>";
        break;
 
        case "tambahsewa":
            // <form method=POST action='$aksi?module=tag&act=input'>
            echo "
            <section class='content'>
                <ol class='breadcrumb'>
                    <li>
                        <a href='member-viewbeli-0.html'><i class='fa fa-dashboard'></i>Pembelian</a>
                    </li>
                    <li class='active'>/</li>
                    <li>
                        <a href='member-viewbeli-0.html'><i class='fa fa-dashboard'></i>Sewa</a>
                    </li>
                    <li class='active'>/ Tambah Sewa</li>
                </ol>
                <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-header'>
                                    <h3 class='box-title'>Tambah <small>Sewa</small></h3>
                                </div><!-- /.box-header -->

                        <div class='box-body pad'>
                            <form method=POST onsubmit='simpan(); return false;'>
                                <div class='form-group'>
                                    <label>Keterangan</label>
                                    <input type='text' class='form-control' name='keterangan' placeholder='keterangan'/>
                                    <input id='id_order' name='id_order' type='hidden'>
                                    <input name='id_kustomer' type='hidden' value='".$_SESSION['idmember']."'>
                                </div>
                                <div class='input-group date'  data-date-format='dd-mm-yyyy' data-provide='datepicker'>
                                    <label>Tanggal Sewa</label>
                                    <input required  readonly placeholder='tanggal sewa' name='tgl_sewa' id='tgl_sewa' type='text' class='datepicker form-control'>
                                    <div class='input-group-addon'>
                                        <i class='glyphicon glyphicon-th'></i>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label>Jam</label>
                                    <select required class='span1 control-input' name='jam'>
                                        <option value=''>-jam-</option>";
                                    for ($i=0; $i <=23 ; $i++) {
                                        $i=$i<10?'0'.$i:$i; 
                                        echo'<option value="'.$i.'">'.$i.'</option>';
                                    }
                                echo'</select> : <select required class="span1 control-input" name="menit">
                                    <option value="">-menit-</option>';
                                    for ($i=0; $i <60 ; $i++) { 
                                        $i=$i<10?'0'.$i:$i; 
                                        echo'<option value="'.$i.'">'.$i.'</option>';
                                    }
                                echo" </select></div>
                                <!--<div class='well'>
                                  <div id='datetimepicker1' class='input-append date'>
                                    <input data-format='dd/MM/yyyy hh:mm:ss' type='text'></input>
                                    <span class='add-on'>
                                      <i data-time-icon='icon-time' data-date-icon='icon-calendar'>
                                      </i>
                                    </span>
                                  </div>
                                </div>-->

                                <div class='box box-info'>
                                    <a onclick='addBarang();' href='#' class='btn btn-primary'><i class='icon-plus'></i> Barang</a>
                                    <table class='table table-striped'>
                                        <thead><tr>
                                            <th>Nama</th>
                                            <th>Jumlah</th>
                                            <th>Harga Total</th>
                                            </tr></thead>
                                        <tbody id='barangTR'>
                                        </tbody>
                                    </table>
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

        case "hapussewa":

            $s='DELETE FROM orders_detail_sewa WHERE id_order_detail_sewa='.$_GET['idsewa'];
            // vd()
            $e=mysqli_query($con,$s);
            if($e) echo '<script>location.href="member-viewsewa-0.html"</script>';
             else echo '<script>alert(\'gagal hapus\');"</script>';
        break;
/*
        case "edittag":
            $edit=mysqli_query($con,"SELECT * FROM tag WHERE id_tag='$_GET[id]'");
            $r=mysqli_fetch_array($edit);
            echo "<section class='content'>
                            <div class='row'>
                                <div class='col-md-12'>
                                    <div class='box box-info'>
                                        <div class='box-header'>
                                            <h3 class='box-title'>Edit <small>Tag Artikel</small></h3>
                                            <!-- tools box -->
                                            <div class='pull-right box-tools'>
                                                <button class='btn btn-info btn-sm' data-widget='collapse' data-toggle='tooltip' title='Collapse'><i class='fa fa-minus'></i></button>
                                                <button class='btn btn-info btn-sm' data-widget='remove' data-toggle='tooltip' title='Remove'><i class='fa fa-times'></i></button>
                                            </div><!-- /. tools -->
                                        </div><!-- /.box-header -->
                                        <div class='box-body pad'>
                                        <form method=POST action='$aksi?module=tag&act=update'>
                                        <input type=hidden name=id value='$r[id_tag]'>
                                        <div class='form-group'>
                                                    <label>Nama Kategori</label>
                                                    <input type='text' class='form-control' name='nama_tag' value='$r[nama_tag]'>
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
        break;*/  
    }
    echo"</section></div>";
}
?>
<script>
    // $(function() {
    //     $('#datetimepicker1').datetimepicker({
            // language: 'pt-BR'
    //     });
    // });

// $('.datepicker').datepicker({
//     format: 'mm/dd/yyyy',
//     startDate: '-3d'
// });
</script>