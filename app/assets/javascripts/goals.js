$(function () {

  //SHOW GOALS INDEX FROM API
  $("#showGoals").on('click', function(e) {
    e.preventDefault();
    $.get("/goals.json", function(data) {
      const goals = data;
      goals.forEach(function(goal) {
        let newGoal = new Goal(goal);
        $(".goal-box").append(newGoal.format());
      });
    });
    $("#showGoals").hide();
  });



  //NEXT GOAL BUTTON (SHOW GOAL FROM API)
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    $(".task-list").html("");
    //get array of user's goals to cycle through them
    var userGoals = $(".js-next").data("goals");
    var currentGoal = parseInt($(".js-next").attr("data-id"));
    var index = userGoals.indexOf(currentGoal) + 1;
    if (index === userGoals.length) {
      index = 0;
    }
    //testing this to see if i can create a loop with the buttons
    $.get("/goals/" + userGoals[index] + ".json", function(data) {
      //Set goal attributes
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

  //PREVIOUS GOAL BUTTON
  $(".js-previous").on("click", function(e) {
    e.preventDefault();
    $(".task-list").html("");
    //get array of user's goals to cycle through them
    var userGoals = $(".js-previous").data("goals");
    var currentGoal = parseInt($(".js-previous").attr("data-id"));
    var index = userGoals.indexOf(currentGoal) - 1;
    //check index to loop through to last goal if necessary
    if (index < 0) {
      index = userGoals.length - 1;
    }
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



//GOAL OBJECT MODEL
function Goal(attributes) {
  this.id = attributes["id"];
  this.name = attributes["name"];
  this.description = attributes["description"];
  this.start_date = attributes["start_date"];
  this.end_date = attributes["end_date"];
  this.completed_date = attributes["completed_date"];
};

//PROTOTYPE FUNCTION TO FORMAT HTML OF GOALS
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

//TASK OBJECT MODEL
function Task(attributes) {
  this.id = attributes["id"];
  this.name = attributes["name"];
  this.description = attributes["description"];
  this.start_date = attributes["start_date"];
  this.end_date = attributes["end_date"];
  this.completed_date = attributes["completed_date"];
};

//PROTOTYPE FUNCTION TO FORMAT HTML OF TASKS
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
