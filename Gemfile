# -*- ruby -*-
source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

# Database
gem 'pg',      :group => [:production]
gem 'sqlite3', :group => [:test, :development]
gem 'bcrypt-ruby'

# Asset template engines
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier'
  gem 'compass', '~> 0.12.alpha'
end

gem 'haml'
gem 'redcarpet', '~> 2.0.0b5'
gem 'jquery-rails'
gem 'nokogiri'
gem 'simple-navigation'
gem 'exception_notification'

# Only used for importing old site info.
gem 'kramdown'

group :test, :development do
  gem "rspec-rails"
  gem 'rb-fsevent'
  gem 'growl'
  gem 'pry'
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
