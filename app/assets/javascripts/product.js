$( document ).ready(function() {

  $(".product").mouseenter(function(e){

    var productTarget = e.currentTarget.id;
    var element = document.getElementById(productTarget);
    var innertext_div = "#" + productTarget + " .inner_text";

    console.log("entering div");
    console.log(productTarget);
    console.log(innertext_div);

    $(innertext_div).css("background-color", "rgba(255,40,120,0.8)");
    $(innertext_div).toggle();
    $("#" + productTarget + " .readmore").addClass("fadeIn");

  }).mouseleave(function() {
    console.log("exiting div");
    $(".inner_text").hide();
  });

});
