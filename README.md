[![Code Climate](https://codeclimate.com/github/andela-oosiname/bonvoyage/badges/gpa.svg)](https://codeclimate.com/github/andela-oosiname/bonvoyage)
<a href="https://codeclimate.com/github/andela-oosiname/bonvoyage/coverage"><img src="https://codeclimate.com/github/andela-oosiname/bonvoyage/badges/coverage.svg" /></a>
[![Build Status](https://travis-ci.org/andela-oosiname/bonvoyage.svg?branch=master)](https://travis-ci.org/andela-oosiname/bonvoyage)

## Getting Started
Getting started is extremely easy, you can either clone / fork this repository or download the entire project as a zip package and run locally.

##Features
This app enebles you to search for available flights and book the flight that you want. You can search for flights using departure location and destination (with or without date). You can also specify the number of passengers you are booking for.

You can also select the cabin you want to book for the passenger(s). i.e. First Class, Business class, Economy class.

You pay for your booking via paypal.

You can also manage your bookings, Change the names, phone numbers of passengers of a particular booking.

You can also cancel a booking if the flight has not departed.

Mails are also sent to the user for every booking completed. This mail contains the booking information, including the booking ref number with which a flight can be searched.

## Dependencies
This project is implemented using the rails framework. To run this app on your local machine after forking or downloading, you need to have a version of Rails running on your local development machine. You also need to make sure that you have the Ruby programming language installed as rails is written in ruby.

* [Get Ruby Here](http://www.ruby-lang.org/)
* [Get Rails Here](http://rubyonrails.org/)

You also need to make sure that you have rubygems and bundler installed. RubyGems is a package management framework for Ruby and bundler is a ruby gem that helps to manage other external dependencies in a rails application.

* [Get Rubygems Here](https://rubygems.org/pages/download)
* [Get Bundler Here](http://bundler.io/)

From the terminal, navigate to the app folder and run these commands
```
bundle install
```
This installs all other necessary dependencies needed for the app to run.

Once done, run the following command to prepare the database on your machine.
```
rake db:migrate
```
Then run the following command to preload the database with data.
```
rake db:seed
```
In the terminal, you start the rails server by typing in
```
rails s
```
## Running the tests.

The tests are driven by rspec and capybara. To run the tests simple type `rspec spec` while
in the project folder

For more specific tests, specify the absolute path to the spec file.
e.g. `bundle exec rspec spec/models/booking_spec.rb`

##Limitations

Money paid for a booking cannot be refunded for now, App is still in development phase.

##Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-oosiname/bonvoyage.

To contribute to this work:

1. Fork it ( https://github.com/[andela-oosiname]/bonvoyage )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Wait
