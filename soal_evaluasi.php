<?php

include_once 'template/header.html';
include_once 'connection.php';

?>
  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-3">
  

  <div class="row d-flex justify-content-between mb-3">
    <h2>Soal Evaluasi</h2>
    <!-- <a href="#jawaban" class="btn btn-md btn-primary">Kebawah</a> -->
  </div>
    
      <?php
      if(!empty($_GET['kode_soal']) && empty($_POST['nama_siswa'])){

        
      #
      $sql_soal = "SELECT * FROM `soal_evaluasi` WHERE kode_soal = '".$_GET['kode_soal']."'";
      $res_soal = $conn->query($sql_soal) or die($conn->error);

      #
      $sql_pk_jwb = "SELECT * FROM `pk_jawab` WHERE kd_soal = '".$_GET['kode_soal']."'";
      $res_pk_jwb = $conn->query($sql_pk_jwb) or die($conn->error);

      $new = $res_pk_jwb->num_rows+1;
      

      if ($res_soal) {
        // output data of each row
        ?>

        <form action="" method="POST">
          <input type="hidden" name="nama_siswa" value="siswa1">
          <input type="hidden" name="typ" value="soal_evaluasi">
          <input type="hidden" name="kd_jawab" value="<?php echo$_GET['kode_soal']."_".$new ?>">

        <?php
        while($row = $res_soal->fetch_assoc()) {
          ?>

        <div class="row ml-2 mr-2">
          <h6 class="col font-weight-bold font-italic"><?php echo $row['no_soal'].". ".$row['txt_soal'] ?></h6>
        </div>

        <div class="col-lg-4 col-md-6 mb-4 py-3">

              <fieldset class="form-check mb-4">
                <input class="form-check-input" name="r[<?php echo $row['no_soal'] ?>]" type="radio" value="a" checked>
                <label class="form-check-label" for="r[<?php echo $row['no_soal'] ?>]">A. <?php echo $row['a'] ?></label>
              </fieldset>

              <fieldset class="form-check mb-4">
                <input class="form-check-input" name="r[<?php echo $row['no_soal'] ?>]" type="radio" value="b">
                <label class="form-check-label" for="r[<?php echo $row['no_soal'] ?>]">B. <?php echo $row['b'] ?></label>
              </fieldset>

              <fieldset class="form-check mb-4">
                <input class="form-check-input" name="r[<?php echo $row['no_soal'] ?>]" type="radio" value="c">
                <label class="form-check-label" for="r[<?php echo $row['no_soal'] ?>]">C. <?php echo $row['c'] ?></label>
              </fieldset>

              <fieldset class="form-check mb-4">
                <input class="form-check-input" name="r[<?php echo $row['no_soal'] ?>]" type="radio" value="d">
                <label class="form-check-label" for="r[<?php echo $row['no_soal'] ?>]">D. <?php echo $row['d'] ?></label>
              </fieldset>

            </div>

          <?php
          }
          ?> 
          <input type="submit" class="btn btn-md btn-primary mb-5" value="Kirim Jawaban">
          </form>
          <?php
        } else {
          echo "0 results";
        }
      }else if(!empty($_POST['nama_siswa'])){

        // echo var_dump($_POST['r']);
        try {

          

          $sql1 = "INSERT INTO pk_jawab (kd_jawab, kd_soal) VALUES('".$_POST['kd_jawab']."', '".$_GET['kode_soal']."')";
          $res1 = $conn->query($sql1) or die($conn->error);

          foreach ($_POST['r'] as $key => $value) {
            $sql2 = "INSERT INTO `jawaban_siswa`(`kd_jawab`, `no_soal`, `jawaban`, `type`) VALUES ('".$_POST['kd_jawab']."', $key, '".$value."', '".$_POST['typ']."')";
            $res2 = $conn->query($sql2) or die($conn->error);
          }
          

        } catch (\Throwable $th) {
          throw $th;
        }

        ?> 
        
        <script>
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Jawaban telah tersimpan',
            showConfirmButton: true,
            timer: 1500
          })
        </script>
        
        <?php


      }else {
        
      $sql = "SELECT * FROM soal ORDER BY `tanggal_upload`";
      $res_soal = $conn->query($sql);
      $no =1;

      ?>
      <div class="container p-5">

        <div class="table-responsive">
          <table class="table table-bordered bg-white">
            <tr>
              <th>No</th>
              <th>Nama materi</th>
              <th>Tgl materi diupload</th>
              <?php if ($res_soal->num_rows > 0) {
            // output data of each row
            while($row = $res_soal->fetch_assoc()) {
            ?>
            </tr>
              <td><a href="/soal_evaluasi.php?kode_soal=<?php echo$row['kode_soal'] ?>"><?php echo $no;?></a></td>
              <td><a href="/soal_evaluasi.php?kode_soal=<?php echo$row['kode_soal'] ?>"><?php echo $row['mapel'];?></a></td>
              <td><?php echo $row['tanggal_upload'];?></td>
            <tr>
              <?php
              $no++;
                }
              }?>

            </tr>
          </table>
        </div>
      </div>

      <?php
      }
      
      ?>


    </div>

    

  </main>
<?php 
include_once 'template/footer.html'
?>