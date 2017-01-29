<?php
	$sid = session_id();
	$sql = mysqli_query($con,"SELECT SUM(jumlah*(harga-(diskon/100)*harga)) as total,SUM(jumlah) as totaljumlah FROM orders_temp, produk 
			                WHERE id_session='$sid' AND orders_temp.id_produk=produk.id_produk");
	
    //$disc        = ($r[diskon]/100)*$r[harga];
    //$subtotal    = ($r[harga]-$disc) * $r[jumlah];
		                
	while($r=mysqli_fetch_array($sql)){

  if ($r['totaljumlah'] != ""){
    $total_rp    = format_rupiah($r['total']);

    echo "<i class='icon-basket'></i>Your Cart : <span class='theme'>Rp. $total_rp</span>   
   ";
  }
  else{
    echo "<i class='icon-basket'></i>Your Cart : <span class='theme'>Rp. 0</span>   
          ";
  }
  }
?>

