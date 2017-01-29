<?php
include "../config/koneksi.php";
include "../config/library.php";
$dbc = new mysqli("localhost","root", "", "skripsi2");

function anti_injection($data){
  // $filter = mysqli_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  // $x=stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES)));
  // $filter = mysqli_real_escape_string($x);
  // return $filter;
  return $data;
}

$username = anti_injection($_POST['username']);
$pass     = anti_injection(md5($_POST['password']));
// vd($pass);

// pastikan username dan password adalah berupa huruf atau angka.
if (!ctype_alnum($username) OR !ctype_alnum($pass)){
  echo "Sekarang loginnya tidak bisa di injeksi lho.";
 // vd($login);
}else{
  $s="SELECT * FROM users WHERE username='$username' AND password='$pass' AND blokir='N'";
  // $login=mysqli_query($con,$s);
 /* $s='SELECT
        l.username,
        l.id_login,
        a.nama_lengkap
      FROM
        login l
      JOIN admin a ON a.id_login = l.id_login
      WHERE
        l.username = "'.$username.'"
      AND l.`password` = "'.$pass.'"';*/

  
  // if ($result = $mysqli->query("SELECT Code, Name FROM Country ORDER BY Name")) {
  if ($result = $dbc->query($s)) {
      $row_cnt = $result->num_rows;
      $r       = $result->fetch_assoc();
      vd($r);
      // exit();
      session_start();
      include "timeout.php";
      
      $_SESSION['namauser']    = $r['username'];
      $_SESSION['namalengkap'] = $r['nama_lengkap'];
      $_SESSION['passuser']    = $r['password'];
      $_SESSION['leveluser']   = 'admin';
      $_SESSION['poto']        = $r['foto'];

      // session timeout
      $_SESSION['login'] = 1;
      timer();
      $sid_lama = session_id();
      session_regenerate_id();
      $sid_baru = session_id();

      // mysqli_query($con,"UPDATE users SET id_session='$sid_baru' WHERE username='$username'");
      mysqli_query($con,"UPDATE login SET id_session='$sid_baru' WHERE username='$username'");
      header('location:media.php?module=home');
      $result->close();
  }
  // $ss='SELECT count(*)jum from users where username='.$username.'" AND password="'.$pass.'" and blokir="N"';
  // $q = $dbc->prepare($ss);
  // $q->execute();
  // vd($q);
  // $e=$q->store_result();

  // $login  =mysqli_query($con,$s);
  // $ketemu =mysqli_num_rows($login);
  $n = $q->num_rows;
  $f=$q->fetch_assoc();
  vd($f);

  $r = mysqli_fetch_assoc($login);
// vd($r);

// Apabila username dan password ditemukan
if ($ketemu > 0){
 //  session_start();
 //  include "timeout.php";

 //  $_SESSION['namauser']     = $r['username'];
 //  $_SESSION['namalengkap']  = $r['nama_lengkap'];
 //  $_SESSION['passuser']     = $r['password'];
 //  $_SESSION['leveluser']    = 'admin';
 //  // $_SESSION['leveluser'] = $r['level'];
 //  $_SESSION['poto']         = $r['foto'];
 
  
 //  // session timeout
 //  $_SESSION['login'] = 1;
 //  timer();

	// $sid_lama = session_id();
	
	// session_regenerate_id();

	// $sid_baru = session_id();

 //  // mysqli_query($con,"UPDATE users SET id_session='$sid_baru' WHERE username='$username'");
 //  mysqli_query($con,"UPDATE login SET id_session='$sid_baru' WHERE username='$username'");
 //  header('location:media.php?module=home');
}
else{
  include "error-login.php";
}
}
?>
s