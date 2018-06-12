source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "5.0.0"
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0", ">= 5.0.5"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.1"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby
# Use materialize css
# Use font awesome
gem "font-awesome-sass"
# Use jquery as the JavaScript library
gem "cocoon"
# Use jquery as the JavaScript library
gem "jquery-rails", ">= 4.1.0"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks", ">= 5.0.0"
gem "bootstrap-sass", "~> 3.2.0.2"
gem "autoprefixer-rails"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", group: :doc

gem "rspec-rails", ">= 3.5.0"
gem "faker"
gem "codeclimate-test-reporter", group: :test
gem "coveralls", require: false

gem "bcrypt", "~> 3.1.7"
gem "paypal-express"

gem "rest-client", "~> 1.8"

# Use Unicorn as the app server
gem "puma"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  gem "byebug"
  gem "rubocop", ">= 0.49.0", require: false
  gem "scss_lint", require: false
  gem "sqlite3"
  gem "capybara", ">= 2.6.2"
  gem "factory_girl_rails", ">= 4.5.0"
  gem "letter_opener"
  gem "shoulda-matchers", "~> 3.0"
  gem "figaro"
  gem "pry-rails"
  gem "pry-nav"
  gem "database_cleaner"
  gem "simplecov"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.2", ">= 2.2.1"
end

group :production do
  gem "pg"
  gem "rails_12factor", "0.0.2"
  gem "activemerchant", ">= 1.56.0"
end
