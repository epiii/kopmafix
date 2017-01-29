<?php
include "config/koneksi.php";
include "config/library.php";
// vd($_POST);
function anti_injection($data){
  // $filter = mysqli_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  // $x=stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES)));
  // $filter = mysqli_real_escape_string($x);
  // return $filter;
  return $data;
}

$username = anti_injection($_POST['username']);
$pass     = anti_injection(md5($_POST['password']));
// vd($username);

// vd(ctype_alnum($username));
// pastikan username dan password adalah berupa huruf atau angka.
// if (!ctype_alnum($username) OR !ctype_alnum($pass)){
//   echo "Sekarang loginnya tidak bisa di injeksi lho.";
// }else{
  // $login=mysqli_query($con,"SELECT * FROM users WHERE username='$username' AND password='$pass' AND blokir='N'");
  $s='SELECT *
      FROM kustomer k 
        JOIN kota ko on ko.id_kota = k.id_kota
      WHERE
        email = "'.$username.'"
        AND PASSWORD = "'.$pass.'"';
// vd($s);
  $login  =mysqli_query($con,$s);
  $ketemu =mysqli_num_rows($login);
  $r      =mysqli_fetch_assoc($login);
// vd($r);

// Apabila username dan password ditemukan
if ($ketemu > 0){
  session_start();
  include "adminpage/timeout.php";

  $_SESSION['idmember']     = $r['id_kustomer'];
  $_SESSION['levelmember']  = $r['kategori'];
  $_SESSION['namamember']   = $r['email'];
  $_SESSION['namamember']   = $r['nama_lengkap'];
  $_SESSION['alamatmember'] = $r['alamat'];
  $_SESSION['potomember']   = $r['foto'];
  $_SESSION['kotamember']   = $r['nama_kota'];
  // vd($_SESSION);
  // session timeout
  $_SESSION['login'] = 1;
  timer();
	$sid_lama = session_id();
	session_regenerate_id();
	$sid_baru = session_id();

  // mysqli_query($con,"UPDATE users SET id_session='$sid_baru' WHERE username='$username'");
  // mysqli_query($con,"UPDATE login SET id_session='$sid_baru' WHERE username='$username'");
  // $ss='UPDATE login SET id_session="'.$sid_baru.'" WHERE id_login='.$r['id_login'];
  // vd($ss);
  // mysqli_query($con,$ss);
  header('location:member-viewbeli-0.html');
  // header('location:member-view.html');
}
else{
  include "error-login.html";
}
// }
?>
