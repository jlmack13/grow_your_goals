# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      --> Goal Show Page has a "Next" and "Previous" button that get the next or previous goal
      and render it on the page without a refresh.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      --> Home page has a button "Show Goals" that gets the user's index of goals via the API.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      --> Goal Show Page when rendered from the API includes the goal's tasks (a goal has many tasks)
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
      --> On the Goal Show Page there is a form to create a new Task that when submitted adds the new Task
      to the list of the goal's task without refreshing the page.
- [x] Translate JSON responses into js model objects.
      --> Both Goal and Task are translated into js model objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      --> Both Goal and Task have prototype methods that format the html to be appended to the DOM

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
