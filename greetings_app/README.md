# README

This README would normally document whatever steps are necessary to get the
application up and running.

The current project is a Greeting_app created based on following requirement
=====================================================
Topic: We would like you to implement a "good night" application to let users track when they go to bed and when they wake up. We want to know how do you structure the code and design the API

We require some restful APIS to achieve the following:
1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records over the past week for their friends, ordered by the length of their sleep.

Please implement the model, db migrations, and JSON API.
You can assume that there are only two fields on the users "id" and "name".
You do not need to implement any user registration API.
You can use any gems you like.
======================================================

Things you may want to cover:

* Ruby version
 ruby 3.1.3p185

* Rails version 
  Rails 7.0.4.3

* System dependencies

* Configuration

* Database creation
  In built SQLite database is used for the project.

* Database initialization
  The database is initialized when the project runs as it is an inbuilt database.

* How to run the test suite
  The test cases are to in the spec folder. 
  bundle exec rspec ./spec/*file_name_in_spec_folder  to run particular test file

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
Install ruby mentioned version
Install rails mentioned version
Install bundler 
Run "bundle install" command to install all gems. Required gems are present in Gemfile
To run the rails server use the command "rails server"- This will run the server in the local url "http://127.0.0.1:3000/"


* File greetings_app.postman_collection.json cotains the postman API collection
    ...
