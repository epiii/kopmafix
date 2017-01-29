<?php
// session_start();
// include "../../../config/library.php";
// include "../config/library.php";
 // if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
if (empty($_SESSION['namauser'])){
echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_order/aksi_order.php";
echo "
<aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Data
                        <small>Order</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li class='active'>Data Order</li>
                       
                    </ol>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                   
<div class='box'>";
$act=!isset($_GET['act'])?'':$_GET['act'];
switch($act){
// switch($_GET['act']){
  // Tampil Order
  default:
    echo "   
    <div class='box-header'>
<h3 class='box-title'>

</h3>
                                </div><!-- /.box-header -->
                                <div class='box-body table-responsive'>
    
    <table id='example1' class='table table-bordered table-striped'>
                                        <thead>
          <tr><th>No.</th><th>No.Order</th><th>Nama Kostumer</th><th>Tgl. Order</th><th>Jam Order</th><th>Status</th><th>Aksi</th></tr>
           </thead><tbody>";

    
$no=1;
    $tampil = mysqli_query($con,"SELECT * FROM orders,kustomer WHERE orders.id_kustomer=kustomer.id_kustomer ORDER BY id_orders DESC");
  
    while($r=mysqli_fetch_array($tampil)){
      $tanggal=tgl_indo($r['tgl_order']);
      echo "<tr><td align=center>$no</td>
      <td align=center>$r[id_orders]</td>
                <td>$r[nama_lengkap]</td>
                <td>$tanggal</td>
                <td>$r[jam_order]</td>
                
                <td>$r[status_order]</td>
                <td class='center'>
		         <a class='btn btn-info' href='?module=order&act=detailorder&id=$r[id_orders]'>
										<i class='icon-edit icon-white'></i>  
										Detail                                            
									</a>
		            </td></tr>";
      $no++;
    }
    echo "</tbody></table>";

    
    break;
  
  case "detailorder":
    $edit = mysqli_query($con,"SELECT * FROM orders,kustomer WHERE orders.id_kustomer=kustomer.id_kustomer AND id_orders='$_GET[id]'");
    $r    = mysqli_fetch_array($edit);
    $tanggal=tgl_indo($r['tgl_order']);
    
    if ($r['status_order']=='Baru'){
        $pilihan_status = array('Baru', 'DP', 'Lunas');
    }
    elseif ($r['status_order']=='DP'){
        $pilihan_status = array('DP','Lunas', 'Batal');    
    }
    elseif ($r['status_order']=='Lunas'){
        $pilihan_status = array('Lunas', 'Batal');    
    }
    else{
        $pilihan_status = array('Baru','DP', 'Lunas', 'Batal');    
    }

    $pilihan_order = '';
    foreach ($pilihan_status as $status) {
	   $pilihan_order .= "<option value=$status";
	   if ($status == $r['status_order']) {
		    $pilihan_order .= " selected";
	   }
	   $pilihan_order .= ">$status</option>\r\n";
    }

    echo "
    
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        Invoice
                        <small>#$r[id_orders]</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='?module=home'><i class='fa fa-dashboard'></i> Home</a></li>
                                              <li class='active'>Invoice</li>
                    </ol>
                </section>

                <div class='pad margin no-print'>
                    <div class='alert alert-info' style='margin-bottom: 0!important;'>
                        <i class='fa fa-info'></i>
                        <b>Note:</b> This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
                    </div>
                </div>

                <!-- Main content -->
                <section class='content invoice'>
                    <!-- title row -->
                    <div class='row'>
                        <div class='col-xs-12'>
                            <h2 class='page-header'>";
                            $logo = mysqli_query($con,"SELECT gambar FROM profil");
                            $hd    = mysqli_fetch_array($logo);
                                echo "<img src='../foto_banner/$hd[gambar]'>
                                <small class='pull-right'>Date: $tgl_skrg-$bln_sekarang-$thn_sekarang</small>
                            </h2>
                        </div><!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class='row invoice-info'>
                        <div class='col-sm-4 invoice-col'>
                            From";
                            $tampil = mysqli_query($con,"SELECT * FROM profil");
                            $rr    = mysqli_fetch_array($tampil);
                            echo "<address>
                                <strong>Administrator.</strong><br>
                                $rr[nama_toko]<br>
                                 $rr[alamat]<br>
                                Phone:  $rr[nomor_hp]<br/>
                                Email:  $rr[email_pengelola]
                            </address>
                        </div><!-- /.col -->
                        <div class='col-sm-4 invoice-col'>
                            To
                            <address>
                                <strong>$r[nama_lengkap]</strong><br>
                                $r[alamat]<br>                                
                                Phone: $r[telpon]<br/>
                                Email: $r[email]
                            </address>
                        </div><!-- /.col -->
                        <div class='col-sm-4 invoice-col'>
                        <form method=POST action=$aksi?module=order&act=update>
          <input type=hidden name=id value=$r[id_orders]>
                            <b>Invoice #$r[id_orders]</b><br/>
                            <b>Status Order : </b><select name=status_order onChange='this.form.submit()'> $pilihan_order</select><br/>
                            </form>
                        </div><!-- /.col -->
                    </div><!-- /.row -->";
                     // tampilkan rincian produk yang di order
  $sql2=mysqli_query($con,"SELECT * FROM orders_detail, produk 
                     WHERE orders_detail.id_produk=produk.id_produk 
                     AND orders_detail.id_orders='$_GET[id]'");
  echo " <!-- Table row -->
                    <div class='row'>
                        <div class='col-xs-12 table-responsive'>
                            <table class='table table-striped'>
                                <thead>
                                    <tr>
                                    <th>Nama Produk</th>
                                    <th>Diskon</th>
                                        <th>Jumlah</th>
                                        <th>Berat (Kg)</th>
										<th>Harga</th>                                       
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>";
  $total=$totalberat=0;
  while($s=mysqli_fetch_array($sql2)){
     // rumus untuk menghitung subtotal dan total		
   $disc        = ($s['diskon']/100)*$s['harga'];
   $hargadisc   = number_format(($s['harga']-$disc),0,",","."); 
   $subtotal    = ($s['harga']-$disc) * $s['jumlah'];

    $total       = $total + $subtotal;
    $subtotal_rp = format_rupiah($subtotal);    
    $total_rp    = format_rupiah($total);    
    $harga       = format_rupiah($s['harga']);

   $subtotalberat = $s['berat'] * $s['jumlah']; // total berat per item produk 
   $totalberat  = $totalberat + $subtotalberat; // grand total berat all produk yang dibeli
   echo "

                   
                                    <tr><td>$s[nama_produk]</td>
                                    <td>$s[diskon]%</td>
                                        <td>$s[jumlah]</td> 
										<td>$s[berat]</td>
                                        <td>Rp. $hargadisc</td>
                                        <td>Rp. $subtotal_rp</td>
                                    ";
                                  }
                                  echo "
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <div class='row'>
                        <!-- accepted payments column -->
                        <div class='col-xs-6'>
                            <p class='lead'>Payment Methods:</p>";
                             $bank=mysqli_query($con,"SELECT * FROM mod_bank ORDER BY id_bank ASC");
      while($b=mysqli_fetch_array($bank)){
      	echo "
                            <img src='../bank_logo/$b[gambar]' width='51' height=32' alt='$b[nama_bank]'/>";
                          }
                          echo "
                            
                            <p class='text-muted well well-sm no-shadow' style='margin-top: 10px;'>
                            Pembayaran dapat dilakukan melalui transfer bank ke Rekening kami :<br />";
                             $norek=mysqli_query($con,"SELECT * FROM mod_bank ORDER BY id_bank ASC");
      while($bb=mysqli_fetch_array($norek)){
      	echo "- <b>$bb[nama_bank] No. Rek : $bb[no_rekening] A.n. $bb[pemilik]</b><br />";
                          }
                          echo "
                           </p><br />
                           <b> Best Regards, </b>
                           <br /><br /><br />
                           <b>JogjaKamera.id</b><br />
                            </p>
                        </div><!-- /.col -->
                        <div class='col-xs-6'>";
                         $cekpembeli=mysqli_fetch_array(mysqli_query($con,"SELECT * FROM kustomer,orders 
          WHERE orders.id_kustomer=kustomer.id_kustomer AND id_orders='$_GET[id]'"));
          $ongkos=mysqli_fetch_array(mysqli_query($con,"SELECT ongkos_kirim FROM kota WHERE id_kota='$cekpembeli[id_kota]'"));
  $ongkoskirim1=$ongkos['ongkos_kirim'];
  $ongkoskirim1=$ongkos['ongkos_kirim'];
  $ongkoskirim=$ongkoskirim1 * $totalberat;

  $grandtotal    = $total + $ongkoskirim; 

  $ongkoskirim_rp = format_rupiah($ongkoskirim);
  $ongkoskirim1_rp = format_rupiah($ongkoskirim1); 
  $grandtotal_rp  = format_rupiah($grandtotal);    
  echo "
                           
                            <div class='table-responsive'>
                                <table class='table'>
                                 <tr>
                                        <th style='width:50%'>Ongkos Kirim :</th>
                                        <td>Rp. $ongkoskirim_rp</td>
                                    </tr>
                                    <tr>
                                        <th style='width:50%'>Subtotal:</th>
                                        <td>Rp. $total_rp</td>
                                    </tr>
                                   
                                    
                                    <tr>
                                        <th>Total:</th>
                                        <td>Rp. $grandtotal_rp</td>
                                    </tr>
                                </table>
                            </div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class='row no-print'>
                        <div class='col-xs-12'>
                            <button class='btn btn-default' onclick='window.print();'><i class='fa fa-print'></i> Print</button>
                            
                        </div>
                    </div>
                </section><!-- /.content -->
           
    
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
