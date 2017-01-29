<?php
function sensor($teks){
    $w = mysqli_query($con,"SELECT * FROM katajelek");
    while ($r = mysqli_fetch_array($w)){
        $teks = str_replace($r['kata'], $r['ganti'], $teks);       
    }
    return $teks;
}  
?>
