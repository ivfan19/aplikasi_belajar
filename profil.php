<?php

include_once 'template/header.html'

?>
  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-3">
  
    <div class="row featurette">
      <!-- <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      </div> -->
      <div class="col-md-12  order-md-1">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width: 100%;
  max-width: 90%;
  float: left;
  clear: both;
  padding : 0px 10px;" src="assets/img/bg/profil1.jpg" alt="">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg> -->
      </div>

  </div>
  </main>
  <style>
  #container {
    margin : auto;
  }
  </style>
  <script>
    $(function(){
      var imageHead = document.getElementById("container");
          imageHead.style.backgroundImage = "url('http://nindy.test/assets/img/bg/profil.jpg')";
          imageHead.style.backgroundRepeat  = "no-repeat";
          imageHead.style.backgroundSize   = "auto";
    })
  </script>
<?php 
include_once 'template/footer.html'
?>
