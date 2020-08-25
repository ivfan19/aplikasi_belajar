<?php

include_once 'template/header.html';
include_once 'connection.php';


if(!empty($_GET['kompetensi'])){

  $sql = "SELECT * FROM kompetensi WHERE kode_kompetensi = '".$_GET['kompetensi']."' LIMIT 1";
  $res_kompetensi = $conn->query($sql);

  if ($res_kompetensi->num_rows > 0) {
    // output data of each row
    while($row = $res_kompetensi->fetch_assoc()) {
      $path = $row['url_kompetensi'];
      $name = $row['nama'];

    }
    ?>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-3">
  

      <h2><?php echo $name; ?></h2>

      <?php
    
    // $path = '\doc\kompetensi pecahan.pdf';

    echo "<iframe src='".$path."' width=\"100%\" style=\"height:400%\"></iframe>";

  }
  else{
    ?>
    
    <div class="container p-5">

      <h1 class="text-center">kompetensi tidak di temukan</h1>
      <div class="text-center"><a href="kompetensi.php" class="btn btn-md btn-success">Silahkan klik link ini untuk kembali</a></div>

    </div>

    <?php 
  }

  
    }
    else {

      $sql = "SELECT * FROM kompetensi ORDER BY `tanggal_upload`";
      $res_kompetensi = $conn->query($sql);
      $no =1;

      ?>
      <div class="container p-5">

        <div class="table-responsive">
          <table class="table table-bordered bg-white">
            <tr>
              <th>No</th>
              <th>Nama kompetensi</th>
              <th>Tgl kompetensi diupload</th>
              <?php if ($res_kompetensi->num_rows > 0) {
            // output data of each row
            while($row = $res_kompetensi->fetch_assoc()) {
            ?>
            </tr>
              <td><a href="/kompetensi.php?kompetensi=<?php echo$row['kode_kompetensi'] ?>"><?php echo $no;?></a></td>
              <td><a href="/kompetensi.php?kompetensi=<?php echo$row['kode_kompetensi'] ?>"><?php echo $row['nama'];?></a></td>
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