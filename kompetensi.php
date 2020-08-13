<?php

include_once 'template/header.html'

?>
  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-3">
  

    <h2>Kompetensi</h2>

    
      <?php
      $path = '\doc\KOMPETENSI.pdf';

      echo "<iframe src='".$path."' width=\"100%\" style=\"height:400%\"></iframe>";

      ?>

  </main>
<?php 
include_once 'template/footer.html'
?>