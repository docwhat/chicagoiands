# -*- ruby -*-
source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

# Database
gem 'pg',      :group => [:production]
gem 'sqlite3', :group => [:test, :development]

# Asset template engines
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-script', "~> 2.2.0"
  gem 'uglifier'
  gem 'compass', :git => 'git://github.com/chriseppstein/compass.git'
end

gem 'haml'
gem 'redcarpet'
gem 'kramdown'
gem 'jquery-rails'
gem 'nokogiri'
gem 'simple-navigation'
gem 'exception_notification'

gem "rspec-rails", :group => [:test, :development]
gem 'rspec-instafail', :group => [:test, :development]
gem 'rb-fsevent', :group => [:test, :development]
gem 'growl', :group => [:test, :development]
gem 'pry', :group => [:test, :development]
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
  #gem 'webkit-rspec-formatter'

#  # To Nuke
#  gem 'contest'
#  # Pretty printed test output
#  gem 'turn', :require => false
end
