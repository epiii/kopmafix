<?php
  // left side bar (menu) 
 $full_name = $_SERVER['REQUEST_URI'];
        $name_array = explode('/',$full_name);
        $count = count($name_array);
        $page_name = $name_array[$count-1];
        $name_array1= explode('?',$page_name);
        $count1 = count($name_array1);
        $page_name1 = $name_array1[$count1-1];
        
include "../config/koneksi.php";
 

if ($_SESSION['leveluser']=='admin'){
	
  $sql=mysqli_query($con,"select * from menuutama where aktif='Y' AND lokasi='Admin' order by urutan");
 
 
                                // <i class='fa fa-dashboard'></i> <span>Dashboard $zz</span>
  echo "<ul class='sidebar-menu'>
    <li class='active'>
      <a href='?module=home'>
          <i class='fa fa-dashboard'></i> <span>Dashboard </span>
      </a> 
      </li>

    ";
      /*<li class='treeview'>
        <a href=''>
          <i class='fa fa-info-circle'></i>
          <span>User</span>
          <i class='fa fa-angle-left pull-right'></i>
        </a> 
        <ul class='treeview-menu'>
          <li><a href='?module=user'><i class='fa fa-angle-double-right'></i> Admin</a></li>
          <li><a href='?module=menuutama'><i class='fa fa-angle-double-right'></i>Member</a></li>
        </ul>
      </li>*/
while ($m=mysqli_fetch_array($sql)){
$carimenu=mysqli_query($con,"select * from submenu where link_sub='?$page_name1'");
 $sm=mysqli_fetch_array($carimenu);
   $qq="$sm[id_main]";
   $qz="$m[id_main]";
    if ($qq == $qz) { 
      echo "<li class='treeview active'>"; 
  		} else{ 
  			echo "<li class='treeview'>"; 
  		} 
  		
 
echo "<a href='$m[link]'>
<i class='$m[icon]'></i>
<span>$m[nama_menu]</span>
<i class='fa fa-angle-left pull-right'></i>
</a>";
             
	             $sub=mysqli_query($con,"SELECT * FROM submenu, menuutama  
                            WHERE submenu.id_main=menuutama.id_main 
                            AND submenu.id_main=$m[id_main] AND submenu.id_submain=0 AND submenu.aktif='Y'");
               $jml=mysqli_num_rows($sub);
                // apabila sub menu ditemukan                
                if ($jml > 0){
                  echo " <ul class='treeview-menu'>";                 
	                while($w=mysqli_fetch_array($sub)){
                    echo "<li><a href='$w[link_sub]'><i class='fa fa-angle-double-right'></i> $w[nama_sub]</a>
                    ";
            			  $sub2 = mysqli_query($con,"SELECT * FROM submenu WHERE id_submain=$w[id_sub] AND id_submain!=0");
                    $jml2=mysqli_num_rows($sub2);
                    if ($jml2 > 0){
			         			  echo "<ul class='treeview-menu'>";
			                 while($s=mysqli_fetch_array($sub2)){
			  	                echo "<li><a href='$w[link_sub]'><i class='fa fa-angle-double-right'></i> $w[nama_sub]</a></li>";
			                 }
			                echo "</ul></li>";
			              }
	                }           
	                
                 echo "</li></ul>
                       </li>";
                }
                else{
                  echo "</li>";
                }
                
              }  
                 echo "</ul>";     
}
  

else{
                                // <i class='fa fa-dashboard'></i> <span>Dashboard $zz</span>
  $sql=mysqli_query($con,"select * from menuutama where hakakses='user' AND lokasi='Admin' order by urutan");
    echo "<ul class='sidebar-menu'>
   <li class='active'>
                            <a href='?module=home'>
                                <i class='fa fa-dashboard'></i> <span>Dashboard</span>
                            </a> 
                            </li>
 <li class='active'>
                            <a href='?module=user'>
                                <i class='fa fa-users'></i> <span>Data User</span>
                            </a> 
                            </li> 
                       ";
} 
 while ($m=mysqli_fetch_array($sql)){
$carimenu=mysqli_query($con,"select * from submenu where link_sub='?$page_name1'");
 $sm=mysqli_fetch_array($carimenu);
   $qq="$sm[id_main]";
   $qz="$m[id_main]";
  	if ($qq == $qz) { 
  		echo "<li class='treeview active'>"; 
  		} else{ 
  			echo "<li class='treeview'>"; 
  		} 
  		
 
  echo "<a href='$m[link]'>
<i class='$m[icon]'></i>
<span>$m[nama_menu]</span>
<i class='fa fa-angle-left pull-right'></i>
</a>";
             
	             $sub=mysqli_query($con,"SELECT * FROM submenu, menuutama  
                            WHERE submenu.id_main=menuutama.id_main 
                            AND submenu.id_main=$m[id_main] AND submenu.id_submain=0 AND submenu.aktif='Y'");
               $jml=mysqli_num_rows($sub);
                // apabila sub menu ditemukan                
                if ($jml > 0){
                  echo " <ul class='treeview-menu'>";                 
	                while($w=mysqli_fetch_array($sub)){
                    echo "<li><a href='$w[link_sub]'><i class='fa fa-angle-double-right'></i> $w[nama_sub]</a>
                    ";
            			  $sub2 = mysqli_query($con,"SELECT * FROM submenu WHERE id_submain=$w[id_sub] AND id_submain!=0");
                    $jml2=mysqli_num_rows($sub2);
                    if ($jml2 > 0){
			         			  echo "<ul class='treeview-menu'>";
			                 while($s=mysqli_fetch_array($sub2)){
			  	                echo "<li><a href='$w[link_sub]'><i class='fa fa-angle-double-right'></i> $w[nama_sub]</a></li>";
			                 }
			                echo "</ul></li>";
			              }
	                }           
	                
                 echo "</li></ul>
                       </li>";
                }
                else{
                  echo "</li>";
                }
                
              }  
                 echo "</ul>";     

?>
	