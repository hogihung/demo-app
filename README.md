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

Running the test suite:

```
bundle exec guard
```


Start the Rails Server:

```
rails s
```

Visit the url:  localhost:3000.

Now, try to visith the sign in url:  localhost:3000/users/sign_in

You most likely will see the error:  "The page you were looking for doesn't exist."

In our development environment there are a couple of ways we can handle working with subdomains.  For example, there is Pow, http://pow.cx/.
But there is an even easier way so long as you have an internet connection - lvh.me.

Ok, now we will get this working by using LVH.  But first, stop the current rails server.  Then run:

```
rails s -p 3000 -b lvh.me
```

Now you can test out our example subdomains, for example:

http://root.lvh.me:3000/users/sign_in
http://demon-strings.lvh.me:3000/users/sign_in

Subdomain      User                   Password
-------------------------------------------------
root           sysadmin@demo-app.com  pw
demon-strings  sconner@skynet.com     pw


NOTE: This application is just enough of an application put together to demonstrate using subdomains. 
      It is the first step towards building a multi-tenancy based application.  While it is true that 
      you can log in using a subdomain, the sysadmin user can log in in to the demons-strings subdomain 
      and the Sarah user can log in to the root domain.  In fact you can use just about any subdomain
      and you will be able to login.

