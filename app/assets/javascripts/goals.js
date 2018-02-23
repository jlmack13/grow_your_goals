$(function () {

  //More Info Button on Goals Index Page
  $('.js-more').on('click', function() {
    var id = $(this).data("id");
    $.get("/goals/" + id + ".json", function(data) {
      console.log(data);
      //build html for this with a function
      $(".more-info-" + id).text(data);
    });
  });
  
});
