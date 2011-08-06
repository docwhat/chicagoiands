# -*- ruby -*-
source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

# Database
gem 'pg',      :group => [:production]
gem 'sqlite3', :group => [:test, :development]

# Asset template engines
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-script'
  gem 'uglifier'
end

gem 'haml'
gem 'jquery-rails'
gem 'nokogiri'
#gem 'pry' -- removed due to https://github.com/carlhuda/bundler/issues/1334


group :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem 'contest'
  # Pretty printed test output
  gem 'turn', :require => false
end
