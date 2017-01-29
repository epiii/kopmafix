    // <script>
    // $(function() {
    //     $('#nav a[href~="' + location.href + '"]').parents('li').addClass('active');
    // });
    // </script>
<div class='container'>

<?php
	// var_dump(isset($_SESSION['levelmember']));
 //    exit();

// vd($_SESSION);
    if(!isset($_SESSION['levelmember'])){
        echo "<script>location.href='memberlogin.html'</script>";
    } else{
		echo '<a class="btn" href="memberlogout.php">Logout</a>';
		// epi
        echo "
            <aside class='right-side'>
                <!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        History Sewa
                    </h1>
                    <div class='left'>
                        - Nama : ".$_SESSION['namamember']." <br>
                        - Alamat : ".$_SESSION['alamatmember']."
                    </div>
                </section>

                <!-- Main content -->
                <section class='content'>
                    <div class='row'>
                        <div class='col-xs-12'>
                            <div class='box'>";
// vd($_GET);
// if(isset($_GET['act']))
// switch($_GET['act']){
//     case 'edit':
//         echo "masuk edit :".$_GET['idsewa'];
//     break;
//   // Tampil Produk
//   default:
    echo "
    <div class='box-header'>
        <h3 class='box-title'>
        <input type=button class='btn btn-primary btn' value='Tambah Sewa' onclick=\"window.location.href='?module=produk&act=tambahproduk';\">
        </h3>
            </div><!-- /.box-header -->
            <div class='box-body table-responsive'>
            <table id='example1' class='table table-bordered table-striped'>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Keperluan</th>
                        <th>Tgl Sewa</th>
                        <th>Tgl Kembali</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>";
                // vd($_SESSION);
            // $s1= 'SELECT id_member from member WHERE id_login ='.$_SESSION['idlogin'];
            $s1= 'SELECT *  from member WHERE id_login ='.$_SESSION['idlogin'];
            $id_member = mysqli_fetch_assoc(mysqli_query($con,$s1));
            // vd($id_member['id_member']);
            $s2= '  SELECT *
                    FROM orders_sewa 
                    WHERE id_member = '.$id_member['id_member'].' order by tgl_pinjam desc';
            $tampil = mysqli_query($con,$s2);
            // $no = $posisi+1;
            $no=1;
            if(mysqli_num_rows($tampil)==0) {
                echo '<tr>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>';
            }else
            while($r=mysqli_fetch_assoc($tampil)){
              $tgl_pinjam  =tgl_indo($r['tgl_pinjam']);
              $tgl_kembali =tgl_indo($r['tgl_kembali']);
              $status=$r['status']==0?'Pending':($r['status']==1?'Belum Kembali':'Sudah Kembali');
              $icon=$r['status']==0?'clock':($r['status']==1?'plus':'check');

                // <td>".($r['status']==0?'<label class="black">Pending':$r['status']==1?'<label class="warning">Belum Kembali':'<label class="info">Sudah Kembali')."</label></td>
              echo "<tr>
                <td>$no</td>
                <td>$r[keterangan]</td>
                <td>$tgl_pinjam</td>
                <td>$tgl_kembali</td>
                <td><i class='icon-".$icon."'></i>$status</td>
                <td class='center'>
                    <a class='btn btn-success' href='?module=produk&act=editproduk&id=$r[id_order_sewa]'>
                        <i class='icon-search icon-white'></i>  
                        Detail                                            
                    </a>";
                if($r['status']==0){
                    echo"
                    <a class='btn btn-info' href='?module=produk&act=editproduk&id=$r[id_order_sewa]'>
                        <i class='icon-pencil icon-white'></i>  
                        Edit                                            
                    </a>
                    <a class='btn btn-danger' href='?module=produk&act=hapus&id=$r[id_order_sewa]'>
                        <i class='icon-trash icon-white'></i> 
                        Delete
                    </a>";
                }echo "</td>
            </tr>";
              $no++;
            }
            echo "</tbody></table>";
            // break;
        // }
    }
