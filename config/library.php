<?php
	require_once 'koneksi.php';
	// vd($con);
	date_default_timezone_set('Asia/Jakarta'); // PHP 6 mengharuskan penyebutan timezone.
	$seminggu = array("Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu");
	$hari = date("w");
	$hari_ini = $seminggu[$hari];

	$tgl_sekarang = date("Ymd");
	$tgl_skrg     = date("d");
	$bln_sekarang = date("m");
	$thn_sekarang = date("Y");
	$jam_sekarang = date("H:i:s");

	$nama_bln=array(1=> "Januari", "Februari", "Maret", "April", "Mei", 
	                    "Juni", "Juli", "Agustus", "September", 
	                    "Oktober", "November", "Desember");
	function vd($par){
		echo '<pre>';
			print_r($par);		
		echo '</pre>';
		exit;
	}
	// fungsi untuk mendapatkan isi keranjang belanja
	function isi_keranjang(){
		global $con;
		$isikeranjang = array();
		$sid = session_id();
		$sql="SELECT * FROM orders_temp WHERE id_session='$sid'";
		$exe = mysqli_query($con,$sql);
		
		while ($r=mysqli_fetch_assoc($exe)) {
			$isikeranjang[] = $r;
		}return $isikeranjang;
	}

	function GetCheckboxes($table, $key, $Label, $Nilai='') {
		global $con;
		$s = "select * from $table order by nama_tag";
		$r = mysqli_query($con,$s);
		$_arrNilai = explode(',', $Nilai);
		$str = '';
		while ($w = mysqli_fetch_array($r)) {
		  $_ck = (array_search($w[$key], $_arrNilai) === false)? '' : 'checked';
		  $str .= "<input type=checkbox name='".$key."[]' value='$w[$key]' $_ck>$w[$Label] ";
		}return $str;
	}

?>
