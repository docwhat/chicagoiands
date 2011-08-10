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
  gem 'compass', :git => 'git://github.com/chriseppstein/compass.git', :branch => 'rails31'
end

gem 'haml'
gem 'kramdown'
gem 'jquery-rails'
gem 'nokogiri'
gem 'simple-navigation'


gem "rspec-rails", :group => [:test, :development]
gem 'rspec-instafail', :group => [:test, :development]
gem 'rb-fsevent', :group => [:test, :development]
gem 'growl', :group => [:test, :development]
gem 'pry', :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
  gem "guard-rspec"
  gem 'mocha'
  gem 'guard-spork'
  gem "guard-bundler"
  #gem 'webkit-rspec-formatter'

#  # To Nuke
#  gem 'contest'
#  # Pretty printed test output
#  gem 'turn', :require => false
end
