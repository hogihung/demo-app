# README

This is a basic Rails application built to demonstrate one approach to working with subdomains in a development environment.  The application has two models - Account and User.  In this example we are using Devise for user authentication and MiniTest for our testing.


* Ruby version: 2.2.3

* Rails version: 5.0

* Database: Postgresql

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Assumption: You are using RVM to manage your ruby versions.  If you already have Ruby 2.2.3+ installed as well as Rails 5, you can skip the rvm and gem install steps below.

```
cd ~/path/to/where/your/projects-go/
rvm use 2.2.3@rails5 --create
gem install bundler
gem install rails

git clone git@github.com:hogihung/demo-app.git
cd demo-app
bundle install
rails db:setup
rails db:seed
```


**Start rails server in development environment:**
rails s -p 3000 -b lvh.me
