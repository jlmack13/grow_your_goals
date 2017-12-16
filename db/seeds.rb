# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Test Users
User.create(name: "Harry", email: "harry@hogwarts.edu", password: "12345678")
User.create(name: "Ginny", email: "ginny@hogwarts.edu", password: "test123")

#Create Test Category
Category.create(name: "Learning")
Category.create(name: "Health")
Category.create(name: "Writing")
Category.create(name: "Personal Growth")

#Create Test Goals
Goal.create(name: "Write a Novel", description: "Write my first novel, finally!", user_id: 1, start_date: DateTime.now, end_date: Date.new(2018, 12, 12), status: "incomplete")
Goal.create(name: "Learn to Code", description: "Teach myself how to code in Ruby.", user_id: 2, start_date: DateTime.now, end_date: Date.new(2018, 4, 12), status: "incomplete")
Goal.create(name: "Read 10 Books", description: "Pretty self explanatory.", user_id: 1, start_date: DateTime.now, end_date: Date.new(2018, 2, 12), status: "incomplete")


#Create Test Actions
Action.create(name: "Brainstorm story ideas", description: "Come up with 3 viable story ideas.", goal_id: 1, start_date: DateTime.now, end_date: Date.new(2017, 12, 15), status: "incomplete")
Action.create(name: "Choose best idea", description: "Pick my favorite of the 3 ideas.", goal_id: 1, start_date: DateTime.now, end_date: Date.new(2017, 12, 18), status: "incomplete")
Action.create(name: "Write an outline", description: "Write a basic outline, just to start", goal_id: 1, start_date: DateTime.now, end_date: Date.new(2018, 1, 15), status: "incomplete")

Action.create(name: "Sign up for Flatiron School", description: "Take free bootcamp prep course at Flatiron.", goal_id: 2, start_date: DateTime.now, end_date: Date.new(2018, 2, 15), status: "incomplete")
