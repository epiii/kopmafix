<?php
     session_start();
     require_once '../config/library.php';
     if(isset($_SESSION['leveluser']))  header('Location:media.php?module=home');
     else 
?>
<!DOCTYPE html>
<html class="bg-grey">
    <head>
        <meta charset="UTF-8">
        <title>Log in Administrator Page</title>

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

       <script type="text/javascript">
function validasi(form){
if (form.username.value == ""){
alert("Anda belum mengisikan Username");
form.username.focus();
return (false);
}
     
if (form.password.value == ""){
alert("Anda belum mengisikan Password");
form.password.focus();
return (false);
}
return (true);
}
</script>
    </head>
    <body class="bg-grey">
    
        <!-- form login  <epi> -->
        <div class="form-box" id="login-box">
            <!-- <small>demo >> <br> username : admin <br> password : admin</small> -->
            <div class="header">Sign In</div>

           <form id="form-login" name="login" method="post" action="cek_login.php" onSubmit="return validasi(this)">
                <div class="body bg-lime">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="User ID"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>          
                   
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-teal btn-block">Submit</button>  
                    
                   
                </div>
            </form>

            <div class="margin text-center">
                
               
            </div>
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>
