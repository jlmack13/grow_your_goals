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

  //NEXT GOAL BUTTON
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    $(".task-list").html("");
    //get array of user's goals to cycle through them
    var userGoals = $(".js-next").data("goals");
    var currentGoal = parseInt($(".js-next").attr("data-id"));
    var index = userGoals.indexOf(currentGoal) + 1;
    $.get("/goals/" + userGoals[index] + ".json", function(data) {
      //Set goal attributes
      $(".goal-name").text(data["name"]);
      $(".goal-description").text(data["description"]);
      $(".goal-status").text(data["status"]);
      //load the goals tasks
      const tasks = data["tasks"];
      console.log(tasks)
      tasks.forEach(function(task) {
        let newTask = new Task(task);
        console.log(newTask)
        $(".task-list").append(newTask.format());
      })
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
      $(".js-previous").attr("data-id", data["id"]);
    });
  });

  //PREVIOUS GOAL BUTTON
  $(".js-previous").on("click", function(e) {
    e.preventDefault();
    $(".task-list").html("");
    //get array of user's goals to cycle through them
    var userGoals = $(".js-previous").data("goals");
    var currentGoal = parseInt($(".js-previous").attr("data-id"));
    var index = userGoals.indexOf(currentGoal) - 1;
    $.get("/goals/" + userGoals[index] + ".json", function(data) {
      $(".goal-name").text(data["name"]);
      $(".goal-description").text(data["description"]);
      $(".goal-status").text(data["status"]);
      //load the goals tasks
      const tasks = data["tasks"];
      tasks.forEach(function(task) {
        let newTask = new Task(task);
        $(".task-list").append(newTask.format());
      })
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
      $(".js-previous").attr("data-id", data["id"]);
    });
  });
});


  //More Info Button on Goals Index Page to render goal show page??
  // $('.js-more').on('click', function() {
  //   var id = $(this).data("id");
  //   $.get("/goals/" + id + ".json", function(data) {
  //
  //   });
  // });



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

//Task object
function Task(attributes) {
  this.id = attributes["id"];
  this.name = attributes["name"];
  this.description = attributes["description"];
  this.start_date = attributes["start_date"];
  this.end_date = attributes["end_date"];
  this.completed_date = attributes["completed_date"];
};

Task.prototype.format = function() {
  const html = `
    <li id="task-${this.id}">
      <a href="/tasks/${this.id}" class="new-task">
        ${this.name}
      </a>
    </li>
  `
  return html;
};
