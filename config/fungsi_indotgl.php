<?php
	function jam_indo($tgl){
		// vd($tgl);
		$jam= substr($tgl,11,2);
		$menit= substr($tgl,14,2);
		return $jam.':'.$menit;
	}
		
	function tgl_indo2($tgl){
			$tanggal = substr($tgl,8,2);
			$bulan = getBulan2(substr($tgl,5,2));
			$tahun = substr($tgl,0,4);
			return $tanggal.' '.$bulan.' '.$tahun;		 
	}	
	
	function tgl_indo($tgl){
			$tanggal = substr($tgl,8,2);
			$bulan = getBulan(substr($tgl,5,2));
			$tahun = substr($tgl,0,4);
			return $tanggal.' '.$bulan.' '.$tahun;		 
	}	
	
	function tgl_db($tgl){ //23-12-1990
			$tanggal = substr($tgl,0,2);
			$bulan   = substr($tgl,3,2);
			$tahun   = substr($tgl,6,4);
			return $tahun.'-'.$bulan.'-'.$tanggal;		 
	}	

	function getBulan2($bln){
				switch ($bln){
					case 1: 
						return "Jan";
						break;
					case 2:
						return "Feb";
						break;
					case 3:
						return "Mar";
						break;
					case 4:
						return "Apr";
						break;
					case 5:
						return "Mei";
						break;
					case 6:
						return "Jun";
						break;
					case 7:
						return "Jul";
						break;
					case 8:
						return "Agus";
						break;
					case 9:
						return "Sept";
						break;
					case 10:
						return "Okt";
						break;
					case 11:
						return "Nov";
						break;
					case 12:
						return "Des";
						break;
				}
			} 
	function getBulan($bln){
				switch ($bln){
					case 1: 
						return "Januari";
						break;
					case 2:
						return "Februari";
						break;
					case 3:
						return "Maret";
						break;
					case 4:
						return "April";
						break;
					case 5:
						return "Mei";
						break;
					case 6:
						return "Juni";
						break;
					case 7:
						return "Juli";
						break;
					case 8:
						return "Agustus";
						break;
					case 9:
						return "September";
						break;
					case 10:
						return "Oktober";
						break;
					case 11:
						return "November";
						break;
					case 12:
						return "Desember";
						break;
				}
			} 
?>
