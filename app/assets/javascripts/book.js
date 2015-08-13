$(document).ready(function(){
  //change label on load of page
  if($("#check_asin").is(':checked')) {
    $("#isbn_label").text("ASIN");
  }else{
    $("#isbn_label").text("ISBN");
  }

  $("#check_asin").click(function(e){
    if($("#check_asin").is(':checked')) {
      $("#isbn_label").text("ASIN");
    }else{
      $("#isbn_label").text("ISBN");
    }
  });
});
