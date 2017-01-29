<?php
  session_start();
  // session_destroy();
  unset($_SESSION['levelmember']);
  echo "<script>alert('Anda telah logout');location.href='member.html'</script>";
?>
