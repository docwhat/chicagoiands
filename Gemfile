# -*- ruby -*-
source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
gem 'haml'
gem 'redcarpet', '~> 2.0.0b5'
gem 'jquery-rails'
gem 'nokogiri'
gem 'simple-navigation'
gem 'sass-rails', "~> 3.2.0"

# Database
gem 'pg',      :group => [:production]
gem 'sqlite3', :group => [:test, :development]
gem 'bcrypt-ruby'

# Asset template engines
group :assets do
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
  gem 'compass', "~> 0.11.7"
end

group :test, :development do
  gem "rspec-rails"
  gem 'rb-fsevent'
  gem 'growl'
end

group :test do
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
  gem 'mocha'
  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-migrate"
end

group :development do
  gem 'heroku'
  gem 'taps'
end

# EOF
