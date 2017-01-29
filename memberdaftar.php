<?php
 if(isset($_SESSION['levelmember']))  {
    header('Location:member-viewbeli-0.html');
 }else{ 
?>
       <script type="text/javascript">

    function simpan () {
        $.ajax({
            url:'memberajax.php',
            dataType:'json',
            data:'aksi=simpanreg&'+$('form').serialize(),
            type:'post',
            success:function(dt){
                alert(dt.success?'berhasil disimpan':'gagal');
                if(dt.success)location.href='memberlogin.html';
            },
        });
    }

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
        <!-- <div class="header">Daftar</div> -->
        <h3>Daftar</h3>
           <form id="form-login" name="login" method="post" action="memberajax.php" onSubmit="simpan();return false;">
                <div class="body bg-lime">
                    <div class="form-group">
                        <label for="">Nama:</label>
                        <input required type="text" name="nama_lengkap" class="form-control" placeholder="nama_lengkap"/>
                    </div>
                    <div class="form-group">
                        <label for="">Alamat</label>
                        <input  type="text" name="alamat" class="form-control" placeholder="alamat"/>
                    </div>
                    <div class="form-group">
                        <label for="">Kota</label>
                        <select required name="id_kota">
                            <?php
                                $s='SELECT * FROM kota order by nama_kota ';
                                $e=mysqli_query($con,$s);
                                echo '<option value="">-Pilih Kota-</option>';
                                while ($r=mysqli_fetch_assoc($e)) {
                                    echo '<option value="'.$r['id_kota'].'">'.$r['nama_kota'].'</option>';
                                }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Telpon</label>
                        <input required type="text" name="telpon" class="form-control" placeholder="telpon"/>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input required type="email" name="email" class="form-control" placeholder="email"/>
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                        <input required type="password" name="password" class="form-control" placeholder="password"/>
                    </div>          
                </div>
                <!-- <div class="footer">                                                                -->
                    <button type="submit" class="btn bg-teal ">Simpan</button>  
                <!-- </div> -->
                <a  href="member.html">Login</a>

            </form>

            <div class="margin text-center">
            </div>
        </div>
        </div>


<?php
    }
?>