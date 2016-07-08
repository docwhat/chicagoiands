# encoding: utf-8
source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'rails', '~> 3.2'
gem 'haml-rails'
gem 'haml', '~> 4.0'
gem 'redcarpet', '~> 3.3'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'nokogiri', '~> 1.6'
gem 'simple-navigation', '~> 3.11'
gem 'sass-rails', '~> 3.2'
gem 'rubocop', '~> 0.35.1'
gem 'pg', group: [:production, :test]

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

# Database
gem 'bcrypt-ruby', '~> 3.0.1'

# Asset template engines
group :assets do
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier'
  gem 'compass-rails'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'rspec', '~> 2.14'
  gem 'test-unit'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'timecop'

  gem 'coveralls', '>= 0.6', require: false
end

group :development do
  gem 'sqlite3'
  gem 'letter_opener'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'

  gem 'foreman'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-shell'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
  gem 'terminal-notifier'
end

# EOF
