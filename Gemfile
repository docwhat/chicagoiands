# encoding: utf-8
source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'rails', '~> 3.2'
gem 'haml', '~> 3.1'
gem 'redcarpet', '~> 2.0'
gem 'jquery-rails', '~> 2.2'
gem 'nokogiri', '~> 1.6'
gem 'simple-navigation', '~> 3.11'
gem 'sass-rails', '~> 3.2'
gem 'thin'

# Database
gem 'pg', '~> 0.15', group: [:production]
gem 'sqlite3',       group: [:test, :development]
gem 'bcrypt-ruby', '~> 3.0.0'

# Asset template engines
group :assets do
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier'
  gem 'compass', '~> 0.11'
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

  gem 'coveralls', '>= 0.6', require: false
  gem 'codeclimate-test-reporter', require: false
end

group :development do
  gem 'letter_opener'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'

  gem 'heroku'
  gem 'foreman'
  gem 'taps'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-migrate'
  gem 'guard-shell'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
  gem 'terminal-notifier'
end

# EOF
