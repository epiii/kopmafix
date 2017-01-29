<?php
  session_start();
  require_once "../../../config/koneksi.php";
  require_once "../../../config/library.php";
  require_once '../../../config/mpdf/mpdf.php';
// vd($_GET);
  // $mnu   = 'DPP (Uang Pangkal)';
  // $pre   ='dpp_';
  // $x     = $_SESSION['id_loginS'].$_GET['angkatanS'].$_GET['nisS'].$_GET['namaS'].$_GET[$pre.'statusS'];
  // $token = base64_encode($x);

  // if(!isset($_SESSION)){ // belum login  
  //   echo 'user has been logout';
  // }else{ // sudah login 
  //   if(!isset($_GET['token']) ){//OR  $token!==$_GET['token']){ //token salah 
  //     echo 'Token URL tidak sesuai';
  //   }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::data member koperasi</title>
          </head>';
          // $angkatan = isset($_GET['angkatanS'])?filter($_GET['angkatanS']):'';
          // $nis      = isset($_GET['nisS'])?filter($_GET['nisS']):'';
          // $nama     = isset($_GET['namaS'])?filter($_GET['namaS']):'';
          // $status   = (isset($_GET[$pre.'statusS']) AND $_GET[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_GET[$pre.'statusS']).'"':'';

        // table content
          // $s='SELECT *
          //     FROM
          //       kustomer k
          //       LEFT JOIN kota ko ON ko.id_kota = k.id_kota
          //       LEFT JOIN jurusan j ON j.id_jurusan = k.id_jurusan
          //       LEFT JOIN fakultas f ON f.id_fakultas = j.id_fakultas
          //     ORDER BY
          //       nama_lengkap';

          //   // vd($s);
          // $e = mysqli_query($con,$s);
          // $n = mysqli_num_rows($e);

        // header info 
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="32%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Pembayaran </b>
                        </td>
                      </tr>
                    </table><br />';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">no.</td>
                    <td align="center">NIS</td>
                    <td align="center">Nama</td>
                    <td align="center">DPP</td>
                    <td align="center">Kurangan</td>
                    <td align="center">Status</td>
                    <td align="center">Tanggal Bayar</td>
                  </tr>';
/*            $nox = 1;
            $totdpp = 0;
            $totkurang = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r=mysqli_fetch_assoc($e)) {
                // $dpp      = getBiaya('dpp',$r['replid'])-getDiscTotal('dpp',$r['replid']);
                // $kurangan = $dpp-getTerbayar('dpp',$r['replid']);
                // $status   = getStatusBayar('dpp',$r['replid']);
                // if($status=='lunas'){
                //   $clr = 'lightGreen';
                // }elseif($status=='kurang'){
                //   $clr = 'yellow';
                // }else{ // belum
                //   $clr = 'pink';
                // }
                // vd($r);
                $out.='<tr>
                          <td align="right">'.$nox.'.</td>
                          <td>'.$r['nama_lengkap'].'</td>
                          <td>'.$r['email'].'</td>
                          <td>'.$r['no_telp'].'</td>
                          <td>'.$r['alamat'].'</td>
                          <td>'.$r['nama_kota'].'</td>
                          <td>'.$r['foto'].'</td>
                          <td>'.$r['kategori'].'</td>
                          <td>'.$r['blokir'].'</td>
                    </tr>';
                $nox++;
                // $totdpp+=$dpp;
                // $totkurang+=$kurangan;
              }
            }
*/            $out.='</table>';
            $out.='</body>halooooooo';
            echo $out;
  
        #generate html -> PDF ------------
          $out = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../../config/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    // }
  // }
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>