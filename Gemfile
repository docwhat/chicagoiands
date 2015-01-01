# encoding: utf-8
source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'rails', '~> 3.2'
gem 'haml-rails'
gem 'redcarpet', '~> 2.0'
gem 'jquery-rails', '~> 2.2'
gem 'nokogiri', '~> 1.6'
gem 'simple-navigation', '~> 3.11'
gem 'sass-rails', '~> 3.2'
gem 'unicorn'
gem 'rails_12factor', group: :production
gem 'rubocop'

# Database
gem 'pg',          group: [:production]
gem 'sqlite3',     group: [:test, :development]
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
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 1.1'
  gem 'launchy'
  gem 'timecop'

  gem 'coveralls', '>= 0.6', require: false
end

group :development do
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
