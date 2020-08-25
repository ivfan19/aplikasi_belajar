<?php

include_once 'template/header.html';
include_once 'connection.php';


if(!empty($_GET['materi'])){

  $sql = "SELECT * FROM materi WHERE kode_materi = '".$_GET['materi']."' LIMIT 1";
  $res_materi = $conn->query($sql);


  if ($res_materi->num_rows > 0) {
    // output data of each row
    while($row = $res_materi->fetch_assoc()) {
      $path = $row['url_materi'];
      $name = $row['nama'];

    }
    ?>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-3">
  

      <h2><?php echo $name; ?></h2>

      <?php
    
    // $path = '\doc\materi pecahan.pdf';

    echo "<iframe src='".$path."' width=\"100%\" style=\"height:400%\"></iframe>";

  }
  else{
    ?>
    
    <div class="container p-5">

      <h1 class="text-center">Materi tidak di temukan</h1>
      <div class="text-center"><a href="materi.php" class="btn btn-md btn-success">Silahkan klik link ini untuk kembali</a></div>

    </div>

    <?php 
  }

  
    }
    else {

      $sql = "SELECT * FROM materi ORDER BY `tanggal_upload`";
      $res_materi = $conn->query($sql);
      $no =1;

      ?>
      <div class="container p-5">

        <div class="table-responsive">
          <table class="table table-bordered bg-white">
            <tr>
              <th>No</th>
              <th>Nama materi</th>
              <th>Tgl materi diupload</th>
              <?php if ($res_materi->num_rows > 0) {
            // output data of each row
            while($row = $res_materi->fetch_assoc()) {
            ?>
            </tr>
              <td><a href="/materi.php?materi=<?php echo$row['kode_materi'] ?>"><?php echo $no;?></a></td>
              <td><a href="/materi.php?materi=<?php echo$row['kode_materi'] ?>"><?php echo $row['nama'];?></a></td>
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

  </main>
<?php 
include_once 'template/footer.html'
?>