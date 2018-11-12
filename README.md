# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Steps Followed -For setting up Postgres-Rails connectivity


$ sudo apt-get install postgresql postgresql-contrib libpq-dev


$ sudo -u postgres createuser -s cool_user


$sudo -u postgres psql
         
         postgres=# \password cool_user


So, you have to add this to the database.yml file:

    app_name/config/database.yml

    development:
    adapter: postgresql
    database: app_name_development
    username: your_user
    password: your_user_password
    encoding: unicode
    host: localhost
    pool: 5

    test:
    adapter: postgresql
    database: app_name_test
    username: your_user
    password: your_user_password
    encoding: unicode
    host: localhost
    pool: 5


Databases Creation: Development & Test
Run this command on your terminal to create the development and test databases:

path/to/your/rails/project$ rake db:setup


Then, run your migrations using this command:

path/to/your/rails/project$ rake db:migrate
       
