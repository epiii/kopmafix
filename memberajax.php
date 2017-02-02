	<?php
	session_start();
	include "config/koneksi.php";
	include "config/library.php";
	include "config/fungsi_indotgl.php";

	if(!isset($_POST['aksi'])){
		echo json_encode('invalid post');
	}else{
		if($_POST['aksi']=='baranglist'){
			$s='select * from produk where tipe="s"';
			$e=mysqli_query($con,$s);
			$arr=[];
			while ($r=mysqli_fetch_assoc($e)) {
				$arr[]=$r;
			}echo json_encode($arr);
		}elseif($_POST['aksi']=='total'){
			$s='select * from produk where id_produk='.$_POST['id_produk'];
			$e=mysqli_query($con,$s);
			$r=mysqli_fetch_assoc($e);
			// pr($_SESSION);
			echo json_encode($r[($_SESSION['levelmember']=='k'?'hargakoperasi':'hargaumum')]);
		}elseif($_POST['aksi']=='stok'){
			$s='SELECT
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
				WHERE p.tipe="s" and p.id_produk = '.$_POST['id_produk'];
			$e=mysqli_query($con,$s);
			$r=mysqli_fetch_assoc($e);
			echo json_encode($r);
		}elseif($_POST['aksi']=='simpan'){
			$tgl= tgl_db($_POST['tgl_sewa']);
			$jam= $_POST['jam'];
			$menit= $_POST['menit'];
			$tgl_sewa=$tgl.' '.$jam.':'.$menit;
			// vd($tgl);
			$s=empty($_POST['id_order'])?'INSERT INTO ':'UDPATE ';
			$s.=' orders_sewa set 
					keterangan  ="'.$_POST['keterangan'].'",
					id_kustomer ="'.$_POST['id_kustomer'].'",
					tgl_sewa    ="'.$tgl_sewa.'"';
			$s.=empty($_POST['id_order'])?'':' WHERE id_order='.$_POST['id_kustomer'];
			$e=mysqli_query($con,$s);
			$id_order_sewa=mysqli_insert_id($con);
			if($e){
				$sx='';
				foreach ($_POST['selectTB'] as $i => $v) {
					$ss='INSERT INTO orders_detail_sewa SET 
						id_order_sewa ='.$id_order_sewa.',
						id_produk     ='.$v.',
						total         ='.$_POST['jumlahTB'][$i];
					$sx.=$ss;
					$ee=mysqli_query($con,$ss);
				}
			}echo json_encode(array('success'=>!$e||!$ee?false:true));
		}elseif($_POST['aksi']=='simpanreg'){
			$s=' INSERT INTO kustomer set 
					nama_lengkap ="'.$_POST['nama_lengkap'].'",
					kategori     ="u",
					alamat       ="'.$_POST['alamat'].'",
					email        ="'.$_POST['email'].'",
					password     =md5("'.$_POST['password'].'"),
					telpon       ="'.$_POST['telpon'].'",
					id_kota      ="'.$_POST['id_kota'].'"';
			$e=mysqli_query($con,$s);
			echo json_encode(array('success'=>!$e?false:true));
		}else{
			$s='DELETE FROM orders WHERE id_order='.$_POST['id_order'];
			$e=mysqli_query($con,$s);
			echo json_encode(array('success'=>!$e?false:true));
		}
	}
?>