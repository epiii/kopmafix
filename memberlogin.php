<?php
    // vd($_SESSION['levelmember']);
     if(isset($_SESSION['levelmember'])){
        echo '<script>
            location.href="member.html";
        </script>';
     }else 
?>
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
    
        <!-- form login  <epi> -->
    <div class="container">
        <div class="form-box" id="login-box">
            <div class="header">Login</div>
            <!-- <small>demo >> <br> username : memum1@email.com <br> password : memum1</small> -->
            <form id="form-login" name="login" method="post" action="cek_memberlogin.php" onSubmit="return validasi(this)">
                <div class="body bg-lime">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="email"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="password"/>
                    </div>          
                </div>
                <!-- <div class="footer">                                                                -->
                    <button type="submit" class="btn bg-teal ">Login</button>  
                <!-- </div> -->
                <a class="btn btn-info" href="memberdaftar.html">Daftar</a>
            </form>

            <div class="margin text-center">
            </div>
        </div>
        </div>
