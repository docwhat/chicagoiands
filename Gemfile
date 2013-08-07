# -*- ruby -*-
source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'haml', '~> 3.1'
gem 'redcarpet', '~> 2.0'
gem 'jquery-rails', '~> 2.2'
gem 'nokogiri'
gem 'simple-navigation'
gem 'sass-rails', "~> 3.2"
gem 'thin'

# Database
gem 'pg', '~> 0.15', :group => [:production]
gem 'sqlite3',       :group => [:test, :development]
gem 'bcrypt-ruby', '~> 3.0.0'

# Asset template engines
group :assets do
  gem 'coffee-rails', "~> 3.2"
  gem 'uglifier'
  gem 'compass', "~> 0.11"
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 1.1'
  gem 'launchy'
  gem 'timecop'
  gem 'coveralls', '>= 0.6.0'
end

group :development do
  gem 'heroku'
  gem 'foreman'
  gem 'taps'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'spring'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'terminal-notifier-guard'
end

# EOF
