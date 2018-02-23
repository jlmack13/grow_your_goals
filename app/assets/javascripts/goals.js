$(function () {
  //redoing the first requirement with just one button that the user clicks to show them all their goals


});

function Goal(attributes) {
  this.name = attributes["name"];
  this.description = attributes["description"];
  this.start_date = attributes["start_date"];
  this.end_date = attributes["end_date"];
  this.completed_date = attributes["completed_date"];
}
//Write a function to build proper HTML
Goal.prototype.format = function() {
  console.log(this)
  const goalName = "<h3>" + this.name + "</h3>"
  console.log(goalName);
  return goalName;
};


// $("#showGoals").on('click', function() {
//   $.get("/goals.json", function(data) {
//     const goals = data;
//     goals.forEach(function(goal) {
//       let newGoal = new Goal(goal);
//       console.log(newGoal)
//       $(".goal-box").append(newGoal.format);
//     });
//   });
// });
// //More Info Button on Goals Index Page
// $('.js-more').on('click', function() {
//   var id = $(this).data("id");
//   $.get("/goals/" + id + ".json", function(data) {
//     console.log(data);
//     //build html for this with a function
//     //What if the goal doesn't have a description?
//     if(data["description"] !== ""){
//       $(".description-" + id).text("Description: " + data["description"]);
//     }
//     //TODO convert dates to more readable format - moment?
//     $(".start_date-" + id).text("Goal Start: " + data["start_date"]);
//     $(".end_date-" + id).text("Goal End: " + data["end_date"]);
//   });
// });
