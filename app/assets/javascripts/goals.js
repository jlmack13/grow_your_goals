$(function () {

  //redoing the first requirement with just one button that the user clicks to show them all their goals
  $("#showGoals").on('click', function() {
    $.get("/goals.json", function(data) {
      const goals = data;
      goals.forEach(function(goal) {
        let newGoal = new Goal(goal);
        $(".goal-box").append(newGoal.format());
      });
    });
    $("#showGoals").hide();
  });

  //Next Button to show next goal on goals show Page
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    console.log(nextId)
    $.get("/goals/" + nextId + ".json", function(data) {
      $(".goal-name").text(data["name"]);
      $(".goal-description").text(data["description"]);
      $(".goal-status").text(data["status"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });

  //More Info Button on Goals Index Page to render goal show page??
  // $('.js-more').on('click', function() {
  //   var id = $(this).data("id");
  //   $.get("/goals/" + id + ".json", function(data) {
  //
  //   });
  // });

});

//Goal object
function Goal(attributes) {
  this.id = attributes["id"];
  this.name = attributes["name"];
  this.description = attributes["description"];
  this.start_date = attributes["start_date"];
  this.end_date = attributes["end_date"];
  this.completed_date = attributes["completed_date"];
};

//Write a function to build proper HTML
Goal.prototype.format = function() {
  const html = `
    <div id="goal-${this.id}" class="goal">
    <h3>${this.name}</h3>
    <p>${this.description}</p>
    <a href="/goals/${this.id}" class="btn btn-primary button">See More</a><br>
    </div>
  `
  return html;
};
