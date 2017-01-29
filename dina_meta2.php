<?php
      $sql2 = mysqli_query($con,"select meta_keyword from profil");
      $j2   = mysqli_fetch_array($sql2);
		  echo "$j2[meta_keyword]";
?>
