$(function () {

  //More Info Button on Goals Index Page
  $('.js-more').on('click', function() {
    var id = $(this).data("id");
    $.get("/goals/" + id + ".json", function(data) {
      console.log(data);
      //build html for this with a function
      //What if the goal doesn't have a description?
      if(data["description"] !== ""){
        $(".description-" + id).text("Description: " + data["description"]);
      }
      //TODO convert dates to more readable format - moment? 
      $(".start_date-" + id).text("Goal Start: " + data["start_date"]);
      $(".end_date-" + id).text("Goal End: " + data["end_date"]);
    });
  });

});
