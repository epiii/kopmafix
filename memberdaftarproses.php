<?php
    if(!isset($_POST)){
        echo 'invalid process';
    }else{
        require 'config/koneksi.php';
        require 'config/library.php';
        $s='INSERT INTO login
            SET username ="'.$_POST['username'].'",
                password= "'.md5($_POST['password']).'"';
        $q=mysqli_query($con,$s);
        $id_login=mysqli_insert_id($con)();
        vd($id_login);
    }