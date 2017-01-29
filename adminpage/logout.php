<?php
  session_start();
  unset($_SESSION['leveluser']);
  // session_destroy();
  echo "<script>alert('Anda telah keluar dari halaman administrator'); window.location = './'</script>";
?>
